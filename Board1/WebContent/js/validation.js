/*
 * 날짜 : 2019/11/19
 * 이름 : 하정욱
 * 내용 : 회원가입 데이터 유효성 체크
 */

// 정규표현식                    ^시작 영소, 영소숫자, 최소4-19자 $종결 g는모르겟 java c# 모두 약속된 포맷   
var regId 		= /^[a-z]+[a-z0-9]{4,19}$/g;    // 아이디 검사식
var regPw 		= /^[a-z0-9_-]{6,18}$/;         // 비밀번호 검사식
var regName 	= /^[가-힣]{2,5}$/;                //이름 유효성 검사 2~5자 사이

$(document).ready(function(){
	
	// 전송버튼을 클릭했을때 실행되는 폼이벤트
	$('#regForm').submit(function(){					
		
		var uid   = $('input[name=uid]');
		var name  = $('input[name=name]');
		var pass1 = $('input[name=pass1]');
		var pass2 = $('input[name=pass2]');										
		
		// 아이디 중복 확인
		if(false)return false;
		
		// 아이디가 최소 4자이상 한글, 특수문자 포함여부
		if(regId.test(uid.val()) == false){
			alert('아이디는 영어 소문자, 숫자로 최소 4자 이상이어야 합니다.');
			uid.val('').focus();
			return false;
		}
		
		// 비밀번호 일치 확인
		if(pass1.val() != pass2.val()){
			alert('비밀번호가 일치하지 않습니다.');						
			pass1.val('').focus();
			pass2.val('');
			return false;
		}
		
		// 이름 한글여부
		if(regName.test(name.val()) == false){
			alert('이름은 한글로 최소 2자에서 5자까지 입력하세요.');
			name.val('').focus();
			return false;
		}
		
		// 별명 중복 확인
		if(false)return false;
		
		// 이메일 중복 확인
		if(false)return false;
		
		// 휴대폰 중복 확인
		if(false)return false;
		
		
		return true;
	});
	
	
	
});