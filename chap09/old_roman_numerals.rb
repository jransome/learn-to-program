=begin

Old-school Roman numerals. In the early days of Roman numerals, the
Romans didn’t bother with any of this new-fangled subtraction “IX”
nonsense. No sir, it was straight addition, biggest to littlest—so 9 was
written “VIIII,” and so on. Write a method that when passed an integer
between 1 and 3000 (or so) returns a string containing the proper old-
school Roman numeral. In other words, old_roman_numeral 4 should return
'IIII'. Make sure to test your method on a bunch of different numbers.

I = 1 V = 5 X = 10 L = 50 C = 100 D = 500 M = 1000

=end

puts "This program will take any positive number and convert it into the old"
puts "style Roman numeral system"
puts "Please enter a number: "
number = gets.chomp.to_i


def old_roman_numeral (number)
    
    numeral = ""
    
    numeral += "M" * (number / 1000)
    numeral += "D" * ((number % 1000) / 500)
    numeral += "C" * ((number % 500) / 100)
    numeral += "L" * ((number % 100) / 50)
    numeral += "X" * ((number % 50) / 10)
    numeral += "V" * ((number % 10) / 5)
    numeral += "I" * (number % 5)
    
    return numeral
    
end

puts old_roman_numeral (number)
