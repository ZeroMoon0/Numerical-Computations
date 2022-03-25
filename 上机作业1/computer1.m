format long
f1 = single(0);
f2 = single(0);
for i = single(1):single(1):single(10000)
    f1 = f1 + i^(-4);
end
disp(f1);

for i = single(10000):single(-1):single(1)
    f2 = f2 + i^(-4);
end
disp(f2);
