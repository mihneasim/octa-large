%Mihnea Simian, mesimian.com
function result = large2str(x)
%returns string out of large number
    result = "";
    index = 0;
    for i = x.digits'
        index++;
        if (x.no_digits - x.no_decimals + 1 == index)
            result = strcat(result, ".");
        endif
        result = strcat(result, num2str(i));
    endfor
endfunction
