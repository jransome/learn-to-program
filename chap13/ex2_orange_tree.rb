=begin
Orange tree. Make an OrangeTree class that has a height method that returns
its height and a one_year_passes method that, when called, ages the tree one
year. Each year the tree grows taller (however much you think an orange
tree should grow in a year), and after some number of years (again, your
call) the tree should die. For the first few years, it should not produce
fruit, but after a while it should, and I guess that older trees produce
more each year than younger trees...whatever you think makes the most
sense. And, of course, you should be able to count_the_oranges (which returns
the number of oranges on the tree) and pick_an_orange (which reduces the
@orange_count by 1 and returns a string telling you how delicious the orange
was, or else it just tells you that there are no more oranges to pick this
year). Make sure any oranges you don’t pick one year fall off before the
next year.
=end

class OrangeTree
    
    def initialize
        @age = 0
        @height = 0
        @fruit_produced = 0
    end
    
    def height
       puts "Height: #{@height}"
    end
    
    def count_the_oranges
       puts "Oranges: #{@fruit_produced}"
    end
    
    def pick_an_orange
        if @fruit_produced >= 1
            @fruit_produced -= 1
            puts "Mmm that was a delicious orange..."
        else
            puts "No more oranges left this year!"
        end
    end
    
    def one_year_passes
       puts "A year has passed!"
       @fruit_produced = 0
       @age += 1 
       @height += 0.5
       
       if @age > 4
           produce_fruit
       elsif @age > 4000
           die
       end
    end
    
    private
    
    def produce_fruit
        @fruit_produced += @age
    end
    
    def die
        puts "tree has died :'("
        exit
    end
end

tree = OrangeTree.new
10.times do
    tree.height
    tree.count_the_oranges
    tree.pick_an_orange
    puts 
    tree.one_year_passes    
end

