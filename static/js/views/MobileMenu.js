app.view.MobileMenu = function() {
	this.init();
	this.bind();
};

app.view.MobileMenu.prototype = {

	// Mobile menu icon class
	mobileMenuSel: '.mobile-menu',
	// This makes the mobile menu visible
	mobileMenuActiveCls: 'mobile-menu-on',

	init: function() {
		this.body = $(document.body);
		this.mobileMenu = $(this.mobileMenuSel);
	},

	toggleMobileMenu: function() {
		if (this.body.hasClass(this.mobileMenuActiveCls)) {
			this.body.removeClass(this.mobileMenuActiveCls);
			this.setTouchMove();
		}
		else {
			this.body.addClass(this.mobileMenuActiveCls);
			this.setTouchMove();
		}
	},

	setTouchMove: function() {
		if (this.body.hasClass(this.mobileMenuActiveCls)) {
			if (window.innerHeight <= 450) {
				this.body.off('touchmove', $.proxy(this.onTouchMove, this));
			}
			else {
				this.body.on('touchmove', $.proxy(this.onTouchMove, this));
			}
		}
		else {
			this.body.off('touchmove', $.proxy(this.onTouchMove, this));
		}
	},

	onOrientationChange: function() {
		this.setTouchMove();
	},

	onTouchMove: function(ev) {
		ev.preventDefault();
	},

	bind: function() {
		this.mobileMenu.click($.proxy(this.toggleMobileMenu, this));
		this.body.on('orientationchange', $.proxy(this.onOrientationChange, this));
	}

};