app.ReadMore = function(mainElementSelector) {
	this.initialize(mainElementSelector);
	this.addEvents();
};

app.ReadMore.prototype = {

	// Read more button selector
	readMoreBtnSel: '.read-more',
	// Selector for hidden items should be revealed


	initialize: function(mainElementSelector) {
		this.el = document.querySelector(mainElementSelector);
		this.showMoreBtn = this.el.querySelector('.read-more');
		this.hiddenItems = this.el.querySelector('.reveal');
	},

	onReadMoreClick: function() {
		if (this.hiddenItems.classList.contains()) {

		}
		else {

		}
	},

	addEvents: function() {
		this.showMoreBtn.addEventListener('click', this.onReadMoreClick.bind(this));
	}

};