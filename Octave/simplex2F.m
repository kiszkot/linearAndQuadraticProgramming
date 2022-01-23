% Simplex fake base function
% Krystian Baran
# GNU Octave
#
# Input:
# A - Matrix containing binding equalities.
# b - Left side of the equalities
# c - Function to maximise, has to contain added variables
#
# Output:
# x - The solution to the problem, contains variables, the added variables
#     and variables of the added base.
# v - A vector of which variables are in the base.
# optimal - Is the optimal value for the given simplex problem
# C - A vector containing the names of the variables.
#     x named ones are from the function
#     s named ones are the added ones
#     a named ones are from the fake base, they sould always be 0


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