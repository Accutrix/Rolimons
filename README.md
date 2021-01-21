# Rolimons
An API for interacting with the [Rolimons](https://www.rolimons.com/) website, with full support for object-oriented programming. This API is useful for retrieving data regarding item value, RAP, and demand.

## Classes
The Rolimon's API has full support for object-oriented programming, for better updating mechanisms.

### Item
The item class is to represent an item on the ROBLOX catalog, with an asset-ID. This includes everything from limited items, to packages.
#### Constructor
The constructor of the item class creates an item. It takes in only one parameter, which is the item's asset-ID
```lua
local Item = Rolimons.Get("Item")
local classicFedora = Item.new(1029025)
```
#### Methods
**GetData**
Get's the item's data from Rolimons. This method is used internally, and takes no parameters. 
```lua
local data = classicFedora:GetData()
```
**UpdateData**
Get's the item's data from Rolimons, and updates the object. This method can be used to update (in intervals) when accuracy is key, and takes no parameters. 
```lua
classicFedora:UpdateData()
```
#### Properties
 - **AssetId**
 The asset-ID of the item
 - **Name**
 The name of the item
  - **AssetTypeId**
 The asset-type-ID for the item
 - **OriginalPrice**
 The original price that the item was on sale for
 - **Created**
 The item's creation timestamp
 - **Updated**
 The timestamp of the item's last update
 - **First**
 The first recorded timestamp of the item
 - **BestPrice**
 The best price of the item
 - **Favorites**
 The amount of favorites of the item
 - **SellerCount**
 The amount of sellers of the item
 - **RecentAveragePrice**
 The recent average price (RAP) of the item
 - **OwnerCount**
 The amount of owners
 - **PremiumCount**
 The amount of owners with ROBLOX Premium
 - **Copies**
 The amount of copies of the item
 - **DeletedCopies**
 The amount of copies of the item that have been deleted
 - **PremiumCopies**
 The amount of copies of the item that are owned by ROBLOX Premium members
 - **HoardedCopies** 
 The amount of copies of the item that are hoarded
 - **ValueChangeNotes**
 Any notes that the value changer had left when changing the value of the item
 - **Acronym**
 The acronym of the item
 - **Value**
 The value of the item
 - **Demand**
 The demand of the item
 - **Trend**
 The current trend of the item
 - **Projected**
 Whether or not the item is projected
 - **Hyped**
 Whether or not the item is hyped
 - **Rare**
 Whether or not the item is rare

### Player
The player class is to represent an player/user on the ROBLOX website, with an user-ID. Please note that this class is quite limited at the moment, and inventory APIs will be implemented soon.
#### Constructor
The constructor of the item class creates an item. It takes in only one parameter, which can be either the player's user-ID or their username.
```lua
local Player = Rolimons.Get("Player")

local shedletksy = Player.new(261)
local optimisticSide = Player.new("OptimisticSide")
```

#### Methods
**GetData**
Get's the item's data from Rolimons. This method is used internally, and takes no parameters. 
```lua
local data = shedletsky:GetData()
```
**UpdateData**
Get's the player's data from Rolimons, and updates the object. This method can be used to update (in intervals) when accuracy is key, and takes no parameters. 
```lua
shetletsky:UpdateData()
```
#### Properties
 - **UserId**
 The user-ID of the player
 - **Name**
 The username of the player
 - **MembershipType**
 The membership-type of the player
 - **Rank**
 The rank of the player
 - **TradeAdCount**
 The amount of trade advertisements posted by the player
 - **Wishlist**
 The items that have been wish-listed by the player
 - **NotForTradeList**
 The items that the player does not want to trade

### Game
The item class is to represent an item on the ROBLOX catalog, with an asset-ID. This includes everything from limited items, to packages.
#### Constructor
The constructor of the item class creates an item. It takes in only one parameter, which is the game's game-ID
```lua
local Game = Rolimons.Get("Game")
local murderMystery2 = Game.new(142823291)
```
#### Methods
**GetData**
Get's the game's data from Rolimons. This method is used internally, and takes no parameters. 
```lua
local data = murderMystery2:GetData()
```
**UpdateData**
Get's the game's data from Rolimons, and updates the object. This method can be used to update (in intervals) when accuracy is key, and takes no parameters. 
```lua
murderMystery2:UpdateData()
```

 - **GameId**
 The game-ID of the game
 - **UniverseId**
 The unverse-ID of the game
 - **DataUpdated**
 The timestamp of when the data was last updated
 - **RootPlaceId**
 The place-ID of the root/main place
 - **CreatorId**
 The ID of the creator (group-ID if it's a group, and user-ID if it's a user)
 - **CreatorName**
 The name of the game creator
 - **CreatorType**
 The type of creator
 - **Created**
 The timestamp of when the game was created
 - **Updated**
 The timestamp of when the game was last updated
 - **Name**
 The name of the game
 - **Description**
 The description about the game
 - **Genre**
 The type of genre the game is
 - **MaxPlayers**
 The maximum amount of players
 - **IconUrl**
 The URL of the game's icon
 - **ThumbnailUrl**
 The URL of the game's thumbnail
 - **IsExperimental**
 Whether or not the game is experimental
 - **Price**
 The price in robux to purchase the game
 - **PlayerCount**
 The amount of players currently playing the game
 - **Visits**
 The total amount of times a player has joined the game
 - **Upvotes**
 The amount of likes/upvotes the game has recieved
 - **Downvotes**
 The amount of dislikes/downvotes the game has recieved
 - **Favorites**
 The amount of users that have favorited the game
 - **ServerCount**
 The amount of servers for the game
 - **AverageServerPlayerCount**
 The average amount of players in a server
 - **AverageServerPlayerCountStandardDeviation**
 The standard deviation of the average amount of players in a server
 - **MinimumServerPlayers**
 The minimum amount of players in a server
 - **MaximumServerPlayers**
 The maximum amount of players in a server
 - **AverageServerPing**
 The average ping of a server
 - **AverageServerPing**
 The standard deviation of the average ping of a server
 - **MinimumServerPing**
 The minimum ping of a server
 - **MaximumServerPing**
 The maximum ping of a server
 - **AverageServerFPS**
 The average frames-per-second of a server
 - **AverageServerFPS**
 The standard deviation of the average frames-per-second of a server
 - **MinimumServerFPS**
 The minimum frames-per-second of a server
 - **MaximumServerFPS**
 The maximum frames-per-second of a server
