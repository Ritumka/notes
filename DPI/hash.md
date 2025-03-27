# The Hash class
In Ruby `hash` is like a list of labeled boxes. Each item (or "box") in a hash has two parts:

- **A key** (a label or name)
- **A value** (the thing stored inside the box)

## Examples of `Hash`
```ruby
person = {
  :name => "Alice",
  :age => 30,
  :city => "Chicago"
}
```

To get access to a value use a key.
Keys have **Symbol** format. It's like light weight String that developers use to label something internally in the code.

```ruby
pp person.keys
```
Use `.fetch` to get the value:

```ruby
puts person.fetch(:name)
puts person.fetch(:age)
```

But there is a shorthand:
```ruby
puts person[:name]
puts person[:age]
```

Similarly, use .keys to get access to values:
```ruby
puts person.key("Alice")
puts person.key(30)
```


## Creating hashes and storing values

```ruby
person = Hash.new
pp person

person.store(:first_name, "Alice")
person.store(:last_name, "Smith")
person.store(:city, "Chicago")

pp person
```
A shorthand:

```ruby
person = Hash.new

person[:first_name] = "Alice"
person[:last_name] = "Smith"
person[:city] = "Chicago"

pp person
```
## Challenge

Create a hash where the keys are words and the values are their lengths
```ruby
array = ["summer", "fall", "winter", "spring"]
hash = {}

array.each do |word|
  hash.store(word, word.length)
end

puts hash
```

Given a hash of TAs names and scores, use `.each` to print each name with their score. Print total score. Find and print the worst TA name (with the lowest score).
```ruby
ta_s = { "Chandhu" => 100, "Margo" => 92, "Benny" => 25 }
total = 0
worst_ta = ""
worst_score = 100

ta_s.each do |name, score|
  puts "#{name} scored #{score}"
  total += score

  if score < worst_score  # If current score is lower, update worst_ta
    worst_score = score
    worst_ta = name
  end
end

puts "Total score: #{total}"
puts "#{worst_ta} is the worst TA with a score of #{worst_score}"
```