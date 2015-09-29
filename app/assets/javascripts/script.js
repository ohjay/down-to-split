$(document).ready(function() {
    $('#bananafy-button').click(function() {
        // Change a bunch of CSS attributes
        $('body').css({
            'background': 'url(/assets/bananas.jpg)',
            'color': '#ffffff'
        });
        
        $('#header-bar').css('opacity', 0.3);
        $('a:link').css('color', '#ffffff');
        $('a:visited').css('color', '#ffffff');
        $('.footer-overline').css('background', '#ffffff');
    });
});
