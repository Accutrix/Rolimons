-- OptimisticSide

local Package = script.Parent

local Formatter = require(Package.Formatter)
local Http = require(Package.Http)
local API = require(Package.API)

local Game = { }

Game.__index = Game


function Game:GetData() => table
	return API.GetData("Game", self.Id)
end

function Game:UpdateData() => nil
	local NewData = self:GetData()
	for Name, Element in pairs(NewData) do
		self[Name] = Element
	end
end


function Game.new(GameId: number) => table
	local self = setmetatable({ }, Game)
	self.Id = GameId
	self:UpdateData()
	return self
end


return Game
