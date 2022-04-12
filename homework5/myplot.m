function myplot(xt,f,g)
    x = 0:0.1:xt;
    y = [];
    for t = x
        y(end+1) = g(x,0.1,f);
    end
    plot(x,y);
end

