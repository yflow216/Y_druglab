RegisterCommand('sell', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    local drugTypes = {'weed', 'coke', 'meth'}

    for _, drug in pairs(drugTypes) do
        if xPlayer.getInventoryItem(drug).count > 0 then
            local price = math.random(500, 2000)
            xPlayer.removeInventoryItem(drug, 1)
            xPlayer.addMoney(price)
            xPlayer.showNotification('Du hast ' .. drug .. ' für $' .. price .. ' verkauft!')
            return
        end
    end

    xPlayer.showNotification('Du hast keine Drogen zum Verkaufen!')
end, false)
