function output = fixdata(in)
 s = size(in);
 frac = 1/8;
 output = zeros(s(1),1);
    for c = 1:s(1)
        output(c) = roundfrac(in(c),frac);
    end
end