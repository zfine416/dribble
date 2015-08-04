// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .


// dropdown for sorting posts by time frame


(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
	(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
	m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
})(window,document,'script','//www.google-analytics.com/analytics.js','ga');

ga('create', 'UA-65859090-1', 'auto');
ga('send', 'pageview')  ;



$( document ).ready(function() {
	$('.sort ul').hide();
});

function dropdown(){
	$('.sort ul').slideToggle();
}

$.ajax({
	url:"/posts/open",
	dataType: 'json',
	success: function(data){
		for(var i = 0; i<data.length; i++){
			$('#post').append('<img src='+data[i].image_file_name+'>');
		}
	}
})
