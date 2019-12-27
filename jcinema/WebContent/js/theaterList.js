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
		
		// 상영중인 영화 불러오기
		
		var theater_no = $(this).attr('data-theater-no');
		$('input[name=theater_no]').val(theater_no);
		
		var schedule_date = $('input[name=movie_date]').val();
		var url ="/jcinema/api/movies?theater_no="+theater_no+"&schedule_date="+schedule_date;
		var movie_list = $(".rank > article > ul");	
		
		movie_list.empty();
		
		$.get(url,function(data){
			
			$.each(data,function(i, value){
				
				var grade = null;
				
				if(value.movie_grade =='0'){
					grade ='gradeAll';
				}else if(value.movie_grade == '12'){
					grade ='grade12';
				}else if(value.movie_grade == '15'){
					grade ='grade15';
				}else if(value.movie_grade == '18'){
					grade ='grade18';
				}else if(value.movie_grade == '19'){
					grade ='grade19';
				}
				
				movie_list.append(
					"<li data-movie-no='"+value.movie_no+"'><a href='#'>"+
					"<span class='grade "+grade+"'></span>"+
					"<span class='tit'>"+value.movie_title+"</span>"+
					"</a></li>"
				);
				
			});
			
		});
		
	});
	
	// 영화선택 동적이벤트 
	$(document).on('click','.rank > article > ul > li', function(e){
		e.preventDefault();
		
		var movie_no = $(this).attr('data-movie-no');
		var schedule_date = $('input[name=movie_date]').val();
		var schedule_theater_no = $('input[name=theater_no]').val();
		
			
		var url = "/jcinema/api/movies-schedule";
		var param = {"schedule_date":schedule_date,
					"schedule_theater_no":schedule_theater_no,
					"schedule_movie_no":movie_no}; 
		
		$.get(url,param,function(data){
			
		});
		
		
		
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
						theaters.eq(0).append("<li data-theater-no='"+data.theater_no+"'><a href='#'>"+data.theater_name+"</a></li>");
					});
					
				}else if(k == '경기/인천'){
					$.each(values, function(i,data){
						theaters.eq(1).append("<li data-theater-no='"+data.theater_no+"'><a href='#'>"+data.theater_name+"</a></li>");
					});
					
				}else if(k == '충청/대전'){
					$.each(values, function(i,data){
						theaters.eq(2).append("<li data-theater-no='"+data.theater_no+"'><a href='#'>"+data.theater_name+"</a></li>");
					});
					
				}else if(k == '전라/광주'){
					$.each(values, function(i,data){
						theaters.eq(3).append("<li data-theater-no='"+data.theater_no+"'><a href='#'>"+data.theater_name+"</a></li>");
					});
					
				}else if(k == '경북/대구'){
					$.each(values, function(i,data){
						theaters.eq(4).append("<li data-theater-no='"+data.theater_no+"'><a href='#'>"+data.theater_name+"</a></li>");
					});
					
				}else if(k == '경남/부산/울산'){
					$.each(values, function(i,data){
						theaters.eq(5).append("<li data-theater-no='"+data.theater_no+"'><a href='#'>"+data.theater_name+"</a></li>");
					});
					
				}else if(k == '강원'){
					$.each(values, function(i,data){
						theaters.eq(6).append("<li data-theater-no='"+data.theater_no+"'><a href='#'>"+data.theater_name+"</a></li>");
					});
					
				}else if(k == '제주'){
					$.each(values, function(i,data){
						theaters.eq(7).append("<li data-theater-no='"+data.theater_no+"'><a href='#'>"+data.theater_name+"</a></li>");
					});
				}


				
			});
			
		}
	
	});
	
	
	
	
	
});