# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->
  $('#research-group-form #users').tagit({
  itemName: "research_group",
  fieldName: "user_emails",
  allowSpaces: false,
  availableTags: $("#users").data('autocomplete-source')
  });