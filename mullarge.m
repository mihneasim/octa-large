%Mihnea Simian, mesimian.com
function result = mullarge(n1, n2)
    result=largezero;
    if(n1.no_digits==0 || n2.no_digits==0)
	return;
    endif
    result_sign = mod(n1.sign+n2.sign,2);
    n1.sign=0;
    n2.sign=0;
    for x=[1:n2.no_digits]
	temp = mulscalar(n1,n2.digits(x));
	if(temp.no_digits~=0)
	    temp.no_digits+=n2.no_digits-x;
	    temp.digits( (temp.no_digits-n2.no_digits+x+1):temp.no_digits )=0;
	    result = addlarge(result,temp);
	endif
    endfor
    
    result.sign = result_sign;
    
endfunction