if SERVER then
	AddCSLuaFile("shared.lua")
end

if CLIENT then
	SWEP.PrintName			= "Magnifying Glass"			
	SWEP.Author				= "DEEKAY"
	SWEP.Slot				= 1
	SWEP.SlotPos			= 0
	SWEP.UTSlot				= 2
	SWEP.Weight				= 2
end

function SWEP:PrimaryAttack()
	print("gay")
end

SWEP.HoldType			= "weapon_stunstick"
SWEP.Category			= "FingerprintSystem"
SWEP.Spawnable			= true

SWEP.WorldModel			= "models/weapons/w_stunbaton.mdl"
SWEP.DeploySound		= Sound("ut2004/weaponsounds/SwitchToAssaultRifle.wav")

SWEP.DelayBeforeShot = 10