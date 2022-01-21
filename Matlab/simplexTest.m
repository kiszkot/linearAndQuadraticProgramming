% Simplex test
% Krystian Baran
clc, clear;

c = [8;9;6;10;0;0];
A = [1,3,1,1,1,0;4,1,1,5,0,1];
b = [600;1200];
v = [5,6];

[x,v,optimal,B] = simplex(A,b,c,v);
for i=1:length(x)
    disp([B(i,:),' ',num2str(x(i))]);
end
disp(['optimal ',num2str(optimal)]);

%{
c = [6;5;0;0];
A = [9,7,1,0;8,8,0,1];
b = [63;64];
v = [3,4];

ans

x1 3.5
x2 4.5
s3 0
s4 0
optimal 43.5

-------

c = [8;9;6;10;0;0];
A = [1,3,1,1,1,0;4,1,1,5,0,1];
b = [600;1200];
v = [5,6];

ans

x1 0
x2 0
x3 450
x4 150
s5 0
s6 0
optimal 4200

%}
