import os;

output = os.popen('/usr/bin/dig @192.168.0.200 jeffreyd.net. axfr').read();
for i in output.splitlines():
   print (i);
   

