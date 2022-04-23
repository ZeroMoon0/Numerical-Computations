function output = RK2_H(a,b,y,f,h)%a为起始点，b为结束点，y为初值，f为函数,h为步长
    %单步校正修恩型二阶RK法，即a1=0.5,a2=0.5,p1=1，q11=1
    for x=a:h:b-h
       k1 = f(x,y);
       k2 = f(x+h , y+h*k1);
       y = y + h*(k2+k1)/2;
    end
    output = y;    
end
