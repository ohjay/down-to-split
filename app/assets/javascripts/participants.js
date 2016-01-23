$(document).ready(function() {
    $("input#add-participant").unbind("click").click(function() {
        if ($("input#usearch-box:last").val()) {
            $('#pform-list .participant-input:first').clone().appendTo('#pform-list').find('input#usearch-box').val('');
            $('#pform-error').html('<br/>');
        } else {
            $('#pform-error').html('<br/>You already have input boxes available!');
        }
    });
});
