-- Input data
local data = "john_doe,28,john.doe@example.com;alice_smith,34,alice@example.net;bob_jones,23,bob.jones@sample.org;jane_doe,29,jane.doe@example.com"

-- Step 1: Parse the string into individual records
local records = {}
for record in string.gmatch(data, "([^;]+)") do
    table.insert(records, record)
end

-- Step 2: Extract and format the data
local usernames = {}
local total_age = 0
local domain_count = {}

for _, record in ipairs(records) do
    local username, age, email = string.match(record, "([^,]+),([^,]+),([^,]+)")
    age = tonumber(age)
    
    -- Add username to the list
    table.insert(usernames, username)
    
    -- Add age to the total age
    total_age = total_age + age
    
    -- Extract the domain from the email
    local domain = string.match(email, "@(.+)$")
    domain_count[domain] = (domain_count[domain] or 0) + 1
end

-- Step 3: Generate the report
local total_users = #usernames
local average_age = total_age / total_users

-- Sort usernames alphabetically
table.sort(usernames)

-- Output the report
print("Total number of users:", total_users)
print("Average age:", string.format("%.1f", average_age))

print("Usernames (sorted):")
for _, username in ipairs(usernames) do
    print(" - " .. username)
end

print("Email domains:")
for domain, count in pairs(domain_count) do
    print(" - " .. domain .. ": " .. count)
end
