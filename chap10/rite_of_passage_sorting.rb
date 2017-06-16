
#rite of passage sorting

def sort_words words
    recursive_sort_words words, []
end

def recursive_sort_words unsorted_words, sorted_words
    
    return sorted_words if unsorted_words.length <= 0
    
    smallest = unsorted_words.pop
    still_unsorted = []
    
    unsorted_words.each do |word|
        if smallest < word
            still_unsorted.push(word) 
        else
            still_unsorted.push(smallest) 
            smallest = word
        end
    end
    
    # now we found actual smallest
    sorted_words.push(smallest)
    
    recursive_sort_words still_unsorted, sorted_words
end

puts "Please input words to be sorted, pressing enter after each word. Press enter on empty line when done."

words_to_sort = []
input = " "
while true
    input = gets.chomp
    if input != ""
        words_to_sort << input
    else
        break
    end
end

puts (sort_words(words_to_sort))
#puts(sort_words(['can','j','a', 'a', 'as', 'cann', 'h', 'can']))