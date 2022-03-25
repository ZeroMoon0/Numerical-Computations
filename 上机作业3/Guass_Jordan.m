function [X] = Guass_Jordan(A,n,b)
    A = [A b];
    for i=1:n
        x = A(i,i);
        for j = 1:n+1
            A(i,j) = A(i,j)/x;
        end
        
        for j = 1:n
            y = A(j,i);
            if j~= i 
                for k = 1:n+1
                    A(j,k) = A(j,k) - y*A(i,k);
                end
            end
        end    
    end
    X = A(:,n+1);
end

