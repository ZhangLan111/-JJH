$(function(){
    var sliderwrap = $(".list");
    var lilen = sliderwrap.find("img").length;
    var start = 0;
    var wrapWid = 2970;
    var btn = $(".slideimg .buttons span")
    var wrap = $(".slideimg")
    var leftrow = $(".slideimg .prev")
    var rightrow = $(".slideimg .next")
    var stoplide ;
    
     /*移动函数*/
    function animaterun(_index){
      var endpostion = _index*(-990)+"px";
      btn.removeClass('on');
      btn.eq(_index).addClass('on')
      sliderwrap.animate({"left":endpostion},1000);
    }

    /*轮播定时器*/
    function timerun(){
        clearInterval(stoplide)
        stoplide = setInterval(function(){
            if(start==3){
                start = 0
            }else if(start==-1){
                start = 2
            }
            animaterun(start)
            start = start+1;
        },3000)
    }
   
    /*事件绑定*/
    wrap.on("mouseover",function(){
        clearInterval(stoplide)
    })

    wrap.on("mouseout",function(){
         timerun()
    })

    leftrow.on("click",function(){
        clearInterval(stoplide)
        start = start-1;
        if(start==-1){
            start = 2
        }
        animaterun(start)
    })

    rightrow.on("click",function(){
        clearInterval(stoplide)
        start = start+1;
        if(start==3){
            start = 0
        }
        animaterun(start)
    })

    btn.on("click",function(){
         clearInterval(stoplide)
         start = $(this).index()
         animaterun(start)
    })
    timerun()
})


function autoScroll(obj, ul_bz){
$(obj).find(ul_bz).animate({
marginTop : "-20px"
},500,function(){
$(this).css({marginTop : "0px"}).find("li:first").appendTo(this);
});
}
setInterval('autoScroll("#oDiv", "#oUl")',5000)


