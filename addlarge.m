%Mihnea Simian, mesimian.com
function result = addlarge(n1,n2)
    %function is designed to sum large integer values
    if(n1.no_digits==0)
	result=n2;
	return;
    endif
    if(n2.no_digits==0)
	result=n1;
	return;
    endif
    %n1 must be bigger in abs value
    if (n1.no_digits<n2.no_digits)
	nx=n1;
	n1=n2;
	n2=nx;
    endif
    
    if(n1.sign==0 && n2.sign==1)
	n2.sign=0;
	result = sublarge(n1,n2);
	return;
    elseif(n1.sign==1 && n2.sign==0)
	n1.sign=0;
	result = sublarge(n2,n1);
	return;
    endif
    
    %if same sign
    
    result.no_digits = n1.no_digits;
    result.sign=n1.sign;
    result.no_decimals=0;
    overflow=0;
    for x=[n1.no_digits:-1:(n1.no_digits-n2.no_digits+1)]
	temp=(n1.digits(x,1)+n2.digits(x-(n1.no_digits-n2.no_digits),1)+overflow);
	
	%mod(temp,10)
	result.digits(x,1) = mod(temp,10);
	
	overflow = floor(temp/10);
    endfor
    %result.digits

    for x=[(n1.no_digits-n2.no_digits):-1:1]
	temp=(n1.digits(x,1)+overflow);
	result.digits(x,1) = mod(temp,10);
	overflow = floor(temp/10);
    endfor
    if(overflow>0)
	result.no_digits=result.no_digits+1;
	result.digits = [overflow; result.digits];
    endif
endfunction