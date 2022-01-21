% Simplex function
% Krystian Baran

function [x,v,optimal,C] = simplex(A,b,c,v)

% v = [A(base1), A(base2 ...]

[len,x] = size(b);
if len <= x; b = transpose(b); end

B = '';
C = '';
D = [];
[len,x] = size(c);
if len <= x; c = transpose(c); end

baseSize = length(v);

for i=1:len
    if c(i) ~= 0
        C = [C ; 'x',num2str(i)];
    else
        C = [C ; 's',num2str(i)];
        B = [B ; 's',num2str(i)];
    end
end

base = zeros(baseSize,1);
for i=1:baseSize; base(i) = c(v(i)); end 
z = zeros(len,1);
cz = zeros(len,1);

head = 0; optimal = 0;
x = 0;  ix = 0;
y = 0;  iy = 0;

while(true)
    
    for i=1:len
        z(i) = transpose(base) * A(:,i);
        cz(i) = c(i) - z(i);
    end
    optimal = transpose(base) * b;
    
    [x, ix] = max(cz);
    if x<=0
        break;
    end
    
    D = b./A(:,ix);
    if max(D)<=0; break; end
    
    for i=1:length(D)
        if D(i)<0; D(i) = max(D)+1; end
    end
    [y, iy] = min(D);
    base(iy,:) = c(ix,:);
    B(iy,:) = C(ix,:);
    v(iy,:) = ix;
    
    head = A(iy,ix);
    A(iy,:) = A(iy,:) / head;
    b(iy,:) = b(iy,:) / head;
    for i=1:baseSize
        if i==iy; continue; end
        head = A(i,ix);
        A(i,:) = A(i,:) - head*A(iy,:);
        b(i,:) = b(i,:) - head*b(iy,:);
    end
    
end

x = zeros(len,1);
for i=1:baseSize
    x(v(i)) = b(i);
end

end