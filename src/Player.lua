-- OptimisticSide

local Players = game:GetService("Players")

local Package = script.Parent

local Formatter = require(Package.Formatter)
local Http = require(Package.Http)
local API = require(Package.API)
local Item = require(Package.Item)

local Player = { }

Player.__index = Player


function Player:GetData() => table
	return API.GetData("Player", self.Id)
end

function Player:UpdateData() => nil
	local NewData = self:GetData()
	for Name, Element in pairs(NewData) do
		self[Name] = Element
	end
end


function Player.new(UserId) => table
	if typeof(UserId) == "string" then
		UserId = Players:GetUserIdFromNameAsync(UserId)
	end
	
	local self = setmetatable({ }, Player)
	self.Id = UserId
	self:UpdateData()
	return self
end


return Player
