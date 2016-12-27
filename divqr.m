%Mihnea Simian, mesimian.com
function [q r] = divqr(n1, n2)
%computes quotient and remainder of the division n1/n2
%where n1, n2 large number integers
    q=largezero;
    r=largezero;
    q.sign = mod(n1.sign + n2.sign,2);
    r_sign = n1.sign;
    n1.sign=0;
    n2.sign=0;
    if (n2.no_digits==0)
	disp("Division by zero");
	q=Inf; r=Inf;
	return;
    endif
    
    if(n1.no_digits==0)
	[q r] = [largezero largezero];
	return;
    endif
    

    if(comparelarge(n1,n2)==-1)
	q=largezero;
	r=n1;
    else
	acum=formlarge(n1.digits(1:n2.no_digits));
	pos=n2.no_digits;
	if(comparelarge(acum,n2)==-1)
	    acum = formlarge([acum.digits; n1.digits(pos+1)]);
	    pos++;
	endif
	while(pos<=n1.no_digits)
	    
	    q.no_digits++;
	    q.digits(q.no_digits,1)=0;
	    while(comparelarge(acum,n2)~=-1)
		acum = sublarge(acum,n2);
		q.digits(q.no_digits,1)++;
	    endwhile
	    
	    first_appended_digit=1;
	    while(comparelarge(acum,n2)==-1)
		pos++;
		if(pos>n1.no_digits)
		    break;
		endif
		acum = formlarge([acum.digits; n1.digits(pos)]);
		if(first_appended_digit==0)
		    q.no_digits++;
		    q.digits(q.no_digits,1)=0;
		endif
		first_appended_digit=0;
	    endwhile
	endwhile
	
	if(first_appended_digit==0)
	    q.no_digits++;
	    q.digits(q.no_digits,1)=0;
	endif
    
	r=acum;
    endif
    r.sign=r_sign;

endfunction