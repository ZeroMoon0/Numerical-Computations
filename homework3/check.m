function [notok] = check(ea,n)
       es = 5e-10;
       notok = true;
       count = 0;
       for i =1:n
           if ea(i) < es
               count = count + 1;%当其中一个解的误差达到容限时，count加一
           end
       end
       if count == n %当count积累到n时，则所有解都达到了容限，此时循环结束
           notok = false;
       end
end

