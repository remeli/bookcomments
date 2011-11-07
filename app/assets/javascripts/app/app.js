$(document).ready(function() {

    /* Use this js doc for all application specific JS */
    $(window).resize(function() {
        console.log($(window).width());
    });

    /* TABS --------------------------------- */
    /* Remove if you don't need :) */

    var tabs = $('dl.tabs');
    tabsContent = $('ul.tabs-content')

    tabs.each(function(i) {
        //Get all tabs
        var tab = $(this).children('dd').children('a');
        tab.click(function(e) {

            //Get Location of tab's content
            var contentLocation = $(this).attr("href")
            contentLocation = contentLocation + "Tab";

            //Let go if not a hashed one
            if (contentLocation.charAt(0) == "#") {

                e.preventDefault();

                //Make Tab Active
                tab.removeClass('active');
                $(this).addClass('active');

                //Show Tab Content
                $(contentLocation).parent('.tabs-content').children('li').css({
                    "display": "none"
                });
                $(contentLocation).css({
                    "display": "block"
                });

            }
        });
    });


    /* PLACEHOLDER FOR FORMS ------------- */
    /* Remove this and jquery.placeholder.min.js if you don't need :) */

    $('input, textarea').placeholder();

});

//search focus
$(document).ready(function() {
    $('input[type="text"]').addClass("idleField");
    $('input[type="text"]').focus(function() {
        $(this).removeClass("idleField").addClass("focusField");
        if (this.value == this.defaultValue) {
            this.value = '';
        }
        if (this.value != this.defaultValue) {
            this.select();
        }
    });
    $('input[type="text"]').blur(function() {
        $(this).removeClass("focusField").addClass("idleField");
        if ($.trim(this.value == '')) {
            this.value = (this.defaultValue ? this.defaultValue: '');
        }
    });
});