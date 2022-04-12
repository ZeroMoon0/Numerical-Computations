function [output] = d_Richardson(x,h,f,e)
    %D_RICHARDSON 外推法求解微分
    T = [];
    S = [];
    C = [];
    es = 1;
    
    R = [];%记录值
    T(1) = dm(x,h,f);
    R(end+1) = T(1);
    i=1;
    while es > e
        T(end+1) = dm(x,h/2,f);
        S(end+1) = 4/3*T(end) - 1/3*T(end-1);
        if i==1
            R(end+1) = S(1);
        else
            C(end+1) = 16/15*S(end) - 1/15*S(end-1);
            R(end+1) = C(end);
        end
        i = i + 1;
        es = abs(R(end) - R(end-1));
    end
     
    output = R(end);
end

