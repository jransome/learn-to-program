=begin
Birthday helper! Write a program to read in names and birth dates from
a text file. It should then ask you for a name. You type one in, and it tells
you when that person’s next birthday will be (and, for the truly adventur-
ous, how old they will be). The input file should look something like this:

Christopher Alexander, Oct 4, 1936
Christopher Lambert, Mar 29, 1957
Christopher Lee, May 27, 1922
Christopher Lloyd, Oct 22, 1938
Christopher Pine, Aug 3, 1976
Christopher Plummer, Dec 13, 1927
Christopher Walken, Mar 31, 1943
The King of Spain, Jan 5, 1938

(That would be me Christopher Pine, not the young James T. Kirk; I don’t
care when he was born.) You’ll probably want to break each line up and
put it in a hash, using the name as your key and the date as your value.

In other words: words:

birth_dates['The King of Spain'] = 'Jan 5, 1938'

(You can store the date in some other format if you prefer.)
=end

birthdays = Hash.new

File.read("birthdays.txt").each_line do |line|
    parsed = line.split(',')
    birthdays[parsed[0]] = parsed[1]+parsed[2]
    # note: split also removes the split character
end

puts "Name:"
name = gets.chomp
birthday = birthdays[name].to_s.split # => eg. ['May', '27', '1922']

if !birthday[0]
    puts "No name found!"
    exit
end

bday_time = Time.local(birthday[2], birthday[0], birthday[1])
age = Time.new.year - bday_time.year

if Time.new.month < bday_time.month
    age -= 1
end

puts "#{name} will be #{age+1} on #{bday_time.month} #{bday_time.day}"



