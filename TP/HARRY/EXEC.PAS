Program dir;
Uses Dos,crt;
var   ProgramName, CmdLine: string;

{clrscr;
writeln;
writeln(' executing dir ');
exec('C:\DIR','');
writeln('done.');
writeln;
delay(2000);}


   { 16K stack, no heap }

begin
  Write('Program to Exec (full path): ');
  ReadLn(ProgramName);
  Write('Command line to pass to ',
        ProgramName, ': ');
  ReadLn(CmdLine);
  WriteLn('About to Exec...');
  SwapVectors;
  Exec(ProgramName, CmdLine);
  SwapVectors;
  WriteLn('...back from Exec');
  if DosError <> 0 then{ Error? }
    WriteLn('Dos error #', DosError)
  else
    WriteLn('Exec successful. ',
            'Child process exit code = ',
            DosExitCode);
delay(2000);


end.
