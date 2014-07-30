var handleFormWysihtml5 = function () {
	"use strict";
	$('#wysihtml5').wysihtml5();
};

var FormWysihtml5 = function () {
	"use strict";
    return {
        //main function
        init: function () {
            handleFormWysihtml5();
        }
    };
}();