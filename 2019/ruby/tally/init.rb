tags = {
  1 => 'kata',
  2 => 'torah',
  3 => 'goals',
  4 => 'journal',
  5 => 'admin',
  6 => 'read',
  7 => 'quesiton'
}

action = {
  1 => 'start',
  2 => 'continue',
  3 => 'finish'
}


puts "what did you do?"
task = gets.chomp

puts "--- time  ---"
time = gets.chomp.to_i

puts "--- tag ---"
puts tags
tag = gets.chomp.to_i

puts "--- action ---"
puts action
action = gets.chomp.to_i

puts "good job"


record = [
  Time.now.strftime("%Y-%m-%d"),
  time,
  task,
  action,
  tags[tag]
]
puts record


File.open("tally.csv","a") { |f|
  f.write(record.join(','))
}
