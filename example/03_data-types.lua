-- Define a global table to store students' data
students = {
    {name = "Alice", grades = {85, 90, 78}},
    {name = "Bob", grades = {70, 60, 80}},
    {name = "Charlie", grades = {95, 88, 92}},
    {name = "David", grades = {40, 55, 60}},
    {name = "Eve", grades = {88, 91, 86}},
}

-- Define global variables to keep track of pass and fail counts
_G.passCount = 0
_G.failCount = 0

-- Function to calculate the average grade for a student
local function calculateAverage(grades)
    local sum = 0
    local count = #grades
    
    for i = 1, count do
        sum = sum + grades[i]
    end
    
    return sum / count
end

-- Function to determine if a student has passed
local function hasPassed(average)
    local passingGrade = 75 -- Local variable for passing grade threshold
    return average >= passingGrade
end

-- Function to process each student's data
local function processStudents(studentList)
    for _, student in ipairs(studentList) do
        local avg = calculateAverage(student.grades) -- Calculate average grade
        
        if hasPassed(avg) then
            print(student.name .. " has passed with an average grade of " .. avg)
            _G.passCount = _G.passCount + 1
        else
            print(student.name .. " has failed with an average grade of " .. avg)
            _G.failCount = _G.failCount + 1
        end
    end
end

-- Function to print the overall class performance
local function printSummary()
    print("\nClass Summary:")
    print("Number of students who passed: " .. _G.passCount)
    print("Number of students who failed: " .. _G.failCount)
    
    if _G.passCount > _G.failCount then
        print("Overall, the class has performed well.")
    else
        print("Overall, the class needs improvement.")
    end
end

-- Main function to execute the script
local function main()
    processStudents(students) -- Process each student's data
    printSummary()            -- Print the summary of the class performance
end

-- Execute the main function
main()
