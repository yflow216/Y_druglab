RegisterServerEvent('esx_druglab:notifyPolice')
AddEventHandler('esx_druglab:notifyPolice', function(playerId)
    local xPlayer = ESX.GetPlayerFromId(playerId)
    local playerCoords = xPlayer.getCoords()

    -- Polizeialarm
    for _, player in ipairs(GetPlayers()) do
        local policePlayer = ESX.GetPlayerFromId(player)
        if policePlayer and policePlayer.job.name == 'police' then
            TriggerClientEvent('esx_druglab:policeAlert', player, playerCoords)
        end
    end
end)
