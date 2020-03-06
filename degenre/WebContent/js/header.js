$(document).ready(function(){
    
    // $('.btn_menu_open.on').click(function(){
    //     $('.gnbwrap').animate({'left':'60px'},200);
    //     $('#layout').show();
    //     $('.btn_menu_open').removeClass('on').addClass('off');

    //     $('.btn_menu_open.off').click(function(){
    //         $('.gnbwrap').animate({'left':'-300px'},200)
    //         $('#layout').hide(); 
    //         $('.btn_menu_open').removeClass('off').addClass('on');
    //     });
    // });

    // 위 오류 해결전 임시작업 
    $('.btn_menu_open.on').click(function(){
        $('.gnbwrap').animate({'left':'60px'},200);
        $('#layout').show();
        
        $('#layout').click(function(){
            $('.gnbwrap').animate({'left':'-300px'},200)
            $('#layout').hide(); 
        });
    });




});

