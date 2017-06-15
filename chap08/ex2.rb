#Table of contents, revisited

=begin
Rewrite your table of contents program on page 32. Start the program with an array holding all of the information
for your table of contents (chapter names, page numbers, and so on). Then print out the information from the array in a beautifully formatted
table of contents.
=end

line_width = 60
title = "Table of Contents"
chapters = [["Getting Started", 1], ["Numbers", 9], ["Letters", 13]]

puts title.center(line_width)

chapter_num = 1
chapters.each do |chapter|
		left = "Chapter #{chapter_num}: " + chapter[0]
		right = "page " + chapter[1].to_s
		puts(left.ljust(line_width/2) + right.rjust(line_width/2))
end
