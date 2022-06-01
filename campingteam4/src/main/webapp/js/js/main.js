(function($) {

	"use strict";

	$('nav .dropdown').hover(function(){
		var $this = $(this);
		$this.addClass('show');
		$this.find('> a').attr('aria-expanded', true);
		$this.find('.dropdown-menu').addClass('show');
	}, function(){
		var $this = $(this);
			$this.removeClass('show');
			$this.find('> a').attr('aria-expanded', false);
			$this.find('.dropdown-menu').removeClass('show');
	});

})(jQuery);

$(document).ready(function() {
	var currentPosition = parseInt($(".chat").css("top"));
	$(window).scroll(function() {
		var position = $(window).scrollTop();
		$(".chat").stop().animate({
			"top" : position + currentPosition + "px"
		}, 1000);
	});
});

