function [table] = SetTable(f,h,x1,x2)
    m = x1:h:x2;
    n = [];
    for k = m
        n(end+1) = f(k);
    end
    table=[m',n'];
end

