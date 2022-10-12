// JQUERY
(function($){

    var pressEvent = ('ontouchstart' in window) ? 'touchstart' : 'mousedown';

  // карусель недавних отчетов на главной
  var $recentReports = $('#recent-reports-carousel'),
      $recentReportsPrev = $('#reports-carousel-nav-prev'),
      $recentReportsNext = $('#reports-carousel-nav-next');

  $recentReports.owlCarousel({
    dots: false,
    margin: 30,
    responsive:{
      0:{
        items: 1,
      },
      720:{
        items: 2,
      },
      1020:{
        items: 3,
      }
    }
  });

  $recentReportsNext.on(pressEvent, function() {
      $recentReports.trigger('next.owl.carousel');
  });

  $recentReportsPrev.on(pressEvent, function() {
      $recentReports.trigger('prev.owl.carousel');
  });

  // карусель недавних статей на главной
  var $recentArticles = $('#recent-articles-carousel'),
      $recentArticlesPrev = $('#articles-carousel-nav-prev'),
      $recentArticlesNext = $('#articles-carousel-nav-next');

  $recentArticles.owlCarousel({
    dots: false,
    margin: 30,
    responsive:{
      0:{
        items: 1,
      },
      720:{
        items: 2,
      },
      1020:{
        items: 3,
      }
    }
  });

  $recentArticlesNext.on(pressEvent, function() {
      $recentArticles.trigger('next.owl.carousel');
  });

  $recentArticlesPrev.on(pressEvent, function() {
    $recentArticles.trigger('prev.owl.carousel');
  });

  //////////////////
  // MASKED INPUT //
  //////////////////

  $('#phone-mask').mask("99999999999?9999",{placeholder:"",autoclear: false});
  $('#stop-autopayment-bank_card-input-six').mask("999999",{placeholder:"",autoclear: false});
  $('#stop-autopayment-bank_card-input-four').mask("9999",{placeholder:"",autoclear: false});

  ///////////////
  // YM BUTTON //
  ///////////////

  $('.ym-button').on('click', function(){
    $('.yandex-money-payment-frame').toggleClass('open');
  })

  //////////////////////
  // STOP AUTOPAYMENT //
  //////////////////////

  function stopAutoPaymentRadio(){
    if($('.stop-autopayment-radio:checked').val() == 'yandex_money'){
      $('.stop-autopayment-yandex_money').show();
      $('.stop-autopayment-bank_card').hide();
    }else{
      $('.stop-autopayment-bank_card').show();
      $('.stop-autopayment-yandex_money').hide();
    }
  }

  stopAutoPaymentRadio();

  $('.stop-autopayment-radio').on('change', function(){
    stopAutoPaymentRadio();
    if($('.stop-autopayment-radio:checked').val() == 'yandex_money'){
      checkSubmitDisabledYandex();
    }else{
      checkSubmitDisabledCard();
    }
  });
  $('.cancel-regular-payment').on('click',function(){
    $('.stop-autopayment-wrapper').css({display: 'flex'});
  });

	$('.stop-autopayment-wrapper').on('click', function(e){
		var div = $(".stop-autopayment-box");
		if (!div.is(e.target) && div.has(e.target).length === 0) {
			$('.stop-autopayment-wrapper').hide();
		}
	});

  function checkSubmitDisabledYandex(){
    if($('#stop-autopayment-yandex_money-input').val().length < 10){
      $('.stop-autopayment-submit').prop('disabled',true);
    }else{
      $('.stop-autopayment-submit').prop('disabled',false);
    }
  }

  function checkSubmitDisabledCard(){
    if($('#stop-autopayment-bank_card-input-six').val().length < 6 || $('#stop-autopayment-bank_card-input-four').val().length < 4){
      $('.stop-autopayment-submit').prop('disabled',true);
    }else{
      $('.stop-autopayment-submit').prop('disabled',false);
    }
  }

  if($('.stop-autopayment-radio:checked').val() == 'yandex_money'){
    checkSubmitDisabledYandex();
  }else if($('.stop-autopayment-radio:checked').val() == 'bank_card'){
    checkSubmitDisabledCard();
  }

  $('.response-popup-container').on('click',function(){
    $('.response-popup-container').hide();
  });

  $('#stop-autopayment-yandex_money-input').on('input', checkSubmitDisabledYandex);
  $('#stop-autopayment-bank_card-input-six').on('keyup', checkSubmitDisabledCard);
  $('#stop-autopayment-bank_card-input-four').on('keyup', checkSubmitDisabledCard);

  ////////////////////
  // МОБИЛЬНОЕ МЕНЮ //
  ////////////////////

  $burgerMenu = $('.burger-menu');
  $burgerOpen = $('.burger-menu-button');
  $burgerClose = $('.burger-menu-close');

  $burgerOpen.on(pressEvent, function(){
    $burgerMenu.addClass('open');
  });

  $burgerClose.on(pressEvent, function(){
    $burgerMenu.removeClass('open');
  });

  /////////////////
  // ВИДЕО ПОПАП //
  /////////////////

  $videoOpen = $('.popup-video-open');
  $popUpWrapper = $('#popup-wrapper');
  $popUpClose = $('#popup-close');

  $popUpVideo = $('.popup-video');

  $videoOpen.on('click', function(){
    $popUpWrapper.show();
    var videoID = $(this).data('video');
    $popUpVideo.html('<iframe style="width: 70vw; height: 40vw" src="https://www.youtube.com/embed/'+ videoID +'" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>');
  });

  $popUpClose.on(pressEvent, function(){
    $popUpWrapper.hide();
  });

  /////////////////////////////
  // СКРИПТЫ СТРАНИЦЫ ПОМОЩИ //
  /////////////////////////////

  function changePayContent(jq){
    if(jq.val() == 'MONTHLY'){
      $('#requisites, #other').hide();
      $('.for-once').hide();
      $('.regular-payment').show();
      $('#save_payment_method').val('true');
    }else if(jq.val() == 'ONCE'){
      $('#requisites, #other').show();
      $('.for-once').show();
      $('.regular-payment').hide();
      $('#save_payment_method').val('false');
    }
  }

  function changePayWay(jq){
    $('#payment_method_data').val(jq.val());
    if($('#payment_method_data').val() == 'alfabank' || $('#payment_method_data').val() == 'sberbank'){
      $('#confirmation_type').val('external');
    }else{
      $('#confirmation_type').val('redirect');
    }
  }

  function donateVal(jq){
    $('.pay-submit').val('Пожертвовать ' + jq.val() + ' р.');
    $("#amount_value").val(jq.val());
  }

  function addFields(){
    if($('#payment_method_data').val() == 'alfabank'){
      $('.pay-alphaclick-logon').css({display: 'flex'});
    }else{
      $('.pay-alphaclick-logon').css({display: 'none'});
    }

    if($('#payment_method_data').val() == 'qiwi' || $('#payment_method_data').val() == 'sberbank'){
      $('.pay-phone-number').css({display: 'flex'});
    }else{
      $('.pay-phone-number').css({display: 'none'});
    }
  }

  function setDisabledPayNumber(){
    if($('#payment_method_data').val() == 'sberbank' || $('#payment_method_data').val() == 'qiwi'){
      if($('#phone_number').val().length < 11){
        $('.pay-submit').prop('disabled', true);
      }else{
        $('.pay-submit').prop('disabled', false);
      }
    }
  }

  function setDisabledPayAlpha(){
    if($('#payment_method_data').val() == 'alfabank'){
      if($('#alphaclick_login').val().length < 3){
        $('.pay-submit').prop('disabled', true);
      }else{
        $('.pay-submit').prop('disabled', false);
      }
    }
  }

  function setEnablePay(){
    if($('#payment_method_data').val() != 'alfabank' && $('#payment_method_data').val() != 'sberbank' && $('#payment_method_data').val() != 'qiwi'){
      $('.pay-submit').prop('disabled', false);
    }
  }

  function checkAmount(){
    if(Number($('#amount_value').val()) == 0 || Number($('#amount_value').val()) == NaN){
      $('.pay-submit').prop('disabled', true);
    }else{
      $('.pay-submit').prop('disabled', false);
    }
  }

  changePayContent($('.pay-variant input:checked'));
  changePayWay($('.pay-way input:checked'));
  donateVal($('.pay-count input:checked'));
  addFields();
  setDisabledPayNumber();
  setDisabledPayAlpha();
  setEnablePay();
  checkAmount();

  $('.pay-variant').on('change', 'input', function(){
    changePayContent($(this));
    $('.pay-way').eq(0).click();
    setDisabledPayNumber();
    setDisabledPayAlpha();
  });

  $('.pay-way').on('change', 'input', function(){
    changePayWay($(this));
    addFields();
    setDisabledPayNumber();
    setDisabledPayAlpha();
    setEnablePay();
  });

  $('.pay-count').on('change input', 'input', function(){
    donateVal($(this));
    checkAmount();
  });

  $('.other-pay-count').on(pressEvent, function(){
    setTimeout(function(){
      $('.other-pay-input').focus();
    }, 100);
  });

  $('.other-pay-input').on('input', function(){
    $('.pay-submit').val('Пожертвовать ' + $(this).val() + ' р.');
    $('.other-pay-count input[type="radio"]').val($(this).val());
    checkAmount();
  });

  $('.pay-phone-number input').on('change keyup', function(){
    $('#phone_number').val($('.pay-phone-number input').val());
    setDisabledPayNumber();
  });

  $('.pay-alphaclick-logon input').on('change input', function(){
    $('#alphaclick_login').val($('.pay-alphaclick-logon input').val());
    setDisabledPayAlpha();
  });

////////////////////////
// AJAX ЗАГРУЗИТЬ ЕЩЕ //
////////////////////////

  var $loadMoreButton = $('#load-more');

  $loadMoreButton.on(pressEvent, function(){

    $(this).text('Загружаю...');

    var tags = [];
    var $checkedTags = $sortingForm.find('input[name="tag[]"]:checked');
    $checkedTags.each(function(i,e){
      tags.push($(e).val());
    });

    var data = {
			'action': 'loadmore',
			'query': posts,
			'page' : currentPage,
      'style_count' : styleCount,
      'post_type' : postType,
      'tag' : tags,
      'relevance' : $sortingForm.find('input[name="relevance"]:checked').val()
		};

    $.ajax({
			url:url + '/wp-admin/admin-ajax.php', // обработчик
			data:data, // данные
			type:'POST', // тип запроса
			success:function(data){
				if( data ) {
					$loadMoreButton.text('Загрузить ещё'); // восстанавливаем текст кнопки
          $('.posts').append(data); // вставляем новые посты
					currentPage++; // увеличиваем номер страницы на единицу
					if (currentPage == maxPages) $loadMoreButton.hide(); // если последняя страница, удаляем кнопку
				} else {
					$loadMoreButton.hide(); // если мы дошли до последней страницы постов, скроем кнопку
				}
			}
		});
    return false;

  });

  /////////////////////////////
  // AJAX СОРТИРОВКА ЗАПИСЕЙ //
  /////////////////////////////

    var $sortingForm = $('#sorting');
    var $sortingSubmit = $('.sort-radio, .tag-checkbox');

    $sortingSubmit.on('change', 'input', function(e){

      var $filter = $sortingForm;
      var currentPostsCount = postsPerPage * currentPage;

    	$.ajax({
    		url: $filter.attr('action') + '/wp-admin/admin-ajax.php',
    		data: $filter.serialize() + '&posts_per_page=' + currentPostsCount,
    		type: $filter.attr('method'),
    		beforeSend:function(xhr){
    			$('.posts').css({opacity: '.2'});
    		},
    		success:function(data){
    			$('.posts').css({opacity: '1'});
    			$('.posts').html(data);
          maxPages <= 1 ? $loadMoreButton.hide() : $loadMoreButton.show();
    		}
    	});
    	return false;

    });

  /////////////////////////////////////
  // AJAX СЧЕТЧИК СКАЧИВАНИЙ ДОКЛАЛА //
  /////////////////////////////////////

  $downLoadButtons = $('.download-button');

  $downLoadButtons.on(pressEvent, function(){

    var $url = $(this).data('site');
    var postID = $(this).data('post-id');

    $.ajax({
  		url: $url + '/wp-admin/admin-ajax.php',
  		data: 'action=download_counter' + '&post_id=' + postID,
  		type: 'POST',
  		success:function(data){
  			$('#download-count').text(data);
  		}
  	});
//  	return false;

  });

  /////////////////////////
  // AJAX EMAIL ПОДПИСКА //
  /////////////////////////

  $footerMailingForm = $('.footer-mailing-form');
  $subscribeSubmit = $('.footer-mailing-submit');

  $subscribeSubmit.on('click', function(e){
    e.preventDefault();

    $.ajax({
      url: $footerMailingForm.data('url') + '/wp-admin/admin-ajax.php',
      data: $footerMailingForm.serialize(),
      type: $footerMailingForm.attr('method'),
      beforeSend:function(xhr){
        $('.footer-mailing-input').val('');
      },
      success:function(data){
        $('.mailing-popup').show();
        if(data == 'success'){
          $('.mailing-popup-title').text('Осталось всего ничего!');
          $('.mailing-popup-subtitle').text('Через пару минут на указанный адрес придет ссылка. Перейдите по ней, чтобы подтвердить подписку.');
        }else{
          $('.mailing-popup-title').text('Произошла ошибка');
          $('.mailing-popup-subtitle').text('Скорее всего, вы уже оформили подписку, но не подтвердили ее по почте.');
        }
        setTimeout(function(){
          $('.mailing-popup').hide();
        },7000);
      },
      error:function(a,b,c){
        console.log(b);
      }
    });
    return false;

  });

  //////////////////
  // AJAX PAYMENT //
  //////////////////

  $paySubmit = $('.pay-submit');
  $siteUrl = $('.pay-money input[name="site_url"]').val();

  $paySubmit.on('click', function(e){
    e.preventDefault();

    var data = {
      amountValue: $('#amount_value').val(),
      paymentMethodData: $('#payment_method_data').val(),
      savePaymentMethod: $('#save_payment_method').val(),
      confirmationType: $('#confirmation_type').val(),
      phoneNumber: $('#phone_number').val(),
      alphaClickLogin: $('#alphaclick_login').val(),
    }

    $.ajax({

      url: $siteUrl + '/wp-admin/admin-ajax.php',
      data: 'action=payment&request=' + JSON.stringify(data),
      type: 'POST',
      beforeSend:function(xhr){
        $paySubmit.addClass('process');
        $paySubmit.prop('disabled',true);
      },
      success:function(data){
        $paySubmit.removeClass('process');
        // console.log(data);
        var responseData = JSON.parse(data);
        console.log(responseData);
        if(responseData.failed){
          $('.response-popup-container').show();
          $('.response-popup-status').text('Произошла ошибка!');
          $('.response-popup-message').text('Попробуйте указать номер еще раз, или воспользуйтесь другим способом оплаты!');
          setTimeout(function(){
            $('.response-popup-container').hide();
          },10000);
        }else{
          if(responseData.type == 'redirect'){
            window.location.href = responseData.redirect_url;
          }else{
            if(responseData.payment_type == 'sberbank'){
              $('.response-popup-container').show();
              $('.response-popup-status').text('Необходимо подтверждение!');
              $('.response-popup-message').text('Проверьте ваш телефон, к которому привязан сбербанк-онлайн и следуйте дальнейшим инструкциям.');
              setTimeout(function(){
                $('.response-popup-container').hide();
              },10000);
            }else if(responseData.payment_type == 'alfabank'){
              $('.response-popup-container').show();
              $('.response-popup-status').text('Необходимо подтверждение!');
              $('.response-popup-message').text('Проверьте ваше приложение альфа-банка, и следуйте дальнейшим инструкциям.');
              setTimeout(function(){
                $('.response-popup-container').hide();
              },10000);
            }
          }
        }

        $paySubmit.prop('disabled',false);
      },
      error:function(a,b,c){
        $paySubmit.removeClass('process');
        $paySubmit.prop('disabled',false);
      }
    });
    return false;

  });

  ///////////////////////////
  // AJAX STOP AUTOPAYMENT //
  ///////////////////////////

  $stopAutopaymentSubmit = $('.stop-autopayment-submit');

  $stopAutopaymentSubmit.on('click', function(e){
    e.preventDefault();
    $urlSite = $stopAutopaymentSubmit.data('url');

    var yandexMoney = $('#stop-autopayment-yandex_money-input').val();
    var cardSix = $('#stop-autopayment-bank_card-input-six').val();
    var cardFour = $('#stop-autopayment-bank_card-input-four').val();
    var paymentType = $('.stop-autopayment-radio:checked').val();

    $.ajax({

      url: $urlSite + '/wp-admin/admin-ajax.php',
      data: 'action=stop_auto_payment&yandex_money=' + yandexMoney + '&card_six=' + cardSix + '&card_four=' + cardFour + '&payment_type=' + paymentType,
      type: 'POST',
      beforeSend:function(xhr){
        $stopAutopaymentSubmit.addClass('process');
        $stopAutopaymentSubmit.prop('disabled',true);
      },
      success:function(data){
        $stopAutopaymentSubmit.removeClass('process');
        $stopAutopaymentSubmit.prop('disabled',false);
        $('.stop-autopayment-wrapper').hide();
        $('.response-popup-container').show();

        if(data == 'success'){
          $('.response-popup-status').text('Операция прошла успешно!');
          $('.response-popup-message').text('Автоматическое списание средств остановлено.');
        }else{
          $('.response-popup-status').text('Не удалось обнаружить ваши реквизиты!');
          $('.response-popup-message').text('Возможно вы допустили ошибку при вводе данных, попробуйте снова или свяжитесь с нами удобным для вас способом!');
        }

        setTimeout(function(){
          $('.response-popup-container').hide();
        },10000);
      },
      error:function(a,b,c){
        $stopAutopaymentSubmit.removeClass('process');
        $stopAutopaymentSubmit.prop('disabled',false);
      }
    });
    return false;

  });


})(jQuery);
