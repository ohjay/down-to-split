$(document).ready(function() {
    $("#usearch-box").bind("keyup", function() {
        var form = $("#usearch-form");
        var formData = form.serializeArray()[0]['value'];
        
        if (formData) {
            $.ajax({
                url: "/live_search",
                type: "GET",
                data: {'q': formData },
                success: function(response) {
                    $("#usearch-results").html(response);
                },
                error: function(response) {
                    $("#usearch-results").html("AJAX error!");
                },
            });
        } else {
            $("#usearch-results").html("No users found.");
        }
    }); 
    
    $(".check_boxes").change(function() {
        if ($(this).is(':checked')) {
            // Add user to "checked" list
        } else {
            // Remove user from "checked" list if he/she is on it
        }
    });
});


