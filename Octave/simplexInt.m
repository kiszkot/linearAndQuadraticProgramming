# Simplex Integer numbers
# GNU Octave
# Krystian Baran
#
# Input:
# A - Matrix containing binding equalities.
# b - Left side of the equalities
# c - Function to maximise, has to contain added variables
# zaum - Idexes of which variables have to be integers
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
#     Note that the solution can have more s values than the staring problem.
#     This is because new s values are added to have integer solutions.
#     If you want to know which ones are from this addition just count from the
#     first s how many you had at the beginning. The rest are from the integer
#     algorithm

function [x,v,optimal,C] = simplexInt(A,b,c,zaum)
  
  # solving with simplex two fase
  [x,v,optimal,C] = simplex2F(A,b,c);
  
  # cheking if zaum are integers
  ind = rem(x(zaum),1)~=0;
  if contains(ind,1)
    
    # check if degenerate
    if contains(v>length(c),1)
      x = [];
      optimal = -inf;
      return;
    else
      
      # split problem
      # left side
      id = find(ind,1);
      [h,l] = size(A);
      c1 = [c,0];
      b1 = [b;floor(x(id(1)))];
      A1 = [A zeros(h,1)];
      A1 = [A1; zeros(1,l+1)];
      A1(end,[zaum(id(1)),end]) = [1,1];
      [x1,v1,optimal1,C1] = simplexInt(A1,b1,c1,zaum);
      
      # right side
      c2 = [c,0];
      b2 = [b;ceil(x(id(1)))];
      A2 = [A zeros(h,1)];
      A2 = [A2; zeros(1,l+1)];
      A2(end,[zaum(id(1)),end]) = [1,-1];
      [x2,v2,optimal2,C2] = simplexInt(A2,b2,c2,zaum);
      
      # check which optimal is better
      if optimal1 >= optimal2
        x = x1;
        v = v1;
        optimal = optimal1;
        C = C1;
        # x,v,optimal,C] = [x1,v1,optimal1,C1];
        return;
      else
        x = x2;
        v = v2;
        optimal = optimal2;
        C = C2;
        # [x,v,optimal,C] = [x2,v2,optimal2,C2];
        return;
      endif
      
    endif
    
  else
    return;
  endif
  
endfunction
