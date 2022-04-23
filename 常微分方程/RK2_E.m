function output = RK2_E(a,b,y,f,h)%a为起始点，b为结束点，y为初值，f为函数,h为步长
    %中心公式型二阶RK法，即a1=0,a2=1,p1=q11=0.5
    for x=a:h:b-h
       k1 = f(x,y);
       k2 = f(x+h/2 , y+h*k1/2);
       y = y + h*k2;
    end
    output = y;    
end

