%Mihnea Simian, mesimian.com
function outputlarge(f,n)
%output large number n to file handle f
    if(n.no_digits==0)
	fprintf(f,"0\n");
	return;
    endif
    fprintf(f,"%d %d %d\n",n.no_digits,n.no_decimals,n.sign);
    fprintf(f,"%d ",n.digits);
    fprintf(f,"\n");
endfunction