
$(document).ready(function(){
	/* инициализация функций */
	popUps();
	if($(window).width() > 500){
		catalog_mob(300);
	}else{
		catalog_mob(150);
	}

	$(window).resize(function(){
		if($(window).width() > 500){
			catalog_mob(300);
		}else{
			catalog_mob(150);
		}
	});



	if($(window).width() > 767){
	   prodTab();
	}

	if($(window).width() < 768){
	// page init
		initAccordion();
	}
	$(window).resize(function(){
		prodTab();
		initAccordion();
	});




	$('.exit_popup li.exit_account a').click(function(){
		$('.popup_holder .bg, .popup_holder .close_popup').click();
	});

	$('.regist_tab .radiolist_input_holder').click(function(){
		var index = $(this).index();
		$(this).closest('.regist_tab_holder').find('form').removeClass('active');
		$(this).closest('.regist_tab_holder').find('form').eq(index).addClass('active');
	});

	$(".range_price_slider").slider({
		range: true,
		min: 0,
		max: 999,
		values: [ 75, 300 ]
	});

	$('.history_orders_list>li .short_description_more').click(function(){
		var parent = $(this).closest('li');
		parent.toggleClass('active');
		parent.hasClass('active') ? parent.children('ul').slideDown() : parent.children('ul').slideUp();

		return false;
	});

	$('.category_list li a').matchHeight();
	$('.contacts_page_wrapper .contacts_list li').matchHeight();
	$('.catalog_products_list li .products_holder').matchHeight();

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
		// autoplay: true,
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

	function catalog_mob(td_width){
		var countTd = $('.catalog_mob_wrapper table tr:first-child td').length;
		$('.catalog_mob_wrapper table').css('width', countTd * td_width);

		$('.catalog_mob_wrapper table td').css('width', td_width);

		$('.catalog_mob_wrapper table tr.title').each(function(){
			$(this).find('td').attr('colspan', countTd)
		});

		$(".catalog_mob_wrapper").scroll(function(){
			$(this).find('tr.title td i').css('padding-left', $(this).scrollLeft())
		});
	}


	
	$('.order_tab_nav li').click(function(){
		var index = $(this).index();

		$('.order_tab, .order_tab_nav li').removeClass('active');
		$(this).addClass('active');
		$('.order_tab').eq(index).addClass('active');
	});
	$('.trigger_submit_btn').click(function(){
		$('.final_order_submit').trigger('click');
		return false;
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


	$('header .top_management a.lang_btn').on('click', function(){
		$(this).siblings('ul').toggleClass('open');
		$(this).siblings('ul').hasClass('open') ? $(this).siblings('ul').slideDown(200) : $(this).siblings('ul').slideUp(300);
		return false;
	});

	$('.type_sort_view li').click(function(){
		$('.type_sort_view li').removeClass('active');
		$(this).addClass('active');
		if($(this).hasClass('col')){
			$('.catalog_products_list').removeClass('catalog_products_list_row');
		}else{
			$('.catalog_products_list').addClass('catalog_products_list_row');
		}
		$('.catalog_products_list li .products_holder').matchHeight();
		return false;
	});
	$(document).on('click', function(e) {
		if (!$(e.target).closest(".parameters_filter_holder.active").length && (!$(e.target).closest(".parameters_btn a").length)){
			$('.parameters_filter_holder').removeClass('active');
		}
	});
	$('.parameters_btn a').click(function(){
		$('.parameters_filter_holder').toggleClass('active');
	});

	$('.type_sort_list_block .selected').click(function(){
		$(this).toggleClass('active');
		$(this).hasClass('active') ? $(this).next().slideDown() : $(this).next().slideUp();
	});
	

	function popUps(){
		$('[data-popup]').on('click',function(){
			var _popupUrl = $(this).data('popup');
			$('.popup_holder').removeClass('active').filter(_popupUrl).addClass('active');
			return false;
		});
		$('.popup_holder .bg, .popup_holder .close_popup').on('click',function(){
			$('.popup_holder').removeClass('active');
			return false;
		});
	};

	$('.personal_office_nav li').click(function(){
		var _this = $(this);
		var this_data = $(this).data('tab-name') || 1;
		$('.personal_office_tabs_holder .personal_office_tab').each(function(){
			if($(this).data('tab-office') == this_data){
				$('.personal_office_tabs_holder .personal_office_tab, .personal_office_nav li').removeClass('active');
				$(this).addClass('active');
				_this.addClass('active');
			}
		});
	});



});


function prodTab(){
	if($(window).width() < 768){
		return false;
	}
	$('.tab-content .slide').removeAttr('style');
	$('ul.tabset').on('click', 'li:not(.active)', function() {
        $(this)
            .addClass('active').siblings().removeClass('active')
            .closest('div.tab-holder').find('div.tab-content').removeClass('active').eq($(this).index()).addClass('active');
    });
}


// accordion menu init
function initAccordion() {
	if($(window).width() > 767){
		return false;
	}
    jQuery('.tab-holder').slideAccordion({
        opener: '>a.opener',
        slider: '>div.slide',
        animSpeed: 300,
        buttons: '.btns'
    });
}

/*
 * jQuery Accordion plugin
 */
;(function($){
    $.fn.slideAccordion = function(opt){
        // default options
        var options = $.extend({
            addClassBeforeAnimation: false,
            activeClass:'activeSlide',
            opener:'.opener',
            slider:'.slide',
            animSpeed: 300,
            collapsible:true,
            event:'click'
        },opt);

        return this.each(function(){
            // options
            var accordion = $(this);
            var items = accordion.find(':has('+options.slider+')');

            items.each(function(){
                var item = $(this);
                var opener = item.find(options.opener);
                var slider = item.find(options.slider);

                opener.bind(options.event, function(e){
                    if(!slider.is(':animated')) {
                        if(item.hasClass(options.activeClass)) {
                            if(options.collapsible) {
                                bindButton(-1);
                                slider.slideUp(options.animSpeed, function(){
                                    hideSlide(slider);
                                    item.removeClass(options.activeClass);
                                });
                            }
                        } else {
                            // show active
                            var levelItems = item.siblings('.'+options.activeClass);
                            var sliderElements = levelItems.find(options.slider);
                            item.addClass(options.activeClass);
                            showSlide(slider).hide().slideDown(options.animSpeed);

                            // collapse others
                            bindButton(1)
                            sliderElements.slideUp(options.animSpeed, function(){
                                levelItems.removeClass(options.activeClass);
                                hideSlide(sliderElements);
                            });
                        }
                    }
                    e.preventDefault();
                });
                if(item.hasClass(options.activeClass)) showSlide(slider); else hideSlide(slider);
            });
            if(options.buttons) var buttons = jQuery(options.buttons);

            function bindButton(index) {
                index == -1 ? buttons.slideDown(options.animSpeed) :  buttons.slideUp(options.animSpeed);
            }
            if(options.buttons) {
                var index = items.filter('.' + options.activeClass).length > 0 ? 1 : -1;
                bindButton(index)
            }
        });
    };

    // accordion slide visibility
    var showSlide = function(slide) {
        return slide.css({position:'', top: '', left: '', width: '' });
    };
    var hideSlide = function(slide) {
        return slide.show().css({position:'absolute', top: -9999, left: -9999, width: slide.width() });
    };
}(jQuery));