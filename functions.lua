util = {}
util.collection = function(table)
    -- TODO: have some collection object and metatable and stuff
    -- TODO: make sure all elements are valid LYST datatypes (either collections or values)
    return table
end
util.value = function(value)
    -- TODO: have some value object (with type?)
    return value
end
util.is_collection = function(something)
    -- TODO: use the collection object
    return type(something) == "table"
end
util.is_value = function(something)
    -- TODO: use the collection object
    return type(something) ~= "table" and type(something) ~= "function"

end

state = {}
state.current_loop_index = -1
state.current_loop_value = -1

function map(collection, f)
    --[[
    (collection, function) -> collection
    returns a collection of thunks
    ]]
    local result = {}
    for i, value in pairs(collection) do
        state.current_loop_index = i
        state.current_loop_value = value
        result[i] = function() return f(value) end
    end
    return result
end

function init(n)
    --[[
    (int) -> collection
    returns a collection of size equal to the input, where each element is defaulted to something (null? 0? doesn't matter yet).
    ]]
    local result = {}
    for i=1,n do
        state.current_loop_index = i
        state.current_loop_value = 0
        result[i] = util.value(0)
    end
    return util.collection(result)
end

function input()
    --[[
    () -> value
    returns either the collection of all inputs, or the single input value.
    ]]
    if arg.n == 1 then
        return util.value(arg[1])
    else
        return util.collection(arg)
    end
end


function output(something)
    --[[
    (value) -> value
    prints the value to STDOUT.
    (collection) -> collection
    iterates through the collection, printing each to STDOUT.
    ]]
    if util.is_collection(something) then

    else
        print(something)
    end
end

function product(a, b)
    --[[
    (value, value) -> value
    multiplies the two values and returns the result.
    (collection) -> value
    multiplies the values of the collection and returns the result.
    ]]
    if util.is_collection(a) and b == nil then
        local result = 1
        for i, n in pairs(a) do
            state.current_loop_index = i
            state.current_loop_value = n
            result = result * n
        end
        return result
    elseif util.is_value(a) and util.is_value(b) then
        return util.value(a * b)
    end
end

function sum(a, b)
    --[[
    (value, value) -> value
    adds the two values and returns the result.
    (collection) -> value
    adds the values of the collection and returns the result.
    ]]
    if util.is_collection(a) and b == nil then
        local result = 0
        for i, n in pairs(a) do
            state.current_loop_index = i
            state.current_loop_value = n
            result = result + n
        end
        return util.value(result)
    elseif util.is_value(a) and util.is_value(b) then
        return util.value(a + b)
    end
end

function join(a, b)
    --[[
    (value, collection) -> value
    joins the collecton with the value and returns the result.
    (collection) -> value
    joins the collection with newlines (or ", "?) and returns the result.
    ]]
    if util.is_collection(a) and b == nil then
        state.current_loop_index = 1
        state.current_loop_value = a[1]
        result = a[1]
        for i = 2, #a do
            local value = a[i]
            state.current_loop_index = i
            state.current_loop_value = value
            result = result .. "\n" .. value
        end
        return util.value(result)
    elseif

    end
end

function increment(something)
    --[[
    (value) -> value
    returns the value incremented by 1.
    (collection) -> collection
    return the collection where each element has been incremented by 1.
    ]]
    if util.is_collection(something) then

    elseif util.is_value(something) then
        return util.value(something + 1)
    end
end

function iterator()
    --[[
    () -> value
    returns the current index of the inner-most loop currently being executed.
    ]]
    return state.current_loop_index
end

function current()
    --[[
    () -> value
    returns the current value of the inner-most loop currently being executed.
    ]]
    return state.current_loop_value
end

function difference()
    --[[
    (value, value) -> value
    returns the difference between the two values.
    (collection) -> collection
    returns a collection of 'delta's, differences between two elements in the original collection.
    ]]
end

function cycle()
    --[[
    (value) -> collection
    Returns an infinite collection containing the value
    (collection) -> collection
    Returns an infinite loop of the collection
    ]]
end

function if(something, f)
    --[[
    (value, function) -> value
    returns the result of the function if value is truthy*. Otherwise returns value.
    (collection, function) -> value
    returns the result of the function if value is truthy*. Otherwise returns value.
    ]]
end

function head()
    --[[
    (collection) -> value
    Returns the first value in the collection.
    (int, collection) -> value
    returns the Nth value in the collection, where N is the first paramater.
    ]]
end

function tail(...)
    --[[
    (collection) -> collection
    Returns all but the first element in the supplied collection.
    (int, collection) -> collection
    Returns the sub-collection starting at the given index.
    (int, int, collection) -> collection
    Returns the sub-collection starting at the first argument, and going upto (exclusive) the second argument.
    ]]
end

function push(value)
    --[[
    (value) -> value
    Saves the value in the next avaiable value (using the letters from the english alphabet)
    ]]
end

function pause(time, value)
    --[[
    (value, value) -> value
    pauses for the number of seconds specified by the first argument, and then returns the second argument.
    ]]
end
