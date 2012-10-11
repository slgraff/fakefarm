range = (0...20)

for variable in range
  if variable % 4 == 0
    puts("this is from first if #{variable}")
  end

  if variable % 16 == 0
    puts "This is from the 2nd if #{variable}"
  end


  if variable % 1 == 0
    puts "This is third #{variable}"
  end
end