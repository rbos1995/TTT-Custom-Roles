local PLAYER = FindMetaTable("Player")

function PLAYER:GetJumpLevel()
    return self:GetDTInt(23)
end

function PLAYER:SetJumpLevel(level)
    self:SetDTInt(23, level)
end

function PLAYER:GetMaxJumpLevel()
    return self:GetDTInt(24)
end

function PLAYER:SetMaxJumpLevel(level)
    self:SetDTInt(24, level)
end

function PLAYER:GetExtraJumpPower()
    return self:GetDTFloat(25)
end

function PLAYER:SetExtraJumpPower(power)
    self:SetDTFloat(25, power)
end

function PLAYER:GetJumped()
    return self:GetDTInt(26)
end

function PLAYER:SetJumped(jumped)
    self:SetDTInt(26, jumped)
end

function PLAYER:GetMaxJumpDistance()
    return self:GetDTInt(27)
end

function PLAYER:SetMaxJumpDistance(max_distance)
    self:SetDTInt(27, max_distance)
end

function PLAYER:GetJumpLocation()
    return self:GetDTVector(28)
end

function PLAYER:SetJumpLocation(loc)
    self:SetDTVector(28, loc)
end