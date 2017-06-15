#Leap years
puts "This program will list all leap years between two given years."

puts "Starting year:"
start_year = gets.chomp.to_i

puts "Ending year:"
end_year = gets.chomp.to_i

puts "Leap years:"
(start_year..end_year).each do |year|
    if year % 4 == 0 && year % 100 != 0
        puts year
    else
        puts year if year % 400 == 0
    end
end
