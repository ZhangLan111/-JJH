$(function(){
 			/*导航点击下拉*/
            $(".tipnav").on("mouseenter",function(e){
                $(this).siblings().removeClass('active')
                $(this).addClass('active')
                e.stopPropagation()
            })

             $(".tipnav").on("mouseleave",function(e){
                $(this).removeClass('active')
            })
})