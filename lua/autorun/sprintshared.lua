function GetSprintMultiplier(ply, enabled)
    local mult = 1
    if IsValid(ply) then
        local mults = {}
        hook.Run("TTTSpeedMultiplier", ply, mults)
        for _, m in pairs(mults) do
            mult = mult * m
        end

        if enabled and ply.mult then
            mult = mult * ply.mult
        end
    end

    local wep = ply:GetActiveWeapon()
    if wep and IsValid(wep) and wep:GetClass() == "genji_melee" then
        return 1.4 * mult
    elseif wep and IsValid(wep) and wep:GetClass() == "weapon_ttt_homebat" then
        return 1.25 * mult
    elseif wep and IsValid(wep) and wep:GetClass() == "weapon_vam_fangs" and wep:Clip1() < 15 then
        return 3 * mult
    elseif wep and IsValid(wep) and wep:GetClass() == "weapon_zom_claws" then
        if ply:HasEquipmentItem(EQUIP_SPEED) then
            return 1.5 * mult
        else
            return 1.35 * mult
        end
    else
        return mult
    end
end