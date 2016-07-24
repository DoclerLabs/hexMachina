(function() {

	var createThreadButtonSel = '.create-thread';

	$(createThreadButtonSel).click(createThread);

	function createThread() {
		console.info('#createThread');
	}

	var threadsEl = $('.threads');
	var data = {
		api_key: threadsEl.attr('data-public-key'),
		category: threadsEl.attr('data-category-id')
	};
	var self = this;

	$.ajax({
		type: 'GET',
		url: "https://disqus.com/api/3.0/categories/listThreads.jsonp",
		data: data,
		cache: false,
		dataType: "jsonp",
		success: function (result) {
			self.threads = result.response;
			//getAuthorNamesFromThreads();
			renderThreads(result.response);
		}
	});

	function getAuthorNamesFromThreads() {
		var userIds = [];
		for (var i = 0; i < this.threads.length; i++) {
			$.ajax({
				type: 'GET',
				url: "https://disqus.com/api/3.0/users/details.jsonp",
				data: {user: this.threads[i].author},
				cache: false,
				dataType: "jsonp",
				success: function (result) {
					userIds.push(result);
				}
			});
		}
		console.info(userIds);
	}

	function renderThreads(threads) {
		var threadInfo;
		for (var i = 0; i < threads.length; i++) {
			threadInfo = threads[i];
			threadsEl.append(
				'<li>' +
					'<a class="col-sm-12 text-center-sm" href="' + threadInfo.link.replace('http://hexmachina.org/', location.origin) + '">' +
						'<h2 class="col-lg-7 col-xs-12 col-sm-12">' + threadInfo.clean_title + '</h2>' +
						'<time class="col-lg-3 col-xs-12 col-sm-12">' + beautifyTime(threadInfo.createdAt) + '</time>' +
						'<strong class="col-lg-2 col-xs-12 col-sm-12">' + threadInfo.posts + ' Comment(s)</strong>' +
						'<small class="clear"></small>' +
					'</a>' +
				'</li>');
		}
	}

	function beautifyTime(time) {
		return 'Created on ' + moment(time).format('Do MMMM YYYY, h:mm A');
	}

}());