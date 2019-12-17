$(document).ready(function(){
	
	// ------------------------------------------------
	// 1. 회원가입
	
	// 회원가입 버튼 클릭시
	$('#btnRegister').click(function(e){
		e.preventDefault();
		
		// 입력 데이터 가져오기
		var name = $('input[name=name]').val();
		var uid = $('input[name=uid]').val();
		var pw1 = $('input[name=pw1]').val();
		var pw2 = $('input[name=pw2]').val();
		var email = $('input[name=email]').val();
		var tel1 = $('select[name=tel1]').val();
		var tel2 = $('input[name=tel2]').val();
		var tel3 = $('input[name=tel3]').val();
		var hp1 = $('select[name=hp1]').val();
		var hp2 = $('input[name=hp2]').val();
		var hp3 = $('input[name=hp3]').val();
		var addrT = $('input[name=addrType]:checked').val();
		var zip = $('input[name=zip]').val();
		var addr1 = $('input[name=addr1]').val();
		var addr2 = $('input[name=addr2]').val();
		
		// 데이터 유효성 검증
			// 동의체크 
			// 아이디 중복여부 확인
			// 비밀번호 일치여부 확인 + 특문영어숫자
		
		// 데이터 전송하기
		var jsonUserData = {
				'name'	: name,
				'uid'	: uid,
				'pw1'	: pw1,
				'email'	: email,
				'tel'	: tel1+'-'+tel2+'-'+tel3,
				'hp'	: hp1+'-'+hp2+'-'+hp3,
				'addrType'	: addrT,
				'zip'	: zip,
				'addr1'	: addr1,
				'addr2'	: addr2
		};
		
		$.ajax({
			url:'/jcinema/member/register',
			type:'post',
			data:jsonUserData,
			dataType:'json',
			success:function(data){
				alert(data.result);
				//데이터 전송 완료 후 login페이지로 이동
				location.href='/jcinema/member/login'; 
			}
		});
		
		
	});
	
	
	
	// ------------------------------------------------
	// 2. 로그인(class탭변경)
	  var tabMenu = $('.tab_btn > li');
	  var tabContent = $('.tab > div');
	  
	  tabMenu.click(function(e){
		  e.preventDefault();
		  
		  var i = $(this).index();
		  
		  tabMenu.removeClass().eq(i).addClass('on');
		  tabContent.removeClass('on').eq(i).addClass('on');
		  
	  });
	  
	  // 로그인 빈칸채우기 알림
//	  var userId = $('.tab1 input[name=uid]').val();
//	  var userId = $('.tab1 input[name=uid]').val();
//	  
//	  $('input[type=submit]').click(function(){
//		  
//	  });
	
	
	
	// ------------------------------------------------
	// 3. tab2 스크립트 
	  
	  // 생년월일 추가
	  var year = $('select[name=year]');
	  var month = $('select[name=month]');
	  var date = $('select[name=date]');
	  
	  for(var y=1930; y<=2020; y++){
	  	  year.append('<option>'+y+'</option>');
	  }
	  
	  for(var m=1; m<=12; m++){
	  	  month.append('<option>'+m+'</option>');
	  }
	  
	  for(var d=1; d<=31; d++){
	  	  date.append('<option>'+d+'</option>');
	  }
	  
 
	  // 폼전송
	  var form = $('.tab2 form');
	  form.submit(function(){
		  
		var hp1 = $('select[name=hp1]').val();
		var hp2 = $('input[name=hp2]').val();
		var hp3 = $('input[name=hp3]').val();
		
		var year = $('select[name=year]').val();
		var month = $('select[name=month]').val();
		var date = $('select[name=date]').val();
		  
		  var hp = hp1+'-'+hp2+'-'+hp3;
		  var birth = year+'-'+month+'-'+date;
		  
		  $('input[name=hp]').val(hp);
		  $('input[name=birth]').val(birth);

		  return ture;
	  });
	  

	  
	  
	// ------------------------------------------------
	// 4. 
	
	
	
	
	
	
	
	
	
	  
});
