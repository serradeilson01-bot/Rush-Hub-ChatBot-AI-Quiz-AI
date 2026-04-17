-- Rush Hub ChatBot Script using RedzLibrary

local ChatBot = {}

function ChatBot:new()
    local newObj = {
        responses = {},  -- Store the chatbot responses
        isActive = true,  -- Flag to control chatbot activity
    }
    self.__index = self
    return setmetatable(newObj, self)
end

function ChatBot:addResponse(trigger, response)
    self.responses[trigger] = response
end

function ChatBot:processMessage(message)
    if not self.isActive then return "ChatBot is currently inactive." end

    for trigger, response in pairs(self.responses) do
        if message:lower():find(trigger:lower()) then
            return response
        end
    end
    return "I'm sorry, I don't understand that message."  -- Default response
end

function ChatBot:activate()
    self.isActive = true
end

function ChatBot:deactivate()
    self.isActive = false
end

-- Example usage
local chatbot = ChatBot:new()
chatbot:addResponse("hello", "Hello! How can I help you?")
chatbot:addResponse("bye", "Goodbye! Have a great day!")

-- Test the chatbot
print(chatbot:processMessage("Hello"))  -- Outputs: Hello! How can I help you?
print(chatbot:processMessage("What is your name?"))  -- Outputs: I'm sorry, I don't understand that message.
