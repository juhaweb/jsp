/*
 * 날짜 : 2019/11/20
 * 이름 : 김철학
 * 내용 : 아이디 중복체크 AJAX 통신 스크립트
 */
$(function(){
	
	var input = $('.checkDp');
			
	input.focusout(function(){
		
		var tag   = $(this);
		var type  = tag.attr('name');
		var value = tag.val();
		
		if(value == ''){
			// 값을 입력하지 않으면 서버로 통신하지 않음
			return false;
		}
		
		$.ajax({
			url: '/Board1/user/checkDuplicateProc.jsp?type='+type+'&value='+value,
			type: 'get',
			dataType: 'json',
			success: function( data ){							
				if(data.result == 1){								
					tag.next().css('color', 'red').text('이미 사용중인 '+type+' 입니다.');
					tag.focus();
				}else{								
					tag.next().css('color', 'green').text('사용 가능한 '+type+' 입니다.');								
				}							
			}
		});
	});	
	
	
	
	
});