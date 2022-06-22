if CLIENT then
    ply = LocalPlayer()

    net.Start("check_weapons_table")
    net.WriteEntity(LocalPlayer())
    net.SendToServer()

    local function getModel()
        local model = ply:GetEyeTrace().Entity:GetModel()
        ply:ChatPrint(model)
    end

    hook.Add("OnPlayerChat", "get_weapon_model", getModel) -- this is a temp solution. later we need an swep

end


