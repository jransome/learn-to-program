#99 bottles of beer on the wall

bottles = 99
while bottles != 1
	puts "#{bottles} bottles of beer on the wall, #{bottles} bottles of beer."
	bottles -= 1
	if bottles == 1
		puts "Take one down and pass it around, #{bottles} bottle of beer on the wall."
	else
		puts "Take one down and pass it around, #{bottles} bottles of beer on the wall."
	end
end

puts "#{bottles} bottle of beer on the wall, #{bottles} bottle of beer."
puts "Take one down and pass it around, no more bottles of beer on the wall"
puts "No more bottles of beer on the wall, no more bottles of beer."
puts "Go to the store and buy some more, 99 bottles of beer on the wall."
