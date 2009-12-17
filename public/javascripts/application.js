$(document).ready(function(){
	$.PeriodicalUpdater('/questions?all=true', {
	  method: 'get',
	  data: '',
	  minTimeout: 60000,
	  maxTimeout: 60000,
	  multiplier: 1,
	  type: 'text',
	    maxCalls: 0,
	    autoStop: 0
	}, function(data) {
		$("#blank_shit").after(data);
	});
	
	$("#questions_table input").live("click", function(){
		var parent_tr = $(this).parents("tr")[0];
		$(parent_tr).slideUp();
		var id = $(parent_tr).attr("id");
		// AJAX the update POST
	});
});