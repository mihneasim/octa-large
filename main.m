%Mihnea Simian, mesimian.com
function main
%big number structure:
%number_of_digits(total) number_of_digits sign
%digits' list
%
%infile:
%big number 1
%big number 2
%one digit standard integer (scalar)

    infile="infile";
    outfile="outfile";

    f=fopen(infile,"r");
    [n1.no_digits n1.no_decimals n1.sign count] = fscanf(f,"%i %i %i","C");
    [n1.digits n1.no_digits] = fscanf(f,"%i",n1.no_digits);
    [n2.no_digits n1.no_decimals n2.sign count] = fscanf(f,"%i %i %i","C");
    [n2.digits n2.no_digits] = fscanf(f,"%i",n2.no_digits);
    [digit count] = fscanf(f,"%i","C");
    fclose(f);
    %addlarge(n1,n2)
    %sublarge(n1,n2)
    %mulscalar(n1,digit)
    %mullarge(n1,n2)
    f=fopen(outfile,"w");
    
    outputlarge(f,addlarge(n1,n2));
    outputlarge(f,sublarge(n1,n2));
    outputlarge(f,mulscalar(n1,digit));
    outputlarge(f,mullarge(n1,n2));
    [q r] = divqr(n1,n2);
    outputlarge(f,q);
    outputlarge(f,r);
    outputlarge(f,divlarge(n1,n2));
    outputlarge(f,largeroot(n1));
    outputlarge(f,largeroot(n2));
    fclose(f);
endfunction
