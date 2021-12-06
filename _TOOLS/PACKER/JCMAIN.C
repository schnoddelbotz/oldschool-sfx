/*
 * jcmain.c
 *
 * Copyright (C) 1991, 1992, Thomas G. Lane.
 * This file is part of the Independent JPEG Group's software.
 * For conditions of distribution and use, see the accompanying README file.
 *
 * This file contains an MS-DOS user interface for the JPEG compressor.
 * It follows DOS practice more closely than does the standard jcmain.c.
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
 * This routine determines what format the input file is,
 * and selects the appropriate input-reading module.
 *
 * To determine which family of input formats the file belongs to,
 * we may look only at the first byte of the file, since C does not
 * guarantee that more than one character can be pushed back with ungetc.
 * Looking at additional bytes would require one of these approaches:
 *     1) assume we can fseek() the input file (fails for piped input);
 *     2) assume we can push back more than one character (works in
 *        some C implementations, but unportable);
 *     3) provide our own buffering as is done in djpeg (breaks input readers
 *        that want to use stdio directly, such as the RLE library);
 * or  4) don't put back the data, and modify the input_init methods to assume
 *        they start reading after the start of file (also breaks RLE library).
 * #1 is attractive for MS-DOS but is untenable on Unix.
 *
 * The most portable solution for file types that can't be identified by their
 * first byte is to make the user tell us what they are.  This is also the
 * only approach for "raw" file types that contain only arbitrary values.
 * We presently apply this method for Targa files.  Most of the time Targa
 * files start with 0x00, so we recognize that case.  Potentially, however,
 * a Targa file could start with any byte value (byte 0 is the length of the
 * seldom-used ID field), so we accept a -T switch to force Targa input mode.
 */

static boolean is_targa;	/* records user -T switch */


LOCAL void
select_file_type (compress_info_ptr cinfo)
{
  int c;

  if (is_targa) {
#ifdef TARGA_SUPPORTED
    jselrtarga(cinfo);
#else
    ERREXIT(cinfo->emethods, "Targa support was not compiled");
#endif
    return;
  }

  if ((c = getc(cinfo->input_file)) == EOF)
    ERREXIT(cinfo->emethods, "Empty input file");

  switch (c) {
#ifdef GIF_SUPPORTED
  case 'G':
    jselrgif(cinfo);
    break;
#endif
#ifdef PPM_SUPPORTED
  case 'P':
    jselrppm(cinfo);
    break;
#endif
#ifdef RLE_SUPPORTED
  case 'R':
    jselrrle(cinfo);
    break;
#endif
#ifdef TARGA_SUPPORTED
  case 0x00:
    jselrtarga(cinfo);
    break;
#endif
  default:
#ifdef TARGA_SUPPORTED
    ERREXIT(cinfo->emethods, "Unrecognized input file format --- if it's Targa, use -T");
#else
    ERREXIT(cinfo->emethods, "Unrecognized input file format");
#endif
    break;
  }

  if (ungetc(c, cinfo->input_file) == EOF)
    ERREXIT(cinfo->emethods, "ungetc failed");
}


/*
 * This routine gets control after the input file header has been read.
 * It must determine what output JPEG file format is to be written,
 * and make any other compression parameter changes that are desirable.
 */

METHODDEF void
c_ui_method_selection (compress_info_ptr cinfo)
{
  /* If the input is gray scale, generate a monochrome JPEG file. */
  if (cinfo->in_color_space == CS_GRAYSCALE)
    j_monochrome_default(cinfo);
  /* For now, always select JFIF output format. */
#ifdef JFIF_SUPPORTED
  jselwjfif(cinfo);
#else
  You shoulda defined JFIF_SUPPORTED.   /* deliberate syntax error */
#endif
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
  fprintf(stderr, "Usage: cjpeg [switches] inputfile(s)\n");
  fprintf(stderr, "List of input files may use wildcards (* and ?)\n");
  fprintf(stderr, "If input file name has no extension, .GIF is assumed\n");
  fprintf(stderr, "Output filename is same as input filename, but extension .JPG\n");
  fprintf(stderr, "Optional switches:\n");
  fprintf(stderr, "  -Q quality  Image quality (0..100; 5-95 is useful range)\n");
  fprintf(stderr, "  -o          Optimize Huffman table (smaller file, but slow)\n");
#ifdef TARGA_SUPPORTED
  fprintf(stderr, "  -T          Input file is Targa format (usually not needed)\n");
#endif
#ifndef FREE_MEM_ESTIMATE
  fprintf(stderr, "  -m memory   Maximum memory to use (default 300K); see USAGE\n");
#endif
  fprintf(stderr, "  -d          Generate debug output\n");
  exit(EXIT_FAILURE);
}


/* Display progress report */

METHODDEF void
progress_monitor (compress_info_ptr cinfo, long loopcounter, long looplimit)
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

static int cur_quality;		/* -Q  */
static boolean cur_opt;		/* -o */
static long cur_mem;		/* -m, or value of FREE_MEM_ESTIMATE */
static int cur_trace;		/* -d */

#define MAX_FNAME_LEN 150


/*
 * Process a single input file
 */

LOCAL void
process_one_file (char * infilename)
{
  struct compress_info_struct cinfo;
  struct compress_methods_struct c_methods;
  struct external_methods_struct e_methods;
  char outfilename[MAX_FNAME_LEN];
  int i;

  /* Select the input and output files */

  if ((cinfo.input_file = fopen(infilename, READ_BINARY)) == NULL) {
    fprintf(stderr, "cjpeg: can't open %s\n", infilename);
    return;
  }
  /* Make outfilename be infilename with .JPG substituted for extension */
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
  strcat(outfilename, ".JPG");

  if (! is_write_ok(outfilename)) {
    fclose(cinfo.input_file);
    return;
  }
  if ((cinfo.output_file = fopen(outfilename, WRITE_BINARY)) == NULL) {
    fprintf(stderr, "cjpeg: can't create %s\n", outfilename);
    fclose(cinfo.input_file);
    return;
  }

  /* Initialize the system-dependent method pointers. */
  cinfo.methods = &c_methods;
  cinfo.emethods = &e_methods;
  jselerror(&e_methods);	/* error/trace message routines */
  jselmemmgr(&e_methods);	/* memory allocation routines */
  c_methods.c_ui_method_selection = c_ui_method_selection;

  /* Now OK to enable signal catcher. */
  emethods = &e_methods;

  /* Set up JPEG parameters. */
  j_c_defaults(&cinfo, cur_quality, FALSE);
  cinfo.optimize_coding = cur_opt;
  e_methods.max_memory_to_use = cur_mem;
  e_methods.trace_level = cur_trace;

  /* Start up progress display, unless trace output is on */
  fprintf(stderr, "Compressing %s => %s\n", infilename, outfilename);
  if (cur_trace == 0)
    c_methods.progress_monitor = progress_monitor;

  /* Figure out the input file format, and set up to read it. */
  select_file_type(&cinfo);

  /* Do it to it! */
  jpeg_compress(&cinfo);

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

  /* Make infilename be filespec; if no explicit extension, attach .GIF */
  strcpy(infilename, filespec);
  if (! hasext)
    strcat(infilename, ".GIF");

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

  is_targa = FALSE;		/* initialize default switch values */
  cur_quality = 75;
  cur_opt = FALSE;
#ifdef FREE_MEM_ESTIMATE
  cur_mem = FREE_MEM_ESTIMATE;
#else
  cur_mem = 300000L;		/* reasonable default for DOS */
#endif
  cur_trace = 0;
  
  while ((c = egetopt(argc, argv, "Q:Tom:d")) != EOF)
    switch (c) {
    case 'Q':			/* Quality factor. */
      if (optarg == NULL)
	usage();
      if (sscanf(optarg, "%d", &cur_quality) != 1)
	usage();
      break;
    case 'T':			/* Input file is Targa format. */
      is_targa = TRUE;
      break;
    case 'o':			/* Enable entropy parm optimization. */
#ifdef ENTROPY_OPT_SUPPORTED
      cur_opt = TRUE;
#else
      fprintf(stderr, "cjpeg: sorry, entropy optimization was not compiled\n");
      exit(EXIT_FAILURE);
#endif
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
	fprintf(stderr, "Independent JPEG Group's CJPEG, version %s\n%s\n",
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