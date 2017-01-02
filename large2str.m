%Mihnea Simian, mesimian.com
function result = large2str(x)
%returns string out of large number
    result = "";
    for i = x.digits'
        result = strcat(result, num2str(i));
    endfor
endfunction
