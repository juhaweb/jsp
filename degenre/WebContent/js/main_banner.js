$(document).ready(function(){

    // 메인상단 풀스크린 배너
    $('.full_slider').bxSlider({
        slideWidth: 1840,
        auto:true,
        pause: 5000,
        slideMargin: 0
    });

    // 메인하단 카테고리 배너
    $('.cate_slider').bxSlider({
        slideWidth: 300,
        minslides : 5,
        maxSlides : 5,
        moveSlides : 1,
        auto: true,
        pause: 2000,
        pager:false,
        slideMargin: 20
    });


});