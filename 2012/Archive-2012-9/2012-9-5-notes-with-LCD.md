# Pairing with Michael Lacroix



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


bootstrap has a slideshow

.row-fluid
  .span6
    =render 'shared/slideshow' (Renders partial from slideshow)
    
  .span6
    %p
      `Lorem...
      

***CSS Hierarchy***

.frame {
  1. Layout (display, float)
  2. sizing (width, height)
  3. padding 
  4. margin
  5. colors
  6. text
  7. border props
  padding: 5px
  @include box-shadow(0 0 4px rga(0,0,0,.25))  
}


## Code for paperwhite code review
@collections = {
spring2012: [
  title: "Spring 2012",
  slug: "spring-2012",
  items: {
    {img: 'image.png', link: 'image', class:'c1r1'}
  }
  
  ]
}


        <section class="collection">
           <% @collections[:fall2012][:items].each do |item| %>
          <%= link_to (image_tag item[:img], class: item[:class]), "item[:item]" %>
        </section>

.collage{
  
}

@mixin faux-box-shadow($border: border, $size: 1px, $color: #ccc){
  #{border}: #{size} soild #{$color}; (That makes: border: 1px solid #ccc;)
  border: 0 solid rgba(0,0,0,0); (resets only in browsers that recognize rgba Deletes only in bowsers that don't see it.)
  
}

@include faux-box-shadow(border, 1px, )



