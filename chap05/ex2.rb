#Bigger, better favourite number

#Write a program that asks for a person’s
#favorite number. Have your program add 1 to the number, and then
#suggest the result as a bigger and better favorite number. (Do be tactful
#about it, though.)

puts "What is your favourite number?"
fav_num = gets.chomp
puts "Well, " +  (fav_num.to_i + 1).to_s + " is in fact a better one!"
