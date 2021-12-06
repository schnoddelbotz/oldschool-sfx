uses crt,dos;
const abc:array[0..16] of byte = (48,49,50,51,52,53,54,55,56,57,97,98,99,100,101,102,32);

var feld:array[1..177] of byte;
    modedata:array[0..252] of byte;
    modi:array[1..100] of word;
    buffer:array[0..64] of byte;
    vesa:boolean;
    m:array[1..40,1..16] of byte;      {1..6 Name,
                                        7=x,      x=0 => nicht aktiv)
                                        8=y,
                                        9/10=ax
                                        11/12=bx
                                        13=modus  100=svga; 101=vesa;
                                        14=ok/fail    1=ok, 2=fail, 0=test
                                        }


    h1,h2,deci,anzmodes:byte;
    regs:registers;
    a,i,j:integer;

    f:file;
    jn1,jn2:char;
    stri:string[20];
    help:string[20];

procedure hex(sim:byte);                    {** DEC -> HEX }
begin h1:=trunc(sim/16);h2:=sim-h1 shl 4 end;

procedure decimal(sim1,sim2:char);             {** HEX -> DEC }
var q:byte; begin q:=0;while sim1<>chr(abc[q]) do inc(q);deci:=q shl 4;
                  q:=0;while sim2<>chr(abc[q]) do inc(q);inc (deci,q) end;


function istvga:boolean;
         begin
          regs.ah:=$1a;regs.al:=0;intr($10,regs);
          if regs.al=$1a then istvga:=TRUE else istvga:=FALSE end;

function istvesa:boolean;
         var count:byte;
         begin
         count:=0;
         if regs.al=79 then count:=1; {vesa-feedback 4fh ok}
         if regs.ah=0  then inc(count); {vesa-ausfuehrung einwandfrei}
         if (feld[1]=ord('V'))and(feld[2]=ord('E'))and(feld[3]=ord('S'))and(feld[4]=ord('A')) then inc(count);
                               { VESA-Signature }
         if count=3 then istvesa:=TRUE else istvesa:=FALSE end;

procedure displaymodes;
begin
 textcolor(3);
 gotoxy(1,2);
 write('                                   ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿');
 write('ÚÄÄÄÄÄÂÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄ´                   ³                       ³');
 write('³     ³        ³            ³      ³                   ³                       ³');
 write('ÆÍÍÍÍÍØÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍµ');
 write('³     ³        ³            ³      ³                   ³                       ³');



 textcolor(7);
 gotoxy(2,4);write('Test:');
 gotoxy(9,4);write('Name :');
 gotoxy(18,4);write('Use X / Y');
 gotoxy(31,4);write('Mode');
 gotoxy(38,3);write('Regs.Ax / Regs.BX');
 gotoxy(38,4);write('AH  AL    BH  BL');

 for i:=1 to anzmodes do begin
  textcolor(7);
  gotoxy(9,i+6);
  for j:=1 to 6 do write(chr(m[i,j]));
  gotoxy(20,i+6);write(m[i,7]:3);
  gotoxy(24,i+6);write(m[i,8]:3);
  gotoxy(31,i+6);
  if m[i,13]<11 then write('VGA ') else
  if m[i,13]=101 then write('VESA')
    else write('SVGA');
  if m[i,13]>90 then begin
    gotoxy(38,i+6);
    hex(m[i,9]);write(chr(abc[h1]),chr(abc[h2]));
    gotoxy(42,i+6);
    hex(m[i,10]);write(chr(abc[h1]),chr(abc[h2]));
    gotoxy(48,i+6);
    hex(m[i,11]);write(chr(abc[h1]),chr(abc[h2]));
    gotoxy(52,i+6);
    hex(m[i,12]);write(chr(abc[h1]),chr(abc[h2]));
    textcolor(3);gotoxy(40,i+6);write('h');
                 gotoxy(44,i+6);write('h');
                 gotoxy(50,i+6);write('h');
                 gotoxy(54,i+6);write('h');
  end;
  textcolor(3);
  gotoxy(1,i+6);write('³');
  gotoxy(7,i+6);write('³');
  gotoxy(16,i+6);write('³');
  gotoxy(29,i+6);write('³');
  gotoxy(36,i+6);write('³');
  gotoxy(56,i+6);write('³');
  gotoxy(80,i+6);write('³');




  end;





write('ÀÄÄÄÄÄÁÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ');






end;


procedure init;
begin
 textmode(co80+font8x8);
 textcolor(7);textbackground(0);

 clrscr;
 textcolor(0);textbackground(3);
 writeln(' Examine                                                                        ');
 writeln;
 textcolor(7);textbackground(0);
end;

procedure initmodes;
begin
        for i:=1 to 40 do for j:=1 to 14 do m[i,j]:=0;
        for i:=1 to 10 do begin m[i,1]:=32;m[i,3]:=48;m[i,4]:=120 end;


        {80x25} m[ 1,2]:=56;m[1,5]:=50;m[1,6]:=53;m[1,7]:=80;m[1,8]:=25;m[1,13]:=1;
        {80x30} m[ 2,2]:=56;m[2,5]:=51;m[2,6]:=48;m[2,7]:=80;m[2,8]:=30;m[2,13]:=2;
        {80x43} m[ 3,2]:=56;m[3,5]:=52;m[3,6]:=51;m[3,7]:=80;m[3,8]:=43;m[3,13]:=3;
        {80x50} m[ 4,2]:=56;m[4,5]:=53;m[4,6]:=48;m[4,7]:=80;m[4,8]:=50;m[4,13]:=4;
        {80x60} m[ 5,2]:=56;m[5,5]:=54;m[5,6]:=48;m[5,7]:=80;m[5,8]:=60;m[5,13]:=5;

        {90x25} m[ 6,2]:=57;m[6,5]:=50;m[6,6]:=53;m[6,7]:=90;m[6,8]:=25;m[6,13]:=6;
        {90x30} m[ 7,2]:=57;m[7,5]:=51;m[7,6]:=48;m[7,7]:=90;m[7,8]:=30;m[7,13]:=7;
        {90x43} m[ 8,2]:=57;m[8,5]:=52;m[8,6]:=51;m[8,7]:=90;m[8,8]:=43;m[8,13]:=8;
        {90x50} m[ 9,2]:=57;m[9,5]:=53;m[9,6]:=48;m[9,7]:=90;m[9,8]:=50;m[9,13]:=9;
        {90x60} m[10,2]:=57;m[10,5]:=54;m[10,6]:=48;m[10,7]:=90;m[10,8]:=60;m[10,13]:=10;
        anzmodes:=10;
end;


procedure scantextmodes;
begin
     for i:=10 to 127 do begin
      regs.ah:=0;regs.al:=i;intr($10,regs);
      directvideo:=false;

      regs.ah:=$1b;regs.bx:=0;regs.es:=seg(buffer[0]);regs.di:=ofs(buffer[0]);intr($10,regs);

        if  ((word(buffer[39])+word(buffer[40])*256)>0)   {<> mono}
        and (word(buffer[6])*256+word(buffer[5])<241)     {Zeichen zwischen 241 und 81}
        and (word(buffer[6])*256+word(buffer[5])>81)
        and ((buffer[4]=i)or(buffer[4]=3))
        then begin
           a:=0;move(a,ptr($b800,0)^,1);write('x');
           {regs.ah:=09;regs.al:=ord('x');regs.bh:=0;regs.bl:=0;regs.cx:=1;intr($10,regs); {=write'x'}
           move(ptr($b800,0)^,a,1);
           if (a=120)and(anzmodes<40) then begin
            inc(anzmodes);
            m[anzmodes,7]:=word(buffer[6])*256+word(buffer[5]); {spalten}
            m[anzmodes,8]:=buffer[34];                          {zeilen}
            str(m[anzmodes,7],help);                            {name + convert}
            stri:=help+'x';str(m[anzmodes,8],help);
            stri:=stri+help+'     ';stri[0]:=#6;
            if stri[6]=' ' then begin
             for j:=6 downto 2 do stri[j]:=stri[j-1];stri[1]:=' '
            end;
            for j:=1 to 6 do m[anzmodes,j]:=ord(stri[j]);
            m[anzmodes,13]:=100;                                {Mode}
            m[anzmodes,10]:=i;
           end;

        end
end;
end;

procedure scantextmodes2; {temp}
begin

            inc(anzmodes);
            m[anzmodes,7]:=132;                               ; {spalten}
            m[anzmodes,8]:=43;                                  {zeilen}
            str(m[anzmodes,7],help);                            {name + convert}
            stri:=help+'x';str(m[anzmodes,8],help);
            stri:=stri+help+'     ';stri[0]:=#6;
            if stri[6]=' ' then begin
             for j:=6 downto 2 do stri[j]:=stri[j-1];stri[1]:=' '
            end;
            for j:=1 to 6 do m[anzmodes,j]:=ord(stri[j]);
            m[anzmodes,13]:=100;                                {Mode}
            m[anzmodes,10]:=84;


            inc(anzmodes);
            m[anzmodes,7]:=132;                               ; {spalten}
            m[anzmodes,8]:=25;                                  {zeilen}
            str(m[anzmodes,7],help);                            {name + convert}
            stri:=help+'x';str(m[anzmodes,8],help);
            stri:=stri+help+'     ';stri[0]:=#6;
            if stri[6]=' ' then begin
             for j:=6 downto 2 do stri[j]:=stri[j-1];stri[1]:=' '
            end;
            for j:=1 to 6 do m[anzmodes,j]:=ord(stri[j]);
            m[anzmodes,13]:=100;                                {Mode}
            m[anzmodes,10]:=85;


end;





procedure checkmodes;
         var offset, segment: word;
         p:^word; i, anzahl,zaehler:integer;
         begin
          init;
          regs.ah:=79;regs.al:=0;
          regs.di:=ofs(feld);
          regs.es:=seg(feld);
           intr($10,regs);
           vesa:=istvesa;
           {write('Vesa-Untersttzung      :');if vesa=TRUE then write(' Ok') else write('Nicht vorhanden oder fehlerhaft');
           writeln;}
           if vesa=true then begin
            {write('Gefundene Vesa-Textmodi : ');}
            offset :=word(feld[15])+word(feld[16])*256;
            segment:=word(feld[17])+word(feld[18])*256;
            i:=0;
            repeat
             p:=ptr(segment,offset);
             inc(offset,2);
             inc(i);
             modi[i]:=p^;
            until p^=65535;
            dec(i);
            anzahl:=i; {modi insgesamt}
            for zaehler:=1 to anzahl do begin
             i:=modi[zaehler];
             regs.ah:=79;regs.al:=1;
             regs.cx:=i;
             regs.di:=ofs(modedata);
             regs.es:=seg(modedata);
             intr($10,regs);
             if (modedata[0] and 15=15)and(modedata[0] and 16=0)and(anzmodes<40) then begin {textmodus}

                inc(anzmodes);
                m[anzmodes,7]:=word(modedata[18])+word(modedata[19])*256; {spalten}
                m[anzmodes,8]:=word(modedata[20])+word(modedata[21])*256; {zeilen}
                str(m[anzmodes,7],help);                                  {name + convert}
                stri:=help+'x';str(m[anzmodes,8],help);
                stri:=stri+help+'     ';stri[0]:=#6;
                if stri[6]=' ' then begin
                 for j:=6 downto 2 do stri[j]:=stri[j-1];stri[1]:=' '
                 end;
                for j:=1 to 6 do m[anzmodes,j]:=ord(stri[j]);
                m[anzmodes,13]:=101;                                      {Mode}
                m[anzmodes, 9]:=79;m[anzmodes,10]:=2;                     {ax}
                m[anzmodes,11]:=hi(modi[zaehler]);m[anzmodes,12]:=lo(modi[zaehler]); {bx}





           end; {textmodus}
          end {for}
         end {if vesa}
        end;








procedure checkgraf;
       begin
        initmodes;
        checkmodes;
        init;
        writeln('textmodes:',anzmodes);

end;



procedure diagnostics;
begin
 init;

 gotoxy(20,19);write('Screen will flicker for 5-10 seconds');
 gotoxy(20,21);write('If your computer hangs during diagnostics');
 gotoxy(20,22);write('please reboot your system and setup modes');
 gotoxy(20,23);write('without running diagnostics.');

 gotoxy(20,25);write('< Press any key to start, ESC to leave >');gotoxy(80,1);
 jn1:=readkey;if jn1=#0 then jn2:=readkey;

 if jn1<>#27 then begin
  initmodes;
  checkmodes;
  scantextmodes2;
  init;
  displaymodes;

 end;


end;


{ ************************ HP ***********************+ }
begin
if istvga=FALSE then begin  {Kein Start ohne VGA}
  writeln('VGA-Grafikkarte wird vorausgesetzt. Examine abgebrochen.'); exit
 end;

init;







initmodes;












    { Prfen, ob DEStruct ueberhaupt gefunden wurde}



gotoxy(10, 5);write('<1> Run display-diagnostics and setup display modes');
gotoxy(10, 6);write('          (delete old values and new mode-installation)');

gotoxy(10, 8);write('<2> Setup display modes without running diagnostics');
gotoxy(10, 9);write('          (edit saved values / edit parameters)');
gotoxy(10,10);write('          (use this if computer hangs up at <1>)');


gotoxy(10,12);write('<3> Colors');


gotoxy(10,20);write('<X> Exit and save values');
gotoxy(10,22);write('<Q> Quit and abandon values');


{
 writeln(' Commandline-Parameters');
 writeln(' Grafikkartentest');
 writeln(' Bildschirmfarben');
 writeln(' bla');
  }
 repeat
  jn1:=readkey;
  if jn1=#0 then begin {scancodes}
   jn2:=readkey;


  end;
 if jn1='1' then diagnostics;





 until (jn1=#27)or((jn1=#0)and(jn2=#45));


{
for i:=1 to 177 do feld[i]:=0;
assign(f,'feld');rewrite(f,1);blockwrite(f,feld[1],177);close(f);

 }
assign(f,'feld');rewrite(f,1);blockwrite(f,feld[1],177);close(f);

end.
