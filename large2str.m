%Mihnea Simian, mesimian.com
function result = large2str(x)
%returns string out of large number
    result = "";
    index = 0;
    if (x.no_digits - x.no_decimals == 0)
        result = "0";
    endif
    for i = x.digits'
        index++;
        if (x.no_digits - x.no_decimals + 1 == index)
            result = strcat(result, ".");
        endif
        result = strcat(result, num2str(i));
    endfor
    if (x.no_digits > 0 && x.sign == 1)
        result = strcat("-", result);
    endif
endfunction
