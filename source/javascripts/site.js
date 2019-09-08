//= require jquery
//= require tether
//= require bootstrap-sprockets

$( document ).ready(function() {
  $('.consent_demo_dk').collapse('show');

  //on change hide all divs linked to select and show only linked to selected option
  $('#consent_demo').change(function(){
      //Saves in a variable the wanted div
      var selector = '.consent_demo_' + $(this).val();

      //hide all elements
      $('.consent_demo_hide').collapse('hide');

      //show only element connected to selected option
      $(selector).collapse('toggle');
  });

  $('.button-active-toggler').click(function(){
    $('.button-active-toggler').removeClass('active');
    $(this).addClass('active');
  });
});
