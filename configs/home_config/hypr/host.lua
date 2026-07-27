-- Resolves which machine profile should be loaded from hosts/
--
-- Add a new machine by putting its hostname in the table below and
-- creating the matching file under hosts/

local hostnames = {
	["guilherme-pc"] = "desktop",
	["guilherme-dell"] = "notebook",
}

-- Least privileged profile: assumes a single screen and no autostart
local FALLBACK = "notebook"

local function read_hostname()
	local file = io.open("/etc/hostname")
	if not file then
		return nil
	end

	local name = file:read("l")
	file:close()

	if name == nil or name == "" then
		return nil
	end

	return name
end

local hostname = read_hostname() or "unknown"
local profile = hostnames[hostname]

if profile == nil then
	profile = FALLBACK
	-- hl.print("host.lua: unknown hostname '" .. hostname .. "', falling back to '" .. FALLBACK .. "'")
end

return {
	hostname = hostname,
	profile = profile,
}
