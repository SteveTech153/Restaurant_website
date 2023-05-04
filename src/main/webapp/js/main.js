(function ($) {
    "use strict";

    // Spinner
    var spinner = function () {
        setTimeout(function () {
            if ($('#spinner').length > 0) {
                $('#spinner').removeClass('show');
            }
        }, 1);
    };
    spinner();

    
    
    // Initiate the wowjs
    new WOW().init();


    // Sticky Navbar
    $(window).scroll(function () {
        if ($(this).scrollTop() > 45) {
            $('.navbar').addClass('sticky-top shadow-sm');
        } else {
            $('.navbar').removeClass('sticky-top shadow-sm');
        }
    });
    
    
    // Dropdown on mouse hover
    const $dropdown = $(".dropdown");
    const $dropdownToggle = $(".dropdown-toggle");
    const $dropdownMenu = $(".dropdown-menu");
    const showClass = "show";
    
    $(window).on("load resize", function() {
        if (this.matchMedia("(min-width: 992px)").matches) {
            $dropdown.hover(
            function() {
                const $this = $(this);
                $this.addClass(showClass);
                $this.find($dropdownToggle).attr("aria-expanded", "true");
                $this.find($dropdownMenu).addClass(showClass);
            },
            function() {
                const $this = $(this);
                $this.removeClass(showClass);
                $this.find($dropdownToggle).attr("aria-expanded", "false");
                $this.find($dropdownMenu).removeClass(showClass);
            }
            );
        } else {
            $dropdown.off("mouseenter mouseleave");
        }
    });
    
    
    // Back to top button
    $(window).scroll(function () {
        if ($(this).scrollTop() > 300) {
            $('.back-to-top').fadeIn('slow');
        } else {
            $('.back-to-top').fadeOut('slow');
        }
    });
    $('.back-to-top').click(function () {
        $('html, body').animate({scrollTop: 0}, 1500, 'easeInOutExpo');
        return false;
    });


    // Facts counter
    $('[data-toggle="counter-up"]').counterUp({
        delay: 10,
        time: 2000
    });


    // Modal Video
    $(document).ready(function () {
        var $videoSrc;
        $('.btn-play').click(function () {
            $videoSrc = $(this).data("src");
        });
        console.log($videoSrc);

        $('#videoModal').on('shown.bs.modal', function (e) {
            $("#video").attr('src', $videoSrc + "?autoplay=1&amp;modestbranding=1&amp;showinfo=0");
        })

        $('#videoModal').on('hide.bs.modal', function (e) {
            $("#video").attr('src', $videoSrc);
        })
    });


    // Testimonials carousel
    $(".testimonial-carousel").owlCarousel({
        autoplay: true,
        smartSpeed: 1000,
        center: true,
        margin: 24,
        dots: true,
        loop: true,
        nav : false,
        responsive: {
            0:{
                items:1
            },
            768:{
                items:2
            },
            992:{
                items:3
            }
        }
    });
    
})(jQuery);
const map1 = new Map();
let size = parseInt(document.querySelector("#size"),10);

for (let i = 1; i <= size; i++){
    document.querySelector("#plus"+i).addEventListener("click", function () {
        // increase value
        var value = parseInt(document.querySelector("#qty"+i).innerHTML, 10);
        value = isNaN(value) ? 0 : value;
        value++;
        document.querySelector("#qty"+i).innerHTML = value;
        map1.set(document.querySelector("#item_name"+i).innerHTML, value);
    });    
    document.querySelector("#minus"+i).addEventListener("click", function () {
            // decrease value
            var value = parseInt(document.querySelector(".qty"+i).innerHTML, 10);
            value = isNaN(value) ? 0 : value;
            value < 1 ? value = 1 : '';
            value--;
            document.querySelector("#qty"+i).innerHTML = value;
            map1.set(document.querySelector("#item_name"+i).innerHTML, value);
        });
}

document.querySelector("#submit_btn").addEventListener("click", function () {
    let str = "";
    map1.forEach((value, key) => {
        str += key + ":" + value + " ";
    });
    document.querySelector("#hidden").value = str;
    alert(str);
    //document.querySelector("#order_form").submit();
});

function clearRow(id){
	document.querySelector("#itemname"+id).value="";
	document.querySelector("#price"+id).value="";
	document.querySelector("#type"+id).value="";
	document.querySelector("#description"+id).value="";
}

 function addItem() {
	let hiddenInd = Number( document.querySelector("#hiddenInd").value );
	document.querySelector("#hiddenInd").value = hiddenInd+1;
	 document.querySelector("#tr"+hiddenInd.toString()).removeAttribute("hidden");
	 //hiddenInd++;
};
