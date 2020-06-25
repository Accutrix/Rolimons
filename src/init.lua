local Package = script

local Rolimons = { }

function Rolimons.Get(Class: string) => table
	local FromPackage = Package:FindFirstChild(Class)
	if FromPackage then
		return require(FromPackage)
	end
end

return setmetatable(Rolimons, {
	__index = function(self, Index)
		return Rolimons.Get(Index)
	end;
	
	__call = function(self, ...)
		return Rolimons.Get(...)
	end;
})
