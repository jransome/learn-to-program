=begin

Interactive baby dragon. Write a program that lets you enter commands
such as feed and walk and calls those methods on your dragon. Of course,
since you are inputting just strings, you will need some sort of method
dispatch, where your program checks which string was entered and then
calls the appropriate method.

=end

puts "Aww, a baby dragon is born! What shall we name it?"
name = gets.chomp
dragon = Dragon.new name
generic_obj = Object.new

while true
    puts "What do you want to do with #{name}?"
    puts "Type either: feed, walk, put_to_bed, toss, rock, exit"
    command = gets.chomp
    
    if command.downcase = "exit"
        exit
    elsif dragon.respond_to?(command) && !generic_obj.respond_to(command)
    # Only accept commands that dragons have, and not ones regular objects have
        dragon.send command
    else
        puts "Didn't catch that!"
    end
end
    




