if CLIENT then
    include("shared.lua")

    net.Receive("ClientDeathNotify", function()
        -- Read the variables from the message
        local name = net.ReadString()
        local role = tonumber(net.ReadString())
        local reason = net.ReadString()

        -- Format the number role into a human readable role
        local col = ROLE_COLORS[role]
        local role_string = ROLE_STRINGS_EXT[role]
        if role == ROLE_NONE then
            col = COLOR_WHITE
            role_string = "a hidden role"
        end

        -- Format the reason for their death
        if reason == "suicide" then
            chat.AddText(COLOR_WHITE, "You killed yourself!")
        elseif reason == "burned" then
            chat.AddText(COLOR_WHITE, "You burned to death!")
        elseif reason == "prop" then
            chat.AddText(COLOR_WHITE, "You were killed by a prop!")
        elseif reason == "ply" then
            chat.AddText(COLOR_WHITE, "You were killed by ", col, name, COLOR_WHITE, ", they were ", col, role_string .. "!")
        elseif reason == "fell" then
            chat.AddText(COLOR_WHITE, "You fell to your death!")
        elseif reason == "water" then
            chat.AddText(COLOR_WHITE, "You drowned!")
        else
            chat.AddText(COLOR_WHITE, "You died!")
        end
    end)
end

if SERVER then
    -- Precache the net message
    util.AddNetworkString("ClientDeathNotify")

    hook.Add("PlayerDeath", "Kill_Reveal_Notify", function(victim, entity, killer)
        if gmod.GetGamemode().Name == "Trouble in Terrorist Town" then
            local reason = "nil"
            local killerz = "nil"
            local role = "nil"

            if victim.DiedByWater then
                reason = "water"
            elseif killer == victim then
                reason = "suicide"
            elseif IsValid(entity) then
                if victim:IsPlayer() and (string.StartWith(entity:GetClass(), "prop_physics") or entity:GetClass() == "prop_dynamic") then -- If the killer is also a prop
                    reason = "prop"
                elseif IsValid(killer) then
                    if entity:GetClass() == "entityflame" and killer:GetClass() == "entityflame" then
                        reason = "burned"
                    elseif entity:GetClass() == "worldspawn" and killer:GetClass() == "worldspawn" then
                        reason = "fell"
                    elseif killer:IsPlayer() and victim ~= killer then
                        reason = "ply"
                        killerz = killer:Nick()

                        -- If this Phantom was killed by a player and they are supposed to haunt them, hide their killer's role
                        if GetRoundState() == ROUND_ACTIVE and victim:IsPhantom() and GetConVar("ttt_phantom_killer_haunt"):GetBool() then
                            role = ROLE_NONE
                        else
                            role = killer:GetRole()
                        end
                    end
                end
            end

            -- Send the buffer message with the death information to the victim
            net.Start("ClientDeathNotify")
            net.WriteString(killerz)
            net.WriteString(role)
            net.WriteString(reason)
            net.Send(victim)
        end
    end)
end