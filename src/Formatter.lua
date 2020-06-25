-- OptimisticSide

local Package = script.Parent

local Formatter = { }

Formatter.Data = {
	ItemElements = {
		AssetId = "item_id";
		Name = "item_name";
		TypeId = "asset_type_id";
		OriginalPrice = "original_price";
		Created = "created";
		First = "first_timestamp";
		BestPrice = "best_price";
		Favorites = "favorited";
		SellerCount = "num_sellers";
		RecentAveragePrice = "rap";
		OwnerCount = "owners";
		PremiumOwners = "bc_owners";
		Copies = "copies";
		DeletedCopies = "deleted_copies";
		PremiumCopies = "bc_copies";
		HoardedCopies = "hoarded_copies";
		ValueChangeNotes = "value_changers_notes";
		Acronym = "acronym";
		Value = "value";
		Demand = "demand";
		Trend = "trend";
		Projected = "projected";
		Hyped = "hyped";
		Rare = "rare";
	};
	
	PlayerElements = {
		UserId = "player_id";
		Name = "player_name";
		MembershipType = "bc_type";
		Rank = "rank";
		TradeAdCount = "trade_ad_count";
		StaffRole = "staff_role";
		Wishlist = "wishlist";
		NotForTradeList = "nft_list";
	};
	
	GameElements = {
		GameId = "game_id";
		UniverseId = "uinverse_id";
		DataUpdated = "data_updated_actual";
		RootPlaceId = "root_place_id";
		CreatorId = "creator_id";
		CreatorName = "creator_name";
		CreatorType = "creator_type";
		Created = "created";
		Updated = "updated";
		Name = "name";
		Description = "description";
		Genre = "genre";
		MaxPlayers = "max_players";
		IconUrl = "icon_url";
		ThumbnailUrl = "thumbnail_url";
		IsExperimental = "is_experimental";
		Price = "price";
		PlayerCount = "players";
		Visits = "visits";
		Upvotes = "upvotes";
		Downvotes = "downvotes";
		Favorites = "favorites";
		ServerCount = "servers";
		AverageServerPlayerCount = "server_players_avg";
		AverageServerPlayersStandardDeviation = "server_players_std_dev";
		MinimumServerPlayers = "server_players_min";
		MaximumServerPlayers = "server_players_max";
		AverageServerPing = "server_ping_avg";
		AverageServerPingStandardDeviation = "server_ping_std_dev";
		AverageServerPing = "server_ping_avg";
		MinimumServerPing = "server_ping_min";
		MaximumServerPing = "server_ping_max";
		AverageServerFPS = "server_fps_avg";
		AverageServerFPSStandardDeviation = "server_fps_avg_std_dev";
		MinimumServerFPS = "server_fps_min";
		MaximumServerFPS = "server_fps_max";
	};
}


function Formatter.FindRawElement(RawElement: string) => string
	for _, DataType in pairs(Formatter.Data) do
		for Formatted, Raw in pairs(DataType) do
			if Raw == RawElement then
				return Formatted
			end
		end
	end
	return RawElement
end


function Formatter.FormatToRaw(Data: table) => table
	local FormattedData = { }
	for Name, Element in pairs(Data) do
		if typeof(Element) ~= "function" then
			for _, DataType in pairs(Formatter.Data) do
				if DataType[Name] then
					Name = DataType[Name]
				end
			end
			FormattedData[Name] = typeof(Element) == "table" and Formatter.FormatToRaw(Element) or Element
		end
	end
	return FormattedData
end


function Formatter.FormatFromRaw(RawData: table) => table
	local Data = { }
	for Name, Element in pairs(RawData) do
		if typeof(Element) ~= "function" then
			Name = Formatter.FindRawElement(Name)
			Data[Name] = typeof(Element) == "table" and Formatter.FormatFromRaw(Element) or Element
		end
	end
	return Data
end


return Formatter
