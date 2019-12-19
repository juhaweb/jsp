$(function(){

	// ticket - register 
	
	var theater_city = $('#theater_city');
	var theater_name = $('#theater_name');
	var screen_name = $('#screen_name');


	// 비활성화
	theater_name.attr('disabled',true);
	screen_name.attr('disabled',true);

	
	// 영화관 지역선택할 때 극장정보 서버로부터 가져오기.
	theater_city.change(function(){
		
		var city = $(this).val();
		var url ="/jcinema/admin/api/theater?city="+city;
		
		$.get(url,function(data){

			// 모든 option태그 삭제
			theater_name.empty();
			theater_name.append('<option>선택</option>');
			
			for(var i=0; i<data.length; i++){
				theater_name.append('<option value="'+data[i].theater_no+'">'+data[i].theater_name+'</option>');
			}
			
			theater_name.attr('disabled',false);

		});				

		// 영화관을 선택하고 input[name=theater_no]에 영화관 번호 입력

		
	});
	
	
	// 영화관 선택하고 서버로부터 상영관 정보 가져오기. 
	theater_name.change(function(){
		
		var theater_no = $(this).val();
		var url ="/jcinema/admin/api/screen?theater_no="+theater_no;
		
		$.get(url,function(data){
			
			// 모든 option태그 삭제
			screen_name.empty();
			screen_name.append('<option value="00">선택</option>');
			
			for(var i=0; i<data.length; i++){
				screen_name.append('<option value="'+data[i].screen_no+'">'+data[i].screen_name+'</option>');
			}
			
			screen_name.attr('disabled',false);
			
		});
		
		// 상영관을 선택하고 input[name=screen_no]에 영화관 번호 입력

	});
	
		
	// movie - schedule - #searchBg 영화검색 팝업창

	var searchBg = $('#searchBg');
	var btnClose = $('#searchBg .btnClose');
	var btnMovieSearch = $('.movie-schedule .btnMovieSearch');
	
	btnMovieSearch.click(function(e){
		e.preventDefault();
		searchBg.show();
	});
	
	btnClose.click(function(e){
		e.preventDefault();
		searchBg.hide();
	});
	
	
	// movie - schedule - .btnSearch 영화검색 팝업창 내부.... 
	
	var btnSearch = $('#searchBg .btnSearch');
	var searchTable = $('#searchBg .searchTable');
	
	btnSearch.click(function(){
	
		var movieTitle = $('#searchBg input[name=title]').val();
		var url = "/jcinema/admin/api/movies?title="+movieTitle;
	
		$.get(url,function(data){

			searchTable.empty();
			
			for(var i=0; i<data.length; i++){
				
				searchTable.append('<tr>'+
								   '<th>'+data[i].movie_no+'</th>'+
								   '<td>'+data[i].movie_title+'<td>'+
								   '<td>'+data[i].movie_genre+'</td>'+
								   '<td>'+data[i].movie_grade+'</td>'+
								   '<td>'+data[i].movie_release_date.substring(2,10)+'</td>'+
								   '<td><button class="btnChoice" data-movie-no="'+data[i].movie_no+'" title="'+data[i].movie_title+'">선택</button></td>'+
								   '</tr>');
			}
			
		});
			
	}); // movie - schedule - btnenddddddd	
		
	// btnChoice에 대한 동적이벤트 구현
		$(document).on('click','.btnChoice',function(){
			
			var title = $(this).attr('title');
			var movieNo = $(this).attr('data-movie-no')
			
			$('#schedule_movie').val(title);
			// 영화번호를 선택하고 영화번호 input[name=schedule_movie_no] 에 영화번호 입력
			$('input[name=schedule_movie_no]').val(movieNo);
			
			searchBg.hide();
			
		});

		
		
		
		
		
		
		
});
		

