window._range_ = (function($) {
    "use strict";
    var _range_ = {
        init: function(options) {
            var minValue = 0, maxValue = 0;
            var options = $.extend({
                _minSelector: "#range-min-value",
                _maxSelector: "#range-max-value"
            }, options);
            
            $(options._minSelector).add(options._maxSelector).keydown(function(e) {
                var key = e.charCode || e.keyCode || 0;
                return (key == 8 || key == 9 || key == 46 || (key >= 37 && key <= 40) || (key >= 48 && key <= 57) || (key >= 96 && key <= 105));
            });
            
            $(options._minSelector).on("change", function() {
                var _min = $(this),
                    _minVal = _min.val();
                
                if (_minVal == "") {
                    minValue = 0;
                    return;
                }
                minValue = parseInt(_minVal);
                minValue = ((minValue < maxValue) || (maxValue == 0)) ? minValue : maxValue;
                _min.val(minValue);
            });
            
            $(options._maxSelector).on("change", function() {
                var _max = $(this),
                    _maxVal = _max.val();
                
                if (_maxVal == "") {
                    maxValue = 0;
                    return;
                }
                maxValue = parseInt(_maxVal);
                maxValue = ((maxValue > minValue) || (minValue == 0)) ? maxValue : minValue;
                _max.val(maxValue);
            });
        }
    }
    return _range_;
})(jQuery);