hook.Add("EntityTakeDamage", "HandleDrowningDamage", function(ent, info)
    if (info:GetDamageType() == DMG_DROWN and ent:IsPlayer()) then
        local health = ent:Health() - info:GetDamage()
        if health <= 0 then
            ent.DiedByWater = true
        end
    end
end)

hook.Add("PlayerSpawn", "ResetDrownDeath", function(ply)
    ply.DiedByWater = false
end)