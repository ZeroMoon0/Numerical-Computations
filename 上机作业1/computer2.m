f1 = 0;
f2 = 0;
for i = 1:1:10000
    f1 = f1 + i^(-4);
end
disp(f1);

for i = 10000:-1:1
    f2 = f2 + i^(-4);
end
disp(f2);
disp(vpa(f1,20));
disp(vpa(f2,20));