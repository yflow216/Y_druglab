RegisterNetEvent('esx_druglab:startProcessing')
AddEventHandler('esx_druglab:startProcessing', function(drug)
    ESX.ShowNotification('Produktion von ' .. drug .. ' gestartet...')
    Citizen.Wait(Config.DrugProcessingTime)

    TriggerServerEvent('esx_druglab:finishProcessing', drug)
end)
