-- ================== BLINDAGEM ANTI-DUP ==================
if getgenv().__MANAGER_LOADED then
    warn("🛑 Manager já carregado, abortando duplicata.")
    return
end
getgenv().__MANAGER_LOADED = true

print("✅ Manager iniciado")

-- ================== REQUEUE NO TELEPORT ==================
queue_on_teleport([[
    loadstring(readfile("manager.lua"))()
]])

-- ================== HEARTBEAT ==================
task.spawn(function()
    while true do
        pcall(function()
            writefile("heartbeat.txt", tostring(os.time()))
        end)
        task.wait(5)
    end
end)

-- ================== START FARM (UMA VEZ) ==================
task.spawn(function()
    print("🚜 Iniciando autofarm...")

    local ok, err = pcall(function()
        script_key = "lqEDtgthalNLvLXEbzHnWZctJAQrwWNA"
        loadstring(game:HttpGet("https://raw.githubusercontent.com/BlitzIsKing/UniversalFarm/refs/heads/main/Jailbreak/autoRob"))()
    end)

    if not ok then
        warn("❌ Erro no farm:", err)
    end
end)
