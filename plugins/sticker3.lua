local function tosticker(msg, success, result)
  local receiver = get_receiver(msg)
  if success then
    local file = 'sticker/'..msg.from.id..'.webp'
    print('File downloaded to:', result)
    os.rename(result, file)
    print('File moved to:', file)
    send_document(get_receiver(msg), file, ok_cb, false)
    redis:del("document:sticker")
  else
    print('Error downloading: '..msg.id)
    send_large_msg(receiver, 'Failed, please try again!', ok_cb, false)
  end
end
local function run(msg,matches)
    local receiver = get_receiver(msg)
    local group = msg.to.id
    if msg.reply_id then
        if msg.to.type == 'photo' and redis:get("document:sticker") then
          if redis:set("document:sticker", "waiting") then
          end
        end
    
      if matches[1] == "sticker3" then
      redis:get("document:sticker")  
        load_document(msg.reply_id,tosticker, msg)
    end
end
end
return {
  patterns = {
  "^[#/](sticker3)$",
  "%[(document)%]",
  },
  run = run,
  }
—by @datak_team
—by @thisismohammadreza
توسط داتک @datak_team بدون منبع ذکر حرام است
