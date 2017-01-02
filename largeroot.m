%Mihnea Simian, mesimian.com
function result = largeroot(n)
%computes square root out of a large integer positive number
%2 decimals precision
    if (mod(n.no_digits,2)==1)
	n.no_digits+=1;
	n.digits = [0; n.digits];
    endif
    n.no_digits+=4;
    n.digits =[n.digits; zeros(4,1)];
    result.sign=0;
    result.no_decimals=2;
    
    cifra=9;
    while(cifra*cifra>10*n.digits(1)+n.digits(2))
	cifra--;
    endwhile
    result.no_digits=1;
    result.digits(1)=cifra;
    acum = sublarge(formlarge(n.digits(1:2)),mklarge(cifra*cifra));
    for i=[3:2:(n.no_digits-1)]
	acum = formlarge([acum.digits; n.digits(i:(i+1))]);
	cifra=9;
	
	while(comparelarge( mulscalar(formlarge([(mulscalar(result,2)).digits; cifra]),cifra),acum )==1 )
	    cifra--;
	endwhile
	acum = sublarge(acum,mulscalar(formlarge([(mulscalar(result,2)).digits; cifra]),cifra));
	result.no_digits++;
	result.digits(result.no_digits)=cifra;
    endfor
    
    
    if( (result.digits(result.no_digits)==0) && (result.digits(result.no_digits-1)==0) )
	result.no_decimals-=2;
	result.no_digits-=2;
	result.digits = result.digits(1:result.no_digits);
    elseif((result.digits(result.no_digits))==0)
	result.no_decimals--;
	result.no_digits--;
	result.digits = result.digits(1:result.no_digits);
    endif
    
	result.digits = result.digits';
endfunction
