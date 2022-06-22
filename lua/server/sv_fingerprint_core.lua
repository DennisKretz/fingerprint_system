require("CONF_TABLES")
require("ANTI_TAMPERING")

local FAKE_PLAYER = "eE088192"
calledNetMsg1 = false

local function checkRootSwep(ply) 
    local plyWeapon = ply:GetActiveWeapon()
    weapons = getWeaponsTable()
    for i=1, #weapons do
        if (plyWeapon:GetClass() == weapons[i]) then
            return true
        end
    end
    return false
end

function getWeaponsTable()
    return CONF_TABLES.rootSwepTable()
end

local function buildWeaponsTableMsg(isSafe)
    if (isSafe == true) then
        local checkWeaponsTableMsg = function()
            local test = net.ReadEntity()
            print(test)
            ANTI_TAMPERING.removeNetMsg("check_weapons_table")
        end
        netMsg = {}
        netMsg["checkWeaponsTableMsg"] = checkWeaponsTableMsg
        return netMsg
    end
end

util.AddNetworkString("check_weapons_table")
util.AddNetworkString("check_root_swep_table")
local checkRootSwepTableMsg = function()
    calledNetMsg1 = true
    local ply = net.ReadEntity()

    local isFakePlayer = ANTI_TAMPERING.checkPlayerPosition(ply)
    if (isFakePlayer) then
        ply:ChatPrint(FAKE_PLAYER)
        print("blocked1")
        return true
    else 
        if (not checkRootSwep(ply)) then
            ply:ChatPrint("YOU ARE NOT HOLDING A VALID SWEP!")
            print("blocked2")
            return true
        end
    end
    print("success")
    local buildWeaponsTableFunc = buildWeaponsTableMsg(true).checkWeaponsTableMsg
    net.Receive("check_weapons_table", buildWeaponsTableFunc)
end

util.AddNetworkString("create_new_fingerprint")
local createNewFingerprintMsg = function()
    --todo
end

net.Receive("create_new_fingerprint", createNewFingerprintMsg)
net.Receive("check_root_swep_table", checkRootSwepTableMsg)


