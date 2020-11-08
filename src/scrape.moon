-- Bulbarchive Image Downloader
http_request = require "http.request"
parser       = require "htmlparser"

headers, stream = assert(http_request.new_from_uri("https://archives.bulbagarden.net/wiki/Category:Red_and_Green_sprites")\go!)
--headers, stream = assert(http_request.new_from_uri("https://archives.bulbagarden.net/wiki/Category:Crystal_sprites")\go!)
body = assert(stream\get_body_as_string!)
root = parser.parse(body, 4000) -- 2000 is the depth
elm = root(".thumb")
html_string = "https://archives.bulbagarden.net" -- root page

-- Getting the first link --
links = {}
print("Loading...")
for i,e in ipairs(elm)
	subs = e("img")
	f = io.open("P#{i}.png", "wb") -- Creating ascending order pngs
	for _, sub in ipairs subs

		-- Connect and save imgs --
		headers, stream = assert(http_request.new_from_uri("https:#{sub.attributes["src"]}")\go!)
		stream\save_body_to_file(f, 1000)

		-- Destroy streams --
		f\close!
		stream\shutdown!
