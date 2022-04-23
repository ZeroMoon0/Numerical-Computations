function output = RK4(a,b,y,f,h)
    %经典的四阶龙格库塔法
    for x=a:h:b-h
        k1 = f(x,y);
        k2 = f(x+h/2,y+h/2*k1);
        k3 = f(x+h/2,y+h/2*k2);
        k4 = f(x+h,y+h*k3);
        y = y + (k1 + 2*k2 + 2*k3 + k4)/6*h;
    end
    output = y;
end

