$(document).ready(function() {
    $("input#add-participant").unbind("click").click(function() {
        if ($("input#usearch-box").val()) {
            $('#pform-list .participant-input').clone().appendTo('#pform-list');
            $('#pform-error').html('<br/>');
        } else {
            $('#pform-error').html('<br/>You already have input boxes available!');
        }
        
        console.log(document.getElementById("usearch-box").value);
    });
});
