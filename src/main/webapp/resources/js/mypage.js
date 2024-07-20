/**
 * 
 */
$(document).ready(function() {
    var url = new URL(window.location.href);
    var activeTab = url.searchParams.get("tab");
    
    if (activeTab) {
        $('.list-group-item-action').removeClass('active'); 
        $('a[href="#' + activeTab + '"]').tab('show');       
        $('a[href="#' + activeTab + '"]').addClass('active');
    }
});