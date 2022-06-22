if SERVER then 
    AddCSLuaFile("client/cl_fingerprint_core.lua")
    include("server/sv_fingerprint_core.lua")
end

if CLIENT then
    include("client/cl_fingerprint_core.lua")
end