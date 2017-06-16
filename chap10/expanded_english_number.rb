=begin
Expanded english_number. First, put in thousands; it should return 'one
thousand' instead of (the sad) 'ten hundred' and 'ten thousand' instead of 'one
hundred hundred'.

Now expand upon english_number some more. For example, put in millions
so you get 'one million' instead of 'one thousand thousand'. Then try adding bil-
lions, trillions, and so on.
=end


def english_number number
    if number < 0 # No negative numbers.
        return 'Please enter a number that isn\'t negative.'
    end

    if number == 0
        return 'zero'
    end

    # No more special cases! No more returns!

    num_string = '' # This is the string we will return.

    ones_place =    ['one', 'two', 'three',
                    'four', 'five', 'six',
                    'seven', 'eight', 'nine']

    tens_place =    ['ten', 'twenty', 'thirty',
                    'forty', 'fifty', 'sixty',
                    'seventy', 'eighty', 'ninety']

    teenagers =     ['eleven', 'twelve', 'thirteen',
                    'fourteen', 'fifteen', 'sixteen',
                    'seventeen', 'eighteen', 'nineteen']

    # "left" is how much of the number
    # we still have left to write out.
    # "write" is the part we are
    # writing out right now.
    # write and left...get it? :)

    left = number
        write = left/1000000000000 #How many trillions?
    left = left - write*1000000000000 # Subtract off the trillions.
    
    if write > 0 
        #If there are trillions to write
        trillions = english_number write
        num_string += trillions + ' trillion'
        if left > 0
            # So we don't write 'one trilliontwo hundred...'
            num_string = num_string + ' '
        end
    end
    
        write = left/1000000000 #How many billions?
    left = left - write*1000000000 # Subtract off the billions.
    
    if write > 0 
        #If there are billions to write
        billions = english_number write
        num_string += billions + ' billion'
        if left > 0
            # So we don't write 'one billiontwo hundred...'
            num_string = num_string + ' '
        end
    end
    
    write = left/1000000 #How many millions?
    left = left - write*1000000 # Subtract off the millions.
    
    if write > 0 
        #If there are millions to write
        millions = english_number write
        num_string += millions + ' million'
        if left > 0
            # So we don't write 'one milliontwo hundred...'
            num_string = num_string + ' '
        end
    end
    
    write = left/1000 #How many thousands?
    left = left - write*1000 # Subtract off the thousands.
    
    if write > 0 
        #If there are thousands to write
        thousands = english_number write
        num_string += thousands + ' thousand'
        if left > 0
            # So we don't write 'two thousandfifty-one'...
            num_string = num_string + ' '
        end
    end
    
    write = left/100 # How many hundreds left?
    left = left - write*100 # Subtract off those hundreds.

    if write > 0
        # Now here's the recursion:
        hundreds = english_number write
        num_string = num_string + hundreds + ' hundred'
        if left > 0
            # So we don't write 'two hundredfifty-one'...
            num_string = num_string + ' '
        end
    end

    write = left/10 # How many tens left?
    left = left - write*10 # Subtract off those tens.
    
    if write > 0
        if ((write == 1) and (left > 0))
            # Since we can't write "tenty-two" instead of
            # "twelve", we have to make a special exception
            # for these.
            num_string = num_string + teenagers[left-1]
            # The "-1" is because teenagers[3] is
            # 'fourteen', not 'thirteen'.
            # Since we took care of the digit in the
            # ones place already, we have nothing left to write.
            left = 0
        else
            num_string = num_string + tens_place[write-1]
            # The "-1" is because tens_place[3] is
            # 'forty', not 'thirty'.
        end
        
        if left > 0
            # So we don't write 'sixtyfour'...
            num_string = num_string + '-'
        end
    end

    write = left # How many ones left to write out?
    left = 0 # Subtract off those ones.
    
    if write > 0
        num_string = num_string + ones_place[write-1]
        # The "-1" is because ones_place[3] is
        # 'four', not 'three'.
    end

    # Now we just return "num_string"...
    num_string
end

puts english_number( 0)
puts english_number( 9)
puts english_number( 10)
puts english_number( 11)
puts english_number( 17)
puts english_number( 32)
puts english_number( 88)
puts english_number( 99)
puts english_number(100)
puts english_number(101)
puts english_number(234)
puts english_number(3211)
puts english_number(14787)
puts english_number(72451)
puts english_number(345899)
puts english_number(999999)
puts
puts "Millions test"
puts english_number(1000000)
puts english_number(53674000)
puts english_number(999000000)

puts
puts "Billions test"
puts english_number(1000000000)
puts english_number(2359902855)
puts english_number(9457298574)

puts
puts "Tillions test"
puts english_number(1000000000000)
puts english_number(9945060453540)
puts english_number(4504530435322)