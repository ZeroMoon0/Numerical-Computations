function [output] = Richardson(T1,T2,m)
%Richardson外推法
    output = ((4^m)*T2 - T1)/(4^m-1);
end

