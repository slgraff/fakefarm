Associate Items to users
1. Follow along OmniAuth to create sessions and user controllers.
2. Create a current_user helper method
3. Open question.rb
- add attr_accessible (:user_id)
- belongs_to :user
4. Open User file
- add has_many :questions
4. Run a migration
	rails g migration AddUserIDToModel user_id:integer 
	rake db:migrate
5. Open ControllerFile
- Assuming it's basic CRUD, change the Create to now run through the current_user
- @question = current_user.questions.build(params[:question])
	1           2            3          4   5       6
 1. @question is the instance variable to call inside the view
 2. current_user is the helper method built in Application controller
 3. questions is the method created through the has_many associations
 4. build is a helper method that creates and saves
 5. params is the most magical method in Rails
 6. found through inspecting the form in the browser.

6. Change the index view from Question.all to pass through the current_user … @question = current_user.questions


## Question
- What would it take to change the column name (From goals, to name_of_goal) 
- What else would i have to change?
- What is a good naming convention?