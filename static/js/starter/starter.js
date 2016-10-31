(function() {

	$(document).ready(function() {
		new app.page.all();
		var pageId = $('body').attr('data-page');

		if (app.page[pageId]) {
			new app.page[pageId]();
		}
	});

}());