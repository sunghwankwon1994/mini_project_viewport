/**
 * 
 */

//${pageContext.request.contextPath}/resources/

$('.collapse').on('shown.bs.collapse', function () { 
    var target = $("[href='#"+$(this).prop("id")+"']");
    target.find('img').attr("src", "/viewport_mini_web/resources/image/Polygon1.png");
 });


 $('.collapse').on('hide.bs.collapse', function () { 
    var target = $("[href='#"+$(this).prop("id")+"']");
    target.find('img').attr("src", "/viewport_mini_web/resources/image/Polygon2.png");
 });

