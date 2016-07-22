(function() {
	var threadsEl = $('.threads');
	$.ajax({
		type: 'GET',
		url: "https://disqus.com/api/3.0/categories/listThreads.jsonp",
		data: {
			api_key: threadsEl.attr('data-public-key'),
			category: threadsEl.attr('data-category-id')
		},
		cache: false,
		dataType: "jsonp",
		success: function (result) {
			renderThreads(result.response);
		}
	});

	function renderThreads(threads) {
		var threadInfo;
		for (var i = 0; i < threads.length; i++) {
			threadInfo = threads[i];
			threadsEl.append(
				'<li>' +
					'<a class="col-sm-12 text-center-sm" href="' + threadInfo.link + '">' +
						'<h2 class="col-lg-5 col-xs-12 col-sm-12">' + threadInfo.clean_title + '</h2>' +
						'<time class="col-lg-3 col-xs-12 col-sm-12">' + beautifyTime(threadInfo.createdAt) + '</time>' +
						'<span class="col-lg-2 col-xs-12 col-sm-12">Balazs Zubak' + '' + '</span>' +
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