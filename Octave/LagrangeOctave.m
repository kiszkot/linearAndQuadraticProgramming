function [x2,fc] = LagrangeOctave(f,G,x)

n = length(x); m = length(G);
U = sym('u', [1 m]);

L = f + U*G;

F = [gradient(L,x);G]

%sol = double(struct2array(solve(F,[x,U],'real',true)));
%solution = struct2cell(solve(F,[x,U]))

solution1 = solve(F,[x,U]);

if isempty(solution1)
    x2 = []; fc = [];
    disp('Nie istnieje rozwi?zanie regularne')
    return;
end

k = [];
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

[m1,n1] = size(sol);

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