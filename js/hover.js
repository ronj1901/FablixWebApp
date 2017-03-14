//$(document).ready(function()
//{
//	$('#templateMovieCardContainer').remove();
//	
//	var templateMovieCard = $(
//			'<div id="templateMovieCardContainer">' +
//				'<div id="templateMovieCardContent"></div>' +
//			'</div>');
//	
//	
//	
//	$('body').append(templateMovieCard);
//	
//	// Hide card by default
//	$('#templateMovieCardContainer').hide();
//	
//	var movieid;
//	
//	$('.card-text').mouseenter(function() {
//		$('.card-text').css("background-color","yellow");
//		$('.card-text').css("height","200px");
//
//		
//		$('#templateMovieCardContainer').show();
////		
////		movieid = $(this).attr('id');
////		
////		$.get('moviePopUp', {movieid: movieid}, function(responseText) {
////			
////            $('#templateMovieCardContent').html(responseText);
////            $('#templateMovieCardContainer').show();
////        });
////		
////		var pos = $(this).offset();
////	    var height = $(this).height();
////	    
////	    $('#templateMovieCardContainer').css({
////	        top: pos.top + height + 10 + 'px',
////	        left: pos.left + 'px'
////	    });
//		
//	});
//	
//	$('.card-text').mouseleave(function() {
//		$('.card-text').css("background-color","blue");
//
////		if ($(this).attr('id') == movieid)
////		{
////			$('#templateMovieCardContainer').hide();
////			$('#templateMovieCardContent').html("");
////		}
//	});
//			$('.starLink').css("background-color","yellow");
	
	
//	$("a").hover(function(e){
//		$($(this).data("tooltip")).css({
//			left: e.pageX + 1,
//			top: e.pageY + 1
//		}).stop().show(100);
//	},function(){
//		$($(this).data("tooltip")).hide();
//	});
	//$('[data-toggle="tooltip"]').tooltip({'selector': '','placement':'right','container':'body',html:true});
//});