=begin
Party like it’s roman_to_integer 'mcmxcix'! Come on, you knew it was coming,
didn’t you? It’s the other half of your roman_numeral 1999 method. Make sure
to reject strings that aren’t valid Roman numerals.
=end


def roman_to_int user_numeral

    roman_numerals = Hash.new
    roman_numerals["M"] = 1000
    roman_numerals["D"] = 500
    roman_numerals["C"] = 100
    roman_numerals["L"] = 50
    roman_numerals["X"] = 10
    roman_numerals["V"] = 5
    roman_numerals["I"] = 1

    value = 0
    user_numeral.upcase!
    
    #Make previous character the last one (as we will look at the numeral backwards initially
    previous_char = user_numeral[-1, 1]
    
    user_numeral.reverse.each_char do |char|
       
        # Catch non valid numerals
        if !roman_numerals[char]
            puts "Not a valid Roman numeral!"
            return
        end
        
        if roman_numerals[char] < roman_numerals[previous_char]
            value -= roman_numerals[char]
        else
            value += roman_numerals[char]
        end
        
        previous_char = char
    end
    
    puts value
   
end

puts "Please enter a Roman numeral"
u_numeral = gets.chomp

roman_to_int u_numeral