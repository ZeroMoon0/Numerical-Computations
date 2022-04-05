function Interpolation_Split1(M)
    X = [];
    Y = [];
    [n,~] = size(M);
    
    for i = 1:n-1%n个点可以分成n-1个段，进行一次插值
        f = Lagrange_1(M(i,1),M(i+1,1),M(i,2),M(i+1,2));
        for x = M(i,1):0.1:M(i+1,1)
            X(end+1) = x;
            Y(end+1) = f(x);
        end        
    end
    plot(M(:,1),M(:,2),'o',X,Y);

end

