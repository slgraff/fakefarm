    def length(string)
      count = 0
      number = 0
      array = string.split('')
      array.each_index do |letter|
        count << letter[number]
        number += 1
        count += 1
      end
      return "\"#{string}\" is #{count} letters long."
    end

    ---------

    puts length('hello')
    puts length("goodbye")


def recur(a,b)
  if b == 1
  a
  else
  a + recur(a, b-1)
  end
end

recur(3,2)