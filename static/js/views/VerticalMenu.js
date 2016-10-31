app.view.VerticalMenu = function() {
	this.init();
	this.bind();
};

app.view.VerticalMenu.prototype = {

	// Vertical menu id
	verticalMenuId: '#slide-menu',
	// Slider container id
	sliderContainerId: '#slide-container',
	// Content margin value
	contentMargin: 30,

	init: function () {
		this.verticalMenu = $(this.verticalMenuId);
		this.calculateMenuPosition();
	},

	calculateMenuPosition: function() {
		this.verticalMenuTop = this.verticalMenu.get(0).offsetTop;
		this.verticalMenuHeight = this.verticalMenu.get(0).clientHeight;
		this.content = $(this.sliderContainerId);
	},

	setPosition: function() {
		var contentHeight = this.content.get(0).clientHeight - this.contentMargin;
		var scrollTop = window.pageYOffset;
		if (scrollTop > (contentHeight - this.verticalMenuHeight)) {
			this.verticalMenu.css('top', contentHeight - this.verticalMenuHeight + this.verticalMenuTop - scrollTop + 'px');
		}
		else {
			this.verticalMenu.css('top', 'auto');
		}
	},

	onResize: function() {
		this.calculateMenuPosition();
	},

	onScroll: function() {
		this.setPosition();
	},

	bind: function() {
		$(window).on('resize', $.proxy(this.onResize, this));
		$(document).on('scroll', $.proxy(this.onScroll, this));
	}

};