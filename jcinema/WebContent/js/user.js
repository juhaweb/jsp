
// 회원가입
$(document).ready(function(){
	
	
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
			// 비밀번호 일치여부 확인
		
		
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
	
	
	  
});
