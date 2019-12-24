$(document).ready(function(){
	
	// 영화관 데이터 불러오기
	
	var theaters_li = $('.theaters > li ');
	var theaters 	= $('.theaters > li > ol');
		
	// 지역메뉴 출력	
	theaters_li.click(function(e){
		e.preventDefault();
		
		var i = $(this).index();
		
		// li class="active"
		theaters_li.removeClass().eq(i).addClass('active');
		
		// ol class="on"
		theaters.removeClass().eq(i).addClass('on');
	});
	
	
	// 극장이름 클릭 (동적 이벤트 생성)
	$(document).on('click','.theaters ol > li',function(e){
		e.preventDefault();
		
		var theaters_all = $('.theaters ol > li');
		
		theaters_all.removeClass('chk');
		$(this).addClass('chk');
		
	});
	

	
	// 영화관 데이터 모두 불러오기 
	$.ajax({
		
		url:'/jcinema/admin/api/theaters',
		type:'get',
		dataType:'json',
		success:function(data){
			
			$.each(data,function(k,values){
				
				// console.log( k + ": " + v );
				
				if(k == '서울'){
					$.each(values, function(i,data){
						theaters.eq(0).append("<li><a href='#'>"+data.theater_name+"</a></li>");
					});
					
				}else if(k == '경기/인천'){
					$.each(values, function(i,data){
						theaters.eq(1).append("<li><a href='#'>"+data.theater_name+"</a></li>");
					});
					
				}else if(k == '충청/대전'){
					$.each(values, function(i,data){
						theaters.eq(2).append("<li><a href='#'>"+data.theater_name+"</a></li>");
					});
					
				}else if(k == '전라/광주'){
					$.each(values, function(i,data){
						theaters.eq(3).append("<li><a href='#'>"+data.theater_name+"</a></li>");
					});
					
				}else if(k == '경북/대구'){
					$.each(values, function(i,data){
						theaters.eq(4).append("<li><a href='#'>"+data.theater_name+"</a></li>");
					});
					
				}else if(k == '경남/부산/울산'){
					$.each(values, function(i,data){
						theaters.eq(5).append("<li><a href='#'>"+data.theater_name+"</a></li>");
					});
					
				}else if(k == '강원'){
					$.each(values, function(i,data){
						theaters.eq(6).append("<li><a href='#'>"+data.theater_name+"</a></li>");
					});
					
				}else if(k == '제주'){
					$.each(values, function(i,data){
						theaters.eq(7).append("<li><a href='#'>"+data.theater_name+"</a></li>");
					});
				}


				
			});
			
		}
	
	});
	
	
	
	
	
});