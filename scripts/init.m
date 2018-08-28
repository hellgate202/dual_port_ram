f = fopen("../tb/init.txt","w+");
for i=1:1:32
  d = dec2hex(i);
  fwrite(f,d);
  fwrite(f,"\n");
endfor
