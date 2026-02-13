local function factorial(n)
    if n == 0 then
        return 1
    else
        return n * factorial(n - 1)
    end
end

local t = {
    name = "Tom",
    age = 30,
    active = true,
    hobbies = { "coding", "chess", "music" }
}

for i, hobby in ipairs(t.hobbies) do
    print(t.name .. " likes " .. hobby)
end

print("Factorial of 5 is " .. factorial(5))
