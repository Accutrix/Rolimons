-- OptimisticSide

local Package = script.Parent

local Formatter = require(Package.Formatter)
local Http = require(Package.Http)
local API = require(Package.API)

local Item = { }

Item.__index = Item


function Item:GetData() => table
	return API.GetData("Item", self.Id)
end

function Item:UpdateData() => nil
	local NewData = self:GetData()
	for Name, Element in pairs(NewData) do
		self[Name] = Element
	end
end


function Item.new(ItemId: number) => table
	local self = setmetatable({ }, Item)
	self.Id = ItemId
	self:UpdateData()
	return self
end


return Item
