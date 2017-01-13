$(document).ready(function() {
    $("input#add-participant").unbind("click").click(function() {
        if ($("input#usearch-box:last").val()) {
            $('#pform-list .participant-input:first').clone().appendTo('#pform-list').find('input#usearch-box').val('');
            $('#pform-error').html('<br/>');
        } else {
            $('#pform-error').html('<br/>You already have input boxes available!');
        }
    });
    
    // Fill in the shopping trip preview as input values change
    var previewVendor = document.getElementById('shopping_trip_vendor_name');
    var previewVendorOutput = document.getElementById('preview-vendor');
    previewVendor.oninput = function() {
        previewVendorOutput.innerHTML = (previewVendor.value) ?
                previewVendor.value : "Untitled shopping trip";
    };
    previewVendor.onpropertychange = previewVendor.oninput;
    
    var previewDate = document.getElementById('shopping_trip_purchase_date_purchased');
    var previewDateOutput = document.getElementById('preview-date');
    previewDate.oninput = function() {
        if (previewDate.value) {
            previewDateOutput.innerHTML = previewDate.value;
        } else {
            var today = new Date();
            var month = today.getMonth() + 1;
            if (month < 10) { month = '0' + month.toString(); }
            var day = today.getDate();
            if (day < 10) { day = '0' + day.toString(); }
            
            previewDateOutput.innerHTML = [today.getFullYear(), month, day].join('-');
        }
    };
    previewDate.onpropertychange = previewDate.oninput;
    
    var previewParticipantsOutput = document.getElementById('preview-participants');
    var currUsername = previewParticipantsOutput.innerText;
    // solo: currUsername.substring(currUsername.indexOf('(') + 1, currUsername.length - 1);
    participants.push(currUsername);
    // pids.push('<%= current_user.id %>'); I'm pretty sure we don't want this?
    
    function addParticipant(participant) {
        participants.push(participant);
        previewParticipantsOutput.innerHTML += '<br>' + participant;
    }
});
