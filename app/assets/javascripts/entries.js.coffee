# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->
	$("#entry_date").datepicker({ format: 'yyyy-mm-dd' });
	
jQuery ->
 	$("a[rel^='prettyPhoto']").prettyPhoto();