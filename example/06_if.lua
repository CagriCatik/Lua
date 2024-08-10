-- User data
local users = {
    {name = "Alice", age = 25, role = "admin", authenticated = true},
    {name = "Bob", age = 17, role = "moderator", authenticated = true},
    {name = "Charlie", age = 30, role = "user", authenticated = false},
    {name = "Dave", age = 15, role = "user", authenticated = true}
}

-- Function to determine access
local function determineAccess(user)
    if not user.authenticated then
        print("Access denied: User is not authenticated.")
        return
    end
    
    if user.role == "admin" then
        print("Access granted: Admin access to all features.")
    elseif user.role == "moderator" then
        if user.age >= 18 then
            print("Access granted: Moderator access to most features.")
        else
            print("Access denied: Moderator must be 18 or older.")
        end
    elseif user.role == "user" then
        if user.age >= 18 then
            print("Access granted: User access to general features.")
        else
            print("Access granted: User access to restricted features only.")
        end
    else
        print("Access denied: Unknown role.")
    end
end

-- Run the function for each user
for _, user in ipairs(users) do
    print("Checking access for " .. user.name .. "...")
    determineAccess(user)
    print("-----------")
end
