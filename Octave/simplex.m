% Simplex function
% Krystian Baran
# Gnu Octave

# Input:
# A - Matrix containing binding equalities.
# b - Left side of the equalities
# c - Function to maximise, has to contain added variables
# v - Idexes of which variables are in the base
#
# Output:
# x - The solution to the problem, contains variables, the added variables
#     and variables of the added base.
# v - A vector of which variables are in the base.
# optimal - Is the optimal value for the given simplex problem
# C - A vector containing the names of the variables.
#     x named ones are from the function
#     s named ones are the added ones

function [x,v,optimal,C] = simplex(A,b,c,v)

% v = [A(base1), A(base2 ...]

# transpose vector if needed
[len,x] = size(b);
if len <= x; b = transpose(b); endif

[len,x] = size(c);
if len <= x; c = transpose(c); endif

# name variables
B = '';
C = '';
D = [];
baseSize = length(v);
for i=1:len
  switch c(i)
    case 0
      C = [C ; 's',num2str(i)];
    case -10^9
      C = [C ; 'a',num2str(i)];
      B = [B ; 'a',num2str(i)];
    otherwise
      C = [C ; 'x',num2str(i)];
  endswitch
endfor

# set initial values and definition of helping variables
base = zeros(baseSize,1);
for i=1:baseSize; base(i) = c(v(i)); endfor

z = zeros(len,1);
cz = zeros(len,1); # last row of simplex matrix defined as c(i) - z(i)

head = 0; optimal = 0;
x = 0;  ix = 0;
y = 0;  iy = 0;

while(true)
    
    # calculate z, cz and optimal value
    for i=1:len
        z(i) = transpose(base) * A(:,i);
        cz(i) = c(i) - z(i);
    endfor
    optimal = transpose(base) * b;
    
    # check if max of last row is posive and break if not
    [x, ix] = max(cz);
    x = cz(ix);
    if x<=0
        break;
    endif
    
    # check min of last column and break if max is negative
    # can't divide by zero or negative number, 0/-1 gives 0
    # this number cannot enter the base
    D = b./A(:,ix);
    if max(D)<=0; break; endif
    
    for i=1:length(D)
        if D(i)<0 || A(i,ix) <= 0; D(i) = max(D)+1; endif
    endfor

    [y, iy] = min(D);
    base(iy,:) = c(ix,:);
    B(iy,:) = C(ix,:);
    v(iy) = ix;
    
    # gaussian elimination for rest of A matrix
    head = A(iy,ix);
    A(iy,:) = A(iy,:) / head;
    b(iy,:) = b(iy,:) / head;
    for i=1:baseSize
        if i==iy; continue; endif
        head = A(i,ix);
        A(i,:) = A(i,:) - head*A(iy,:);
        b(i,:) = b(i,:) - head*b(iy,:);
    endfor
    
endwhile

# creates results vector
x = zeros(len,1);
for i=1:baseSize
    x(v(i)) = b(i);
endfor

endfunction