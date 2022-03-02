# Kolokwium PLiK
# Krystian Baran
# Octave
clc, clear;

c = [3.6, 5.4, 3.6, 0, 0];
A = [3, 6, 8, 1, 0;
     6, 4, 2, 0, 1];
b = [1500; 1200];

[x,v,optimal,B] = simplex2F(A,b,c);
for i=1:length(x)
    disp([B(i,:),' ',num2str(x(i))]);
endfor
disp(['optimal ',num2str(optimal)]);

#{
Zadanie 1
c = [-5, -2.5, 0, 0, 0];
A = [0.5, 0.25, 1, 0, 0;
     0.1, 0.03, 0, -1, 0;
     0.01, 0.01, 0, 0, -1];
b = [25, 3, 0.5];

simplex2F

x1 21.4286
x2 28.5714
s3 7.1429
s4 0
s5 0
a6 0
a7 0
a8 0
optimal -178.5714

---
Zadanie 2
c = [3.6, 5.4, 3.6, 0, 0];
A = [3, 6, 8, 1, 0;
     6, 4, 2, 0, 1];
b = [1500; 1200];

simplex2F

x1 50
x2 225
x3 0
s4 0
s5 0
a6 0
a7 0
optimal 1395

---
Zadanie 3

---
Zadanie 4
warning("off","OctSymPy:sym:rationalapprox")
setenv PYTHON python3
pkg load symbolic

x = sym('x', [1,3]);
f = x(1)^2 + 2*x(2)^2 + 3*x(3)^2 - 2*x(1) - 4*x(2) - 6*x(3) + 14;
G = [x(1) + x(2) + x(3) - 15];

[x2, fc] = LagrangeOctave(f,G,x)

#}