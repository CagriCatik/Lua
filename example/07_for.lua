local width = 15
local height = 15

-- Initialize the maze with walls
local maze = {}
for i = 1, height do
    maze[i] = {}
    for j = 1, width do
        maze[i][j] = 1  -- 1 represents a wall
    end
end

-- Possible movements (right, down, left, up)
local directions = {
    {x = 1, y = 0},
    {x = 0, y = 1},
    {x = -1, y = 0},
    {x = 0, y = -1}
}

-- Function to shuffle directions (for randomness)
local function shuffle(t)
    for i = #t, 2, -1 do
        local j = math.random(i)
        t[i], t[j] = t[j], t[i]
    end
end

-- Recursive DFS function to generate the maze
local function dfs(x, y)
    maze[y][x] = 0  -- Mark the current cell as a path

    -- Shuffle the directions to ensure random maze generation
    shuffle(directions)

    -- Explore each direction
    for i = 1, #directions do
        local new_x = x + directions[i].x * 2
        local new_y = y + directions[i].y * 2

        -- Check if the new position is within the grid and is a wall
        if new_x > 1 and new_x < width and new_y > 1 and new_y < height and maze[new_y][new_x] == 1 then
            -- Knock down the wall between the current cell and the new cell
            maze[y + directions[i].y][x + directions[i].x] = 0

            -- Recursively apply DFS to the new cell
            dfs(new_x, new_y)
        end
    end
end

-- Start DFS from the top-left corner
math.randomseed(os.time())
dfs(2, 2)

-- Ensure the entrance and exit are open
maze[2][2] = 0
maze[height-1][width-1] = 0

-- Function to print the maze
local function print_maze(maze)
    for i = 1, #maze do
        for j = 1, #maze[i] do
            if maze[i][j] == 1 then
                io.write("#")  -- Wall
            elseif maze[i][j] == 0 then
                io.write(" ")  -- Path
            elseif maze[i][j] == 2 then
                io.write(".")  -- Solution path
            end
        end
        io.write("\n")
    end
    io.write("\n")
end

print("Generated Maze:")
print_maze(maze)

-- DFS function to solve the maze
local function solve(x, y)
    -- Base case: If we've reached the bottom-right corner, we're done
    if x == width - 1 and y == height - 1 then
        maze[y][x] = 2  -- Mark the solution path
        return true
    end

    -- If the cell is a path and not yet visited
    if maze[y][x] == 0 then
        -- Mark the cell as part of the solution path
        maze[y][x] = 2

        -- Explore each direction
        for i = 1, #directions do
            local new_x = x + directions[i].x
            local new_y = y + directions[i].y

            if solve(new_x, new_y) then
                return true
            end
        end

        -- If no path is found, backtrack
        maze[y][x] = 0
    end

    return false
end

-- Solve the maze starting from the entrance
solve(2, 2)

print("Solved Maze:")
print_maze(maze)
