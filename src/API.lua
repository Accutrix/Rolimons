-- OptimisticSide

local Package = script.Parent

local Formatter = require(Package.Formatter)
local Http = require(Package.Http)

local API = { }

API.UrlFormat = "https://www.rolimons.com/%s/%s"


function API.GetVariable(JavaScript: string, Variable: string) => string
	local Declaration = string.sub(JavaScript, string.find(JavaScript, Variable) + string.len(Variable))
	Declaration = string.sub(Declaration, 1, string.find(Declaration, "\n"))
	if string.find(Declaration, "=") then
		Declaration = string.sub(Declaration, string.find(Declaration, "=") + 2, string.find(Declaration, ";") - 1)
		return Declaration
	end
end


function API.GetData(Type: string, Id: number) => table?
	local DidGet, Result = Http.Get(string.format(API.UrlFormat, Type, Id))
	if DidGet then
		Type = string.lower(Type)
		local RawData = Http.DecodeJson(API.GetVariable(Result, Type .. "_details_data") or API.GetVariable(Result, Type .. "_details"))
		
		local FormateedData = Formatter.FormatFromRaw(RawData)
		return FormateedData
	else
		warn("Rolimons - " .. Type .. " - Unable to retrive data | " .. Result)
	end
end


return API
