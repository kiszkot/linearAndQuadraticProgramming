# KKT and Lagrange Test
# GNU Octave
# Krystian Baran
clc, clear;
warning("off","OctSymPy:sym:rationalapprox")
setenv PYTHON python3
pkg load symbolic

x = sym('x', [1,2]);
f = -x(1) - 2*x(2) + x(2)^2;
G = [x(1) + x(2) - 1; -x(1); -x(2)];

# [x2, fc] = LagrangeOctave(f,G,x)
[x2, fc] = KKTOctave(f,G,x)

#{
x = sym('x', [1,2]);
f = x.^2 * [1;2];
G = [1 - x(1)^2 - x(2)^2];

x2 =

  -1   0
   1   0

fc = 1
x2 =

  -1   0
   1   0

fc = 1

----------------------------

#}