%Mihnea Simian, mesimian.com
function result = sublarge(n1,n2)
    %n1 - n2, where n1,n2 - large integer numbers
    if(n1.no_digits==0)
	result=n2;
	result.sign = 1-result.sign;
	return;
    endif
    if(n2.no_digits==0)
	result=n1;
	return;
    endif
    
    result.no_decimals=0;
    if(n1.sign==0 && n2.sign==1)
	n2.sign=0;
	result = addlarge(n1,n2);
	return;
    elseif(n1.sign==1 && n2.sign==0)
	n2.sign=1;
	result = addlarge(n1,n2);
	return;
    endif
    
    %same sign
    
    invert_result_sign=0;
    %make n1 the bigger number in abs value
    if (n1.no_digits<n2.no_digits)
	nx=n1;
	n1=n2;
	n2=nx;
	invert_result_sign=1;
    elseif (n1.no_digits==n2.no_digits)
	for x=[1:n1.no_digits]
	    if(n1.digits(x)>n2.digits(x))
		break;
	    elseif(n1.digits(x)<n2.digits(x))
		nx=n1;
		n1=n2;
		n2=nx;
		invert_result_sign=1;
	    endif
	endfor
	if(x==1 && n1.digits(1)==n2.digits(1))
	    result=largezero;
	    return;
	endif
    endif
    
    result.sign = n1.sign;
    if(invert_result_sign)
	result.sign = 1-result.sign;
    endif
    
    remember=0;
    for x=[n1.no_digits:-1:(n1.no_digits-n2.no_digits+1)]
	temp=(n1.digits(x)-n2.digits(x-(n1.no_digits-n2.no_digits))-remember);
	remember=0;
	if(temp<0)
	    temp+=10;
	    remember=1;
	endif
	
	result.digits(x) = temp;
    
    endfor
    %result.digits

    for x=[(n1.no_digits-n2.no_digits):-1:1]
	temp=(n1.digits(x,1)-remember);
	remember=0;
	if(temp<0)
	    temp+=10;
	    remember=1;
	endif
	result.digits(x) = temp;
    endfor
    
    for x=[1:n1.no_digits]
	if(result.digits(x)~=0)
	    result.no_digits = n1.no_digits-x+1;
	    result.digits = result.digits(x:n1.no_digits)';
	    return;
	endif
    endfor
    
    %if here, it means result=0 (null)
    
    result=largezero;
endfunction 