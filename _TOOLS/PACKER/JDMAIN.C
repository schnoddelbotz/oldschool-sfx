/*
 * jdmain.c
 *
 * Copyright (C) 1991, 1992, Thomas G. Lane.
 * This file is part of the Independent JPEG Group's software.
 * For conditions of distribution and use, see the accompanying README file.
 *
 * This file contains an MS-DOS user interface for the JPEG decompressor.
 * It follows DOS practice more closely than does the standard jdmain.c.
 * This compiles under Borland C or Microsoft C; don't know about others.
 * If you are using jmemnobs.c, #define FREE_MEM_ESTIMATE=0.
 */

#include "jinclude.h"
#include <stdlib.h>		/* to declare exit() */
#include <string.h>		/* string functions */
#include <signal.h>		/* to declare signal() */

#ifdef __TURBOC__
				/* Borland C declarations */
#include <dir.h>		/* for findfirst/findnext */
typedef struct ffblk FF_DATA;
#define FF_NAME  ff_name
#define FINDFIRST(path,blk)	findfirst(path, blk, 0)
#define FINDNEXT(blk)		findnext(blk)

#include <alloc.h>		/* for farcoreleft() */
/* In Borland C, force -m equal to 95% of farcoreleft figure */
#define FREE_MEM_ESTIMATE  ((farcoreleft() * 95L) / 100L)

#else /* !__TURBOC__ */
				/* Microsoft C declarations */
#include <dos.h>		/* for findfirst/findnext */
typedef struct find_t FF_DATA;
#define FF_NAME  name
#define FINDFIRST(path,blk)	_dos_findfirst(path, _A_NORMAL, blk)
#define FINDNEXT(blk)		_dos_findnext(blk)

#endif /* __TURBOC__ */

#define READ_BINARY	"rb"
#define WRITE_BINARY	"wb"

#ifndef EXIT_FAILURE		/* define exit() codes if not provided */
#define EXIT_FAILURE  1
#endif
#ifndef EXIT_SUCCESS
#define EXIT_SUCCESS  0
#endif


#include "jversion.h"		/* for version message */


/*
 * PD version of getopt(3).
 */

#include "egetopt.c"


/*
 * This list defines the known output image formats
 * (not all of which need be supported by a given version).
 * You can change the default output format by defining DEFAULT_FMT;
 * indeed, you had better do so if you undefine GIF_SUPPORTED.
 */

typedef enum {
	FMT_GIF,		/* GIF format */
	FMT_PPM,		/* PPM/PGM (PBMPLUS formats) */
	FMT_RLE,		/* RLE format */
	FMT_TARGA,		/* Targa format */
	FMT_TIFF		/* TIFF format */
} IMAGE_FORMATS;

#ifndef DEFAULT_FMT		/* so can override from CFLAGS in Makefile */
#define DEFAULT_FMT	FMT_GIF
#endif

static IMAGE_FORMATS requested_fmt;


/*
 * This routine gets control after the input file header has been read.
 * It must determine what output file format is to be written,
 * and make any other decompression parameter changes that are desirable.
 */

METHODDEF void
d_ui_method_selection (decompress_info_ptr cinfo)
{
  /* if grayscale or CMYK input, force similar output; */
  /* else leave the output colorspace as set by options. */
  if (cinfo->jpeg_color_space == CS_GRAYSCALE)
    cinfo->out_color_space = CS_GRAYSCALE;
  else if (cinfo->jpeg_color_space == CS_CMYK)
    cinfo->out_color_space = CS_CMYK;

  /* select output file format */
  /* Note: jselwxxx routine may make additional parameter changes,
   * such as forcing color quantization if it's a colormapped format.
   */
  switch (requested_fmt) {
#ifdef GIF_SUPPORTED
  case FMT_GIF:
    jselwgif(cinfo);
    break;
#endif
#ifdef PPM_SUPPORTED
  case FMT_PPM:
    jselwppm(cinfo);
    break;
#endif
#ifdef RLE_SUPPORTED
  case FMT_RLE:
    jselwrle(cinfo);
    break;
#endif
#ifdef TARGA_SUPPORTED
  case FMT_TARGA:
    jselwtarga(cinfo);
    break;
#endif
  default:
    ERREXIT(cinfo->emethods, "Unsupported output file format");
    break;
  }
}


/*
 * Signal catcher to ensure that temporary files are removed before aborting.
 * Doesn't do anything during intervals where emethods is NULL.
 */

static external_methods_ptr emethods; /* for access to free_all */

LOCAL void
signal_catcher (int signum)
{
  if (emethods != NULL) {
    emethods->trace_level = 0;	/* turn off trace output */
    (*emethods->free_all) ();	/* clean up memory allocation & temp files */
  }
  exit(EXIT_FAILURE);
}


LOCAL void
usage (void)
/* complain about bad command line */
{
  fprintf(stderr, "Usage: djpeg [switches] inputfile(s)\n");
  fprintf(stderr, "List of input files may use wildcards (* and ?)\n");
  fprintf(stderr, "If input file name has no extension, .JPG is assumed\n");
  fprintf(stderr, "Output filename is same as input filename, except for extension\n");
  fprintf(stderr, "Optional switches:\n");
#ifdef GIF_SUPPORTED
  fprintf(stderr, "  -G          Select GIF output, extension .GIF  (default)\n");
#endif
#ifdef PPM_SUPPORTED
  fprintf(stderr, "  -P          Select PPM/PGM output, extension .PPM\n");
#endif
#ifdef RLE_SUPPORTED
  fprintf(stderr, "  -R          Select Utah RLE output, extension .RLE\n");
#endif
#ifdef TARGA_SUPPORTED
  fprintf(stderr, "  -T          Select Targa output, extension .TGA\n");
#endif
  fprintf(stderr, "  -g          Force grayscale output\n");
  fprintf(stderr, "  -q colors   Quantize to no more than N colors\n");
  fprintf(stderr, "  -1          Use 1-pass quantization (fast, low quality)\n");
  fprintf(stderr, "  -D          Don't use dithering in quantization\n");
  fprintf(stderr, "  -b          Apply cross-block smoothing\n");
#ifndef FREE_MEM_ESTIMATE
  fprintf(stderr, "  -m memory   Maximum memory to use (default 300K); see USAGE\n");
#endif
  fprintf(stderr, "  -d          Generate debug output\n");
  exit(EXIT_FAILURE);
}


/* Display progress report */

METHODDEF void
progress_monitor (decompress_info_ptr cinfo, long loopcounter, long looplimit)
{
  if (cinfo->total_passes > 1) {
    fprintf(stderr, "\rPass %d/%d: %3d%% ",
	    cinfo->completed_passes+1, cinfo->total_passes,
	    (int) (loopcounter*100L/looplimit));
  } else {
    fprintf(stderr, "\r %3d%% ",
	    (int) (loopcounter*100L/looplimit));
  }
  fflush(stderr);
}


/*
 * Check for overwrite of an existing file; clear it with user
 */

LOCAL boolean
is_write_ok (char * outfilename)
{
  FILE * ofile;
  int ch;

  ofile = fopen(outfilename, READ_BINARY);
  if (ofile == NULL)
    return TRUE;		/* not present */
  fclose(ofile);		/* oops, it is present */

  for (;;) {
    fprintf(stderr, "%s already exists, overwrite it? [y/n] ",
	    outfilename);
    fflush(stderr);
    ch = getc(stdin);
    fflush(stdin);		/* flush rest of line */
    switch (ch) {
    case 'Y':
    case 'y':
      return TRUE;
    case 'N':
    case 'n':
      return FALSE;
    /* otherwise, ask again */
    }
  }
}


/*
 * Save current switch values here --- necessary for multiple input files!
 */

static boolean b_smooth;	/* -b */
static boolean gray_scale;	/* -g */
static int num_colors;		/* -q, or 0 if not seen */
static boolean two_pass_q;	/* not -1 */
static boolean do_dither;	/* not -D */
static long cur_mem;		/* -m, or value of FREE_MEM_ESTIMATE */
static int cur_trace;		/* -d */

#define MAX_FNAME_LEN 150


/*
 * Process a single input file
 */

LOCAL void
process_one_file (char * infilename)
{
  struct decompress_info_struct cinfo;
  struct decompress_methods_struct dc_methods;
  struct external_methods_struct e_methods;
  char outfilename[MAX_FNAME_LEN];
  int i;

  /* Select the input and output files */

  if ((cinfo.input_file = fopen(infilename, READ_BINARY)) == NULL) {
    fprintf(stderr, "djpeg: can't open %s\n", infilename);
    return;
  }
  /* Make outfilename be infilename with appropriate extension */
  strcpy(outfilename, infilename);
  for (i = strlen(outfilename)-1; i >= 0; i--) {
    switch (outfilename[i]) {
    case ':':
    case '/':
    case '\\':
      i = 0;			/* stop scanning */
      break;
    case '.':
      outfilename[i] = '\0';	/* lop off existing extension */
      i = 0;			/* stop scanning */
      break;
    default:
      break;			/* keep scanning */
    }
  }
  switch (requested_fmt) {
  case FMT_GIF:
    strcat(outfilename, ".GIF");
    break;
  case FMT_PPM:
    strcat(outfilename, ".PPM");
    break;
  case FMT_RLE:
    strcat(outfilename, ".RLE");
    break;
  case FMT_TARGA:
    strcat(outfilename, ".TGA");
    break;
  }

  if (! is_write_ok(outfilename)) {
    fclose(cinfo.input_file);
    return;
  }
  if ((cinfo.output_file = fopen(outfilename, WRITE_BINARY)) == NULL) {
    fprintf(stderr, "djpeg: can't create %s\n", outfilename);
    fclose(cinfo.input_file);
    return;
  }

  /* Initialize the system-dependent method pointers. */
  cinfo.methods = &dc_methods;
  cinfo.emethods = &e_methods;
  jselerror(&e_methods);	/* error/trace message routines */
  jselmemmgr(&e_methods);	/* memory allocation routines */
  dc_methods.d_ui_method_selection = d_ui_method_selection;

  /* Now OK to enable signal catcher. */
  emethods = &e_methods;

  /* Set up JPEG parameters. */
  j_d_defaults(&cinfo, TRUE);
  cinfo.do_block_smoothing = b_smooth;
  if (gray_scale)
    cinfo.out_color_space = CS_GRAYSCALE;
  if (num_colors > 0) {
    cinfo.desired_number_of_colors = num_colors;
    cinfo.quantize_colors = TRUE;
  }
  cinfo.two_pass_quantize = two_pass_q;
  cinfo.use_dithering = do_dither;
  e_methods.max_memory_to_use = cur_mem;
  e_methods.trace_level = cur_trace;

  /* Start up progress display, unless trace output is on */
  fprintf(stderr, "Decompressing %s => %s\n", infilename, outfilename);
  if (cur_trace == 0)
    dc_methods.progress_monitor = progress_monitor;
  
  /* Set up to read a JFIF or baseline-JPEG file. */
  /* A smarter UI would inspect the first few bytes of the input file */
  /* to determine its type. */
#ifdef JFIF_SUPPORTED
  jselrjfif(&cinfo);
#else
  You shoulda defined JFIF_SUPPORTED.   /* deliberate syntax error */
#endif

  /* Do it to it! */
  jpeg_decompress(&cinfo);

  /* Clear away progress display */
  if (cur_trace == 0)
    fprintf(stderr, "\r                \r");
  fflush(stderr);

  /* All done. Close files, disable signal catcher */
  fclose(cinfo.input_file);
  fclose(cinfo.output_file);
  emethods = NULL;
}


/*
 * Process one filespec; expand wildcards
 */

LOCAL void
process_filespec (char * filespec)
{
  FF_DATA ffblock;
  char infilename[MAX_FNAME_LEN];
  int pathlen, i;
  boolean hasext;

  /* Determine whether there is a path and an extension */
  pathlen = 0;
  hasext = FALSE;
  for (i = strlen(filespec)-1; i >= 0; i--) {
    switch (filespec[i]) {
    case ':':
    case '/':
    case '\\':
      pathlen = i+1;		/* path part ends here */
      i = 0;			/* stop scanning */
      break;
    case '.':
      hasext = TRUE;		/* there is an extension */
      break;
    default:
      break;			/* keep scanning */
    }
  }

  /* Make infilename be filespec; if no explicit extension, attach .JPG */
  strcpy(infilename, filespec);
  if (! hasext)
    strcat(infilename, ".JPG");

  /* Scan over matching files */
  if (FINDFIRST(infilename, &ffblock) != 0) {
    fprintf(stderr, "No files matching %s\n", infilename);
  } else {
    do {
      strcpy(infilename, filespec);
      strcpy(infilename + pathlen, ffblock.FF_NAME);
      process_one_file(infilename);
    } while (FINDNEXT(&ffblock) == 0);
  }
}


/*
 * The main program.
 */

GLOBAL int
main (int argc, char **argv)
{
  int c;

  /* Set up signal catcher. */
  emethods = NULL;
  signal(SIGINT, signal_catcher);
#ifdef SIGTERM			/* not all systems have SIGTERM */
  signal(SIGTERM, signal_catcher);
#endif

  /* Scan command line, process switches */

  requested_fmt = DEFAULT_FMT;	/* initialize default switch values */
  b_smooth = FALSE;
  gray_scale = FALSE;
  num_colors = 0;
  two_pass_q = TRUE;
  do_dither = TRUE;
#ifdef FREE_MEM_ESTIMATE
  cur_mem = FREE_MEM_ESTIMATE;
#else
  cur_mem = 300000L;		/* reasonable default for DOS */
#endif
  cur_trace = 0;
  
  while ((c = egetopt(argc, argv, "GPRTbgq:1Dm:d")) != EOF)
    switch (c) {
    case 'G':			/* GIF output format. */
      requested_fmt = FMT_GIF;
      break;
    case 'P':			/* PPM output format. */
      requested_fmt = FMT_PPM;
      break;
    case 'R':			/* RLE output format. */
      requested_fmt = FMT_RLE;
      break;
    case 'T':			/* Targa output format. */
      requested_fmt = FMT_TARGA;
      break;
    case 'b':			/* Enable cross-block smoothing. */
      b_smooth = TRUE;
      break;
    case 'g':			/* Force grayscale output. */
      gray_scale = TRUE;
      break;
    case 'q':			/* Do color quantization. */
      if (optarg == NULL)
	usage();
      if (sscanf(optarg, "%d", &num_colors) != 1)
	usage();
      break;
    case '1':			/* Use fast one-pass quantization. */
      two_pass_q = FALSE;
      break;
    case 'D':			/* Suppress dithering in color quantization. */
      do_dither = FALSE;
      break;
    case 'm':			/* Maximum memory in Kb (or Mb with 'm'). */
      { long lval;
	char ch = 'x';

	if (optarg == NULL)
	  usage();
	if (sscanf(optarg, "%ld%c", &lval, &ch) < 1)
	  usage();
	if (ch == 'm' || ch == 'M')
	  lval *= 1000L;
	cur_mem = lval * 1000L;
      }
      break;
    case 'd':			/* Debugging. */
      /* On first -d, print version identification */
      if (cur_trace == 0)
	fprintf(stderr, "Independent JPEG Group's DJPEG, version %s\n%s\n",
		JVERSION, JCOPYRIGHT);
      cur_trace++;
      break;
    case '?':
    default:
      usage();
      break;
    }

  /* Process file specifications */
  if (optind >= argc)
    usage();			/* no filespecs?? */

  while (optind < argc)
    process_filespec(argv[optind++]);

  /* All done. */
  exit(EXIT_SUCCESS);
  return 0;			/* suppress no-return-value warnings */
}
