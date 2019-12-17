// 영화포스터 배너 
$(function(){

	var posterUl = $('main > .poster ul');
	
	$.ajax({
		url:'/jcinema/movie/posters',
		type:'get',
		dataType:'json',
		success: function(data){

			// alert(data[0].movie_poster);
			
			for(var i=0; i<data.length; i++){
				posterUl.append("<li><a href='/jcinema/movie/detail?movie_no="+data[i].movie_no+"'><img src='/jcinema/resource/poster/"+data[i].movie_poster+"' alt='"+data[i].movie_title+"'></a></li>");
			}
			
			// 메인 포스터 슬라이더 
			posterUl.bxSlider({
			  slideWidth: 188,
			  minslides : 5,
			  maxSlides : 5,
			  moveSlides : 1,
			  auto: true,
			  pause: 3000,
			  slideMargin: 0

			});

		}
	});
 
});




$(function(){

  // 메인 슬라이더 
  $('.bxslider').bxSlider({
    auto: true,
    pager: false,
    slideWidth: 1115,
    pause: 2000,
    controls: false,
    slideMargin: 0

  });
  
});




// 상단배너
$(function(){
	
});

// 예매순위
$(function(){
	
});

// 슬라이드배너
$(function(){
	
});





// 메인 공지사항 롤링업







