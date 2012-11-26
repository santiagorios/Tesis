# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->
  if window.innerHeight > $('body > .container').height()
    $('body').css("min-height", (window.innerHeight - 180) + 'px');
    $('body').css("position", "relative");
    $('body').css("padding-bottom", "60px");
    $('.footer-container').addClass('sticky-bottom');