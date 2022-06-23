if CLIENT then
    cCore = {}
    function getFingerprint()
        ply = LocalPlayer()
    
        net.Start("check_root_swep_table")
        net.WriteEntity(ply)
        net.SendToServer()
    
        net.Start("check_weapons_table")
        net.WriteEntity(LocalPlayer())
        net.SendToServer()
    end
    cCore['getFingerprint'] = getFingerprint
    return cCore
end


