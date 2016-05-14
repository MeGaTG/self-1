local function todocument(msg, success, result)
  local receiver = get_receiver(msg)
  if success then
    local file = 'photo/'..msg.from.id..'.png'
    print('File downloaded to:', result)
    os.rename(result, file)
    print('File moved to:', file)
    send_photo(get_receiver(msg), file, ok_cb, false)
    redis:del("document:photo")
  else
    print('Error downloading: '..msg.id)
    send_large_msg(receiver, 'Failed, please try again!', ok_cb, false)
  end
end
local function run(msg,matches)
    local receiver = get_receiver(msg)
    local group = msg.to.id
    if msg.reply_id then
        if msg.to.type == 'photo' and redis:get("document:photo") then
          if redis:set("document:photo", "waiting") then
          end
        end
    
      if matches[1] == "photo3" then
      redis:get("document:photo")  
        load_photo(msg.reply_id,todocument, msg)
    end
end
end
return {
  patterns = {
  "^[#/](photo3)$",
  "%[(document)%]",
  },
  run = run,
  }
