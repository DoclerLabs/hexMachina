app.view.GoogleSearch = function() {
	this.init();
	this.bind();
};

app.view.GoogleSearch.prototype = {

	// Toggle search button selector
	toggleSearchBtnSel: '.toggle-search',
	// Class that will make the search visible
	searchEnabledCls: 'search-enabled',
	// Wrapper selector for search
	searchFieldCls: '.google-search',
	// Google search element
	apiTag: '<gcse:search></gcse:search>',

	init: function() {
		this.body = $(document.body);
		this.searchField = $(this.searchFieldCls);
		this.toggleSearchButtons = $(this.toggleSearchBtnSel);

		this.initSearch();
	},

	toggleSearchVisibility: function() {
		this.body.toggleClass(this.searchEnabledCls);
		if (!this.body.hasClass(this.searchEnabledCls)) {
			this.resetGoogleSearchApi();
		}
	},

	resetGoogleSearchApi: function() {
		this.searchField.html(this.apiTag);
		this.initSearch();
	},

	initSearch: function() {
		var cx = '010997690404295003250:ejhhrxabuqc';
		var gcse = document.createElement('script');
		gcse.type = 'text/javascript';
		gcse.async = true;
		gcse.src = 'https://cse.google.com/cse.js?cx=' + cx;
		var s = document.getElementsByTagName('script')[0];
		s.parentNode.insertBefore(gcse, s);
	},

	bind: function() {
		this.toggleSearchButtons.click($.proxy(this.toggleSearchVisibility, this))
	}

};