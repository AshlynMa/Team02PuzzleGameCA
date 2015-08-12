//Function that catches the current url and make sure the menu item of that url is highlighted/selected.

function loadcurrentmenu() {

var str = location.href.toLowerCase();
    $("#menu li a").each(function () {
        if (str.indexOf($(this).attr("href").toLowerCase()) > -1) {
            $("li.current_page_item").removeClass("current_page_item");
            $(this).parent().addClass("current_page_item");
        }
    });
    $("li.current_page_item").parents().each(function () {
        if ($(this).is("li")) {
            $(this).addClass("current_page_item");
        }
    });
}