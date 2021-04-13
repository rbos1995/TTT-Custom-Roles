WEPS = {}

function WEPS.TypeForWeapon(class)
    local tbl = util.WeaponForClass(class)
    return tbl and tbl.Kind or WEAPON_NONE
end

-- You'd expect this to go on the weapon entity, but we need to be able to call
-- it on a swep table as well.
function WEPS.IsEquipment(wep)
    return wep.Kind and wep.Kind >= WEAPON_EQUIP
end

function WEPS.GetClass(wep)
    if istable(wep) then
        return wep.ClassName or wep.Classname
    elseif IsValid(wep) then
        return wep:GetClass()
    end
end

function WEPS.DisguiseToggle(ply)
    if IsValid(ply) and ply:HasEquipmentItem(EQUIP_DISGUISE) then
        if not ply:GetNWBool("disguised", false) then
            RunConsoleCommand("ttt_set_disguise", "1")
        else
            RunConsoleCommand("ttt_set_disguise", "0")
        end
    end
end

WEPS.BuyableWeapons = { }
WEPS.ExcludeWeapons = { }

function WEPS.PrepWeaponsLists(role)
    -- Initialize the lists for this role
    if not WEPS.BuyableWeapons[role] then
        WEPS.BuyableWeapons[role] = {}
    end
    if not WEPS.ExcludeWeapons[role] then
        WEPS.ExcludeWeapons[role] = {}
    end
end

local DoesRoleHaveWeaponCache = { }

function WEPS.ResetRoleWeaponCache()
    for id, _ in pairs(ROLE_STRINGS) do
        DoesRoleHaveWeaponCache[id] = nil
    end
end

function WEPS.DoesRoleHaveWeapon(role)
    if type(DoesRoleHaveWeaponCache[role]) ~= "boolean" then
        DoesRoleHaveWeaponCache[role] = nil
    end

    if DoesRoleHaveWeaponCache[role] ~= nil then
        return DoesRoleHaveWeaponCache[role]
    end
    if WEPS.BuyableWeapons[role] ~= nil and table.Count(WEPS.BuyableWeapons[role]) > 0 then
        DoesRoleHaveWeaponCache[role] = true
        return true
    end

    for _, w in ipairs(weapons.GetList()) do
        if w and w.CanBuy and table.HasValue(w.CanBuy, role) then
            DoesRoleHaveWeaponCache[role] = true
            return true
        end
    end

    DoesRoleHaveWeaponCache[role] = false
    return false
end