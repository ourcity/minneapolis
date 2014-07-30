function calculateDivider() {
    var dividerValue = 4;
    if ($(this).width() <= 480) {
        dividerValue = 1;
    } else if ($(this).width() <= 767) {
        dividerValue = 2;
    } else if ($(this).width() <= 980) {
        dividerValue = 3;
    }
    return dividerValue;
}
var handleIsotopesGallery = function() {
	"use strict";
	$(window).load(function() {
		var $container = $('#gallery');
		var dividerValue = calculateDivider();
		$container.isotope({
			resizable: false,
			masonry: {
				columnWidth: $container.width() / dividerValue
			}
		});
		
		$(window).smartresize(function() {
			var dividerValue = calculateDivider();
			
			$container.isotope({
				masonry: { columnWidth: $container.width() / dividerValue }
			});
		});
		
		var $optionSets = $('#options .gallery-option-set'),
		$optionLinks = $optionSets.find('a');
		
		$optionLinks.click( function(){
			var $this = $(this);
			if ($this.hasClass('active')) {
				return false;
			}
			var $optionSet = $this.parents('.gallery-option-set');
			$optionSet.find('.active').removeClass('active');
			$this.addClass('active');
		
			var options = {};
			var key = $optionSet.attr('data-option-key');
			var value = $this.attr('data-option-value');
				value = value === 'false' ? false : value;
				options[ key ] = value;
			$container.isotope( options );
			return false;
		});
	});
};


var Gallery = function () {
	"use strict";
    return {
        //main function
        init: function () {
            handleIsotopesGallery();
        }
    };
}();