-- Variable to track auto-run state
local isAutoRunning = false

-- Function to handle player chat
local function onChatted(message)
    local prefixShowNames = ".show names "

    if message:sub(1, #prefixShowNames) == prefixShowNames then
        local arg = message:sub(#prefixShowNames + 1)
        if arg == "true" then
            game:GetService("Players").LocalPlayer.NameDisplayDistance = 100
            if not isAutoRunning then
                isAutoRunning = true
                local distances = {50, 51, 52} -- List of distances to toggle
                local currentIndex = 1
                
                while isAutoRunning do
                    wait()
                    game:GetService("Players").LocalPlayer.NameDisplayDistance = distances[currentIndex]
                    currentIndex = currentIndex + 1
                    if currentIndex > #distances then
                        currentIndex = 1
                    end
                    wait() -- Wait before switching distances again
                end
            end
        elseif arg == "false" then
            game:GetService("Players").LocalPlayer.NameDisplayDistance = 0
            isAutoRunning = false -- Stop the auto-run
        else
            print("Invalid argument. Usage: .show names true/false")
        end
    end
end

game:GetService("Players").LocalPlayer.Chatted:Connect(onChatted)
