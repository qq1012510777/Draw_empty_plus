clc
clear all
close all


X = 0.8;
Y = 0.8;

x = 0.2;
y = 0.2;

Pnt = [X/2-x/2, 0; 
    X/2+x/2, 0;
    X, Y/2-y/2;
    X, Y/2+y/2;
    X/2+x/2, Y; 
    X/2-x/2, Y;
    0, Y/2+y/2;
    0, Y/2-y/2];

center = [X/2, Y/2];

Pnt2 = [center(1) + x/2, center(2) - y/2;
    center(1) + x/2, center(2) + y/2;
    center(1) - x/2, center(2) + y/2;
    center(1) - x/2, center(2) - y/2;];

Pnt3 = [];
for i = 1:4
    Pnt3 = [Pnt3; Pnt(i*2-1, :); Pnt(i * 2, :)];
    Pnt3 = [Pnt3; Pnt2(i, :)];
end

Pnt3 = [Pnt3; Pnt3(1, :)];

figure(1)
%scatter(Pnt2(:, 1), Pnt2(:, 2))
%plot(Pnt3(:, 1), Pnt3(:, 2), '-')

Pnt3(:, 1) = Pnt3(:, 1) + 0.1;
for i = 1:size(Pnt3, 1)
    f = Quaternion_Rotation(-45, 0, 0, 1, Pnt3(i, 1) - 0.5, Pnt3(i, 2) - 0.4 ,0 );
    Pnt3(i, :) = [f(1) + 0.5, f(2) + 0.4];
end

plot(Pnt3(:, 1), Pnt3(:, 2), '-')

for i = 1:size(Pnt3, 1)-1
    disp(['(', num2str(Pnt3(i, 1)), 'em,', num2str(Pnt3(i, 2)), 'em)', '--', '(', num2str(Pnt3(i+1, 1)), 'em,', num2str(Pnt3(i+1, 2)), 'em)'])
end