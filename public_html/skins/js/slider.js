jQuery(function ($) {
    var inputs = $('input[name="slider"]', '#slider'), l = inputs.length, timer = setTimeout(next, 5000);

    function next() {
        for (var i = 0; i < l; ++i) {
            if ($(inputs[i]).prop('checked')) {
                return $(inputs[(i == l - 1) ? 0 : i + 1]).prop('checked', true).change();
            }
        }
    }

    $('#slider').on({
        mouseover: function () {
            clearTimeout(timer);
        },
        mouseout: function () {
            clearTimeout(timer);
            timer = setTimeout(next, 5000);
        }
    });

    inputs.on('change', function () {
        clearTimeout(timer);
        timer = setTimeout(next, 5000);
    });
});