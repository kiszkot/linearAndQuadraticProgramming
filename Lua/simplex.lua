--[[  Simplex function
*   Krystian Baran
*   Lua 

    # Input:
    # A - Matrix containing binding equalities.
    # b - Left side of the equalities
    # c - Function to maximise, has to contain added variables
    # v - Idexes of which variables are in the base
    #
    # Output:
    # x - The solution to the problem, contains variables, the added variables
    #     and variables of the added base.
    # v - A vector of which variables are in the base.
    # optimal - Is the optimal value for the given simplex problem
    # C - A vector containing the names of the variables.
    #     x named ones are from the function
    #     s named ones are the added ones

--]]

transpose = function(matrix)
    local n = #matrix
    local m = #matrix[1]
    local ret_matrix = {}

    for i = 1,n,1 do
        for j = 1,m,1 do
            ret_matrix[i][j] = matrix[j][i]
        end
    end

    return ret_matrix
end

--[[
mat_prod = function(matrix1, matrix2)
    assert(matrix1.length == matrix2.height, "Size mismatch")
    local ret = {}
    local len = matrix1.length
    local high = matrix2.height
    local len2 = matrix2.length
    local sum = 0
    for i = 1,high do
        for j = 1,len do
            sum = 0
            for k = 1,len2 do
                sum = sum + matrix1[j][k] * matrix2[k][j]
            end
            ret[i][j] = sum
        end
    end
    return ret
end
]]

size = function(matrix)
    if type(matrix) == "table" then
        if type(matrix[1]) ~= "table" then
            return {1, #matrix}
        else 
            return {#matrix[1], #matrix}
        end
    else
        return {1, 1}
    end
end

length = function(matrix)
    if type(matrix) ~= "table" then
        return 1
    else
        return #matrix[1]
    end
end

zeros = function(length, height)
    local ret = {}
    if height == 1 then
        for i = 1,length do
            ret[i] = 0
        end
    else
        for i=1,height do
            ret[i] = {}
            for j=1,length do
                ret[i][j] = 0
            end
        end
    end
    return ret
end

max = function(matrix)
    local len = #matrix
    local max = matrix[1]
    local maxi = 1

    for i = 1,len do
        if matrix[i] > max then
            max = matrix[i]
            maxi = i
        end
    end

    return {max, maxi}
end

min = function(matrix)
    local len = #matrix
    local min = matrix[1]
    local mini = 1

    for i = 1,len do
        if matrix[i] < min then
            min = matrix[i]
            mini = i
        end
    end

    return {min, mini}
end

local z_calc = function(base, table)
    local z = {}
    local len = #base
    local sizeA = size(table)

    for i = 1,sizeA[1] do
        z[i] = 0
        for j = 1,len do
            z[i] = z[i] + base[j] * table[j][i]
        end
    end

    return z
end

-- [x,v,optimal,C]
simplex = function(A,b,c,v)

    --[[ transpose if necessary
    local len = size(b)
    if len[1] <= len[2] then b = transpose(b); end

    len = size(c)
    if len[1] <= len[2] then c = transpose(c); end
    ]]

    local len = #c
    local baseSize = #v

    --[[ name variables TODO
    B = ""
    C = ""
    D = {}
    local baseSize = v.length
    len = len[1]
    for i = 1,len do
      if c[i] == 0 then
          C = [C ; 's',num2str(i)];
        case -10^9
          C = [C ; 'a',num2str(i)];
          B = [B ; 'a',num2str(i)];
        otherwise
          C = [C ; 'x',num2str(i)];
      endswitch
    end
    ]]

    -- set initial values and definition of helping variables
    local base = zeros(baseSize,1);
    for i = 1,baseSize do base[i] = c[v[i]] end

    local z = zeros(len,1)
    local cz = zeros(len,1) -- last row of simplex matrix defined as c(i) - z(i)

    local head = 0
    local optimal = 0
    local x = 0
    local ix = 0
    local y = 0
    local iy = 0
    local m = 0

    while(true) do

        -- calculate z, cz and optimal value
        z = z_calc(base, A)
        for i = 1,len do
            cz[i] = c[i] - z[i]
        end

        optimal = 0
        for i = 1,baseSize do
            optimal = optimal + base[i] * b[i]
        end

        -- optimal = mat_prod(transpose(base), b)

        -- check if max of last row is posive and break if not
        x = max(cz)
        ix = x[2]
        x = cz[ix]
        if x <= 0 then
            break
        end

        --[[ check min of last column and break if max is negative
        -- can't divide by zero or negative number, 0/-1 gives 0
        -- this number cannot enter the base
        ]]
        D = {}
        for i = 1,baseSize do
            if A[i][ix] == 0 then
                D[i] = -1
            else
                D[i] = b[i] / A[i][ix]
            end
        end
        m = max(D)
        if m[1] <= 0 then break end

        for i = 1,baseSize do
            if D[i] < 0 or A[i][ix] <= 0 then D[i] = m[1] + 1 end
        end

        y = min(D)
        iy = y[2]
        base[iy] = c[ix]
        v[iy] = ix

        -- gaussian elimination for rest of A matrix
        head = A[iy][ix]
        for i = 1,len do
            A[iy][i] = A[iy][i] / head
        end
        b[iy] = b[iy] / head

        for i = 1,baseSize do
            if i ~= iy then
                head = A[i][ix]
                for j = 1,len do
                    A[i][j] = A[i][j] - head * A[iy][j]
                end
                b[i] = b[i] - head * b[iy]
            end
        end
    end

    -- creates results vector
    x = zeros(len, 1)
    for i = 1,baseSize do
        x[v[i]] = b[i]
    end

    return {x, v, {optimal}}
end