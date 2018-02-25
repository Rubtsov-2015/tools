$(document).ready(function(){
	/* инициализация функций */
	// mobile_menu_height();
	/* описание функций */
	$('.main_carousel').slick({
		slidesToShow: 1,
		dots: true,
	});
	$('.brands_carousel').slick({
		slidesToShow: 3,
	});

	$('.products_carousel.variable_carousel').on('init', function() {
		setTimeout(function(){
			$('.products_carousel li .products_carousel_holder').matchHeight();
		}, 100)
	});
	$('.products_carousel').slick({
		variableWidth: true,
		autoplay: true,
		autoplaySpeed: 4000,
		responsive: [
			{
				breakpoint: 1024,
				settings: {
					slidesToShow: 4,
					variableWidth: false,
				}
			},{
				breakpoint: 960,
				settings: {
					slidesToShow: 3,
					variableWidth: false,
				}
			},{
				breakpoint: 700,
				settings: {
					slidesToShow: 2,
					variableWidth: false,
				}
			}
		]
	});

	$(".phone").mask("+38 - (999)-999-99-99",{
		placeholder: "_"
	});


	$('.middle_row .search_btn a').click(function(){
		$(this).toggleClass('open');
		$(this).hasClass('open') ? $('.header_search_form').slideDown(300) : $('.header_search_form').slideUp();
	});
	$('.middle_row .burger_menu').click(function(){
		$('header nav').slideDown(200);
	});
	$('.close_mob_menu').click(function(){
		$('header nav').slideUp(200);
	});

	$('.addmenu_has_drop>a').click(function(){
		$(this).closest('li').toggleClass('open');
		$(this).closest('li').hasClass('open') ? $(this).closest('li').children('ul').slideDown(300) : $(this).closest('li').children('ul').slideUp();
		return false;
	});

	$('header .top_management a.lang_btn').click(function(){
		$(this).siblings('ul').toggleClass('open');
		$(this).siblings('ul').hasClass('open') ? $(this).siblings('ul').slideDown(200) : $(this).siblings('ul').slideUp(300);
		return false;
	});

	// function mobile_menu_height(){
	// 	var minus_height = $('header nav .language_list').height() + $('header nav .main_menu').height() + $('.mobile_user_actions').height();
	// 	console.log(minus_height)
	// 	$('.addmenu_wrapper .addmenu_list').css('height','calc(100% - '+minus_height+')')
	// }
	

});

/* подключение плагинов */