# Intro to APIs

Application Programming Interfaces (APIs) allow you to request web data from many external services. 

## Placing requests with Ruby

First add [gem http](https://github.com/httprb/http) to your Gemfile

```ruby
gem "http"
```

Then `require "http"` to your `.rb` file.  
Then use it: 
```ruby
puts HTTP.get("https://en.wikipedia.org/wiki/Chicago").to_s
```
- The `http.rb` gem includes a class, `HTTP`, that has a class method `get` (and `post`, `patch`, `delete`, etc, for the other verbs).
- The argument to `get()` should be a `String` containing the full URL of the resource you want to request.    
- The `get` method returns an object that represents the HTTP response.    
- The `HTTP::Response` object has a method called `body` which will return a new object `HTTP::Response::Body`
- The `HTTP::Response::Body` contents can be retrieved by calling `to_s` on it, or we can just shortcut that and call `to_s` on the response itself. Also there are `headers` and `status`.

## Pirate Weather

[merrysky.net](https://merrysky.net/forecast/merchandise%20mart/us)

```ruby
require "http"

puts HTTP.get("https://merrysky.net/forecast/merchandise%20mart/us").to_s
```

Fortunately, there’s a parallel version of that same page but in a format that is much better for programs to understand. Try visiting this URL in a browser tab:

```html
https://api.pirateweather.net/forecast/API_KEY_FROM_COURSE_SECRETS/41.8887,-87.6355
```
[secrets](https://learn.firstdraft.com/runs/76/learner/secrets)

Install `gem "dotenv"` and store the key in `.env`. To check if the key is set correctly:
```ruby
# /env_test.rb
require "dotenv/load"

pp ENV.fetch("PIRATE_WEATHER_API_KEY")
```
Then write a program:

```ruby
require "http"
require "json"
require "dotenv/load"

pirate_weather_api_key = ENV.fetch("PIRATE_WEATHER_API_KEY")
pirate_weather_url = "https://api.pirateweather.net/forecast/" + pirate_weather_api_key + "/41.8887,-87.6355"

raw_response = HTTP.get(pirate_weather_url)
parsed_response = JSON.parse(raw_response)
current_temp = parsed_response.fetch("currently").fetch("temperature")

puts "The current temperature is " + current_temp.to_s + "."
```
Ruby includes a class called `JSON` that can convert a `String` containing `JSON` into Ruby `Hashes` & `Arrays`

## Google Maps Geocoding

```html
https://maps.googleapis.com/maps/api/geocode/json?address=Merchandise%20Mart%20Chicago&key=API_KEY_FROM_COURSE_SECRETS
```

```ruby
require "http"
require "json"
require "dotenv/load"
require "ascii_charts"

puts "========================================"
puts "    Will you need an umbrella today?"
puts "========================================"
puts ""
puts "Where are you?"
user_location = gets.chomp

puts "Let's see what the weather is in " + user_location.to_s.capitalize + "...."

gmaps_api_key = ENV.fetch("GMAPS_KEY")
gmaps_url = "https://maps.googleapis.com/maps/api/geocode/json?address=" + user_location.gsub(" ", "%20") + "&key=" + gmaps_api_key

raw_gmaps_response = HTTP.get(gmaps_url)
parsed_gmaps_response = JSON.parse(raw_gmaps_response)
results_hash = parsed_gmaps_response.fetch("results")
first_result = results_hash.at(0)
geometry_hash = first_result.fetch("geometry")
location_hash = geometry_hash.fetch("location")
lat = location_hash.fetch("lat")
lng = location_hash.fetch("lng")
puts "Your coordinates are " + lat.to_s + ", " + lng.to_s + "."


pirate_weather_api_key = ENV.fetch("PIRATE_WEATHER_KEY")
pirate_weather_url = "https://api.pirateweather.net/forecast/" + pirate_weather_api_key + "/" + lat.to_s + "," + lng.to_s

raw_response = HTTP.get(pirate_weather_url)
parsed_response = JSON.parse(raw_response)
currently_hash = parsed_response.fetch("currently")
current_temp = currently_hash.fetch("temperature")
hourly_hash = parsed_response.fetch("hourly")
hourly_summary = hourly_hash.fetch("summary")

puts "The current temperature is " + current_temp.to_s + "F. "
puts "Next hour: " + hourly_summary.to_s


hourly_data_array = hourly_hash.fetch("data")
next_twelve_hours = hourly_data_array[1..12]

any_precipitation = false
precip_array = [] # for ascii chart

next_twelve_hours.each_with_index do |hour_hash, index|
  precip_probability = hour_hash.fetch("precipProbability")
  precip_array.push([index + 1, (precip_probability * 100).round]) # push the array to the ascii chart

  if precip_probability > 0.10
    any_precipitation = true

    precip_time = Time.at(hour_hash.fetch("time"))
    seconds_from_now = precip_time - Time.now
    hours_from_now = seconds_from_now / 60 / 60

    # puts "In #{hours_from_now.round} hours, there is a #{(precip_probability * 100).round}% chance of precipitation."
  end
end

puts ""
puts "Hours from now vs Precipitation probability"

puts AsciiCharts::Cartesian.new(precip_array, :bar => true, :hide_zero => true).draw

if any_precipitation == true
  puts "You might want to take an umbrella!"
else
  puts "You probably won't need an umbrella."
end
```
[ascii_charts](https://github.com/benlund/ascii_charts)