# Powtorka dla chłopaków
clc, clear;

c = [2000,2500,1000,1500,700,1200,0,0,0,0,0,0,0];
A = [2,3,3.5,1,0.5,1.5,1,0,0,0,0,0,0;
     1,0,0,0,0,0,0,1,0,0,0,0,0;
     0,1,0,0,0,0,0,0,1,0,0,0,0;
     0,0,1,0,0,0,0,0,0,1,0,0,0;
     0,0,0,1,0,0,0,0,0,0,1,0,0;
     0,0,0,0,1,0,0,0,0,0,0,1,0;
     0,0,0,0,0,1,0,0,0,0,0,0,1];
b = [10;2;1;1;4;10;1];
zaum = [1:6];

[x,v,optimal,B] = simplexInt(A,b,c,zaum);
for i=1:length(x)
    disp([B(i,:),' ',num2str(x(i))]);
endfor
disp(['optimal ',num2str(optimal)]);

#{
Zadanko 1

Zadanie 1
c = [-5,-6,-2,0,0,0,0];
A = [6,2,26,-1,0,0,0;
     40,4,20,0,-1,0,0;
     3,20,60,0,0,-1,0;
     18,12,13,0,0,0,-1;
     1,-2,0,0,0,0,0;
     0,-8,1,0,0,0,0];
b = [96;160;120;152;0;0];

[x,v,optimal,B] = simplex2F(A,b,c);
for i=1:length(x)
    disp([B(i,:),' ',num2str(x(i))]);
endfor
disp(['optimal ',num2str(optimal)]);

Zadanko 2

c = [2000,2500,1000,1500,700,1200,0,0,0,0,0,0,0];
A = [2,3,3.5,1,0.5,1.5,1,0,0,0,0,0,0;
     1,0,0,0,0,0,0,1,0,0,0,0,0;
     0,1,0,0,0,0,0,0,1,0,0,0,0;
     0,0,1,0,0,0,0,0,0,1,0,0,0;
     0,0,0,1,0,0,0,0,0,0,1,0,0;
     0,0,0,0,1,0,0,0,0,0,0,1,0;
     0,0,0,0,0,1,0,0,0,0,0,0,1];
b = [10;2;1;1;4;10;1];
zaum = [1:6];

[x,v,optimal,B] = simplexInt(A,b,c,zaum);
for i=1:length(x)
    disp([B(i,:),' ',num2str(x(i))]);
endfor
disp(['optimal ',num2str(optimal)]);

Zadanko 4
warning("off","OctSymPy:sym:rationalapprox")
setenv PYTHON python3
pkg load symbolic

x = sym('x', [1,2]);
f = 2*x(1)^2 + x(2)^2 - 14*x(1) - x(2) + 48;
G = [2*x(1) + x(2) - 12];

[x2, fc] = LagrangeOctave(f,G,x)
# [x2, fc] = KKTOctave(f,G,x)

Zadanko 5
warning("off","OctSymPy:sym:rationalapprox")
setenv PYTHON python3
pkg load symbolic

x = sym('x', [1,2]);
f = 5*x(1)^2 - 8*x(1)*x(2) + 7*x(2)^2 - 12*x(1) - 4*x(2) + 81;
G = [x(1) + x(2) - 16];

[x2, fc] = LagrangeOctave(f,G,x)
#}