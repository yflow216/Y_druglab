ESX = exports["es_extended"]:getSharedObject()

RegisterServerEvent('esx_druglab:startProduction')
AddEventHandler('esx_druglab:startProduction', function(drug)
    local xPlayer = ESX.GetPlayerFromId(source)

    -- Überprüfung, ob der Spieler genug Zutaten hat
    if xPlayer.getInventoryItem('chemicals').count >= 2 then
        xPlayer.removeInventoryItem('chemicals', 2)
        TriggerClientEvent('esx_druglab:startProcessing', source, drug)
    else
        xPlayer.showNotification('Du hast nicht genug Chemikalien!')
    end
end)

RegisterServerEvent('esx_druglab:finishProcessing')
AddEventHandler('esx_druglab:finishProcessing', function(drug)
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.addInventoryItem(drug, 1)

    -- Zufällige Polizei-Warnung
    if math.random(1, 100) <= Config.PoliceAlertChance then
        TriggerEvent('esx_druglab:notifyPolice', source)
    end
end)
