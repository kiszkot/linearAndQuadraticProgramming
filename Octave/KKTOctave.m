function [x2,fc] = KKTOctave(f,G,x)

n = length(x); m = length(G);
U = sym('u', [1 m]);

L = f + U*G;

F = [gradient(L,x);transpose(U).*G]

%sol = double(struct2array(solve(F,[x,U],'real',true)));
%solution = struct2cell(solve(F,[x,U]))

# Check if there is a solution
solution1 = solve(F,[x,U]);

if isempty(solution1)
    x2 = []; fc = [];
    disp('Nie istnieje rozwi?zanie regularne')
    return;
end

# Remove complex solutions
if length(solution1)==1
  sol = double([struct2cell(solution1){:}]);
else
  sol = zeros(length(solution1),n+m);
  k = [];
  for i = 1:length(solution1)
    sol(i,:) = double([struct2cell(solution1{i}){:}]);
    if ~isreal(sol(i,:))
      k = [k,i];
    end
  end
end
sol(k,:)=[];

# Non Negative check
[m1,n1] = size(sol);
k = [];
for i=1:m1
  for j=n:n1
    if sol(i,j) < 0, k = [k i]; endif
  endfor
endfor
sol(k,:) = [];
[m1,n1] = size(sol);

# Check if solution is allowed gi(x) <= 0
k = []; g = 0;
for i=1:m1
  x1 = sol(i,:);
  for j=1:m
    g = subs(G(j), [x, U], x1);
    if g > 0, k = [k i]; endif
  endfor
endfor
sol(k,:) = [];
[m1,n1] = size(sol);

# Select minimal solutions
# The ones where fc is minimal
min = inf;
x2 = 0;
for i = 1:m1
    x1 = sol(i,1:n);
    fc = subs(f,x,x1);
    if (fc<min)
        min = fc;
        x2 = x1;
    elseif (fc == min)
        x2 = [x2;x1];
    end
end
fc = double(min);