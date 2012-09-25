# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->
	$("#user_profile_attributes_birthday").datepicker({ format: 'yyyy-mm-dd' });
jQuery ->
	$("#user_department_name").autocomplete
		source: $("#user_department_name").data('autocomplete-source')
jQuery ->
  $("#user_knowledge_area_name").autocomplete
    source: $("#user_knowledge_area_name").data('autocomplete-source')

jQuery ->
	if $('#user').length
		$('#user #info').bind 'click', (event) ->
			extra = $(this).closest('.row').find('#extra');
			if extra.hasClass('collapsed')
				extra.slideDown();
				extra.removeClass('collapsed');
				$("#help-text").text('Click to hide');
			else
				extra.slideUp();
				extra.addClass('collapsed');
				$("#help-text").text('Click to show more');
jQuery ->
	$('.best_in_place').best_in_place()