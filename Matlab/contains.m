% Krystian Baran
% Matlab R2011b
% Function to check if matrix contains a given number
% M - matix to be checked
% a - searched number
% return:
% bool - 0 if false, 1 if true
% ibool - first index of variable

function [bool,ibool,jbool] = contains(M, a)
  
  [height, width] = size(M);
  bool = 0;
  
  for i=1:height
    for j=1:width
      if M(i,j) == a
        bool = 1;
        ibool = i;
        jbool = j;
        return;
      end
    end
  end
  
end
