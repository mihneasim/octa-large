#Mihnea Simian, mesimian.com
#script for testing large numbers operations
#please edit lines 53 and 61 with appropiate paths to "infile" and "outfile" files
from os import system
import sys
noTests=5
score=0
points=[1,1,1,1.5,1,0.5,2,1,1]
tests = ['Addition','Substraction','Digit Multiply','Multiplication','Quotient','Remainder','Division','Square root 1','Square root 2']
error=''
result_file='results.txt'

class Number():
    def __init__(self,line):
	line=line.rstrip().lstrip()
	if(line=="0"):
	    self.decimals=0
	    self.nodigits=0
	    self.digits=list()
	    self.sign=0
	else:
	    
	    ls = map(str.lstrip,map(str.rstrip,line.split(" ")))
	    #print "Ls is "+str(ls)
	    self.nodigits=ls[0]
	    self.decimals=ls[1]
	    self.sign=ls[2]
	    
    def setdigits(self,line):
	self.digits=map(str.rstrip,map(str.lstrip,line.split(" ")))
	self.nodigits=len(self.digits)
	
    def __eq__(self,other):
	if(self.nodigits==other.nodigits and self.nodigits==0):
	    return True
	if(self.nodigits==other.nodigits and self.decimals==other.decimals and self.sign==other.sign and self.digits==other.digits):
	    return True
	self.error=''
	if(self.nodigits!=other.nodigits):
	    self.error += "\nNumber of digits mismatch"
	if(self.decimals!=other.decimals):
	    self.error += "\nNumber of decimals mismatch"
	if(self.sign!=other.sign):
	    self.error += "\nSign mismatch"
	if(self.digits!=other.digits):
	    self.error += "\nDigits mismatch"
	return False
    
    def __ne__(self,other):
	return ( not self.__eq__(other))

for i in range(noTests):
    infile="infile"+str(i)
    system("cp "+infile+" infile")
    print "Testing infile"+str(i)
    system("octave -q --eval main")
    system("cp outfile his_out"+str(i))
    result=list()
    his_result=list()
    newnumber=True
    for line in open("outfile"+str(i),'r').readlines():
	if(newnumber):
	    result.append(Number(line))
	    if(result[-1].nodigits!=0):
		newnumber=False
	else:
	    result[-1].setdigits(line)
	    newnumber=True
	    
    newnumber=True
    for line in open("his_out"+str(i),'r').readlines():
	if(newnumber):
	    his_result.append(Number(line))
	    if(his_result[-1].nodigits!=0):
		newnumber=False
	else:
	    his_result[-1].setdigits(line)
	    newnumber=True
    
    for x in range(len(his_result)):
	if(his_result[x]!=result[x]):
	    print "Error in ",tests[x],":",his_result[x].error
	else:
	    score+=points[x]

print "Sum: ",score," out of ",str(noTests*10)
score = float(score)/noTests
print "Average: ",str(score)," out of 10"