--- Credit transfer tab for equipment menu
local GetTranslation = LANG.GetTranslation
function CreateTransferMenu(parent)
    local dform = vgui.Create("DForm", parent)
    dform:SetName(GetTranslation("xfer_menutitle"))
    dform:StretchToParent(0, 0, 0, 0)
    dform:SetAutoSize(false)

    if LocalPlayer():GetCredits() <= 0 then
        dform:Help(GetTranslation("xfer_no_credits"))
        return dform
    end

    local bw, bh = 100, 20
    local dsubmit = vgui.Create("DButton", dform)
    dsubmit:SetSize(bw, bh)
    dsubmit:SetDisabled(true)
    dsubmit:SetText(GetTranslation("xfer_send"))

    local selected_entry = nil

    local dpick = vgui.Create("DComboBox", dform)
    dpick.OnSelect = function(s, idx, val, data)
        if data then
            selected_entry = data
            dsubmit:SetDisabled(false)
        end
    end

    dpick:SetWide(250)

    -- fill combobox
    local ply = LocalPlayer()
    for _, p in pairs(player.GetAll()) do
        if IsValid(p) and p ~= ply and
            ((
                -- Local player is a traitor team member
                ply:IsTraitorTeam() and
                -- and target is a traitor team member (or a glitch). Also include monsters if Monsters-as-Traitors is enabled
                (p:IsTraitorTeam() or p:IsActiveGlitch() or player.IsMonsterTraitorAlly(p))
            ) or
            (
                -- Local player is a monster
                ply:IsMonsterTeam() and
                (
                    -- and target is a monster ally
                    (ply:IsZombieAlly() and p:IsZombie()) or (ply:IsVampireAlly() and p:IsVampire()) or
                    -- or a Glitch if this monster player is a traitor ally
                    player.IsMonsterTraitorAlly(ply) and p:IsGlitch()
                )
            ) or
            (
                -- Local player is a Detective and target is a Mercenary whose role has been revealed
                ply:IsDetective() and p:IsMercenary() and p:GetNWBool("RoleRevealed", false)
            )) then
            local data = { ni = p:Nick(), sid = p:SteamID64() or "BOT"}
            dpick:AddChoice(p:Nick(), data)
        end
    end

    -- select first player by default
    if dpick:GetOptionText(1) then dpick:ChooseOptionID(1) end

    dsubmit.DoClick = function(s)
        if selected_entry then
            if selected_entry.sid == "BOT" then
                RunConsoleCommand("ttt_bot_transfer_credits", selected_entry.ni, "1")
            elseif player.GetBySteamID64(selected_entry.sid):IsActiveGlitch() then
                RunConsoleCommand("ttt_fake_transfer_credits", selected_entry.sid, "1")
            else
                RunConsoleCommand("ttt_transfer_credits", selected_entry.sid, "1")
            end
        end
    end

    dsubmit.Think = function(s)
        if LocalPlayer():GetCredits() < 1 then
            s:SetDisabled(true)
        end
    end

    dform:AddItem(dpick)
    dform:AddItem(dsubmit)

    dform:Help(LANG.GetParamTranslation("xfer_help", { role = LocalPlayer():GetRoleString() }))

    return dform
end