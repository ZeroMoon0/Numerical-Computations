function Interpolation_Split2(M)
    X = [];
    Y = [];
    [n,~] = size(M);
    
    for i = 1:2:n-1%每次插值包含3组点数据，进行二次插值
        f = Lagrange_2(M(i,1),M(i+1,1),M(i+2,1),M(i,2),M(i+1,2),M(i+2,2));
        for x = M(i,1):0.1:M(i+2,1)
            X(end+1) = x;
            Y(end+1) = f(x);
        end        
    end
    plot(M(:,1),M(:,2),'o',X,Y);

end

