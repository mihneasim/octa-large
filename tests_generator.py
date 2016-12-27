#Mihnea Simian, mesimian.com
#generates input files for test (infile)
import random
from math import ceil,floor

def somedigit():
    return int(ceil(random.random()*10)-1);

random.seed();

no_digits1=20;
no_digits2=18;

scalar=somedigit();
print no_digits1,"0",int(round(random.random()));
print int(ceil(random.random()*9)),
for i in range(no_digits1-1):
    print somedigit(),
print "\n",

print no_digits2,"0",int(round(random.random()));
print int(ceil(random.random()*9)),
for i in range(no_digits2-1):
    print somedigit(),
print "\n",scalar;