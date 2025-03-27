# a = []

# a = Array.new

# a = "array".split("")

# a = [1, 2, 3]


# words = ["apple", "banana", "orange"]
# number_of_words = words.count

# number_of_words.times do |the_index|
#     pp words.at(the_index).capitalize
#     pp words.at(the_index).reverse
#     pp words.at(the_index).upcase
# end



# words = ["apple", "banana", "orange"]

# words.each do |anything|
#     pp anything.capitalize
#     pp anything.reverse
#     pp anything.upcase
# end



# words = ["apple", "banana", "orange"].sample

# array = words.split("")

# array.each do |character|
#     pp "#{character.upcase}"
# end


# words = ["apple", "banana", "orange"]

# words.each do |word|
#     length = word.length

#     if length.even?
#         pp word
#     end  
# end

# word = ["apple", "banana", "orange"].sample

# array = word.split("")

# array.each do |character|
#     count = word.count(character)
#     pp "#{character} appears #{count} times"
# end


# numbers = [1, 2, 3]
# doubles = [2, 4, 6]

# doubles = []

# numbers.each do |number|
#     number = number * 2
#     doubles.push(number)
# end

# pp doubles


# numbers = [10, 20, 30]
# sum = 0

# numbers.each do |number|
#     sum += number
# end

# pp sum


# words = ["apple", "dog", "elephant", "cat", "sunset"]
# count = 0

# words.each do |word|
#   count += 1 if word.length > 5
# end

# puts count


# words = ["banana", "chandhu", "dpi", "ruby"]
# count = 0

# words.each do |word|
#     count += 1 if word.length > 5

# end

# puts count

# numbers = [2, 5, 8, 11, 14, 17]

# numbers.each do |num|
#     if num.odd?
#         num *= 3
#     end
#     puts num
# end

# words = ["elephant", "cat", "butterfly", "dog"]
# longest_word = ""

# words.each do |word|
#   longest_word = word if word.length > longest_word.length
# end

# puts longest_word

# person = {
#   :name => "Alice",
#   :age => 30,
#   :city => "Chicago"
# }

# puts person.key("Alice")
# puts person.key(30)

# person

# pp person.fetch(:name)
# pp person.fetch(:age)

# pp person[:name]
# pp person[:age]

# person = Hash.new
# pp person

# person.store(:first_name, "Alice")
# person.store(:last_name, "Smith")
# person.store(:city, "Chicago")

# person = Hash.new

# person[:first_name] = "Alice"
# person[:last_name] = "Smith"
# person[:city] = "Chicago"

# pp person


# array = ["summer", "fall", "winter", "spring"]
# hash = {}

# array.each do |word|
#   hash.store(word, word.length)
# end

# puts hash

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