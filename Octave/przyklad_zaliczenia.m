# Zadania podobne do kolosa
# PLiK - Krystian Baran
# GNu Octave
clc, clear;

warning("off","OctSymPy:sym:rationalapprox")
setenv PYTHON python3
pkg load symbolic

x = sym('x', [1;2]);
A = [-1, 1; 1, -3];
b = [2; 3];
p = [1; 1];

C = p' * x;
y = transpose(x) * A * x + b' * x;
f = c * y + p' * x;
G = [x(1); x(2)];

[x2, fc] = LagrangeOctave(f,G,x)

#{
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

=========================================
Zadanie 2
c = [2000,2500,1000,1500,700,1200];
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

=========================================
Zadanie 3
Nie dla komputera
#}