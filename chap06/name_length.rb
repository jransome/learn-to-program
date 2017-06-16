#Write a program that asks for your first, middle, and last names individually and then adds those lengths together
puts "What is your first name?"
first_name = gets.chomp
puts "What is your middle name?"
mid_name = gets.chomp
puts "What is your last name?"
last_name = gets.chomp
puts "There are " + (first_name.length + mid_name.length + last_name.length).to_s + " characters in your name!"
