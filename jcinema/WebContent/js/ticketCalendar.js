$(document).ready(function(){

  var $month = $(".calendar .month");
  var $year = $(".calendar .year");
  var $a = $(".calendar a");

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

  //날짜출력 
  if(today > lastDate.getDate()){
    today = 1;
    };

    $(this).children().last().text(today++);

  }); //each 끝





  //날짜선택 on 하이라이트
  $a.eq(0).parent().addClass('on');




});