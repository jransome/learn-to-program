=begin
Extend the built-in classes. How about making your shuffle method on page
75 an array method? Or how about making factorial an integer method?
4.to_roman, anyone? In each case, remember to use self to access the object
the method is being called on (the 4 in 4.to_roman).
=end

class Array
    def shuffle
        recursive_shuffle self, []
    end

    def recursive_shuffle unshuffled, shuffled
        return shuffled if unshuffled.length <= 0
        shuffled.push(unshuffled.delete_at(rand(unshuffled.length)))
        recursive_shuffle unshuffled, shuffled
    end 
end

=begin
#testing

array_s = [1,2,3,4,5,6,7,8,9]
puts array_s.shuffle

=end

class Integer
    def factorial
        if self < 0
            puts "Cannot use negative integer!" 
            exit
        end
        (self <= 1) ? 1 : self * (self-1).factorial
    end

    def to_roman
        
        thou = self / 1000
        hund = (self % 1000) / 100
        tens = (self % 100) / 10
        ones = (self % 10) 
        
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

end

class Die

    def initialize
        # I'll just roll the die, though we could do something else
        # if we wanted to, such as setting the die to have 6 showing.
        roll
    end
    
    def roll
        @number_showing = 1 + rand(6)
    end
    
    def showing
        @number_showing
    end
    
    def cheat result
       @number_showing = result 
    end
end

