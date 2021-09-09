# 9/1 Working some exercises in Ruby Learning


# Write a Ruby program to do the following. Take two text files say A and B. The program should swap the contents of A and B. That is after the program is executed, A should contain B's contents and B should contains A's contents.


filename_a = './file1.txt'
filename_b = './file2.txt'
File.rename(filename_a,filename_a+'.tmp')
File.rename(filename_b,filename_a)
File.rename(filename_a+'.tmp',filename_b)

# Set a variable to hold the file path. 
# These names would be relvant when dealing with the files
# Use the File class to manupulate the file.
# User the rename method - prewritten
# The two arguments allow for the acepting the file that's current, and what you want to rename
# Adding a '.tmp' makes sure it's still a file, for the file class, but will be renamed to file b.