// endorse page

function endorse_people() {

  $('.endorse-skills').click();
  window.setInterval(endorse, 1200);

  function endorse() {
    $('#endorsements-connections')
    .find('.endorse-action')
    .first()
    .trigger('click');
  }
}
endorse_people();

// Stats page

function stats_stuff() {
  var i;

  function box(index) {
    return $('#recommended-actions > ul > li:nth-child(' + index + ') > ul > li.action-card.show > div > button');
  }

  function push_buttons () {
    if ( typeof(i) === "undefined" ) { i = 1 }

      var $box = box(i),
      $box_text = $box.text();

      setInterval(
        push_non_edit_buttons($box)
      , 500);
    }

  function push_non_edit_buttons(box) {
    if ( !/Edit/.test( box.text() ) ) {
      box.click()
    } else {
      i += 1;
      push_buttons;
    }
  }

  setInterval(
    push_buttons
  , 1000);

  setInterval(
    stats_stuff
  , 5000);
}
stats_stuff()

// like people's postings

function get_all_page_likes() {
  var $likes;

  function get_bottom() {
    var $height = $(document).height();
    $("html,body").scrollTop($height)
  }

  var bottom = setInterval(
    get_bottom
    , 2100 )


  window.setTimeout(
    stop,
    5000
  )

  function stop () {
    window.clearInterval(bottom)
    like_stuff()
  }

  function like_stuff() {
    $likes = $('.like');

    $.each( $likes, function(i, value) {
      var $value = $(value);
      if( !/Unlike/.test($value.text()) ) {
        $value.click();
      }
    });
  }
};
get_all_page_likes()

// WIP

// come to homepage;

// function home_page() {
//   window.location.href = url.home;
// }

// function stats_page() {
//   window.location.href = url.stats_page;
// }


// // put all page links here
// var url = {
//   home: 'https://www.linkedin.com/home?trk=nav_responsive_tab_home', // like
//   stats_page: 'https://www.linkedin.com/wvmx/profile?trk=hp-identity-wvmp', // follow, connect, add
//   people: {
//     dad: 'https://www.linkedin.com/in/john-m-woodall-1321302?authType=NAME_SEARCH&authToken=dTLk&locale=en_US&trk=tyah&trkInfo=clickedVertical%3Amynetwork%2CclickedEntityId%3A6283190%2CauthType%3ANAME_SEARCH%2Cidx%3A1-1-1%2CtarId%3A1455994889275%2Ctas%3Ajohn', // endorse
//   },
//   pymk: 'https://www.linkedin.com/people/pymk?trk=nav_responsive_sub_nav_pymk', // add new people
//   congrats: 'https://www.linkedin.com/contacts/?filter=recent&trk=nav_responsive_sub_nav_network#?filter=recent&trk=nav_responsive_sub_nav_network' // auto send a congrats
// }
