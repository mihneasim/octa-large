%Mihnea Simian, mesimian.com
function n = mklarge(x)
%creates a large integer representation out of a standard one
    if(x<0)
	n.sign=1;
	x=-x;
    elseif(x==0)
	n=largezero;
	return;
    else
	n.sign=0;
    endif;
    n.no_decimals=0;
    n.no_digits=0;
    n.digits=[];
    while(x~=0)
	n.digits = [mod(x,10); n.digits];
	n.no_digits++;
	x=floor(x/10);
    endwhile

endfunction