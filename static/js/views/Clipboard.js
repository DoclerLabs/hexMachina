app.view.Clipboard = function() {
	this.init();
};

app.view.Clipboard.prototype = {

	// Clipboard icon selector
	clipboardCls: 'copy-icon',
	// Timeout value for clipboard tooltip in ms
	timeoutDuration: 3000,

	init: function() {
		this.clipboard = new Clipboard('.' + this.clipboardCls);

		var clipboard = new Clipboard('.copy-icon');
		clipboard.on('success', function(e) {
			e.trigger.className += ' copied';
			setTimeout(function(){e.trigger.className = 'copy-icon';}, 3000);
			e.clearSelection();
		});

		clipboard.on('error', function(e) {
			e.trigger.className += ' error';
			setTimeout(function(){e.trigger.className = 'copy-icon';}, 3000);
		});
	},

	onClipBoardSuccess: function(ev) {
		ev.trigger.className += ' copied';
		setTimeout(function(){ev.trigger.className = this.clipboardCls;}, this.timeoutDuration);
		ev.clearSelection();
	},

	onClipBoardError: function(ev) {
		ev.trigger.className += ' error';
		setTimeout(function(){ev.trigger.className = this.clipboardCls;}, this.timeoutDuration);
	},

	bind: function() {
		this.clipboard.on('success', $.proxy(this.onClipBoardSuccess, this));
		this.clipboard.on('error', $.proxy(this.onClipBoardError, this));
	}
	
};