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
Try to visit:
```html
https://api.pirateweather.net/forecast/API_KEY_FROM_COURSE_SECRETS/41.8887,-87.6355
```
[secrets](https://learn.firstdraft.com/runs/76/learner/secrets)