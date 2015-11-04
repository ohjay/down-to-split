function enableBananafication() {
    $('#bananafy-button').on('click', function(evt) {
        // Change a bunch of CSS attributes
        $('body').css({
            'background': 'url(/assets/bananas.jpg)',
            'color': '#ffffff'
        });
        
        $('#header-bar').css('opacity', 0.3);
        $('#footer-bar').css('opacity', 0.5);
        $('a:link').css('color', '#ffffff');
        $('a:visited').css('color', '#ffffff');
        $('.footer-overline').css('background', '#ffffff');
    });
}

$(document).ready(enableBananafication);
$(document).on('page:load', enableBananafication);
