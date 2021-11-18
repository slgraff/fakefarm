require 'open-uri'

# search: "gets': No such file or directory @ rb_sysopen"
# solved: true
# solution: ""
# date: "2021-08-13"

search = ARGV[0]

puts "does this look familiar?"
puts "1 example"
puts "2 example"
puts "type a number or 'no'"

answer = STDIN.gets.chomp

puts "> "
puts answer

require 'pry'; binding.pry
if answer == 'no'
  open("https://www.google.com/search?q=#{search}")
end

puts "what was the solution?"
answer = STDIN.gets.chomp
puts answer

puts "tags?"
answer = STDIN.gets.chomp
puts answer

puts "logged!"