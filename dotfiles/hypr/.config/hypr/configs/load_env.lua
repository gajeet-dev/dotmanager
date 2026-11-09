local function load_env(path)
	local file = io.open(path, "r")

	if not file then
		return
	end

	for line in file:lines() do
		-- Ignore comments and empty lines
		if not line:match("^%s*#") and line:match("%S") then
			local key, value = line:match("^%s*([%w_]+)%s*=%s*(.-)%s*$")

			if key and value then
				-- Remove optional surrounding quotes
				value = value:gsub("^['\"]", ""):gsub("['\"]$", "")

				hl.env(key, value)
			end
		end
	end

	file:close()
end

load_env(os.getenv("HOME") .. "/.environment")
