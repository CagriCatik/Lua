-- Define the parameters
local v0 = 50  -- Initial velocity in m/s
local theta = math.rad(45)  -- Launch angle in degrees, converted to radians
local g = 9.81  -- Acceleration due to gravity in m/s²
local time_step = 0.1  -- Time increment in seconds

-- Initialize variables
local t = 0  -- Time in seconds
local x, y = 0, 0  -- Initial positions

-- Function to calculate the position at time t
function calculate_position(v0, theta, g, t)
    local x = v0 * math.cos(theta) * t
    local y = v0 * math.sin(theta) * t - 0.5 * g * t^2
    return x, y
end

-- Simulation loop: calculates and prints positions until the projectile hits the ground
print("Time (s)\tX (m)\tY (m)")
while y >= 0 do
    x, y = calculate_position(v0, theta, g, t)
    print(string.format("%.2f\t\t%.2f\t%.2f", t, x, y))
    t = t + time_step
end

-- Output the maximum range and flight time
local flight_time = 2 * v0 * math.sin(theta) / g
local max_range = v0 * math.cos(theta) * flight_time
print("\nFlight Time: " .. string.format("%.2f", flight_time) .. " seconds")
print("Maximum Range: " .. string.format("%.2f", max_range) .. " meters")
