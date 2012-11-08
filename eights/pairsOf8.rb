
# Print out the pairs of items in an array that equal 8

def combinations_of_eight(list_of_numbers)

  matches = []

  list_of_numbers.each do |first_number|
    list_of_numbers.each do |second_number|
      if list_of_numbers[first_number] != list_of_numbers[second_number]
        if first_number + second_number == 8
          match = []
          match.push(first_number, second_number)
          matches << match.sort
        end
      end
    end
  end

  matches = matches.uniq
end



