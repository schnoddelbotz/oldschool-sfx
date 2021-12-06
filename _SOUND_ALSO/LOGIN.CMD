echo on
display \nModem RESET\n
output atz\13
input 10 OK\n
display \nModem Einstellung\n
output at\13
input 10 OK\13
display \n\nEinwählversuch
output atdt0,0753168955\n
if [input 20 BUSY\n]
   display Besetzt\n
   abort
end
input 40 CONNECT
display \nEinloggen\n
input 20 login:
output kutter\n
input 20 Password:
output $password\n
bootp