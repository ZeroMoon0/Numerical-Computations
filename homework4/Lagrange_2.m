function [f] = Lagrange_2(x0,x1,x2,y0,y1,y2)
    %返回拉格朗日二次插值函数
    f = @(x)( y0*(x - x1)*(x - x2)/(x0 - x1)/(x0 - x2) + y1*(x - x0)*(x - x2)/(x1 - x2)/(x1 - x0) + y2*(x - x0)*(x - x1)/(x2 - x1)/(x2 - x0));
end

