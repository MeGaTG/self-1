function run_bash(command)
    local cmd = io.popen(command)
    local result = cmd:read('*all')
    cmd:close()
    return result
end
local function is_channel_disabled( receiver )
	if not _config.disabled_channels then
		return false
	end

	if _config.disabled_channels[receiver] == nil then
		return false
	end

  return _config.disabled_channels[receiver]
end

local function enable_channel(receiver, to_id)
	if not _config.disabled_channels then
		_config.disabled_channels = {}
	end

	if _config.disabled_channels[receiver] == nil then
		return 'باشه خاموش شدم'
	end
	
	_config.disabled_channels[receiver] = false

	save_config()
	return 'باشه روشن شدم'
end

local function disable_channel(receiver, to_id)
	if not _config.disabled_channels then
		_config.disabled_channels = {}
	end
	
	_config.disabled_channels[receiver] = true

	save_config()
	return 'باشه خاموش شدم'
end

local function pre_process(msg)
	local receiver = get_receiver(msg)
	
	-- If sender is sudo then re-enable the channel
	if is_sudo(msg) then
	  if msg.text == "#bot on" then
	    enable_channel(receiver, msg.to.id)
	  end
	end

  if is_channel_disabled(receiver) then
  	msg.text = ""
  end

	return msg
end

local function run(msg, matches)
	if permissions(msg.from.id, msg.to.id, "bot") then
		local receiver = get_receiver(msg)
		-- Enable a channel
		if matches[1] == 'on' then
			return enable_channel(receiver, msg.to.id)
		end
		-- Disable a channel
		if matches[1] == 'off' then
			return disable_channel(receiver, msg.to.id)
		end
	else
		return 
	end
	    if matches[1] == 'up' then
  if not is_sudo(msg) then
    return nil
  end
  local receiver = get_receiver(msg)
 if string.match then
     local command = 'git pull'
   text = run_bash(command)
   local text = text..'Updates were applied GitHub\n@BeatBot_Team'
    return text
  end
end
end

return {
	patterns = {
		"^#bot? (on)$",
		"^#bot? (off)$",
	    "^#bot? (up)$",
	    },
	run = run,
	pre_process = pre_process
}
