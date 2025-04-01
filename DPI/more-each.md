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

## map
The map method (also known as collect) transforms each element of a collection according to the block provided and returns a new array of transformed elements

```ruby
numbers = [1, 2, 3, 4, 5]

squares = numbers.map do |number|
  number * number
end

pp squares
```

Also
```ruby
numbers = [1, 2, 3, 4, 5]

squares = numbers.map { |number| number * number }

pp squares
```

## select and reject methods
- select returns a new array containing all elements for which the block returns true.
- reject returns a new array containing all elements for which the block returns false.
```ruby
numbers = [1, 2, 3, 4, 5]

even_numbers = numbers.select do |number|
  number.even?
end

pp even_numbers
```

```ruby
numbers = [1, 2, 3, 4, 5]

odd_numbers = numbers.reject do |number|
  number.even?
end

pp odd_numbers
```