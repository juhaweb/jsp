$(function(){
	
	var theater_city = $('#theater_city');
	var theater_name = $('#theater_name');
	var screen_name = $('#screen_name');
	var movie_no = $('#movie_no');
	var movie_date = $('#movie_date');
	var round_view = $('#round_view');
	var price = $('#price');

	// 비활성화
	theater_name.attr('disabled',true);
	screen_name.attr('disabled',true);
	movie_no.attr('disabled',true);
	movie_date.attr('disabled',true);
	round_view.attr('disabled',true);
	price.attr('disabled',true);
	
	
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
			movie_no_attr('disabled',false);
			
		});
		
	});
	
	
	
});
