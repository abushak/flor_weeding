jQuery(function ($) {
    $(window).on('scroll', function () {
        $('#to_top').toggleClass('show', window.scrollY > 400);
    });
    $('#to_top').toggleClass('show', window.scrollY > 400);

    $('a[href="#top"]').on('click', function (e) {
        e.preventDefault();
        $('html,body').animate({scrollTop: 0}, function () {
            location.hash = 'top';
        });
    });
});
