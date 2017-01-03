%Mihnea Simian, mesimian.com
function result = comparelarge(n1,n2)
%compares two large positive numbers
%-1 n1 is smaller
%0 n1 equals n2
%1 n1 is larger

	% get rid of decimals; losing precision of course
	n1 = floorlarge(n1);
	n2 = floorlarge(n2);

    if(n1.no_digits<n2.no_digits)
	result=-1;
	return;
    elseif(n1.no_digits>n2.no_digits)
	result=1;
	return;
    else
	for x=[1:n1.no_digits]
	    if(n1.digits(x)>n2.digits(x))
		result=1;
		return;
	    elseif(n1.digits(x)<n2.digits(x))
		result=-1;
		return;
	    endif
	endfor
	result=0;
	return;
    endif

endfunction
