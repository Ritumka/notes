# Given hash of TAs names and scores, use .each to:
# Print each name and score
# Print total score
# Find and print the worst Ta (lowest score)


ta_s = {"Chandhu" => 99, "Margo" => 99.1, "Benny" => -999.2, "Aldo" => 2, "Mary" => -100}
total = 0
worst_ta = nil

# Iterate through keys and values and
ta_s.each do |name, score|
    # print keys and values
    puts "#{name} scored #{score}"

    # print total
    total += score

    # print TA with lowest value
    # use worst_ta 
    # worst_ta = ta_s.values.min
    if worst_ta == nil
        worst_ta = name
    elsif score < ta_s.fetch(worst_ta)
        worst_ta = name
    end

end

puts total 
puts "The worst TA is: #{worst_ta}"
pp ta_s.key(ta_s.values.min)