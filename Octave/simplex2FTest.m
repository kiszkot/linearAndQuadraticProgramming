# Simplex fake base test
# Krystian Baran
# GNU Octave
clc, clear;

c = [2;5;0;0;0;0];
A = [2,-1,1,0,0,0;-1,6,0,1,0,0;1,0,0,0,1,0;0,1,0,0,0,1];
b = [6;24;5;4];

[x,v,optimal,B] = simplex2F(A,b,c);
for i=1:length(x)
    disp([B(i,:),' ',num2str(x(i))]);
endfor
disp(['optimal ',num2str(optimal)]);

#{

c = [-3,-5,0,0];
A = [4,2,-1,0;5,6,0,1];
b = [8;30];

ans

x1 2
x2 0
s3 0
s4 20
a5 0
a6 0
optimal -6

---------------

c = [1;1;1;0;0;0];
A = [-1,0,2,1,0,0;16,-7,-4,0,1,0;-1,12,-4,0,0,1];
b = [6;16;24];

ans

x1 4
x2 4
x3 5
s4 0
s5 0
s6 0
a7 0
a8 0
a9 0
optimal 13

------------------

c = [2850,6270,0,0,0,0,0,0];
A = [19000,33000,1,0,0,0,0,0;
     6,4,0,1,0,0,0,0;
     1,0,0,0,1,0,0,0;
     1,0,0,0,0,-1,0,0;
     0,1,0,0,0,0,1,0;
     0,1,0,0,0,0,0,-1];
b = [2400000;520;100;10;75;5];


#}