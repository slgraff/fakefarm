# Overview
Raw notes taken during skype/ghangout/calls, etc. 
I'm going to break these down and out as time goes on...

# 9/5 Meeting with Michael Lacroix

##HTML
Haml

##CSS
SCSS
Bourbon
@mixins are like methods
- makes the code cleaner

bourbon is a bunch of pre-made mixins
exmple: @include transition (all 0.3s);

@mixin defines the mixin
@includ calls the mixin
@extend - brings in class into another attributes

  @extend.clearfix (anything in the clearfix class - will clear out the content. '.clearfix' comes from bootstrap)

.scss files - you can write normal sass but it's more compatable. has a more traditional look as css.

.sass has it's own syntax which will look different 

##JS
Pjax
JQ

## Browser Testing
Browser stack

## Server
Unicorn
PG
Thin



look into iterm

gem: friendly ID 



bootstrap has a slideshow

.row-fluid
  .span6
    =render 'shared/slideshow' (Renders partial from slideshow)
    
  .span6
    %p
      `Lorem...
      




## Websites
hojoki.com
fortawesome.com
https://github.com/buymeasoda/soda-theme
http://darcyclarke.me/design/skin-your-chrome-inspector/
http://html5please.com/
http://caniuse.com/
http://pow.cx/
https://github.com/rodreegez/powder
https://github.com/flyerhzm/bullet
https://showoff.io/
http://hattieb.lacroixdesign.showoff.io/
do.com


## Services
Rack
Bourbon
gem sorcery
amazon s3
backblaze (remote backup)
rbenv vs. rvm
google: switch from rvm to rbenv
fontcase
free ruler - photoshop plugin
postgres hstore
bundler is like a gemset
gemlock file locks me into a gem
capybara
capistrano
heroku
background processing
delay job
reddis server

unicorn
nginx
puma

foreman /ceder stack

rackspace
- run capistrano tasks
- deployment tasks

bourbon
browswer stack
foundation
html5boilerplate
thin
eager loading
flay
html5shiv
showoff.io
pow/powder
bullet gem
railtie
pjax
"push state"
moment.js
underscore
coffeescript
notation
brew
rvm
gemsets
ruby doctest




## Skills
gitbranches
Sym links

Bash Shell Scripting

Nested Loops

Here Doc <<- Adding the "-" allows the end "<<" to go anywhere.
menicingcloud.com - tests the dpi of the screen and makes css for high retina displays
postgres.app

responsive grid in bootstrap
clear fix

.history
.bash_history
run git commit without a -m
decoupled code
fundamentals of progmming

'ctrl' + 'cmd' plus aarows moves highlighted text

## haml 
  white space matters
  % element type example %body
  = is ruby output
  - dash is hidden ruby
  .class
  #.id
  example
  .container-fluid.wrap same as;
  <div class='containter-fluid wrap'></div>

## sass
  @mixin retina{
  }

## Responsive Web
  16px = 1em

  ## vim
  i = edit mode
  gg
  3j
  2l
  1h
  2k
  shifta
  escape
  dd
  3dd
  shiftP
  :w
  :q
  :set number
  d^
  ^
  b
  w
  vimtutor
  $
  dw
  d$
  dgg
  dshiftg
  2dw
  shiftg
  :%s/arg1/sub1/g

## Unfiltered Notes

