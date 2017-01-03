%Mihnea Simian, mesimian.com
function result = mulscalar(n1,d)
%multiply large integer n1 by scalar d

	% get rid of decimals; losing precision of course
	n1 = floorlarge(n1);

    result.no_decimals=0;
    if(n1.no_digits==0 || d==0)
	result=largezero;
	return;
    endif

    result.sign = n1.sign;
    
    
    result.no_digits = n1.no_digits;
    overflow = 0;
    for x=[n1.no_digits:-1:1]
	temp = n1.digits(x)*d + overflow;
	overflow =floor(temp/10);
	result.digits(x) = mod(temp,10);
    endfor
    
    result.digits = result.digits(:);
    if(overflow>0)
	result.no_digits++;
	result.digits = [overflow; result.digits];
    endif
    
endfunction
