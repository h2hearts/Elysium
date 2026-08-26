--!nocheck
--!nolint

local cloneref = cloneref or function(x) return x end

local game          = cloneref(game)
local http_service  = cloneref(game:GetService("HttpService"))
local players       = cloneref(game:GetService("Players"))
local starter_gui   = cloneref(game:GetService("StarterGui"))

type loader_config = {
	name: string,
	url: string,
	version: string?,
	author: string?,
}

local ___loaders: { [number]: loader_config } = {}

local ___place_loaders: { [number]: loader_config } = {
	[110369730911937] = {
		name    = "cdid",
		url     = "https://elysium-sc.vercel.app/api/raw?name=cdid.luau",
		author  = "Elysium",
	},
	[14005966837] = {
		name    = "cdid_event",
		url     = "https://elysium-sc.vercel.app/api/raw?name=cdid_event.luau",
		author  = "Elysium",
	},
}

local function __notify(title: string, text: string): ()
	pcall(function()
		starter_gui:SetCore("SendNotification", {
			Title    = title,
			Text     = text,
			Duration = 5,
		})
	end)
end

local function __load_script(url: string): boolean
	local user_key: string = (getgenv and getgenv().ElysiumKey) or ""
	local target_url: string = url
	if user_key ~= "" then
		target_url = target_url .. (url:find("?") and "&" or "?") .. "key=" .. tostring(user_key)
	end

	local success: boolean, result: any = pcall(function()
		local script_content: string = game:HttpGet(target_url)
		local loaded_function: any = loadstring(script_content)

		if loaded_function then
			loaded_function()
			return true
		else
			error("failed to compile script")
		end
	end)

	if not success then
		warn("[loader] failed:", result)
		__notify("Elysium loader", "failed to load script")
		return false
	end

	return true
end

local ___default_loader: loader_config? = nil

local place_id: number    = game.PlaceId
local universe_id: number = game.GameId
local loader_config: loader_config = ___place_loaders[place_id]
	or ___loaders[universe_id]
	or ___default_loader

if loader_config then
	__load_script(loader_config.url)
else
	warn("[loader] failed: loader config not found for this game")
	__notify("Elysium loader", "Game not supported")
end
