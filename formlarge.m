%Mihnea Simian, mesimian.com
function result = formlarge(x)
%forms a large integer positive number out of x digits
    result.sign=0;
    result.no_decimals=0;
    cpy=x(:);
    for i=cpy'
	if (i==0)
	    x=x(2:length(x));
	else
	    break;
	endif
    endfor
    result.no_digits = length(x);
    result.digits = x(:);
endfunction