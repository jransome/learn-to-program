=begin
Happy birthday! Ask what year a person was born in, then the month,
and then the day. Figure out how old they are, and give them a big SPANK!
for each birthday they have had.
=end

puts "What year were you born in?"
year = gets.chomp.to_i

puts "What month were you born in? (1-12)"
month = gets.chomp.to_i

puts "What day of that month were you born in?"
day = gets.chomp.to_i

age_years = 1

while Time.local(year + age_years, month, day) < Time.new
    puts "SPANK! #{age_years}"
    age_years += 1
end
