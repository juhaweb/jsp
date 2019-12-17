$(document).ready(function(){

	//-----------------------------------------------
	/* 상단 배너광고 클릭시 닫기! (+세션유지 필요) */
	
	var topBanner = $('#top-banner');
	var topBannerImg = $('#topBannerImg');
	var topBannerClose = $('#top-banner .close');
	 
	topBannerClose.click(function(e){
	  e.preventDefault();
	  topBanner.slideUp(200);
	});
	
	
	//-----------------------------------------------
	// 상단 배너광고 랜덤 출력
	var rand = Math.ceil(Math.random()*6);
	var imgPath ="/jcinema/img/top_banner_poster"+rand+".jpg";
	
	topBannerImg.attr('src',imgPath);
	
	
	//-----------------------------------------------
	// 상단 배너광고 배경색 지정 (jquery image edge color extract)
	var ctx = document.getElementById('canvas').getContext('2d');
	var img = document.getElementById('topBannerImg');
	
	if(img.complete){
	  drawBackground();
	}else{
	  img.onload = drawBackground;
	}
	  
	function drawBackground(){
	  ctx.drawImage(img, 0, 0);
	  var pixel = ctx.getImageData(0,0,1,1).data;  // 좌상단 0,0에서 1,1
	  var rgb = 'rgb('+pixel[0]+','+pixel[1]+','+pixel[2]+')';
	  topBanner.css('background-color',rgb);
	}


});

