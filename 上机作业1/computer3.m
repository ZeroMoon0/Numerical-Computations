format long
x = single(100000);
y1 = single(log(x - sqrt(x^2-1)));
y2 = single(-log(x + sqrt(x^2-1)));
disp(y1);
disp(y2);