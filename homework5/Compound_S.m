function [output] = Compound_S(a,b,f,n)
    %复合Simpson公式,n为偶数个子区间
    h = (b-a)/n;
    output = f(a) + f(b);
    m = n/2;
    for i=0:m-1
        if i==0
            output = output + f(a+(2*i+1)*h)*4;
        else
            output = output + f(a+(2*i+1)*h)*4 + f(a+(2*i)*h)*2;
        end
    end
    output = output*h/3;
end

