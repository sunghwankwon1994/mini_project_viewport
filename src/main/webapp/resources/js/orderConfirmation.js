$(".branch").hover(function(){$(this).find('img').css({"border": "1px solid #000","transition":"0.7s"
})},function(){
    $(this).find('img').css("border", "1px solid #fff")
})