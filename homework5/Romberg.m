function [output] = Romberg(a,b,f,e)%传入参数分别为起始点，终点，函数表达式，误差上界
    T = [];
    S = [];
    C = [];
    R = [];
    e0 = 1;
    T(end+1) = (b-a)*(f(a)+f(b))/2;
    T1 = [];%T1用来储存用于进行比较计算误差的值
    T1(end+1) = T(1);
    i=1;
    while e0 > e            %迭代，直到达到误差界未知
        T(end+1) =  Compound_T(a,b,f,2^i);%复合梯形公式
        S(end+1) =  Richardson(T(end-1),T(end),1);%Richarson外推公式计算S
        if i == 1
            T1(end+1) = S(1);
        elseif i == 2
           C(end+1) =  Richardson(S(end-1),S(end),2);%Richarson外推公式计算C
           T1(end+1) = C(1);
        elseif i >= 3
           C(end+1) =  Richardson(S(end-1),S(end),2);%Richarson外推公式计算R
           R(end+1) =  Richardson(C(end-1),C(end),3);
           T1(end+1) = R(end);
        end
        i = i + 1;
        e0 = abs(T1(end)-T1(end-1));
    end
    output = T1(end);
    T
    S
    C
    R    
end

