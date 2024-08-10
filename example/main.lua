function love.load()
    -- Colors
    buttonColor = {0.2, 0.5, 0.8}
    hoverColor = {0.4, 0.7, 1.0}
    textColor = {1, 1, 1}
    
    -- Button properties
    buttons = {
        {x = 50, y = 50, width = 200, height = 50, text = "Button 1"},
        {x = 50, y = 120, width = 200, height = 50, text = "Button 2"},
        {x = 50, y = 190, width = 200, height = 50, text = "Button 3"}
    }

    -- Slider properties
    slider = {x = 50, y = 270, width = 200, value = 0.5}

    -- Textbox properties
    textbox = {x = 50, y = 350, width = 200, height = 50, text = "", active = false}

    -- Fonts
    font = love.graphics.newFont(20)
    love.graphics.setFont(font)
end


function love.draw()
    -- Draw buttons
    for _, button in ipairs(buttons) do
        if isMouseOver(button) then
            love.graphics.setColor(hoverColor)
        else
            love.graphics.setColor(buttonColor)
        end
        love.graphics.rectangle("fill", button.x, button.y, button.width, button.height)
        love.graphics.setColor(textColor)
        love.graphics.printf(button.text, button.x, button.y + 15, button.width, "center")
    end

    -- Draw slider
    love.graphics.setColor(buttonColor)
    love.graphics.rectangle("fill", slider.x, slider.y, slider.width, 20)
    love.graphics.setColor(hoverColor)
    love.graphics.rectangle("fill", slider.x + slider.value * slider.width - 10, slider.y - 5, 20, 30)

    -- Draw textbox
    love.graphics.setColor(0.8, 0.8, 0.8)
    love.graphics.rectangle("fill", textbox.x, textbox.y, textbox.width, textbox.height)
    love.graphics.setColor(0, 0, 0)
    love.graphics.printf(textbox.text, textbox.x + 5, textbox.y + 15, textbox.width, "left")
    if textbox.active then
        love.graphics.setColor(0, 0, 0)
        love.graphics.rectangle("line", textbox.x, textbox.y, textbox.width, textbox.height)
    end
end


function love.mousepressed(x, y, button)
    if button == 1 then
        -- Check if any button was clicked
        for _, btn in ipairs(buttons) do
            if isMouseOver(btn) then
                print(btn.text .. " clicked!")
            end
        end

        -- Check if slider was clicked
        if x > slider.x and x < slider.x + slider.width and y > slider.y and y < slider.y + 20 then
            slider.value = (x - slider.x) / slider.width
        end

        -- Check if textbox was clicked
        if x > textbox.x and x < textbox.x + textbox.width and y > textbox.y and y < textbox.y + textbox.height then
            textbox.active = true
        else
            textbox.active = false
        end
    end
end

function love.mousemoved(x, y, dx, dy)
    if love.mouse.isDown(1) then
        -- Handle slider dragging
        if x > slider.x and x < slider.x + slider.width and y > slider.y and y < slider.y + 20 then
            slider.value = (x - slider.x) / slider.width
        end
    end
end

function love.textinput(text)
    if textbox.active then
        textbox.text = textbox.text .. text
    end
end

function love.keypressed(key)
    if textbox.active then
        if key == "backspace" then
            local byteoffset = utf8.offset(textbox.text, -1)
            if byteoffset then
                textbox.text = string.sub(textbox.text, 1, byteoffset - 1)
            end
        end
    end
end


function isMouseOver(button)
    local mouseX, mouseY = love.mouse.getX(), love.mouse.getY()
    return mouseX > button.x and mouseX < button.x + button.width and mouseY > button.y and mouseY < button.y + button.height
end
