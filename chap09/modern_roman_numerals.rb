=begin

“Modern” Roman numerals. Eventually, someone thought it would be ter-
ribly clever if putting a smaller number before a larger one meant you
had to subtract the smaller one. As a result of this development, you must
now suffer. Rewrite your previous method to return the new-style Roman
numerals so when someone calls roman_numeral 4, it should return 'IV'.

I = 1 V = 5 X = 10 L = 50 C = 100 D = 500 M = 1000

=end

puts "This program will take any positive number and convert it into the Roman numeral system"
puts "Please enter a number: "
number = gets.chomp.to_i

def modern_roman_numeral (number)
    
    thou = number / 1000
    hund = (number % 1000) / 100
    tens = (number % 100) / 10
    ones = (number % 10) 
    
    numeral = ""
    
    # thousands
    numeral += "M" * thou
    
    # hundreds
    if hund.floor == 9
        numeral += "CM"
    elsif hund.floor >= 5
        numeral += "D"
        numeral += "C" * (hund - 5)
    else
        numeral += "C" * hund
    end
        
    # tens
    if tens.floor == 9
        if hund == 5
            numeral += "XD"
        else
            numeral += "XC"
        end
    elsif tens.floor >= 5
        numeral += "L"
        numeral += "X" * (tens - 5)
    elsif tens.floor == 4
        numeral += "XL"
    else
        numeral += "X" * tens
    end
    
    # ones
    if ones.floor == 9
        numeral += "IX"
    elsif ones.floor >= 5
        numeral += "V"
        numeral += "I" * (ones - 5)
    elsif ones.floor == 4
        numeral += "IV"
    else
        numeral += "I" * ones
    end
    
    return numeral
    
end

puts modern_roman_numeral (number)
