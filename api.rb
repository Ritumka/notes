require "http"

puts HTTP.get("https://merrysky.net/forecast/irkutsk/ru").to_s
