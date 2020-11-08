local http_request = require("http.request")
local parser = require("htmlparser")
local headers, stream = assert(http_request.new_from_uri("https://archives.bulbagarden.net/wiki/Category:Red_and_Green_sprites"):go())
local body = assert(stream:get_body_as_string())
local root = parser.parse(body, 2000)
local elm = root(".thumb")
local html_string = "https://archives.bulbagarden.net"
local links = { }
for i, e in ipairs(elm) do
  local subs = e("img")
  local f = io.open("P" .. tostring(i) .. ".png", "wb")
  for _, sub in ipairs(subs) do
    headers, stream = assert(http_request.new_from_uri("https:" .. tostring(sub.attributes["src"])):go())
    stream:save_body_to_file(f, 1000)
    f:close()
    stream:shutdown()
  end
end
