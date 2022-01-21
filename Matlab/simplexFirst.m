# Simplex
# Krystian Baran
clc,clear, format long;

c = [6;5;0;0];
A = [9,7,1,0;8,8,0,1];
b = [63;64];
optimal = 0;

[len,optimal] = size(c);
base = zeros(2,1);
[lenbase,optimal] = size(base);
z = zeros(len,1);
cz = zeros(len,1);

head = 0;
x = 0;
ix = 0;
y = 0;
iy = 0;

while(true)
  for i=1:len
     z(i) = transpose(base) * A(:,i);
     cz(i) = c(i) - z(i);
  endfor
  optimal = transpose(base) * b;
  
  [x, ix] = max(cz);
  if x<=0
    break;
  endif
  [y, iy] = min(b./A(:,ix));
  base(iy,:) = c(ix,:);
  
  head = A(iy,ix);
  A(iy,:) = A(iy,:) / head;
  b(iy,:) = b(iy,:) / head;
  for i=1:lenbase
    if i==iy continue; endif
    head = A(i,ix);
    A(i,:) = A(i,:) - head*A(iy,:);
    b(i,:) = b(i,:) - head*b(iy,:);
  endfor
  disp(A)

endwhile

disp(cz);
disp("crap");
disp(z);
disp("max");
disp(optimal);
