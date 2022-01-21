# Integer Simplex Test
# GNU Octave
# Krystian Baran

clc,clear;

c = [3,7,0,0];
A = [3,8,1,0;
     2,3,0,1];
b = [24;12];
zaum = [1,2];

[x,v,optimal,B] = simplexInt(A,b,c,zaum);
for i=1:length(x)
    disp([B(i,:),' ',num2str(x(i))]);
endfor
disp(['optimal ',num2str(optimal)]);
