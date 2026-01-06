-- Manager Loader
if getgenv().ManagerExecuted then return end
getgenv().ManagerExecuted = true

print("📦 Manager iniciado")

-- Carrega o script principal (heartbeat + autorob)
local success, err = pcall(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/iSaidBr/teste-qot/refs/heads/main/hop.lua"))()
end)

if success then
    print("✅ Script principal carregado com sucesso")
else
    warn("❌ Erro ao carregar script principal:", err)
end

-- Reenfileira o manager para o próximo hop
queue_on_teleport('loadstring(game:HttpGet("https://raw.githubusercontent.com/iSaidBr/teste-qot/refs/heads/main/manager.lua"))()')
