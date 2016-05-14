do

function run(msg, matches)
local reply_id = msg['id']
local text = 'جانم ؟؟؟؟'
if matches[1] == 'امیر' then
    if not is_sudo(msg) then
reply_msg(reply_id, text, ok_cb, false)
end
end 
end
return {
patterns = {
    "امیر"
},
run = run
}

end
