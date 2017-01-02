%gets rid of decimals by floor operation
function result = floor(x)
    if (x.no_decimals == 0)
        result = x;
    else
        x.digits = x.digits(1:(x.no_digits - x.no_decimals));
        x.no_decimals = x.no_digits - x.no_decimals;
        x.no_digits = 0;
        result = x;
    endif
endfunction
