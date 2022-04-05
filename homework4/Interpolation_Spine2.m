function Interpolation_Spine2(M)
    %参数矩阵计算
    [n,~] = size(M);
    A = zeros(3*n-4,3*n-4);%A为求取参数的系数矩阵
    b = zeros(3*n-4,1);%b为方程的右边值

    for i = 1:n-1
       if i == 1
            A(1:3,1:4)=[M(1,1),1,0,0;M(2,1),1,0,0;1,0,-2*M(2,1),-1];
            b(1:2) = [M(1,2),M(2,2)];
       elseif i ~= n-1
           A(3*i-2:3*i,3*i-3:3*i-1)=[M(i,1)^2,M(i,1),1;M(i+1,1)^2,M(i+1,1),1;2*M(i+1,1),1,0];
           A(3*i,3*i:3*i+2) = [-2*M(i+1,1),-1,0];
           b(3*i-2:3*i) = [M(i,2),M(i+1,2),0];
       else
           A(3*i-2:3*i-1,3*i-3:3*i-1) = [M(i,1)^2,M(i,1),1;M(i+1,1)^2,M(i+1,1),1];
           b(3*i-2:3*i-1) = [M(i,2),M(i+1,2)];
       end
    end

    S = Guass_Jordan(A,3*n-4,b);
    %绘制二次样条图像
    X = [];
    Y = [];
    k = 1;
    for i = M(1:1):0.01:M(n,1)
        if i == M(k+1,1)
            k = k + 1;
        end
        X(end+1) = i;   
        if k == 1
            Y(end+1) = S(1)*i+S(2);
        elseif k == n
            Y(end+1) = M(n,2);
        else 
            Y(end+1) = S(3*k-3)*(i^2)+S(3*k-2)*i+S(3*k-1);
        end    
    end
    
    plot(M(:,1),M(:,2),'o',X,Y);
    
end

