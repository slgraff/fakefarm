
# Print out the pairs of items in an array that equal 8

def combinations_of_eight(list_of_numbers)

  matches = []
  turns = 0
  list_of_numbers.each do |first_number|
    turns += 1
    list_of_numbers.each do |second_number|
      turns += 1
      if list_of_numbers[first_number] != list_of_numbers[second_number]
        if first_number + second_number == 8
          match = []
          match.push(first_number, second_number)
          matches << match.sort
        end
      end
    end
  end

  matches << [4,4] if list_of_numbers.count(4) == 2
  puts "total turns: #{turns}"
  matches = matches.uniq
end

list = [1,1,2,3,4,5,6,7,8,19,0,1,11,2,3,4,5,36,7,8,9,0,21,1,2,3,4,15,6,7,8,9,0]

puts combinations_of_eight(list)