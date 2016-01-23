$(document).ready(function() {
    $("#vsearch-box").bind("keyup", function() {
        var form = $("#vsearch-form");
        var formData = form.serializeArray()[0]['value'];
        
        if (formData) {
            $.ajax({
                url: "/live_search",
                type: "GET",
                data: {'q': formData },
                success: function(response) {
                    $("#vsearch-results").html(response);
                },
                error: function(response) {
                    $("#vsearch-results").html("AJAX error!");
                },
            });
        } else {
            $("#vsearch-results").html("No vendors found.");
        }
    }); 
});
