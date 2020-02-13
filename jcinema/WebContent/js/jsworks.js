$(document).ready(function(){
	
	var seat		= $('.seat-area .seat');
	var resultSet	= $('.total-info .table .result_seat')
	var doPay		= $('.back-and-pay .do_pay')
	
	dopay.click(function(){
		location.href='/jcinema/ticketing/order-confirm';
		
	});
	
	seat.click(function(){

		var dataSeat	= $(this).attr('data-seat');	
		resultSet.text(dataSeat);
		
		return false;  // e.preventDefault랑 같
	});
	
	
	
	
});