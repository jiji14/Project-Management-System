
/**
* Theme: Velonic - Responsive Bootstrap 4 Admin Dashboard
* Author: Coderthemes
* Sparkline chart
*/

!function($) {
    "use strict";

    var Sparkline = function() {};

    //
    Sparkline.prototype.init = function() {
        //various example of creating sparklines 

        //TODO: we should create separate method which generates different type of sparklines
        if ($.isFunction($.fn.sparkline)) {
            var myvalues = [10, 8, 5, 7, 4, 4, 7, 5, 2, 8, 3, 4, 5];
            var sidebargraph1 = [7, 6, 4, 7, 5, 3, 5, 7, 3, 4];
            var sidebargraph2 = [4, 7, 5, 5, 7, 3, 5, 7, 4, 2];

            $('.inlinesparkline').sparkline(myvalues, {
                type: 'line',
                width: '100%',
                height: '32',
                lineWidth: 2,
                lineColor: '#34c73b',
                fillColor: 'rgba(52, 199, 59, 0.5)',
                highlightSpotColor: '#34c73b',
                highlightLineColor: '#34c73b',
                spotRadius: 3,
            });

            /* The second argument gives options such as specifying you want a bar chart */
            $('.dynamicbar').sparkline(myvalues, {
                type: 'bar',
                barColor: '#3960d1',
                height: '32',
                barWidth: 5,
                barSpacing: 2
            });

            /* The second argument gives options such as specifying you want a bar chart */
            $('.dynamicbar-big').sparkline([8, 4, 1, 2, 6, 7, 1, 6, 2, 4, 3, 5, 6, 0, 3, 0, 4, 6, 5, 7, 6,9,0], {
                type: 'bar',
                barColor: '#3960d1',
                height: '32',
                barWidth: 7,
                barSpacing: 2
            });

            // Composite line charts, the second using values supplied via javascript
            $('#compositeline').sparkline([8, 4, 1, 2, 6, 7, 1, 6, 2, 4, 3, 5, 6, 0, 3, 0, 4, 6, 5, 7, 6], {
                fillColor: false,
                changeRangeMin: 0,
                chartRangeMax: 10,
                type: 'line',
                width: '100%',
                height: '32',
                lineWidth: 2,
                lineColor: '#3960d1',
                highlightSpotColor: '#6e8cd7',
                highlightLineColor: '#f13c6e',
                spotRadius: 4,
            });

            

            // Pie charts
            $('.sparkpie').sparkline([3, 4, 1, 2], {
                type: 'pie',
                width: '100%',
                height: '32',
                sliceColors: ['#3960d1', '#f13c6e', '#6e8cd7', '#dcdcdc'],
                offset: 0,
                borderWidth: 0,
                borderColor: '#00007f'
            });
            // Pie charts
            $('.sparkpie-big').sparkline([3, 4, 1, 2], {
                type: 'pie',
                width: '100%',
                height: '50',
                sliceColors: ['#1a2942', '#34c73b', '#6e8cd7', '#dcdcdc'],
                offset: 0,
                borderWidth: 0,
                borderColor: '#00007f'
            });


        }

    },
    //init
    $.Sparkline = new Sparkline, $.Sparkline.Constructor = Sparkline
}(window.jQuery),

//initializing 
function($) {
    "use strict";
    $.Sparkline.init()
}(window.jQuery);