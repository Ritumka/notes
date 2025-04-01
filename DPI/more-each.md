## .each with index

With given array create a hash were words are keys and their indexes are value

```ruby
array = ["apple", "banana", "cherry", "date"]

result = {}

words.each_with_index do |word, index|
    result[word] = index
end

puts result
```
Reversed indexes

```ruby
array = ["apple", "banana", "cherry", "date"]

result = {}

array.each_with_index do |word, index|
  result[word] = array.length - 1 - index 
end

puts result
```
## .each with character
In given string count vowels and print the value
```ruby
string = "Hello World"

count = 0
vowels = "aeiou"

string.downcase.each_char do |char|
  count += 1 if vowels.include?(char)
end

puts count
```