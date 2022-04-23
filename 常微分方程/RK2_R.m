function output = RK2_R(a,b,y,f,h)%a为起始点，b为结束点，y为初值，f为函数,h为步长
    %罗森型二阶RK法，即a1=1/3,a2=2/3,p1=q11=3/4
    for x=a:h:b-h
       k1 = f(x,y);
       k2 = f(x+h/4*3 , y+h*k1/4*3);
       y = y + h*(k2*2/3+k1*1/3);
    end
    output = y;    
end

