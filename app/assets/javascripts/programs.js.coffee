# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->
  $('#program-form #research-sublines').tagit({
  itemName: "program",
  fieldName: "research_subline_names",
  allowSpaces: true,
  availableTags: $("#research-sublines").data('autocomplete-source')
  });

jQuery ->
  $('#program-form #knowledge-areas').tagit({
  itemName: "program",
  fieldName: "knowledge_area_names",
  allowSpaces: true,
  availableTags: $("#knowledge-areas").data('autocomplete-source')
  });

jQuery ->
  $("#program_start_date").datepicker({ format: 'yyyy-mm-dd' });