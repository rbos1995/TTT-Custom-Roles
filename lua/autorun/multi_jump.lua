if SERVER then
    util.AddNetworkString("TTT_MultiJump")
end

local function GetMoveVector(mv)
    local ang = mv:GetAngles()

    local max_speed = mv:GetMaxSpeed()

    local forward = math.Clamp(mv:GetForwardSpeed(), -max_speed, max_speed)
    local side = math.Clamp(mv:GetSideSpeed(), -max_speed, max_speed)

    local abs_xy_move = math.abs(forward) + math.abs(side)

    if abs_xy_move == 0 then
        return Vector(0, 0, 0)
    end

    local mul = max_speed / abs_xy_move

    local vec = Vector()

    vec:Add(ang:Forward() * forward)
    vec:Add(ang:Right() * side)

    vec:Mul(mul)

    return vec
end

hook.Add("SetupMove", "MultiJumpSetupMove", function(ply, mv)
    -- Only run this for Valid, Alive, Non-Spectators playing TTT
    if gmod.GetGamemode().Name ~= "Trouble in Terrorist Town" or not IsValid(ply) or not ply:Alive() or ply:IsSpec() then return end

    -- Let the engine handle movement from the ground
    -- Only set the 'jumped' flag if that functionality is enabled
    if ply:OnGround() and mv:KeyPressed(IN_JUMP) and ply:GetJumped() ~= -1 then
        ply:SetJumped(1)
        return
    elseif ply:OnGround() then
        ply:SetJumpLevel(0)
        ply:SetJumpLocation(vector_origin)
        -- Only set the 'jumped' flag if that functionality is enabled
        if ply:GetJumped() ~= -1 then
            ply:SetJumped(0)
        end
        return
    end

    -- Ignore if the player is on a ladder
    if ply:GetMoveType() == MOVETYPE_LADDER then
        return
    end

    -- If we have a limited jump distance, keep track of the player's location
    local max_distance = ply:GetMaxJumpDistance()
    if max_distance > 0 then
        local jump_loc = ply:GetJumpLocation()
        if jump_loc == vector_origin then
            jump_loc = ply:GetPos()
            ply:SetJumpLocation(jump_loc)
        else
            local new_height = ply:GetPos().z
            local distance = math.abs(jump_loc.z - new_height)
            if distance > max_distance then
                return
            end
        end
    end

    -- Don't do anything if not jumping
    if not mv:KeyPressed(IN_JUMP) then
        return
    end

    ply:SetJumpLevel(ply:GetJumpLevel() + 1)

    if not ply:OnGround() and ply:GetJumped() == 0 then
        return
    end

    if ply:GetJumpLevel() > ply:GetMaxJumpLevel() then
        return
    end

    local vel = GetMoveVector(mv)
    vel.z = ply:GetJumpPower() * ply:GetExtraJumpPower()
    mv:SetVelocity(vel)

    ply:DoCustomAnimEvent(PLAYERANIMEVENT_JUMP , -1)

    if SERVER then
        net.Start("TTT_MultiJump")
        net.WriteEntity(ply)
        net.Broadcast()
    end
end)

if CLIENT then
    net.Receive("TTT_MultiJump", function()
        local ply = net.ReadEntity()
        if not IsValid(ply) or ply:IsSpec() or not ply:Alive() then return end

        local pos = ply:GetPos() + Vector(0, 0, 10)
        local client = LocalPlayer()
        if client:GetPos():Distance(pos) > 1000 then return end

        local emitter = ParticleEmitter(pos)
        for _ = 0, math.random(40, 50) do
            local partpos = ply:GetPos() + Vector(math.random(-10, 10), math.random(-10, 10), 10)
            local part = emitter:Add("particle/particle_smokegrenade", partpos)
            if part then
                part:SetDieTime(math.random(0.4, 0.7))
                part:SetStartAlpha(math.random(200, 240))
                part:SetEndAlpha(0)
                part:SetColor(math.random(200, 220), math.random(200, 220), math.random(200, 220))

                part:SetStartSize(math.random(6, 8))
                part:SetEndSize(0)

                part:SetRoll(0)
                part:SetRollDelta(0)

                local velocity = VectorRand() * math.random(10, 15);
                velocity.z = 5;
                part:SetVelocity(velocity)
            end
        end

        emitter:Finish()
    end)
end