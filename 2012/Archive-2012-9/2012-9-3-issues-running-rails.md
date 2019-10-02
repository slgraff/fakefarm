## Issue(Solved): Can't seem to find rails on my system!
Got this message when trying to run my server;

_Rails is not currently installed on this system. To get the latest version, simply type:_

### Steps

1. [Rails keeps telling me that it's not currently installed](http://stackoverflow.com/questions/7788946/rails-keeps-telling-me-that-its-not-currently-installed) - That answer was about switching between ruby versions. 


2. $ sudo gem install rails

  Successfully installed rails-3.2.8

  1 gem installed


3. [Installed Rails but the rails command says it's not installed](http://stackoverflow.com/questions/1954015/installed-rails-but-the-rails-command-says-its-no-installed)

  Discovered **gem environment** will list out ... the gem environment. 

  RubyGems Environment:
    - RUBYGEMS VERSION: 1.8.24
    - RUBY VERSION: 1.9.3 (2012-04-20 patchlevel 194) [x86_64-darwin11.4.0]
    - INSTALLATION DIRECTORY: /Users/dubipod/.rvm/gems/ruby-1.9.3-p194@CodeJournal
    - RUBY EXECUTABLE: /Users/dubipod/.rvm/rubies/ruby-1.9.3-p194/bin/ruby
    - EXECUTABLE DIRECTORY: /Users/dubipod/.rvm/gems/ruby-1.9.3-p194@CodeJournal/bin
    - RUBYGEMS PLATFORMS:
      - ruby
      - x86_64-darwin-11
    - GEM PATHS:
       - /Users/dubipod/.rvm/gems/ruby-1.9.3-p194@CodeJournal
       - /Users/dubipod/.rvm/gems/ruby-1.9.3-p194@global
    - GEM CONFIGURATION:
       - :update_sources => true
       - :verbose => true
       - :benchmark => false
       - :backtrace => false
       - :bulk_threshold => 1000
       - "gem" => "--no-ri --no-rdoc"
    - REMOTE SOURCES:
       - http://rubygems.org/

4. Link led me to [Adding a Directory to the Path](http://www.troubleshooters.com/linux/prepostpath.htm)

  Linux determines the executable search path with the $PATH environment variable. To add directory /data/myscripts to the beginning of the $PATH environment variable, use the following:        
    ``PATH=/data/myscripts:$PATH``

    To add that directory to the end of the path, use the following command:
    ``PATH=$PATH:/data/myscripts``


    Ok, so how does that help me? My .bash_profile looks like the following: 
    ``export PATH="/usr/local/bin:/usr/local/sbin:/usr/local/mysql/bin:$PATH"``

5. Gemsets
 
Figured it was related to gemsets, so I went back to RVM. Read up on [Gemsets](https://rvm.io/gemsets/basics/) and this time, I did rails install without 'sudo'. 
I did try to run server but it didn't work until I hit bundle one more time. (Some issue with coffee script, which was resolved with bundle.)

## Questions
- What directory paths should I be familiar with, and which should I be changing?
- Anything in particular I should notice in my gem environment?
- What should I do with `echo $PATH`? 


**dmwoodall:NWNM dubipod$ echo $PATH**

    /Users/dubipod/.rvm/gems/ruby-1.9.3-p194@CodeJournal/bin:/Users/dubipod/.rvm/gems/ruby-1.9.3-p194@global/bin:/Users/dubipod/.rvm/rubies/ruby-1.9.3-p194/bin:/Users/dubipod/.rvm/bin:/usr/local/bin:/usr/local/sbin:/usr/local/mysql/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin

## Issue (solved): Git Branches
Created a separate branch and named it the same as my directory. (codeJournalApp). 
Gave me issues because my auto tab complete was going to my directory and not my branch. 


## Summary
- Starting to comprehend the need for bash scripting, changing directories, and having a better grasp on rvm & gem management
- Learned some more markdown syntax in the process (4 spaces / tab becomes code block)

## Journal
Progress is defined differently than originally expected. It is not as linear and while I have to keep you eye on the ball, advancing the cause is accomplished through many twists and turns. As demonstrated above, I am learning about my environment, gems, paths, etc. These are not topics I want to wake early about but they are all apart of becoming an effective developer. I need to know about my environment and how to keep it working.

