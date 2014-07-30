var handleBootstrapWizards = function() {
	"use strict";
	$("#wizard").bwizard();
};

var FormWizard = function () {
	"use strict";
    return {
        //main function
        init: function () {
            handleBootstrapWizards();
        }
    };
}();