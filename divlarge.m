%Mihnea Simian, mesimian.com
function result = divlarge(n1,n2)
    %computes the division n1/n2 with 2 decimals
    %where n1, n2 large number integers

	% get rid of decimals; losing precision of course
	n1 = floorlarge(n1);
	n2 = floorlarge(n2);

    result.sign = mod(n1.sign + n2.sign,2);
    n1.sign=0;
    n2.sign=0;
    if (n2.no_digits==0)
	disp("Division by zero");
	result = Inf;
	return;
    endif
    
    if(n1.no_digits==0)
	result = largezero;
	return;
    endif
    
    result.no_digits=0;
    result.no_decimals=0;
    result.digits(1)=0;
    
    n1.no_digits+=2;
    n1.digits(n1.no_digits-1)=0;
    n1.digits(n1.no_digits)=0;
    [q r]=divqr(n1,n2);
    result.digits=q.digits;
    if(q.no_digits==0)
	result=largezero;
	return;
    endif
    result.no_digits=q.no_digits;
    result.no_decimals=2;
    if( (result.digits(result.no_digits)==0) && (result.digits(result.no_digits-1)==0) )
	result.no_decimals-=2;
	result.no_digits-=2;
	result.digits = result.digits(1:result.no_digits);
    elseif((result.digits(result.no_digits))==0)
	result.no_decimals--;
	result.no_digits--;
	result.digits = result.digits(1:result.no_digits);
    endif
endfunction
