# Deaf grandma

puts "WHAT? WHAT IS IT SONNY?"
input = prev_input = ""
goodbye_count = 0
while goodbye_count < 2
    input = gets.chomp
        if input == input.upcase
            puts "NO, NOT SINCE " + (1930 + rand(21)).to_s
            input == "BYE" && prev_input == "BYE" ? goodbye_count += 1 : goodbye_count = 0
        else
            puts "HUH?! SPEAK UP, SONNY!"
        end
    prev_input = input
end

puts "OH OKAY BYE THEN D':"
