=begin
Safer picture downloading. Adapt the picture-downloading/file-renaming
program to your computer by adding some safety features to make sure
you never overwrite a file. A few methods you might find useful are
File.exist? (pass it a filename, and it will return true or false) and exit (like if
return and Napoleon had a baby—it kills your program right where it stands;
this is good for spitting out an error message and then quitting).
=end

Dir.chdir 'C:/Documents and Settings/User/Pictures'

# First we find all of the pictures to be moved.
pic_names = Dir['F:/**/*.jpg']

puts 'What would you like to call this batch?'
batch_name = gets.chomp

puts
print "Downloading #{pic_names.length} files: "

# This will be our counter. We'll start at 1 today,
# though normally I like to count from 0.

pic_number = 1

pic_names.each do |name|
    print '.' # This is our "progress bar".
    
    new_name = if pic_number < 10
        "#{batch_name}0#{pic_number}.jpg"
    else
        "#{batch_name}#{pic_number}.jpg"
    end
    
    #Rename files so they don't overwrite existing ones
    while File.exist new_name
        new_name.chomp(".jpg")
        new_name += "a.jpg"
    end
    
    # new_name is now unique
    File.rename name, new_name

    # Finally, we increment the counter.
    pic_number = pic_number + 1
end

puts # This is so we aren't on progress bar line.
puts 'Done!'