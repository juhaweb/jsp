$(document).ready(function(){

  var $a 	 = $(".calendar a");
  var $month = $(".calendar .month");
  var $year	 = $(".calendar .year");
  

  var d = new Date();
  var year = d.getFullYear();
  var month = d.getMonth();
  var today = d.getDate();
  var day = d.getDay();

  var monthNames = ['January','Fabruary','March','April','May','June','July','August','September','October','November','December'];
  var week = ['일','월','화','수','목','금','토'];



  // 오늘 년도, 월 출력
  $year.text(year+' '+monthNames[month]);
  $month.text(month+1);

  // 현재 월의 첫번째 날짜와 마지막 날짜 구함 
  var firstDate = new Date(year, d.getMonth(), 1);
  var lastDate = new Date(year, d.getMonth()+1, 0);

  // 요일, 날짜 출력하기 
  $a.each(function(){

  //요일
  if(day == 7){ 
        day = 0; 
    }

  var week_name = week[day++];
  $(this).children().first().text(week_name);

  //요일별색상
  if(week_name == '토'){
    $(this).parent().removeClass().addClass('sat');
  }else if(week_name == '일'){
    $(this).parent().removeClass().addClass('sun');
  }else{
    $(this).parent().removeClass().addClass('day');
  }

  //날짜출력 다음달로 넘기기 
  if(today > lastDate.getDate()){
    today = 1;
    
    if( month == 11 ){
    	month = 0;
    	year = year+1;
    }
    
  }
  	// a태그에 지금날짜 넣기 
  	$(this).attr('data-date',year+"-"+(month+1)+"-"+today);
    $(this).children().last().text(today++);

  }); //each 끝


  //날짜선택 on 하이라이트
  $a.eq(0).parent().addClass('on');

  //날짜를 클릭하면 동그라미 강조
  $a.click(function(e){
      e.preventDefault();
      
      $a.parent().removeClass('on');
      $(this).parent().addClass('on');

      // 날짜입력 필드에 선택된 날짜 movie_date 입력       
      var today = $(this).children().eq(1).text();
      $('input[name=movie_date]').val(year+'-'+(month+1)+'-'+today);
      
  });
  


});