-- OptimisticSide

local HttpService = game:GetService("HttpService")

local Http = { }


function Request(Method: string, Url: string, Headers: table?, Body) => table
--	print('request - ' .. Url .. ' - ' .. Body)
	return HttpService:RequestAsync({
		Url = Url;
		Method = Method;
		Body = Body;
		Headers = Headers;
	})
end


function Http.Get(Url: string, Body: any, Headers: table?) => table
	local HttpResponse = Request("GET", Url, Headers, Body)
	return HttpResponse.Success, HttpResponse.Body
end

function Http.Post(Url, Body, Headers) => table
	local HttpResponse = Request("POST", Url, Headers, Body)
	return HttpResponse.Success, HttpResponse.Body
end


function Http.EncodeJson(Table) => string?
	return HttpService:JSONEncode(Table)
end

function Http.DecodeJson(Json) => table?
	return HttpService:JSONDecode(Json)
end


return setmetatable(Http, {
	__call = function(self, ...)
		return Request(...)
	end;
})
