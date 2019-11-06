module ListMaker
  class ListFile
    
    @@filename = 'lm_list.txt'
    
    def initialize
      # locate list file in APP_ROOT
      #   confirm that it is readable and writable
      # or create a new file in APP_ROOT
      #   Use File.new/open in write mode
      # if success, return self, otherwise exit program
    end
    
    def view
      puts "\nView List\n\n".upcase
      # Read from list file
      # Use File.new/open in read mode
      # add numbers next to list items
    end
    
    def add(args=[])
      puts "\nAdd a List Item\n\n".upcase
      # Add item to the end of the list.
      # Use File.new/open in append mode
    end
    
    def edit(args=[])
      puts "\nEdit a List Item\n\n".upcase
      # get the item position from the args ("edit 3", "edit 7")
      position = args.first.to_i
      # read list file and make sure that item exists
      #   Use File.readlines
      # return not found message if item does not exist
      # output text of current list item again
      # ask user to type new text
      # write list file with the new updated list
      #   Use File.write
    end
    
  end
end
