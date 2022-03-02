require "simplex"

local c = {8, 9, 6, 10, 0, 0}
local A = { {1,3,1,1,1,0},
            {4,1,1,5,0,1}}
local b = {600, 1200}
local v = {5, 6}
--print("A(2,4)", A[2][4], "\n---")

local x = simplex(A, b, c, v)

for i = 1,#x do
    for j = 1,#x[i] do
        print(x[i][j])
    end
    print("---")
end

local a = zeros(3, 1)
for i = 1,3 do
    print(a[i])
end