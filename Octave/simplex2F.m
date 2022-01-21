% Simplex fake base function
% Krystian Baran
# GNU Octave

function [x,v,optimal,C] = simplex2F(A,b,c)

% v = [A(base1), A(base2) ...]

# define M as big value
M = 10^9;

# transform to column vector
[len,x] = size(b);
if len <= x; b = transpose(b); endif

[len,x] = size(c);
if len <= x; c = transpose(c); len = x; endif

# add fake base and define base
baseSize = length(b);
D = eye(baseSize);
A = [A D];
v = zeros(baseSize,1);
for i=1:baseSize
  c = [c; -M*D(i,i)];
  len = len + 1;
  v(i) = len;
endfor

# call simplex with added base
[x,v,optimal,C] = simplex(A,b,c,v);

endfunction