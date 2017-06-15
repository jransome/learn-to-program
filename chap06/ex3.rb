#Table of contents
line_width = 60
toc_title = "Table of Contents"
chapter1 = "Chapter 1: Getting Started"
chapter1_page = "page  1"
chapter2 = "Chapter 2: Numbers"
chapter2_page = "page  9"
chapter3 = "Chapter 3: Letters"
chapter3_page = "page 13"

puts toc_title.center(line_width)
puts(chapter1.ljust(line_width/2) + chapter1_page.rjust(line_width/2))
puts(chapter2.ljust(line_width/2) + chapter2_page.rjust(line_width/2))
puts(chapter3.ljust(line_width/2) + chapter3_page.rjust(line_width/2))
