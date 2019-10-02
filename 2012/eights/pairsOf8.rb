
# Print out the pairs of items in an array that equal 8

def combinations_of_eight(list_of_numbers)

  sorted_list = list_of_numbers.sort
  matches = []

  if sorted_list.count(4) >= 2
    matches << [4,4]
  end

  sorted_list = sorted_list.uniq

  turns = 0
  sorted_list.each do |first_number|
    turns += 1
    sorted_list.each do |second_number|
      turns += 1
      if sorted_list[first_number] != sorted_list[second_number]
        if first_number + second_number == 8
          match = []
          match.push(first_number, second_number)
          matches << match.sort
        end
      end
    end
  end

  puts "Total Turns: #{turns}"
  matches.uniq
end

list = [1,1,2,3,4,5,6,7,8,19,0,1,11,2,3,4,5,36,7,8,9,0,21,1,2,3,4,15,6,7,8,9,0]

print combinations_of_eight(list)
