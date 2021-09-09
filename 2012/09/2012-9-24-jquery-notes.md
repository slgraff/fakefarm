#Today

##Code School
[Jquery Air](http://jqueryair.com/)

_While this is possible, it's not recommended_
var original = parsInt($('p').css('font-size'));
$('p').css('font-size', original + 8 + 'px');

Add a map which is like a hash with braces and colons
$('p').css({
'font-size':'90%',
'color':'blue'
});


Keep separation of concerns and don't manipulate CSS. Instead modify the id's and classes instead of modifying .css...

$('p:first').hasClass('plan');

$('p:first').addClass('bigger');
$('p:first').removeClass('bigger');
$('p:first').toggleClass('bigger');

$('p:first').hide();
$('p:first').show();
$('p:first').toggle();

Controlling the timing by wrapping in document ready function which waits for the document to download.
$(document).ready(function(){
   ...
});

components of a JQuery command;
1. Document ready
2. selector
3. action (find / show / toggle)
4. item of interest class, id, et.

**Questions**
I see these actions, but where are they written?
How are they activiated?

###Level Four - Manipulating Content

_.text - Adds plain text and escapes the html_
$p("p#time span.label").text("Departs At:");

_.html - adds html and wipes out what's there_
If you want to add HTML need to use HTMl function;
$('p#time').html()
$('p#time').html('<b>Departs at:</b> 10:36am')

_.prepend - adds text on the front_
$('span.label').prepend("departure");

_.append - adds text on the back_
$('p#time').append("AM");

_.before to insert siblings before_
$("p#time").before("<h3>Departure Details</h3>");

_.after to insert siblings after_
$('h1').after("<h3>Departure Details</h3>");

_.remove removing nodes_
$("span.label").remove()

_Moving nodes is a two step process_
1. var gate = $('p.gate').remove()
to remove gate from current place & store in variable

2. $('p#time').before(gate)
use the gate variable and move it before the p#time

### Level Five - Events and Animation
_functions_
function name(){instructions}

_Anonymous functions are not meant to be called, but to be passed as arguments._

$(document).ready(
function(){
alert("The dom is ready!");
}
);

_Setup_
1. make the doument ready
2. find
3. do

_Click Event_
3 parts;
1. document ready to make sure it Jquery loads after
2. Call the click function for area I want
3. Write what I want when I click.


$(document).ready(function(){
    $("p").click(function(){
        alert("Got It!");
    });
});

_Click to Hide_
$(document).ready(function()){
    $("p").click(function(){
        $(this).hide();
    });
});

'this' referrs to the current object.
usually just a plain DOM element

wrap it to access JQuery functions: $(this)

_Comment about Timing_
If you remove the document.ready function then the code will run before the document loads. Best to wrap what I want in the document ready...

_Hover_
Hover accepts two functions. when moved on. when moved off.
$(document).ready(function(){
 $("p").hover(
    function(){$(this).addClass("highlight");},
    function(){$(this).removeClass("highlight");}
 );
});

**Version 2**

$(document).ready(function(){
 $("p").hover(
    function(){$(this).toggleClass("highlight");}
 );
});

_Keyboard Events_

    - Keydown - fires once when a key is depressed
    - Keypress - fires once or more times when a key is held down
    - Keyup - firse once when a key is released.

_Key press when only wanting the letter F to alert 'fantastic'_
$(document).ready(function(){
    $('body').keypress(
    function(event){
        if (event.which == 102){alert('fantastic!')};
   }
  );
});

_Fade Animations_
FadeIn, fadeToggle, FadeOut

_Ajax_
Sending or receiving content via XMLHttpRequest

Uses .load()






































