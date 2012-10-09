# Structs


#### Part one
<hr>
Set a variable as if it were the class name.

    Snack = Struct.new(:name, :carbs)


<code>Snack</code> would be considered our <code>Class</code>. A struct is a magical object that will create this <code>Class</code>. You only need call <code>Struct.new</code> once.

Then, the arguments sitting in the struck are the Class attributes. At this point, it's as if we explicitly wrote a class called Snack with accessor methods called name and carbs.

#### Part two
<hr>

You can now call the variable <code>Snack</code> as if it were a <code>Class</code>.

    tasty_snack = Snack.new(:nachos, 40)

Notice the word <code>Struct</code> is no longer being used.
Once we have the nachos snack object, we call the accessor methods as follows:

    >> tasty_snack.name
    => :nachos
    >> tasty_snack.carbs
    => 40