IO.puts 'hi'
prefs = [ {"Betty", :dog}, {"Bob", :dog}, {"Becky", :cat} ]

puts = for {name, pet_choice} <- prefs, pet_choice == :dog, do: name
IO.inspect puts

puts = for {name, pet_choice} <- prefs, pet_choice == :cat, do: name
IO.inspect puts

dog_lover? = fn(choice) -> choice == :dog end
cat_lover? = fn(choice) -> choice == :cat end

puts = for {name, pet_choice} <- prefs,
  dog_lover?.(pet_choice) do
    name
  end

IO.inspect puts

puts = for {name, pet_choice} <- prefs, cat_lover?.(pet_choice), do: name

IO.inspect puts

array = [
  1,2,3,4,"1", "boom", "cool", %{no: "find"}
]

IO.inspect(array)

is_my_map = fn(i) -> is_map(i) end
is_integer = fn(i) -> is_integer(i) end

filter = for thing <- array, is_integer.(thing), do: thing

IO.inspect(filter)