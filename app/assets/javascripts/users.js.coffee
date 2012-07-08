# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->
	$("#user_profile_attributes_birthday").datepicker({ format: 'yyyy-mm-dd' });
	$("#user_department_name").autocomplete
		source: $("#user_department_name").data('autocomplete-source')
