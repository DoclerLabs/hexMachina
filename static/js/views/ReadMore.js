app.ReadMore = function(mainElementSelector) {
	this.initialize(mainElementSelector);
	this.addEvents();
};

app.ReadMore.prototype = {

	// Read more button selector
	readMoreBtnSel: '.read-more',
	// Selector for hidden items should be revealed
	hideCls: 'hide',


	initialize: function(mainElementSelector) {
		this.el = $(mainElementSelector);
		this.showMoreBtn = this.el.find('.read-more');
		this.hiddenItems = this.el.find('.reveal');

		console.info('#showMoreBtn');

		setTimeout(this.toggleVisibility.bind(this), 0);
	},

	toggleVisibility: function(ev) {
		if (ev) {
			ev.preventDefault();
		}
		console.info('Toggling visibility');
		if (this.hiddenItems.hasClass(this.hideCls)) {
			this.hiddenItems.removeClass(this.hideCls);
		}
		else {
			this.hiddenItems.addClass(this.hideCls);
		}
	},

	addEvents: function() {
		this.showMoreBtn.click(this.toggleVisibility.bind(this));
	}

};