# Lesson: Iterating with Ruby's `.each` Method
- In Ruby, most of our work involves managing lists—photos, messages, records, etc. The Array class is our go-to data structure for these lists, and looping over an array is one of the most common tasks. While you could use Integer’s `.times` method to iterate over an array (by counting its length), Ruby offers a more elegant solution with the Array’s `.each` method.

### examples of `Array`
```ruby
a = []

a = Array.new

a = "ruby".split("")

a = [1, 2, 3]
```

## Iterating Over Arrays: Using `.times` vs `.each`
```ruby
# .times
words = ["apple", "banana", "orange"]
number_of_words = words.count

number_of_words.times do |the_index|
  pp words.at(the_index).capitalize
  pp words.at(the_index).reverse
  pp words.at(the_index).upcase
end
```
- We count the array length and use that value with .times.
- The block variable (the_index) is an integer, used to access elements with words.at(the_index).

```ruby
# .each
words = ["apple", "banana", "orange"]

words.each do |the_word|
  pp the_word.capitalize
  pp the_word.reverse
  pp the_word.upcase
end
```
### Benefits of `.each`
- Simplicity:
    - You don't need to count the array’s length.
    - Ruby takes care of iterating the correct number of times.
- Readability:
    - The block variable (in this case, `the_word`) directly represents the element.
    - Best practice: name the array plurally (e.g., `words`) and the block variable singularly (e.g., `word` or `the_word`).
- Less Error-Prone:
    - No manual indexing is required.
    - The code is cleaner and easier to understand.

## Examples
### looping through every element in array
```ruby
word = ["apple", "banana", "orange"].sample

array = word.split("")

array.each do |character|
    pp "#{character.upcase}"
end
```

### even word?
```ruby
words = ["apple", "banana", "orange"]

words.each do |word|
    length = word.length

    if length.even?
        pp word
    end  
end
```

### letter count?
Get a word, print each letter in the word, and the number of times that letter appears.

```ruby
word = ["apple", "banana", "orange"].sample

array = word.split("")

array.each do |character|
    count = word.count(character)
    pp "#{character} appears #{count} times"
end
```

# Small challenges
Double Each Number

``` ruby
numbers = [1, 2, 3]
doubles = []

numbers.each do |number|
    number = number * 2
    doubles.push(number)
end

pp doubles
```

Sum up numbers
```ruby
numbers = [10, 20, 30]
sum = 0

numbers.each do |number|
    sum += number
end

pp sum
```

Count how many words have more than 4 letters
```ruby
words = ["apple", "dog", "elephant", "cat", "sunset"]
count = 0

words.each do |word|
  count += 1 if word.length > 4
end

puts count
```

Multiply Odd Numbers by 3
```ruby
numbers = [2, 5, 8, 11, 14, 17]

numbers.each do |num|
    if num.odd?
        num *= 3
    end
    
    puts num
end
```

# Conclusion
The `.each` method is fundamental in Ruby for iterating over collections. It simplifies your code by eliminating manual counting and indexing, and makes your intentions clear.