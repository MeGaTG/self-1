do

function run(msg, matches)
send_contact(get_receiver(msg), "+989367009354", "Amir", "Hossein", ok_cb, false)
end

return {
patterns = {
"^[!#/]share$"
},
run = run
}

end
