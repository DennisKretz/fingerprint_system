module("ANTI_TAMPERING", package.seeall)

local function getPlayerByName(ply)
    for k,v in pairs(player.GetAll()) do
        if (v:GetName() == ply:GetName()) then
            return v:GetPos()
        end
    end
end

function ANTI_TAMPERING.checkPlayerPosition(ply)
    plyPos = getPlayerByName(ply)
    if (plyPos != ply:GetPos()) then
        return true
    end
    return false
end

function ANTI_TAMPERING.removeNetMsg(netMsgName)
    net.Receivers[netMsgName] = nil
end
