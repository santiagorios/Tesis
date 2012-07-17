# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->
	$("#entry_date").datepicker({ format: 'yyyy-mm-dd' });
	
jQuery ->
	$("a[rel^='prettyPhoto']").prettyPhoto();

jQuery ->
	$('#research-lines').tagit({
		itemName: "entry",
		fieldName: "research_line_names"
		availableTags: $("#research-lines").data('autocomplete-source')
	});

jQuery ->
	if $('.pagination').length
		$(window).scroll ->
			url = $('.pagination a[rel="next"]').attr('href')
			if url && $(window).scrollTop() > $(document).height() - $(window).height() - 180
				$('.pagination').text("Fetching more entries...")
				$.getScript(url)
		$(window).scroll()

