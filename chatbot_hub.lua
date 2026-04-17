-- chatbot_hub.lua

-- Carregando a biblioteca RedzLibrary
local RedzLibrary = require("RedzLibrary")

-- Definindo as variáveis e personalidades do ChatBot
local personalities = {
    friendly = {
        greeting = "Olá! Como posso ajudá-lo hoje?",
        responsive = "Estou aqui para ajudar!",
    },
    strict = {
        greeting = "Bom dia! O que você precisa?",
        responsive = "Serei direto e claro." 
    },
}

-- Função principal do ChatBot
local function chatbotResponse(input)
    -- Lógica para determinar a resposta baseada na entrada
    if input:match("olá") then
        return personalities.friendly.greeting
    elseif input:match("ajuda") then
        return personalities.friendly.responsive
    else
        return "Desculpe, não entendi."
    end
end

-- Inicialização do ChatBot
local function init()
    print(personalities.friendly.greeting)
end

-- Loop de interação
init()
while true do
    local userInput = io.read()
    local response = chatbotResponse(userInput)
    print(response)
end

-- Fim do script