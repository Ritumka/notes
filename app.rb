a = []

a = Array.new

a = "array".split("")

a = [1, 2, 3]


# words = ["apple", "banana", "orange"]
# number_of_words = words.count

# number_of_words.times do |the_index|
#     pp words.at(the_index).capitalize
#     pp words.at(the_index).reverse
#     pp words.at(the_index).upcase
# end


words = ["apple", "banana", "orange"]

words.each do |anything|
    pp anything.capitalize
    pp anything.reverse
    pp anything.upcase
end