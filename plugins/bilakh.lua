do
local function run(msg, matches)

local bilakh = 223404066


-- Bilakh --

    if msg.from.id == tonumber(bilakh) and matches[1]:lower() == 'bilakh' then
        return 'In Bilakh ba Eshgh, Taghdim be Shoma!\n _|_ '
    end

end
 
 
return {
  patterns = {
   "^[!/#]([Bb]ilakh)",
  },
  run = run
}
end
