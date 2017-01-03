%Mihnea Simian, mesimian.com
function n = str2large(x)
%creates a large integer representation out of a string
	pos = 1;
    if(x(1) == "-")
		n.sign = 1;
		pos++;
    elseif(x == "0")
		n = largezero;
		return;
    else
		n.sign = 0;
    endif;
    n.no_decimals = 0;
    n.no_digits = 0;
    n.digits = [];
	reached_decimals = 0;
    while(pos <= length(x))
		if (x(pos) == ".")
			reached_decimals = 1;
			pos++;
			continue;
		endif
		n.digits = [n.digits; x(pos) - 48];
		n.no_digits++;
		if (reached_decimals == 1)
			n.no_decimals++;
		endif
		pos++;
    endwhile
endfunction
