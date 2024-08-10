-- Define the quiz questions and answers
local quiz = {
    {question = "What is the capital of France?", answer = "Paris"},
    {question = "What is 5 * 6?", answer = "30"},
    {question = "Who wrote 'To Kill a Mockingbird'?", answer = "Harper Lee"},
    {question = "What is the chemical symbol for water?", answer = "H2O"},
    {question = "What is the square root of 144?", answer = "12"}
}

-- Initialize score and total questions
local score = 0
local totalQuestions = #quiz

-- Main game loop
for i, q in ipairs(quiz) do
    io.write("Question " .. i .. ": " .. q.question .. " ")

    -- Capture user input
    local userAnswer = io.read()

    -- Check if the answer is correct
    if userAnswer:lower() == q.answer:lower() then
        print("Correct!")
        score = score + 1
    else
        print("Incorrect. The correct answer is: " .. q.answer)
    end

    print("")  -- Add a blank line for readability
end

-- End of game and score calculation
print("Quiz complete!")
print("You answered " .. score .. " out of " .. totalQuestions .. " questions correctly.")

-- Provide feedback based on the score
local percentage = (score / totalQuestions) * 100

if percentage == 100 then
    print("Excellent! You got all the questions right!")
elseif percentage >= 70 then
    print("Good job! You passed the quiz.")
elseif percentage >= 50 then
    print("Not bad, but you might want to study a bit more.")
else
    print("You might need to review the material and try again.")
end
