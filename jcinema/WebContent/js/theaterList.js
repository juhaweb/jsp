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
					"<li data-movie-no='"+value.movie_no+"'>" +
					"<a href='#'>"+
					"<span class='grade "+grade+"'></span>"+
					"<span class='tit'>"+value.movie_title+"</span>"+
					"</a>" +
					"</li>"
				);
				
			});
			
		});
		
	});
	
	// 영화선택 동적이벤트 
	$(document).on('click', '.rank > article > ul > li', function(e){
		e.preventDefault();
		
		var movie_no = $(this).attr('data-movie-no');			
		var schedule_date = $('input[name=movie_date]').val();
		var schedule_theater_no = $('input[name=theater_no]').val();
		
		var url = "/jcinema/api/movies-schedule";			
		var param = {"schedule_date": schedule_date, 
					 "theater_no": schedule_theater_no, 
					 "movie_no": movie_no}; 
		
		var showtime_section_div	= $('.showtime > article > section > div');
		var showtime_nodata			= $('.showtime .nodata');
		
		
		$.get(url, param, function(data){
			
			if(data.length > 0){
				//데이터가 있을때 .nodata 삭제 
				showtime_nodata.remove();
				showtime_section_div.empty();
				
				// 왜 이중포문이냐면 관별 회차가 다르기 때문에 
				for(var a=0; a<data.length; a++){

					showtime_section_div.append("<ul class='round_view'></ul>");
					
					var dataObj = data[a];
					
					for(var b=0; b<dataObj.length; b++){
						
						showtime_section_div.children().last().append("<li>" +
																	  "<a href='#' data-theater-no='"+dataObj[b].schedule_theater_no+
																	  "'data-screen-no='"+dataObj[b].schedule_screen_no+
																	  "' data-movie-no='"+dataObj[b].schedule_movie_no+
																	  "' data-movie-date='"+dataObj[b].schedule_date+
																	  "' data-round-view='"+dataObj[b].schedule_round_view+"' >"+
																	  "<span>"+dataObj[b].schedule_round_view+"회차</span>"+
																  	  "<span>"+dataObj[b].schedule_start_time.substring(0,5)+" ~ "+dataObj[b].schedule_end_time.substring(0,5)+"</span>"+
																  	  "<span><em>24</em>석/<em>80</em>석</span>"+
																	  "</a>" + 
																	  "</li>"
						);
						
					}
					
					
				}
				
			}
			
		});
		// json 종료
		
	});
	// 동적이벤트 종료
	
	
	
	// 영화상영일정 클릭 (동정이벤트 또 생성)
	$(document).on('click','.round_view > li > a', function(e){
		e.preventDefault();
		
		var theater_no = $(this).attr('data-theater-no');
		var screen_no = $(this).attr('data-screen-no');
		var movie_date = $(this).attr('data-movie-no');
		var movie_no = $(this).attr('data-movie-date');
		var round_view = $(this).attr('data-round-view');		
		
		location.href='/jcinema/ticketing/choice-seat?theater_no='+theater_no+'&screen_no='+screen_no+'&movie_date='+movie_date+'&movie_no='+movie_no+'&round_view='+round_view ;
		
		
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