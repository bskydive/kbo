'use strict';

function copyToClipboard(text) {
	window.prompt("Скопируйте адрес почты безопасным способом: Ctrl+C, Enter", text);
}

function offsetResize() {

	//todo fix small bug:in small screen sizes navHeight changes after scroll at 3px
//	let navTopHeight = window.document.querySelector('#id-nav').style.height;
//	if (!navTopHeight) {
//		navTopHeight = parseInt(window.getComputedStyle(window.document.querySelector('#id-nav')).height) + 50;
//	}

	//let rowTagsHeight = window.document.querySelector('.c-portfolio-row-tags').style.height;
	let windowWidth = window.innerWidth;
	//var curXPos = $(document).body.scrollTop();
	//todo save scroll pos after resize

//	if (windowWidth >= 315) {
//		window.document.querySelector("#id-container-main").style.paddingTop = String(navTopHeight) + 'px';
//		window.document.querySelector(".c-portfolio-anchor-offset").style.top = '-' + String(navTopHeight) + 'px';
		//window.scrollTo(curXPos+50,0);
//	} else {
//		window.document.querySelector("#id-container-main").style.paddingTop = '0';
//		window.document.querySelector(".c-portfolio-anchor-offset").style.top = '-20px';
//	}

}

//function preventScrollFixed() {
//	var fixed = document.getElementById('id-nav');
//
//	fixed.addEventListener('touchmove', function (e) {
//
//		e.preventDefault();
//
//	}, false);
//}

function init() {

	offsetResize();
	window.addEventListener("resize", offsetResize);
//	preventScrollFixed();
}

window.addEventListener("load", init);

//
//    // Cache selectors
//    var lastId,
//        topMenu = $("#top-menu"),
//        topMenuHeight = topMenu.outerHeight()+15,
//    // All list items
//        menuItems = topMenu.find("a"),
//    // Anchors corresponding to menu items
//        scrollItems = menuItems.map(function(){
//            var item = $($(this).attr("href"));
//            if (item.length) { return item; }
//        }),
//        noScrollAction = false;
//
//// Bind click handler to menu items
//// so we can get a fancy scroll animation
//    menuItems.click(function(e){
//        var href = $(this).attr("href"),
//            offsetTop = href === "#" ? 0 : $(href).offset().top-topMenuHeight+1;
//        noScrollAction = true;
//        $('html, body').stop().animate({
//            scrollTop: offsetTop
//        },{
//            duration: 300,
//            complete: function() {
//                menuItems
//                    .parent().removeClass("active")
//                    .end().filter("[href=" + href +"]").parent().addClass("active");
//                setTimeout(function(){ noScrollAction = false; }, 10);
//            }
//        });
//        e.preventDefault();
//    });
//
//// Bind to scroll
//    $(window).scroll(function(){
//        if(!noScrollAction){
//            // Get container scroll position
//            var fromTop = $(this).scrollTop()+topMenuHeight;
//
//            // Get id of current scroll item
//            var cur = scrollItems.map(function(){
//                if ($(this).offset().top < fromTop)
//                    return this;
//            });
//            // Get the id of the current element
//            cur = cur[cur.length-1];
//            var id = cur && cur.length ? cur[0].id : "";
//
//            if (lastId !== id) {
//                lastId = id;
//                // Set/remove active class
//                menuItems
//                    .parent().removeClass("active")
//                    .end().filter("[href=#"+id+"]").parent().addClass("active");
//            }
//        }
//    });



