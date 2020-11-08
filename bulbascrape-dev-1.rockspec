package = "BulBScrape"
version = "dev-1"
source = {
   url = "git://github.com/oxilgk/bulbscrape.git"

}

description = {
   summary = "Web Scraping From The Moon To The Bulb"
   detailed = [[
      This is a really alpha version of a scraper
      that is written in moonscript to download 
      imgs or info from all over bulbapedia. 
      ]],
   homepage = "http://oxilgk.github.io/bulbscrape" -- We don't have one yet

   license = "MIT" -- or whatever you like
   maintainer = "Vasilis Katsifolis <vazkats@gmail.com>"
}

dependencies = {
	   "lua >= 5.1, < 5.4"
	   "http"
	   "htmlparser"
}

build = {
   type = "builtin",
   modules = {
      bulbscrape = "bulbscrape.lua"
   }
}
