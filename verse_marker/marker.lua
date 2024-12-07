Citizen.CreateThread(function()
    local markers = {
        {439.58, -975.55, 31.03, "Teçhizat Deposu"},
        -- {436.16, -976.17, 31.03, "Pazar Yeri"},
        -- {149.64, -1040.29, 29.3, "Market 3"}
    }
    
    local playerPed = PlayerPedId()

    while true do
        local playerCoords = GetEntityCoords(playerPed)
        local anyMarkerInRange = false

        for _, marker in ipairs(markers) do
            local distance = GetDistanceBetweenCoords(playerCoords, marker[1], marker[2], marker[3], true)

            if distance < 15.0 then
                anyMarkerInRange = true
                DrawMarker(1, marker[1], marker[2], marker[3] - 1.0, 0, 0, 0, 0, 0, 0, 1.1, 1.1, 1.1, 255, 0, 0, 250, false, false, 1, false)

                local onScreen, _x, _y = World3dToScreen2d(marker[1], marker[2], marker[3] + 1.0)
                if onScreen then
                    SetTextFont(4)
                    SetTextScale(0.0, 0.9)
                    SetTextOutline()
                    SetTextColour(255, 255, 255, 255)
                    SetTextEntry("STRING")
                    AddTextComponentString(marker[4])
                    DrawText(_x, _y)
                end
            end
        end

        if not anyMarkerInRange then
            Citizen.Wait(1000)
        else
            Citizen.Wait(0)
        end
    end
end)
