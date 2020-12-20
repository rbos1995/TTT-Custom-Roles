-- serverside extensions to player table

local plymeta = FindMetaTable("Player")
if not plymeta then Error("FAILED TO FIND PLAYER TABLE") return end

function plymeta:SetRagdollSpec(s)
    if s then
        self.spec_ragdoll_start = CurTime()
    end
    self.spec_ragdoll = s
end

function plymeta:GetRagdollSpec() return self.spec_ragdoll end

AccessorFunc(plymeta, "force_spec", "ForceSpec", FORCE_BOOL)

--- Karma

-- The base/start karma is determined once per round and determines the player's
-- damage penalty. It is networked and shown on clients.
function plymeta:SetBaseKarma(k) self:SetNWFloat("karma", k) end

-- The live karma starts equal to the base karma, but is updated "live" as the
-- player damages/kills others. When another player damages/kills this one, the
-- live karma is used to determine his karma penalty.
AccessorFunc(plymeta, "live_karma", "LiveKarma", FORCE_NUMBER)

-- The damage factor scales how much damage the player deals, so if it is .9
-- then the player only deals 90% of his original damage.
AccessorFunc(plymeta, "dmg_factor", "DamageFactor", FORCE_NUMBER)

-- If a player does not damage team members in a round, he has a "clean" round
-- and gets a bonus for it.
AccessorFunc(plymeta, "clean_round", "CleanRound", FORCE_BOOL)

-- How many clean rounds in a row the player has gone
AccessorFunc(plymeta, "clean_rounds", "CleanRounds", FORCE_NUMBER)

function plymeta:SetZombiePrime(p) self:SetNWBool("zombie_prime", p) end

function plymeta:SetVampirePrime(p) self:SetNWBool("vampire_prime", p) end

function plymeta:SetVampirePreviousRole(r) self:SetNWInt("vampire_previous_role", r) end

function plymeta:SetBaseDrinks(d) self:SetNWInt("drinks", d) end

function plymeta:SetBaseShots(s) self:SetNWInt("shots", s) end

AccessorFunc(plymeta, "live_drinks", "LiveDrinks", FORCE_NUMBER)
AccessorFunc(plymeta, "live_shots", "LiveShots", FORCE_NUMBER)

function plymeta:InitKarma()
    KARMA.InitPlayer(self)
end

function plymeta:InitDrinks()
    DRINKS.InitPlayer(self)
end

--- Equipment credits
function plymeta:SetCredits(amt)
    self.equipment_credits = amt
    self:SendCredits()
end

function plymeta:AddCredits(amt)
    self:SetCredits(self:GetCredits() + amt)
end

function plymeta:SubtractCredits(amt) self:AddCredits(-amt) end

function plymeta:SetDefaultCredits()
    if self:IsTraitorTeam() then
        local c
        if self:IsTraitor() then
            c = GetConVar("ttt_credits_starting"):GetInt()
        elseif self:IsDetraitor() then
            c = GetConVar("ttt_der_credits_starting"):GetInt()
        elseif self:IsAssassin() then
            c = GetConVar("ttt_asn_credits_starting"):GetInt()
        elseif self:IsHypnotist() then
            c = GetConVar("ttt_hyp_credits_starting"):GetInt()
        end

        if CountTraitors() == 1 then
            c = c + GetConVar("ttt_credits_alonebonus"):GetInt()
        end
        self:SetCredits(math.ceil(c))
    elseif self:IsDetective() then
        self:SetCredits(math.ceil(GetConVar("ttt_det_credits_starting"):GetInt()))
    elseif self:IsMercenary() then
        self:SetCredits(math.ceil(GetConVar("ttt_mer_credits_starting"):GetInt()))
    elseif self:IsKiller() then
        self:SetCredits(math.ceil(GetConVar("ttt_kil_credits_starting"):GetInt()))
    elseif self:IsMonsterTeam() then
        local c
        local is_traitor = GetGlobalBool("ttt_monsters_are_traitors")
        if self:IsZombie() then
            c = GetConVar("ttt_zom_credits_starting"):GetInt()
            is_traitor = is_traitor or GetGlobalBool("ttt_zombies_are_traitors")
        elseif self:IsVampire() then
            c = GetConVar("ttt_vam_credits_starting"):GetInt()
            is_traitor = is_traitor or GetGlobalBool("ttt_vampires_are_traitors")
        end
        if is_traitor and CountTraitors() == 1 then
            c = c + GetConVar("ttt_credits_alonebonus"):GetInt()
        end
        self:SetCredits(math.ceil(c))
    else
        self:SetCredits(0)
    end
end

function plymeta:SendCredits()
    net.Start("TTT_Credits")
    net.WriteUInt(self:GetCredits(), 8)
    net.Send(self)
end

--- Equipment items
function plymeta:AddEquipmentItem(id)
    id = tonumber(id)
    if id then
        self.equipment_items = bit.bor(self.equipment_items, id)
        self:SendEquipment()
    end
end

-- We do this instead of an NW var in order to limit the info to just this ply
function plymeta:SendEquipment()
    net.Start("TTT_Equipment")
    net.WriteUInt(self.equipment_items, 16)
    net.Send(self)
end

function plymeta:ResetEquipment()
    self.equipment_items = EQUIP_NONE
    self:SendEquipment()
end

function plymeta:SendBought()
    -- Send all as string, even though equipment are numbers, for simplicity
    net.Start("TTT_Bought")
    net.WriteUInt(#self.bought, 8)
    for k, v in pairs(self.bought) do
        net.WriteString(v)
    end
    net.Send(self)
end

local function ResendBought(ply)
    if IsValid(ply) then ply:SendBought() end
end

concommand.Add("ttt_resend_bought", ResendBought)

function plymeta:ResetBought()
    self.bought = {}
    self:SendBought()
end

function plymeta:AddBought(id)
    if not self.bought then self.bought = {} end

    table.insert(self.bought, tostring(id))

    self:SendBought()
end

-- Strips player of all equipment
function plymeta:StripAll()
    -- standard stuff
    self:StripAmmo()
    self:StripWeapons()

    -- our stuff
    self:ResetEquipment()
    self:SetCredits(0)
end

-- Sets all flags (force_spec, etc) to their default
function plymeta:ResetStatus()
    self:SetRole(ROLE_INNOCENT)
    self:SetRagdollSpec(false)
    self:SetForceSpec(false)

    self:ResetRoundFlags()
end

-- Sets round-based misc flags to default position. Called at PlayerSpawn.
function plymeta:ResetRoundFlags()
    -- equipment
    self:ResetEquipment()
    self:SetCredits(0)

    self:ResetBought()

    -- equipment stuff
    self.bomb_wire = nil
    self.radar_charge = 0
    self.decoy = nil

    -- corpse
    self:SetNWBool("det_called", false)
    self:SetNWBool("body_found", false)
    self:SetNWBool("body_searched", false)

    self.kills = {}

    self.dying_wep = nil
    self.was_headshot = false

    -- communication
    self.mute_team = -1
    self.traitor_gvoice = false

    self:SetNWBool("disguised", false)
    -- If they had an "old model" that means they were disguised
    -- Reset their model back to what they used before they put the disguise on
    if self.oldmodel then
        local SetMDL = FindMetaTable("Entity").SetModel
        SetMDL(self, self.oldmodel)
        self.oldmodel = nil
    end

    -- karma
    self:SetCleanRound(true)

    if not self:GetCleanRounds() then
        self:SetCleanRounds(1)
    end

    self:Freeze(false)
end

function plymeta:GiveEquipmentItem(id)
    if self:HasEquipmentItem(id) then
        return false
    elseif id and id > EQUIP_NONE then
        self:AddEquipmentItem(id)
        return true
    end
end

-- Forced specs and latejoin specs should not get points
function plymeta:ShouldScore()
    if self:GetForceSpec() then
        return false
    elseif self:IsSpec() and self:Alive() then
        return false
    else
        return true
    end
end

function plymeta:RecordKill(victim)
    if not IsValid(victim) then return end

    if not self.kills then
        self.kills = {}
    end

    table.insert(self.kills, victim:SteamID())
end

function plymeta:SetSpeed(slowed)
    -- For player movement prediction to work properly, ply:SetSpeed turned out
    -- to be a bad idea. It now uses GM:SetupMove, and the TTTPlayerSpeedModifier
    -- hook is provided to let you change player speed without messing up
    -- prediction. It needs to be hooked on both client and server and return the
    -- same results (ie. same implementation).
    error "Player:SetSpeed has been removed - please remove this call and use the TTTPlayerSpeedModifier hook in both CLIENT and SERVER environments"
end

function plymeta:ResetLastWords()
    if not IsValid(self) then return end -- timers are dangerous things
    self.last_words_id = nil
end

function plymeta:SendLastWords(dmginfo)
    -- Use a pseudo unique id to prevent people from abusing the concmd
    self.last_words_id = math.floor(CurTime() + math.random(500))

    -- See if the damage was interesting
    local dtype = KILL_NORMAL
    if dmginfo:GetAttacker() == self or dmginfo:GetInflictor() == self then
        dtype = KILL_SUICIDE
    elseif dmginfo:IsDamageType(DMG_BURN) then
        dtype = KILL_BURN
    elseif dmginfo:IsFallDamage() then
        dtype = KILL_FALL
    end

    self.death_type = dtype

    net.Start("TTT_InterruptChat")
    net.WriteUInt(self.last_words_id, 32)
    net.Send(self)

    -- any longer than this and you're out of luck
    local ply = self
    timer.Simple(2, function() ply:ResetLastWords() end)
end

function plymeta:ResetViewRoll()
    local ang = self:EyeAngles()
    if ang.r ~= 0 then
        ang.r = 0
        self:SetEyeAngles(ang)
    end
end

function plymeta:ShouldSpawn()
    -- do not spawn players who have not been through initspawn
    if (not self:IsSpec()) and (not self:IsTerror()) then return false end
    -- do not spawn forced specs
    if self:IsSpec() and self:GetForceSpec() then return false end

    return true
end

-- Preps a player for a new round, spawning them if they should. If dead_only is
-- true, only spawns if player is dead, else just makes sure he is healed.
function plymeta:SpawnForRound(dead_only, round_start)
    local max_rounds = GetConVar("ttt_round_limit"):GetInt()
    local rounds_left = GetGlobalInt("ttt_rounds_left", max_rounds)
    local round_number = max_rounds - rounds_left
    if round_start and ((round_number == 0 and GetConVar("ttt_player_set_model_on_initial_spawn"):GetBool()) or GetConVar("ttt_player_set_model_on_new_round"):GetBool()) then
        hook.Call("PlayerSetModel", GAMEMODE, self)
    end
    hook.Call("TTTPlayerSetColor", GAMEMODE, self)

    -- Workaround to prevent GMod sprint from working
    self:SetRunSpeed(self:GetWalkSpeed())

    -- wrong alive status and not a willing spec who unforced after prep started
    -- (and will therefore be "alive")
    if dead_only and self:Alive() and (not self:IsSpec()) then
        -- if the player does not need respawn, make sure he has full health
        self:SetHealth(self:GetMaxHealth())
        return false
    end

    if not self:ShouldSpawn() then return false end

    -- reset propspec state that they may have gotten during prep
    PROPSPEC.Clear(self)

    -- respawn anyone else
    if self:Team() == TEAM_SPEC then
        self:UnSpectate()
    end

    self:StripAll()
    self:SetTeam(TEAM_TERROR)
    -- Disable Phantom haunting
    self:SetNWBool("Haunting", false)
    self:SetNWString("HauntingTarget", nil)
    self:SetNWInt("HauntingPower", 0)
    timer.Remove(self:Nick() .. "HauntingPower")
    self:Spawn()

    if round_start then
        self:Freeze(true)
        local ply = self
        timer.Simple(1.5, function()
            ply:Freeze(false)
        end)
    -- If a dead player was spawned outside of the round start, broadcast the defib event
    elseif dead_only then
        net.Start("TTT_Defibrillated")
        net.WriteString(self:Nick())
        net.Broadcast()
    end

    timer.Simple(1, function()
        if not self:HasWeapon("weapon_ttt_unarmed") then
            self:Give("weapon_ttt_unarmed")
        end
        if not self:HasWeapon("weapon_zm_carry") then
            self:Give("weapon_zm_carry")
        end
        if not self:HasWeapon("weapon_zm_improvised") then
            self:Give("weapon_zm_improvised")
        end
    end)

    -- tell caller that we spawned
    return true
end

function plymeta:InitialSpawn()
    self.has_spawned = false

    -- The team the player spawns on depends on the round state
    self:SetTeam(GetRoundState() == ROUND_PREP and TEAM_TERROR or TEAM_SPEC)

    -- Change some gmod defaults
    self:SetCanZoom(false)
    self:SetJumpPower(160)
    self:SetCrouchedWalkSpeed(0.3)
    self:SetRunSpeed(220)
    self:SetWalkSpeed(220)
    self:SetMaxSpeed(220)

    -- Always spawn innocent initially, traitor will be selected later
    self:ResetStatus()

    -- Start off with clean, full karma (unless it can and should be loaded)
    self:InitKarma()

    self:InitDrinks()

    -- We never have weapons here, but this inits our equipment state
    self:StripAll()
end

function plymeta:KickBan(length, reason)
    -- see admin.lua
    PerformKickBan(self, length, reason)
end

local oldSpectate = plymeta.Spectate
function plymeta:Spectate(type)
    oldSpectate(self, type)

    -- NPCs should never see spectators. A workaround for the fact that gmod NPCs
    -- do not ignore them by default.
    self:SetNoTarget(true)
    -- Save the spectate mode so it can be accessed on the client
    self:SetNWInt("SpecMode", type)

    if type == OBS_MODE_ROAMING then
        self:SetMoveType(MOVETYPE_NOCLIP)
    end

    -- If this player is a Spectator then strip all the weapons after a delay to work around some addons that force spectator but leave the magneto stick somehow
    if self:IsSpec() then
        timer.Simple(0.5, function()
            self:StripAll()
        end)
    end
end

local oldSpectateEntity = plymeta.SpectateEntity
function plymeta:SpectateEntity(ent)
    oldSpectateEntity(self, ent)

    if IsValid(ent) and ent:IsPlayer() then
        self:SetupHands(ent)
    end
end

local oldUnSpectate = plymeta.UnSpectate
function plymeta:UnSpectate()
    oldUnSpectate(self)
    self:SetNoTarget(false)
end

function plymeta:GetAvoidDetective()
    return self:GetInfoNum("ttt_avoid_detective", 0) > 0
end
