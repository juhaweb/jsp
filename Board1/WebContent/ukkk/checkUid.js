$(function(){
		
	
	// uid 체크
	
	$('input[name=uid]').focusout(function(){
		
		var input = $(this);
		
		$.ajax({
			
			url:'/Board1/user/checkUidProc.jsp?uid='+input.val(),
			type:'get',
			dataType:'json',
			success:function(data){
				
				if(data.result == 1){
					$(".resultId").css('color','red').text("이미 사용중인 아이디 입니다. ");
					input.focus();
				}else{
					$(".resultId").css('color','green').text("사용 가능한 아이디 입니다. ");
				}
				
			}
		
		});				
	});
	
	
	
	
	// nick 체크
	
	$('input[name=nick]').focusout(function(){
		
		var input = $(this);
		
		$.ajax({
			
			url:'/Board1/user/checkNickProc.jsp?nick='+input.val(),
			type:'get',
			dataType:'json',
			success:function(data){
				
				if(data.result == 1){
					$(".resultNick").css('color','red').text("이미 사용중인 닉네임 입니다. ");
					input.focus();
				}else{
					$(".resultNick").css('color','green').text("사용 가능한 닉네임 입니다. ");
				}
				
			}
		
		});				
	});
	
	
	
	
	// email 체크
	
	$('input[name=email]').focusout(function(){
		
		var input = $(this);
		
		$.ajax({
			
			url:'/Board1/user/checkEmailProc.jsp?email='+input.val(),
			type:'get',
			dataType:'json',
			success:function(data){
				
				if(data.result == 1){
					$(".resultEmail").css('color','red').text("이미 사용중인 이메일 입니다. ");
					input.focus();
				}else{
					$(".resultEmail").css('color','green').text("사용 가능한 이메일 입니다. ");
				}
				
			}
		
		});				
	});
	
	
	
	// hp 체크
	
	$('input[name=hp]').focusout(function(){
		
		var input = $(this);
		
		$.ajax({
			
			url:'/Board1/user/checkHpProc.jsp?hp='+input.val(),
			type:'get',
			dataType:'json',
			success:function(data){
				
				if(data.result == 1){
					$(".resultHp").css('color','red').text("이미 사용중인 휴대폰 번호 입니다. ");
					input.focus();
				}else{
					$(".resultHp").css('color','green').text("사용 가능한 휴대폰 번호 입니다. ");
				}
				
			}
		
		});				
	});
	
	
	
	
	
	
	
	
	
	
});