Program Login;
uses crt;
var comm:text;
    ch:char;
    x:integer;

BEGIN
assign(comm,'COM2');
rewrite(comm);
write(comm,'ATZ^M');

writeln('did so...');
ch:=readkey;
END.