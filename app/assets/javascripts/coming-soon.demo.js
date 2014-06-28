var handleCountdownTimer = function() {
    var austDay = new Date();
    austDay = new Date(austDay.getFullYear() + 1, 1 - 1, 26);
    $('#timer').countdown({until: austDay});
};

var ComingSoon = function () {
	"use strict";
    return {
        //main function
        init: function () {
            handleCountdownTimer();
        }
    };
}();