%gets rid of decimals by floor operation
function result = floorlarge(x)
    if (x.no_decimals == 0)
        result = x;
    else
        x.digits = x.digits(1:(x.no_digits - x.no_decimals));
        x.no_digits = x.no_digits - x.no_decimals;
        x.no_decimals = 0;
        if (x.sign == 1)
            result = sublarge(x, mklarge(1));
        else
            result = x;
        endif
    endif
endfunction
