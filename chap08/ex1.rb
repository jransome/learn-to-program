#Building and sorting an array

#Write the program we talked about at the beginning of this chapter, one that asks us to type as many words as we want (one word per line, continuing until we just press Enter on an empty line) and then repeats the words back to us in alphabetical order.

input = " " 
words = []
puts "Type some words, after each word hit enter. When you're finished, hit enter on an empty line."

until input == ""
	input = gets.chomp
	if input != ""
		words.push input
	end
end

puts "Here are your words, sorted alphabetically:"
puts words.sort