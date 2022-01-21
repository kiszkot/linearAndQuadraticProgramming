function [x2,fc] = LagrangeMatlab(f,G,x)

n = length(x); m = length(G);
U = sym('u', [1 m]);

L = f + U*G;

F = [gradient(L,x);G];
sol = double(struct2array(solve(F,[x,U],'real',true)));

if isempty(sol)
    %sol = double(struct2array(solve(G,x,'real',true)))
    sol = double(struct2array(solve(F,x,'real',true)))
    x2 = sol;    fc = subs(f,x,x2);
    disp('Nie istnieje rozwi¹zaneie regularne')
    return;
end

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