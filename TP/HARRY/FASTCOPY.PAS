Program FileCopy;{ Simple, fast file copy program with NO error-checking }
var
  FromF, ToF: file;
  NumRead, NumWritten: Word;
  Buf: array[1..2048] of Char;
Procedure errdisp;begin
{input file does not ... output file does not exist.. maximum blocksize !}
writeln(' ERROR: Syntax: FastCopy [input] [output]');halt(1); end;
begin
  if (paramstr(1)='') or (paramstr(2)='') then errdisp;
  Assign(FromF, ParamStr(1)); { Open input file }
  Reset(FromF, 1);  { Record size = 1 }
  Assign(ToF, ParamStr(2)); { Open output file }
  Rewrite(ToF, 1);  { Record size = 1 }
  Writeln('Copying ', FileSize(FromF), ' bytes...');
  repeat
    BlockRead(FromF, Buf, SizeOf(Buf), NumRead);
    BlockWrite(ToF, Buf, NumRead, NumWritten);
  until (NumRead = 0) or (NumWritten <> NumRead);
  Close(FromF);
  Close(ToF);
end.
