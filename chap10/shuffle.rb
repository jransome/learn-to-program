=begin
Shuffle. Now that you’ve finished your new sorting algorithm, how about
the opposite? Write a shuffle method that takes an array and returns a to-
tally shuffled version.
=end


def shuffle array
    recursive_shuffle array, []
end

def recursive_shuffle unshuffled, shuffled
    return shuffled if unshuffled.length <= 0
    shuffled.push(unshuffled.delete_at(rand(unshuffled.length)))
    recursive_shuffle unshuffled, shuffled
end

# testing

10.times do
    puts ((shuffle (['a', 'b', 'c', 'd', 'e', 'f'])).join(", "))
end

