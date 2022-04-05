function [f] = Lagrange_1(x0,x1,y0,y1)%返回拉格朗日一次插值函数
    f = @(x)(y0 + (y1 - y0)/(x1 - x0)*(x - x0));
end

