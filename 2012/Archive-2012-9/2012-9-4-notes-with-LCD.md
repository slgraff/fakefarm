# Meeting with Michael LaCroix screen sharing his Workflow

## Workflow

1. setup directory
2. grab asset files from basecamp
3. grab template and follow files
  *installing files will also produce repo and first commit*
4. Bitbucket and add new repo
5. save as sublime project
6. setup basic styles - hide files in sublime
7. setup color variables (uses throughout application)
$off-white: #12002;
8. typekit fonts setup
*add fonts, project name, domains used*
select weights used
grab code and add to application.html.haml
use variables too! 
@type-sans: "font family..."
9. create heroku
10. powder link raylynn > powder open (boots up rails server)
11. rspec testing
12. list out models and attributes per model needed - to get an idea of what's needed.
  * artist(model)
    * name 
    * bio {body}
    * has_many :photos
    * has_many :songs
    * link_email
    * link_twitter
    * link_website
13. rails g model...
14. add_index to model
15. write tests

        describe Post do
            subject { Post.new(title: 'Post Title', body: "lorem impsum", date:Time.now )}
            it { should be_valid}
        end
16. run tests
        rspec spec/models/        
17. rake:db:migrate
18. rake db:test:prepare
19. front end
20. work with photoshop / css file


**Directory Structure**
projects > web > client > project > (app / assets / design Files)

