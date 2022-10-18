<!DOCTYPE html>
<!--[if !(IE 6) | !(IE 7) | !(IE 8)  ]><!-->
<html class="js supports no-touchevents no-forcetouch objectfit object-fit cssanimations no-cssgridlegacy cssgrid cssfilters csstransforms csstransforms3d csstransitions mobile-false js_active vc_desktop vc_transform not-iOS" style="" lang="ru-RU"><!--<![endif]--><head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
	<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=0">
		<meta name="theme-color" content="#ec7834">	<link rel="profile" href="https://gmpg.org/xfn/11">
	        <script type="text/javascript">
            if (/Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent)) {
                var originalAddEventListener = EventTarget.prototype.addEventListener,
                    oldWidth = window.innerWidth;

                EventTarget.prototype.addEventListener = function (eventName, eventHandler, useCapture) {
                    if (eventName === "resize") {
                        originalAddEventListener.call(this, eventName, function (event) {
                            if (oldWidth === window.innerWidth) {
                                return;
                            }
                            else if (oldWidth !== window.innerWidth) {
                                oldWidth = window.innerWidth;
                            }
                            if (eventHandler.handleEvent) {
                                eventHandler.handleEvent.call(this, event);
                            }
                            else {
                                eventHandler.call(this, event);
                            };
                        }, useCapture);
                    }
                    else {
                        originalAddEventListener.call(this, eventName, eventHandler, useCapture);
                    };
                };
            };
        </script>
		<meta name="robots" content="index, follow, max-image-preview:large, max-snippet:-1, max-video-preview:-1">
<link rel="alternate" hreflang="ru" href="https://aerophoto.com.ua/2022/05/18/atti-for-mavic-3/">

	<!-- This site is optimized with the Yoast SEO plugin v18.4.1 - https://yoast.com/wordpress/plugins/seo/ -->
	<title>Как включить режим ATTI на DJI Mavic 3, и закрытые настройки дрона - aerophoto.com.ua</title>
	<meta name="description" content="Открываем режим ATTI у Mavic 3 с помощью DroneHack. Гасим огни, отключаем автопосадку. Борьба с РЭБ. Школа Дмитрия Следюка.">
	<link rel="canonical" href="https://aerophoto.com.ua/2022/05/18/atti-for-mavic-3/">
	<meta property="og:locale" content="ru_RU">
	<meta property="og:type" content="article">
	<meta property="og:title" content="Как включить режим ATTI на DJI Mavic 3, и закрытые настройки дрона - aerophoto.com.ua">
	<meta property="og:description" content="Открываем режим ATTI у Mavic 3 с помощью DroneHack. Гасим огни, отключаем автопосадку. Борьба с РЭБ. Школа Дмитрия Следюка.">
	<meta property="og:url" content="https://aerophoto.com.ua/2022/05/18/atti-for-mavic-3/">
	<meta property="og:site_name" content="aerophoto.com.ua">
	<meta property="article:published_time" content="2022-05-18T13:11:06+00:00">
	<meta property="article:modified_time" content="2022-09-27T19:04:39+00:00">
	<meta property="og:image" content="https://aerophoto.com.ua/wp-content/uploads/2022/05/dji_mavic_3.jpg">
	<meta property="og:image:width" content="1276">
	<meta property="og:image:height" content="638">
	<meta property="og:image:type" content="image/jpeg">
	<meta name="twitter:card" content="summary_large_image">
	<meta name="twitter:label1" content="Написано автором">
	<meta name="twitter:data1" content="admin">
	<meta name="twitter:label2" content="Примерное время для чтения">
	<meta name="twitter:data2" content="12 минут">
	<!-- / Yoast SEO plugin. -->


<link rel="dns-prefetch" href="https://fonts.googleapis.com/">
<link rel="dns-prefetch" href="https://s.w.org/">
<link rel="alternate" type="application/rss+xml" title="aerophoto.com.ua » Лента" href="https://aerophoto.com.ua/feed/">
<link rel="alternate" type="application/rss+xml" title="aerophoto.com.ua » Лента комментариев" href="https://aerophoto.com.ua/comments/feed/">
<link rel="alternate" type="application/rss+xml" title="aerophoto.com.ua » Лента комментариев к «Как включить режим ATTI на DJI Mavic 3, и закрытые настройки дрона»" href="https://aerophoto.com.ua/2022/05/18/atti-for-mavic-3/feed/">
		<!-- This site uses the Google Analytics by MonsterInsights plugin v8.9.0 - Using Analytics tracking - https://www.monsterinsights.com/ -->
							<script src="%D0%9A%D0%B0%D0%BA%20%D0%B2%D0%BA%D0%BB%D1%8E%D1%87%D0%B8%D1%82%D1%8C%20%D1%80%D0%B5%D0%B6%D0%B8%D0%BC%20ATTI%20%D0%BD%D0%B0%20DJI%20Mavic%203,%20%D0%B8%20%D0%B7%D0%B0%D0%BA%D1%80%D1%8B%D1%82%D1%8B%D0%B5%20%D0%BD%D0%B0%D1%81%D1%82%D1%80%D0%BE%D0%B9%D0%BA%D0%B8%20%D0%B4%D1%80%D0%BE%D0%BD%D0%B0%20-%20aerophoto.com_files/google-analytics_analytics.js" data-cfasync="false" data-wpfc-render="false" type="text/javascript" async=""></script>
			<script data-cfasync="false" data-wpfc-render="false" type="text/javascript">
				var mi_version = '8.9.0';
				var mi_track_user = true;
				var mi_no_track_reason = '';
				
								var disableStrs = [
															'ga-disable-UA-27325158-1',
									];

				/* Function to detect opted out users */
				function __gtagTrackerIsOptedOut() {
					for (var index = 0; index < disableStrs.length; index++) {
						if (document.cookie.indexOf(disableStrs[index] + '=true') > -1) {
							return true;
						}
					}

					return false;
				}

				/* Disable tracking if the opt-out cookie exists. */
				if (__gtagTrackerIsOptedOut()) {
					for (var index = 0; index < disableStrs.length; index++) {
						window[disableStrs[index]] = true;
					}
				}

				/* Opt-out function */
				function __gtagTrackerOptout() {
					for (var index = 0; index < disableStrs.length; index++) {
						document.cookie = disableStrs[index] + '=true; expires=Thu, 31 Dec 2099 23:59:59 UTC; path=/';
						window[disableStrs[index]] = true;
					}
				}

				if ('undefined' === typeof gaOptout) {
					function gaOptout() {
						__gtagTrackerOptout();
					}
				}
								window.dataLayer = window.dataLayer || [];

				window.MonsterInsightsDualTracker = {
					helpers: {},
					trackers: {},
				};
				if (mi_track_user) {
					function __gtagDataLayer() {
						dataLayer.push(arguments);
					}

					function __gtagTracker(type, name, parameters) {
						if (!parameters) {
							parameters = {};
						}

						if (parameters.send_to) {
							__gtagDataLayer.apply(null, arguments);
							return;
						}

						if (type === 'event') {
							
														parameters.send_to = monsterinsights_frontend.ua;
							__gtagDataLayer(type, name, parameters);
													} else {
							__gtagDataLayer.apply(null, arguments);
						}
					}

					__gtagTracker('js', new Date());
					__gtagTracker('set', {
						'developer_id.dZGIzZG': true,
											});
															__gtagTracker('config', 'UA-27325158-1', {"forceSSL":"true","link_attribution":"true"} );
										window.gtag = __gtagTracker;										(function () {
						/* https://developers.google.com/analytics/devguides/collection/analyticsjs/ */
						/* ga and __gaTracker compatibility shim. */
						var noopfn = function () {
							return null;
						};
						var newtracker = function () {
							return new Tracker();
						};
						var Tracker = function () {
							return null;
						};
						var p = Tracker.prototype;
						p.get = noopfn;
						p.set = noopfn;
						p.send = function () {
							var args = Array.prototype.slice.call(arguments);
							args.unshift('send');
							__gaTracker.apply(null, args);
						};
						var __gaTracker = function () {
							var len = arguments.length;
							if (len === 0) {
								return;
							}
							var f = arguments[len - 1];
							if (typeof f !== 'object' || f === null || typeof f.hitCallback !== 'function') {
								if ('send' === arguments[0]) {
									var hitConverted, hitObject = false, action;
									if ('event' === arguments[1]) {
										if ('undefined' !== typeof arguments[3]) {
											hitObject = {
												'eventAction': arguments[3],
												'eventCategory': arguments[2],
												'eventLabel': arguments[4],
												'value': arguments[5] ? arguments[5] : 1,
											}
										}
									}
									if ('pageview' === arguments[1]) {
										if ('undefined' !== typeof arguments[2]) {
											hitObject = {
												'eventAction': 'page_view',
												'page_path': arguments[2],
											}
										}
									}
									if (typeof arguments[2] === 'object') {
										hitObject = arguments[2];
									}
									if (typeof arguments[5] === 'object') {
										Object.assign(hitObject, arguments[5]);
									}
									if ('undefined' !== typeof arguments[1].hitType) {
										hitObject = arguments[1];
										if ('pageview' === hitObject.hitType) {
											hitObject.eventAction = 'page_view';
										}
									}
									if (hitObject) {
										action = 'timing' === arguments[1].hitType ? 'timing_complete' : hitObject.eventAction;
										hitConverted = mapArgs(hitObject);
										__gtagTracker('event', action, hitConverted);
									}
								}
								return;
							}

							function mapArgs(args) {
								var arg, hit = {};
								var gaMap = {
									'eventCategory': 'event_category',
									'eventAction': 'event_action',
									'eventLabel': 'event_label',
									'eventValue': 'event_value',
									'nonInteraction': 'non_interaction',
									'timingCategory': 'event_category',
									'timingVar': 'name',
									'timingValue': 'value',
									'timingLabel': 'event_label',
									'page': 'page_path',
									'location': 'page_location',
									'title': 'page_title',
								};
								for (arg in args) {
																		if (!(!args.hasOwnProperty(arg) || !gaMap.hasOwnProperty(arg))) {
										hit[gaMap[arg]] = args[arg];
									} else {
										hit[arg] = args[arg];
									}
								}
								return hit;
							}

							try {
								f.hitCallback();
							} catch (ex) {
							}
						};
						__gaTracker.create = newtracker;
						__gaTracker.getByName = newtracker;
						__gaTracker.getAll = function () {
							return [];
						};
						__gaTracker.remove = noopfn;
						__gaTracker.loaded = true;
						window['__gaTracker'] = __gaTracker;
					})();
									} else {
										console.log("");
					(function () {
						function __gtagTracker() {
							return null;
						}

						window['__gtagTracker'] = __gtagTracker;
						window['gtag'] = __gtagTracker;
					})();
									}
			</script>
				<!-- / Google Analytics by MonsterInsights -->
				<script type="text/javascript">
			window._wpemojiSettings = {"baseUrl":"https:\/\/s.w.org\/images\/core\/emoji\/13.0.1\/72x72\/","ext":".png","svgUrl":"https:\/\/s.w.org\/images\/core\/emoji\/13.0.1\/svg\/","svgExt":".svg","source":{"concatemoji":"https:\/\/aerophoto.com.ua\/wp-includes\/js\/wp-emoji-release.min.js?ver=5.7.7"}};
			!function(e,a,t){var n,r,o,i=a.createElement("canvas"),p=i.getContext&&i.getContext("2d");function s(e,t){var a=String.fromCharCode;p.clearRect(0,0,i.width,i.height),p.fillText(a.apply(this,e),0,0);e=i.toDataURL();return p.clearRect(0,0,i.width,i.height),p.fillText(a.apply(this,t),0,0),e===i.toDataURL()}function c(e){var t=a.createElement("script");t.src=e,t.defer=t.type="text/javascript",a.getElementsByTagName("head")[0].appendChild(t)}for(o=Array("flag","emoji"),t.supports={everything:!0,everythingExceptFlag:!0},r=0;r<o.length;r++)t.supports[o[r]]=function(e){if(!p||!p.fillText)return!1;switch(p.textBaseline="top",p.font="600 32px Arial",e){case"flag":return s([127987,65039,8205,9895,65039],[127987,65039,8203,9895,65039])?!1:!s([55356,56826,55356,56819],[55356,56826,8203,55356,56819])&&!s([55356,57332,56128,56423,56128,56418,56128,56421,56128,56430,56128,56423,56128,56447],[55356,57332,8203,56128,56423,8203,56128,56418,8203,56128,56421,8203,56128,56430,8203,56128,56423,8203,56128,56447]);case"emoji":return!s([55357,56424,8205,55356,57212],[55357,56424,8203,55356,57212])}return!1}(o[r]),t.supports.everything=t.supports.everything&&t.supports[o[r]],"flag"!==o[r]&&(t.supports.everythingExceptFlag=t.supports.everythingExceptFlag&&t.supports[o[r]]);t.supports.everythingExceptFlag=t.supports.everythingExceptFlag&&!t.supports.flag,t.DOMReady=!1,t.readyCallback=function(){t.DOMReady=!0},t.supports.everything||(n=function(){t.readyCallback()},a.addEventListener?(a.addEventListener("DOMContentLoaded",n,!1),e.addEventListener("load",n,!1)):(e.attachEvent("onload",n),a.attachEvent("onreadystatechange",function(){"complete"===a.readyState&&t.readyCallback()})),(n=t.source||{}).concatemoji?c(n.concatemoji):n.wpemoji&&n.twemoji&&(c(n.twemoji),c(n.wpemoji)))}(window,document,window._wpemojiSettings);
		</script><script src="%D0%9A%D0%B0%D0%BA%20%D0%B2%D0%BA%D0%BB%D1%8E%D1%87%D0%B8%D1%82%D1%8C%20%D1%80%D0%B5%D0%B6%D0%B8%D0%BC%20ATTI%20%D0%BD%D0%B0%20DJI%20Mavic%203,%20%D0%B8%20%D0%B7%D0%B0%D0%BA%D1%80%D1%8B%D1%82%D1%8B%D0%B5%20%D0%BD%D0%B0%D1%81%D1%82%D1%80%D0%BE%D0%B9%D0%BA%D0%B8%20%D0%B4%D1%80%D0%BE%D0%BD%D0%B0%20-%20aerophoto.com_files/wp-emoji-release.min.js" type="text/javascript" defer="defer"></script>
		<style type="text/css">
img.wp-smiley,
img.emoji {
	display: inline !important;
	border: none !important;
	box-shadow: none !important;
	height: 1em !important;
	width: 1em !important;
	margin: 0 .07em !important;
	vertical-align: -0.1em !important;
	background: none !important;
	padding: 0 !important;
}
</style>
	<link rel="stylesheet" id="ggskin-style-css" href="%D0%9A%D0%B0%D0%BA%20%D0%B2%D0%BA%D0%BB%D1%8E%D1%87%D0%B8%D1%82%D1%8C%20%D1%80%D0%B5%D0%B6%D0%B8%D0%BC%20ATTI%20%D0%BD%D0%B0%20DJI%20Mavic%203,%20%D0%B8%20%D0%B7%D0%B0%D0%BA%D1%80%D1%8B%D1%82%D1%8B%D0%B5%20%D0%BD%D0%B0%D1%81%D1%82%D1%80%D0%BE%D0%B9%D0%BA%D0%B8%20%D0%B4%D1%80%D0%BE%D0%BD%D0%B0%20-%20aerophoto.com_files/ggskin.css" type="text/css" media="all">
<link rel="stylesheet" id="wp-block-library-css" href="%D0%9A%D0%B0%D0%BA%20%D0%B2%D0%BA%D0%BB%D1%8E%D1%87%D0%B8%D1%82%D1%8C%20%D1%80%D0%B5%D0%B6%D0%B8%D0%BC%20ATTI%20%D0%BD%D0%B0%20DJI%20Mavic%203,%20%D0%B8%20%D0%B7%D0%B0%D0%BA%D1%80%D1%8B%D1%82%D1%8B%D0%B5%20%D0%BD%D0%B0%D1%81%D1%82%D1%80%D0%BE%D0%B9%D0%BA%D0%B8%20%D0%B4%D1%80%D0%BE%D0%BD%D0%B0%20-%20aerophoto.com_files/style.min_002.css" type="text/css" media="all">
<style id="wp-block-library-inline-css" type="text/css">
.has-text-align-justify{text-align:justify;}
</style>
<link rel="stylesheet" id="wp-block-library-theme-css" href="%D0%9A%D0%B0%D0%BA%20%D0%B2%D0%BA%D0%BB%D1%8E%D1%87%D0%B8%D1%82%D1%8C%20%D1%80%D0%B5%D0%B6%D0%B8%D0%BC%20ATTI%20%D0%BD%D0%B0%20DJI%20Mavic%203,%20%D0%B8%20%D0%B7%D0%B0%D0%BA%D1%80%D1%8B%D1%82%D1%8B%D0%B5%20%D0%BD%D0%B0%D1%81%D1%82%D1%80%D0%BE%D0%B9%D0%BA%D0%B8%20%D0%B4%D1%80%D0%BE%D0%BD%D0%B0%20-%20aerophoto.com_files/theme.min.css" type="text/css" media="all">
<link rel="stylesheet" id="mediaelement-css" href="%D0%9A%D0%B0%D0%BA%20%D0%B2%D0%BA%D0%BB%D1%8E%D1%87%D0%B8%D1%82%D1%8C%20%D1%80%D0%B5%D0%B6%D0%B8%D0%BC%20ATTI%20%D0%BD%D0%B0%20DJI%20Mavic%203,%20%D0%B8%20%D0%B7%D0%B0%D0%BA%D1%80%D1%8B%D1%82%D1%8B%D0%B5%20%D0%BD%D0%B0%D1%81%D1%82%D1%80%D0%BE%D0%B9%D0%BA%D0%B8%20%D0%B4%D1%80%D0%BE%D0%BD%D0%B0%20-%20aerophoto.com_files/mediaelementplayer-legacy.min.css" type="text/css" media="all">
<link rel="stylesheet" id="wp-mediaelement-css" href="%D0%9A%D0%B0%D0%BA%20%D0%B2%D0%BA%D0%BB%D1%8E%D1%87%D0%B8%D1%82%D1%8C%20%D1%80%D0%B5%D0%B6%D0%B8%D0%BC%20ATTI%20%D0%BD%D0%B0%20DJI%20Mavic%203,%20%D0%B8%20%D0%B7%D0%B0%D0%BA%D1%80%D1%8B%D1%82%D1%8B%D0%B5%20%D0%BD%D0%B0%D1%81%D1%82%D1%80%D0%BE%D0%B9%D0%BA%D0%B8%20%D0%B4%D1%80%D0%BE%D0%BD%D0%B0%20-%20aerophoto.com_files/wp-mediaelement.min.css" type="text/css" media="all">
<link rel="stylesheet" id="contact-form-7-css" href="%D0%9A%D0%B0%D0%BA%20%D0%B2%D0%BA%D0%BB%D1%8E%D1%87%D0%B8%D1%82%D1%8C%20%D1%80%D0%B5%D0%B6%D0%B8%D0%BC%20ATTI%20%D0%BD%D0%B0%20DJI%20Mavic%203,%20%D0%B8%20%D0%B7%D0%B0%D0%BA%D1%80%D1%8B%D1%82%D1%8B%D0%B5%20%D0%BD%D0%B0%D1%81%D1%82%D1%80%D0%BE%D0%B9%D0%BA%D0%B8%20%D0%B4%D1%80%D0%BE%D0%BD%D0%B0%20-%20aerophoto.com_files/styles.css" type="text/css" media="all">
<link rel="stylesheet" id="nextchat-css-css" href="%D0%9A%D0%B0%D0%BA%20%D0%B2%D0%BA%D0%BB%D1%8E%D1%87%D0%B8%D1%82%D1%8C%20%D1%80%D0%B5%D0%B6%D0%B8%D0%BC%20ATTI%20%D0%BD%D0%B0%20DJI%20Mavic%203,%20%D0%B8%20%D0%B7%D0%B0%D0%BA%D1%80%D1%8B%D1%82%D1%8B%D0%B5%20%D0%BD%D0%B0%D1%81%D1%82%D1%80%D0%BE%D0%B9%D0%BA%D0%B8%20%D0%B4%D1%80%D0%BE%D0%BD%D0%B0%20-%20aerophoto.com_files/styles_002.css" type="text/css" media="all">
<link rel="stylesheet" id="rs-plugin-settings-css" href="%D0%9A%D0%B0%D0%BA%20%D0%B2%D0%BA%D0%BB%D1%8E%D1%87%D0%B8%D1%82%D1%8C%20%D1%80%D0%B5%D0%B6%D0%B8%D0%BC%20ATTI%20%D0%BD%D0%B0%20DJI%20Mavic%203,%20%D0%B8%20%D0%B7%D0%B0%D0%BA%D1%80%D1%8B%D1%82%D1%8B%D0%B5%20%D0%BD%D0%B0%D1%81%D1%82%D1%80%D0%BE%D0%B9%D0%BA%D0%B8%20%D0%B4%D1%80%D0%BE%D0%BD%D0%B0%20-%20aerophoto.com_files/rs6.css" type="text/css" media="all">
<style id="rs-plugin-settings-inline-css" type="text/css">
#rs-demo-id {}
</style>
<link rel="stylesheet" id="wpml-menu-item-0-css" href="%D0%9A%D0%B0%D0%BA%20%D0%B2%D0%BA%D0%BB%D1%8E%D1%87%D0%B8%D1%82%D1%8C%20%D1%80%D0%B5%D0%B6%D0%B8%D0%BC%20ATTI%20%D0%BD%D0%B0%20DJI%20Mavic%203,%20%D0%B8%20%D0%B7%D0%B0%D0%BA%D1%80%D1%8B%D1%82%D1%8B%D0%B5%20%D0%BD%D0%B0%D1%81%D1%82%D1%80%D0%BE%D0%B9%D0%BA%D0%B8%20%D0%B4%D1%80%D0%BE%D0%BD%D0%B0%20-%20aerophoto.com_files/style.min.css" type="text/css" media="all">
<link rel="stylesheet" id="the7-Defaults-css" href="%D0%9A%D0%B0%D0%BA%20%D0%B2%D0%BA%D0%BB%D1%8E%D1%87%D0%B8%D1%82%D1%8C%20%D1%80%D0%B5%D0%B6%D0%B8%D0%BC%20ATTI%20%D0%BD%D0%B0%20DJI%20Mavic%203,%20%D0%B8%20%D0%B7%D0%B0%D0%BA%D1%80%D1%8B%D1%82%D1%8B%D0%B5%20%D0%BD%D0%B0%D1%81%D1%82%D1%80%D0%BE%D0%B9%D0%BA%D0%B8%20%D0%B4%D1%80%D0%BE%D0%BD%D0%B0%20-%20aerophoto.com_files/Defaults.css" type="text/css" media="all">
<link rel="stylesheet" id="the7-fontello-css" href="%D0%9A%D0%B0%D0%BA%20%D0%B2%D0%BA%D0%BB%D1%8E%D1%87%D0%B8%D1%82%D1%8C%20%D1%80%D0%B5%D0%B6%D0%B8%D0%BC%20ATTI%20%D0%BD%D0%B0%20DJI%20Mavic%203,%20%D0%B8%20%D0%B7%D0%B0%D0%BA%D1%80%D1%8B%D1%82%D1%8B%D0%B5%20%D0%BD%D0%B0%D1%81%D1%82%D1%80%D0%BE%D0%B9%D0%BA%D0%B8%20%D0%B4%D1%80%D0%BE%D0%BD%D0%B0%20-%20aerophoto.com_files/fontello.min.css" type="text/css" media="all">
<link rel="stylesheet" id="tablepress-default-css" href="%D0%9A%D0%B0%D0%BA%20%D0%B2%D0%BA%D0%BB%D1%8E%D1%87%D0%B8%D1%82%D1%8C%20%D1%80%D0%B5%D0%B6%D0%B8%D0%BC%20ATTI%20%D0%BD%D0%B0%20DJI%20Mavic%203,%20%D0%B8%20%D0%B7%D0%B0%D0%BA%D1%80%D1%8B%D1%82%D1%8B%D0%B5%20%D0%BD%D0%B0%D1%81%D1%82%D1%80%D0%BE%D0%B9%D0%BA%D0%B8%20%D0%B4%D1%80%D0%BE%D0%BD%D0%B0%20-%20aerophoto.com_files/default.min.css" type="text/css" media="all">
<link rel="stylesheet" id="js_composer_front-css" href="%D0%9A%D0%B0%D0%BA%20%D0%B2%D0%BA%D0%BB%D1%8E%D1%87%D0%B8%D1%82%D1%8C%20%D1%80%D0%B5%D0%B6%D0%B8%D0%BC%20ATTI%20%D0%BD%D0%B0%20DJI%20Mavic%203,%20%D0%B8%20%D0%B7%D0%B0%D0%BA%D1%80%D1%8B%D1%82%D1%8B%D0%B5%20%D0%BD%D0%B0%D1%81%D1%82%D1%80%D0%BE%D0%B9%D0%BA%D0%B8%20%D0%B4%D1%80%D0%BE%D0%BD%D0%B0%20-%20aerophoto.com_files/js_composer.min.css" type="text/css" media="all">
<link rel="stylesheet" id="dt-web-fonts-css" href="%D0%9A%D0%B0%D0%BA%20%D0%B2%D0%BA%D0%BB%D1%8E%D1%87%D0%B8%D1%82%D1%8C%20%D1%80%D0%B5%D0%B6%D0%B8%D0%BC%20ATTI%20%D0%BD%D0%B0%20DJI%20Mavic%203,%20%D0%B8%20%D0%B7%D0%B0%D0%BA%D1%80%D1%8B%D1%82%D1%8B%D0%B5%20%D0%BD%D0%B0%D1%81%D1%82%D1%80%D0%BE%D0%B9%D0%BA%D0%B8%20%D0%B4%D1%80%D0%BE%D0%BD%D0%B0%20-%20aerophoto.com_files/css.css" type="text/css" media="all">
<link rel="stylesheet" id="dt-main-css" href="%D0%9A%D0%B0%D0%BA%20%D0%B2%D0%BA%D0%BB%D1%8E%D1%87%D0%B8%D1%82%D1%8C%20%D1%80%D0%B5%D0%B6%D0%B8%D0%BC%20ATTI%20%D0%BD%D0%B0%20DJI%20Mavic%203,%20%D0%B8%20%D0%B7%D0%B0%D0%BA%D1%80%D1%8B%D1%82%D1%8B%D0%B5%20%D0%BD%D0%B0%D1%81%D1%82%D1%80%D0%BE%D0%B9%D0%BA%D0%B8%20%D0%B4%D1%80%D0%BE%D0%BD%D0%B0%20-%20aerophoto.com_files/main.min.css" type="text/css" media="all">
<style id="dt-main-inline-css" type="text/css">
body #load {
  display: block;
  height: 100%;
  overflow: hidden;
  position: fixed;
  width: 100%;
  z-index: 9901;
  opacity: 1;
  visibility: visible;
  transition: all .35s ease-out;
}
.load-wrap {
  width: 100%;
  height: 100%;
  background-position: center center;
  background-repeat: no-repeat;
  text-align: center;
}
.load-wrap > svg {
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%,-50%);
}
#load {
  background-color: #ffffff;
}
.uil-default rect:not(.bk) {
  fill: #1367a3;
}
.uil-ring > path {
  fill: #1367a3;
}
.ring-loader .circle {
  fill: #1367a3;
}
.ring-loader .moving-circle {
  fill: #1367a3;
}
.uil-hourglass .glass {
  stroke: #1367a3;
}
.uil-hourglass .sand {
  fill: #1367a3;
}
.spinner-loader .load-wrap {
  background-image: url("data:image/svg+xml,%3Csvg width='75px' height='75px' xmlns='http://www.w3.org/2000/svg' viewBox='0 0 100 100' preserveAspectRatio='xMidYMid' class='uil-default'%3E%3Crect x='0' y='0' width='100' height='100' fill='none' class='bk'%3E%3C/rect%3E%3Crect  x='46.5' y='40' width='7' height='20' rx='5' ry='5' fill='%231367a3' transform='rotate(0 50 50) translate(0 -30)'%3E  %3Canimate attributeName='opacity' from='1' to='0' dur='1s' begin='0s' repeatCount='indefinite'/%3E%3C/rect%3E%3Crect  x='46.5' y='40' width='7' height='20' rx='5' ry='5' fill='%231367a3' transform='rotate(30 50 50) translate(0 -30)'%3E  %3Canimate attributeName='opacity' from='1' to='0' dur='1s' begin='0.08333333333333333s' repeatCount='indefinite'/%3E%3C/rect%3E%3Crect  x='46.5' y='40' width='7' height='20' rx='5' ry='5' fill='%231367a3' transform='rotate(60 50 50) translate(0 -30)'%3E  %3Canimate attributeName='opacity' from='1' to='0' dur='1s' begin='0.16666666666666666s' repeatCount='indefinite'/%3E%3C/rect%3E%3Crect  x='46.5' y='40' width='7' height='20' rx='5' ry='5' fill='%231367a3' transform='rotate(90 50 50) translate(0 -30)'%3E  %3Canimate attributeName='opacity' from='1' to='0' dur='1s' begin='0.25s' repeatCount='indefinite'/%3E%3C/rect%3E%3Crect  x='46.5' y='40' width='7' height='20' rx='5' ry='5' fill='%231367a3' transform='rotate(120 50 50) translate(0 -30)'%3E  %3Canimate attributeName='opacity' from='1' to='0' dur='1s' begin='0.3333333333333333s' repeatCount='indefinite'/%3E%3C/rect%3E%3Crect  x='46.5' y='40' width='7' height='20' rx='5' ry='5' fill='%231367a3' transform='rotate(150 50 50) translate(0 -30)'%3E  %3Canimate attributeName='opacity' from='1' to='0' dur='1s' begin='0.4166666666666667s' repeatCount='indefinite'/%3E%3C/rect%3E%3Crect  x='46.5' y='40' width='7' height='20' rx='5' ry='5' fill='%231367a3' transform='rotate(180 50 50) translate(0 -30)'%3E  %3Canimate attributeName='opacity' from='1' to='0' dur='1s' begin='0.5s' repeatCount='indefinite'/%3E%3C/rect%3E%3Crect  x='46.5' y='40' width='7' height='20' rx='5' ry='5' fill='%231367a3' transform='rotate(210 50 50) translate(0 -30)'%3E  %3Canimate attributeName='opacity' from='1' to='0' dur='1s' begin='0.5833333333333334s' repeatCount='indefinite'/%3E%3C/rect%3E%3Crect  x='46.5' y='40' width='7' height='20' rx='5' ry='5' fill='%231367a3' transform='rotate(240 50 50) translate(0 -30)'%3E  %3Canimate attributeName='opacity' from='1' to='0' dur='1s' begin='0.6666666666666666s' repeatCount='indefinite'/%3E%3C/rect%3E%3Crect  x='46.5' y='40' width='7' height='20' rx='5' ry='5' fill='%231367a3' transform='rotate(270 50 50) translate(0 -30)'%3E  %3Canimate attributeName='opacity' from='1' to='0' dur='1s' begin='0.75s' repeatCount='indefinite'/%3E%3C/rect%3E%3Crect  x='46.5' y='40' width='7' height='20' rx='5' ry='5' fill='%231367a3' transform='rotate(300 50 50) translate(0 -30)'%3E  %3Canimate attributeName='opacity' from='1' to='0' dur='1s' begin='0.8333333333333334s' repeatCount='indefinite'/%3E%3C/rect%3E%3Crect  x='46.5' y='40' width='7' height='20' rx='5' ry='5' fill='%231367a3' transform='rotate(330 50 50) translate(0 -30)'%3E  %3Canimate attributeName='opacity' from='1' to='0' dur='1s' begin='0.9166666666666666s' repeatCount='indefinite'/%3E%3C/rect%3E%3C/svg%3E");
}
.ring-loader .load-wrap {
  background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 32 32' width='72' height='72' fill='%231367a3'%3E   %3Cpath opacity='.25' d='M16 0 A16 16 0 0 0 16 32 A16 16 0 0 0 16 0 M16 4 A12 12 0 0 1 16 28 A12 12 0 0 1 16 4'/%3E   %3Cpath d='M16 0 A16 16 0 0 1 32 16 L28 16 A12 12 0 0 0 16 4z'%3E     %3CanimateTransform attributeName='transform' type='rotate' from='0 16 16' to='360 16 16' dur='0.8s' repeatCount='indefinite' /%3E   %3C/path%3E %3C/svg%3E");
}
.hourglass-loader .load-wrap {
  background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 32 32' width='72' height='72' fill='%231367a3'%3E   %3Cpath transform='translate(2)' d='M0 12 V20 H4 V12z'%3E      %3Canimate attributeName='d' values='M0 12 V20 H4 V12z; M0 4 V28 H4 V4z; M0 12 V20 H4 V12z; M0 12 V20 H4 V12z' dur='1.2s' repeatCount='indefinite' begin='0' keytimes='0;.2;.5;1' keySplines='0.2 0.2 0.4 0.8;0.2 0.6 0.4 0.8;0.2 0.8 0.4 0.8' calcMode='spline'  /%3E   %3C/path%3E   %3Cpath transform='translate(8)' d='M0 12 V20 H4 V12z'%3E     %3Canimate attributeName='d' values='M0 12 V20 H4 V12z; M0 4 V28 H4 V4z; M0 12 V20 H4 V12z; M0 12 V20 H4 V12z' dur='1.2s' repeatCount='indefinite' begin='0.2' keytimes='0;.2;.5;1' keySplines='0.2 0.2 0.4 0.8;0.2 0.6 0.4 0.8;0.2 0.8 0.4 0.8' calcMode='spline'  /%3E   %3C/path%3E   %3Cpath transform='translate(14)' d='M0 12 V20 H4 V12z'%3E     %3Canimate attributeName='d' values='M0 12 V20 H4 V12z; M0 4 V28 H4 V4z; M0 12 V20 H4 V12z; M0 12 V20 H4 V12z' dur='1.2s' repeatCount='indefinite' begin='0.4' keytimes='0;.2;.5;1' keySplines='0.2 0.2 0.4 0.8;0.2 0.6 0.4 0.8;0.2 0.8 0.4 0.8' calcMode='spline' /%3E   %3C/path%3E   %3Cpath transform='translate(20)' d='M0 12 V20 H4 V12z'%3E     %3Canimate attributeName='d' values='M0 12 V20 H4 V12z; M0 4 V28 H4 V4z; M0 12 V20 H4 V12z; M0 12 V20 H4 V12z' dur='1.2s' repeatCount='indefinite' begin='0.6' keytimes='0;.2;.5;1' keySplines='0.2 0.2 0.4 0.8;0.2 0.6 0.4 0.8;0.2 0.8 0.4 0.8' calcMode='spline' /%3E   %3C/path%3E   %3Cpath transform='translate(26)' d='M0 12 V20 H4 V12z'%3E     %3Canimate attributeName='d' values='M0 12 V20 H4 V12z; M0 4 V28 H4 V4z; M0 12 V20 H4 V12z; M0 12 V20 H4 V12z' dur='1.2s' repeatCount='indefinite' begin='0.8' keytimes='0;.2;.5;1' keySplines='0.2 0.2 0.4 0.8;0.2 0.6 0.4 0.8;0.2 0.8 0.4 0.8' calcMode='spline' /%3E   %3C/path%3E %3C/svg%3E");
}

</style>
<link rel="stylesheet" id="the7-font-css" href="%D0%9A%D0%B0%D0%BA%20%D0%B2%D0%BA%D0%BB%D1%8E%D1%87%D0%B8%D1%82%D1%8C%20%D1%80%D0%B5%D0%B6%D0%B8%D0%BC%20ATTI%20%D0%BD%D0%B0%20DJI%20Mavic%203,%20%D0%B8%20%D0%B7%D0%B0%D0%BA%D1%80%D1%8B%D1%82%D1%8B%D0%B5%20%D0%BD%D0%B0%D1%81%D1%82%D1%80%D0%BE%D0%B9%D0%BA%D0%B8%20%D0%B4%D1%80%D0%BE%D0%BD%D0%B0%20-%20aerophoto.com_files/icomoon-the7-font.min.css" type="text/css" media="all">
<link rel="stylesheet" id="the7-awesome-fonts-css" href="%D0%9A%D0%B0%D0%BA%20%D0%B2%D0%BA%D0%BB%D1%8E%D1%87%D0%B8%D1%82%D1%8C%20%D1%80%D0%B5%D0%B6%D0%B8%D0%BC%20ATTI%20%D0%BD%D0%B0%20DJI%20Mavic%203,%20%D0%B8%20%D0%B7%D0%B0%D0%BA%D1%80%D1%8B%D1%82%D1%8B%D0%B5%20%D0%BD%D0%B0%D1%81%D1%82%D1%80%D0%BE%D0%B9%D0%BA%D0%B8%20%D0%B4%D1%80%D0%BE%D0%BD%D0%B0%20-%20aerophoto.com_files/all.min.css" type="text/css" media="all">
<link rel="stylesheet" id="the7-awesome-fonts-back-css" href="%D0%9A%D0%B0%D0%BA%20%D0%B2%D0%BA%D0%BB%D1%8E%D1%87%D0%B8%D1%82%D1%8C%20%D1%80%D0%B5%D0%B6%D0%B8%D0%BC%20ATTI%20%D0%BD%D0%B0%20DJI%20Mavic%203,%20%D0%B8%20%D0%B7%D0%B0%D0%BA%D1%80%D1%8B%D1%82%D1%8B%D0%B5%20%D0%BD%D0%B0%D1%81%D1%82%D1%80%D0%BE%D0%B9%D0%BA%D0%B8%20%D0%B4%D1%80%D0%BE%D0%BD%D0%B0%20-%20aerophoto.com_files/back-compat.min.css" type="text/css" media="all">
<link rel="stylesheet" id="the7-custom-scrollbar-css" href="%D0%9A%D0%B0%D0%BA%20%D0%B2%D0%BA%D0%BB%D1%8E%D1%87%D0%B8%D1%82%D1%8C%20%D1%80%D0%B5%D0%B6%D0%B8%D0%BC%20ATTI%20%D0%BD%D0%B0%20DJI%20Mavic%203,%20%D0%B8%20%D0%B7%D0%B0%D0%BA%D1%80%D1%8B%D1%82%D1%8B%D0%B5%20%D0%BD%D0%B0%D1%81%D1%82%D1%80%D0%BE%D0%B9%D0%BA%D0%B8%20%D0%B4%D1%80%D0%BE%D0%BD%D0%B0%20-%20aerophoto.com_files/custom-scrollbar.min.css" type="text/css" media="all">
<link rel="stylesheet" id="the7-wpbakery-css" href="%D0%9A%D0%B0%D0%BA%20%D0%B2%D0%BA%D0%BB%D1%8E%D1%87%D0%B8%D1%82%D1%8C%20%D1%80%D0%B5%D0%B6%D0%B8%D0%BC%20ATTI%20%D0%BD%D0%B0%20DJI%20Mavic%203,%20%D0%B8%20%D0%B7%D0%B0%D0%BA%D1%80%D1%8B%D1%82%D1%8B%D0%B5%20%D0%BD%D0%B0%D1%81%D1%82%D1%80%D0%BE%D0%B9%D0%BA%D0%B8%20%D0%B4%D1%80%D0%BE%D0%BD%D0%B0%20-%20aerophoto.com_files/wpbakery.min.css" type="text/css" media="all">
<link rel="stylesheet" id="the7-core-css" href="%D0%9A%D0%B0%D0%BA%20%D0%B2%D0%BA%D0%BB%D1%8E%D1%87%D0%B8%D1%82%D1%8C%20%D1%80%D0%B5%D0%B6%D0%B8%D0%BC%20ATTI%20%D0%BD%D0%B0%20DJI%20Mavic%203,%20%D0%B8%20%D0%B7%D0%B0%D0%BA%D1%80%D1%8B%D1%82%D1%8B%D0%B5%20%D0%BD%D0%B0%D1%81%D1%82%D1%80%D0%BE%D0%B9%D0%BA%D0%B8%20%D0%B4%D1%80%D0%BE%D0%BD%D0%B0%20-%20aerophoto.com_files/post-type.min.css" type="text/css" media="all">
<link rel="stylesheet" id="the7-css-vars-css" href="%D0%9A%D0%B0%D0%BA%20%D0%B2%D0%BA%D0%BB%D1%8E%D1%87%D0%B8%D1%82%D1%8C%20%D1%80%D0%B5%D0%B6%D0%B8%D0%BC%20ATTI%20%D0%BD%D0%B0%20DJI%20Mavic%203,%20%D0%B8%20%D0%B7%D0%B0%D0%BA%D1%80%D1%8B%D1%82%D1%8B%D0%B5%20%D0%BD%D0%B0%D1%81%D1%82%D1%80%D0%BE%D0%B9%D0%BA%D0%B8%20%D0%B4%D1%80%D0%BE%D0%BD%D0%B0%20-%20aerophoto.com_files/css-vars.css" type="text/css" media="all">
<link rel="stylesheet" id="dt-custom-css" href="%D0%9A%D0%B0%D0%BA%20%D0%B2%D0%BA%D0%BB%D1%8E%D1%87%D0%B8%D1%82%D1%8C%20%D1%80%D0%B5%D0%B6%D0%B8%D0%BC%20ATTI%20%D0%BD%D0%B0%20DJI%20Mavic%203,%20%D0%B8%20%D0%B7%D0%B0%D0%BA%D1%80%D1%8B%D1%82%D1%8B%D0%B5%20%D0%BD%D0%B0%D1%81%D1%82%D1%80%D0%BE%D0%B9%D0%BA%D0%B8%20%D0%B4%D1%80%D0%BE%D0%BD%D0%B0%20-%20aerophoto.com_files/custom.css" type="text/css" media="all">
<link rel="stylesheet" id="dt-media-css" href="%D0%9A%D0%B0%D0%BA%20%D0%B2%D0%BA%D0%BB%D1%8E%D1%87%D0%B8%D1%82%D1%8C%20%D1%80%D0%B5%D0%B6%D0%B8%D0%BC%20ATTI%20%D0%BD%D0%B0%20DJI%20Mavic%203,%20%D0%B8%20%D0%B7%D0%B0%D0%BA%D1%80%D1%8B%D1%82%D1%8B%D0%B5%20%D0%BD%D0%B0%D1%81%D1%82%D1%80%D0%BE%D0%B9%D0%BA%D0%B8%20%D0%B4%D1%80%D0%BE%D0%BD%D0%B0%20-%20aerophoto.com_files/media.css" type="text/css" media="all">
<link rel="stylesheet" id="the7-mega-menu-css" href="%D0%9A%D0%B0%D0%BA%20%D0%B2%D0%BA%D0%BB%D1%8E%D1%87%D0%B8%D1%82%D1%8C%20%D1%80%D0%B5%D0%B6%D0%B8%D0%BC%20ATTI%20%D0%BD%D0%B0%20DJI%20Mavic%203,%20%D0%B8%20%D0%B7%D0%B0%D0%BA%D1%80%D1%8B%D1%82%D1%8B%D0%B5%20%D0%BD%D0%B0%D1%81%D1%82%D1%80%D0%BE%D0%B9%D0%BA%D0%B8%20%D0%B4%D1%80%D0%BE%D0%BD%D0%B0%20-%20aerophoto.com_files/mega-menu.css" type="text/css" media="all">
<link rel="stylesheet" id="the7-elements-albums-portfolio-css" href="%D0%9A%D0%B0%D0%BA%20%D0%B2%D0%BA%D0%BB%D1%8E%D1%87%D0%B8%D1%82%D1%8C%20%D1%80%D0%B5%D0%B6%D0%B8%D0%BC%20ATTI%20%D0%BD%D0%B0%20DJI%20Mavic%203,%20%D0%B8%20%D0%B7%D0%B0%D0%BA%D1%80%D1%8B%D1%82%D1%8B%D0%B5%20%D0%BD%D0%B0%D1%81%D1%82%D1%80%D0%BE%D0%B9%D0%BA%D0%B8%20%D0%B4%D1%80%D0%BE%D0%BD%D0%B0%20-%20aerophoto.com_files/the7-elements-albums-portfolio.css" type="text/css" media="all">
<link rel="stylesheet" id="the7-elements-css" href="%D0%9A%D0%B0%D0%BA%20%D0%B2%D0%BA%D0%BB%D1%8E%D1%87%D0%B8%D1%82%D1%8C%20%D1%80%D0%B5%D0%B6%D0%B8%D0%BC%20ATTI%20%D0%BD%D0%B0%20DJI%20Mavic%203,%20%D0%B8%20%D0%B7%D0%B0%D0%BA%D1%80%D1%8B%D1%82%D1%8B%D0%B5%20%D0%BD%D0%B0%D1%81%D1%82%D1%80%D0%BE%D0%B9%D0%BA%D0%B8%20%D0%B4%D1%80%D0%BE%D0%BD%D0%B0%20-%20aerophoto.com_files/post-type-dynamic.css" type="text/css" media="all">
<link rel="stylesheet" id="style-css" href="%D0%9A%D0%B0%D0%BA%20%D0%B2%D0%BA%D0%BB%D1%8E%D1%87%D0%B8%D1%82%D1%8C%20%D1%80%D0%B5%D0%B6%D0%B8%D0%BC%20ATTI%20%D0%BD%D0%B0%20DJI%20Mavic%203,%20%D0%B8%20%D0%B7%D0%B0%D0%BA%D1%80%D1%8B%D1%82%D1%8B%D0%B5%20%D0%BD%D0%B0%D1%81%D1%82%D1%80%D0%BE%D0%B9%D0%BA%D0%B8%20%D0%B4%D1%80%D0%BE%D0%BD%D0%B0%20-%20aerophoto.com_files/style.css" type="text/css" media="all">
<link rel="stylesheet" id="jetpack_css-css" href="%D0%9A%D0%B0%D0%BA%20%D0%B2%D0%BA%D0%BB%D1%8E%D1%87%D0%B8%D1%82%D1%8C%20%D1%80%D0%B5%D0%B6%D0%B8%D0%BC%20ATTI%20%D0%BD%D0%B0%20DJI%20Mavic%203,%20%D0%B8%20%D0%B7%D0%B0%D0%BA%D1%80%D1%8B%D1%82%D1%8B%D0%B5%20%D0%BD%D0%B0%D1%81%D1%82%D1%80%D0%BE%D0%B9%D0%BA%D0%B8%20%D0%B4%D1%80%D0%BE%D0%BD%D0%B0%20-%20aerophoto.com_files/jetpack.css" type="text/css" media="all">
<script type="text/javascript" src="%D0%9A%D0%B0%D0%BA%20%D0%B2%D0%BA%D0%BB%D1%8E%D1%87%D0%B8%D1%82%D1%8C%20%D1%80%D0%B5%D0%B6%D0%B8%D0%BC%20ATTI%20%D0%BD%D0%B0%20DJI%20Mavic%203,%20%D0%B8%20%D0%B7%D0%B0%D0%BA%D1%80%D1%8B%D1%82%D1%8B%D0%B5%20%D0%BD%D0%B0%D1%81%D1%82%D1%80%D0%BE%D0%B9%D0%BA%D0%B8%20%D0%B4%D1%80%D0%BE%D0%BD%D0%B0%20-%20aerophoto.com_files/jquery.min.js" id="jquery-core-js"></script>
<script type="text/javascript" src="%D0%9A%D0%B0%D0%BA%20%D0%B2%D0%BA%D0%BB%D1%8E%D1%87%D0%B8%D1%82%D1%8C%20%D1%80%D0%B5%D0%B6%D0%B8%D0%BC%20ATTI%20%D0%BD%D0%B0%20DJI%20Mavic%203,%20%D0%B8%20%D0%B7%D0%B0%D0%BA%D1%80%D1%8B%D1%82%D1%8B%D0%B5%20%D0%BD%D0%B0%D1%81%D1%82%D1%80%D0%BE%D0%B9%D0%BA%D0%B8%20%D0%B4%D1%80%D0%BE%D0%BD%D0%B0%20-%20aerophoto.com_files/jquery-migrate.min.js" id="jquery-migrate-js"></script>
<script type="text/javascript" src="%D0%9A%D0%B0%D0%BA%20%D0%B2%D0%BA%D0%BB%D1%8E%D1%87%D0%B8%D1%82%D1%8C%20%D1%80%D0%B5%D0%B6%D0%B8%D0%BC%20ATTI%20%D0%BD%D0%B0%20DJI%20Mavic%203,%20%D0%B8%20%D0%B7%D0%B0%D0%BA%D1%80%D1%8B%D1%82%D1%8B%D0%B5%20%D0%BD%D0%B0%D1%81%D1%82%D1%80%D0%BE%D0%B9%D0%BA%D0%B8%20%D0%B4%D1%80%D0%BE%D0%BD%D0%B0%20-%20aerophoto.com_files/jquery.cookie.js" id="jquery.cookie-js"></script>
<script type="text/javascript" id="wpml-cookie-js-extra">
/* <![CDATA[ */
var wpml_cookies = {"wp-wpml_current_language":{"value":"ru","expires":1,"path":"\/"}};
var wpml_cookies = {"wp-wpml_current_language":{"value":"ru","expires":1,"path":"\/"}};
/* ]]> */
</script>
<script type="text/javascript" src="%D0%9A%D0%B0%D0%BA%20%D0%B2%D0%BA%D0%BB%D1%8E%D1%87%D0%B8%D1%82%D1%8C%20%D1%80%D0%B5%D0%B6%D0%B8%D0%BC%20ATTI%20%D0%BD%D0%B0%20DJI%20Mavic%203,%20%D0%B8%20%D0%B7%D0%B0%D0%BA%D1%80%D1%8B%D1%82%D1%8B%D0%B5%20%D0%BD%D0%B0%D1%81%D1%82%D1%80%D0%BE%D0%B9%D0%BA%D0%B8%20%D0%B4%D1%80%D0%BE%D0%BD%D0%B0%20-%20aerophoto.com_files/language-cookie.js" id="wpml-cookie-js"></script>
<script type="text/javascript" src="%D0%9A%D0%B0%D0%BA%20%D0%B2%D0%BA%D0%BB%D1%8E%D1%87%D0%B8%D1%82%D1%8C%20%D1%80%D0%B5%D0%B6%D0%B8%D0%BC%20ATTI%20%D0%BD%D0%B0%20DJI%20Mavic%203,%20%D0%B8%20%D0%B7%D0%B0%D0%BA%D1%80%D1%8B%D1%82%D1%8B%D0%B5%20%D0%BD%D0%B0%D1%81%D1%82%D1%80%D0%BE%D0%B9%D0%BA%D0%B8%20%D0%B4%D1%80%D0%BE%D0%BD%D0%B0%20-%20aerophoto.com_files/frontend-gtag.min.js" id="monsterinsights-frontend-script-js"></script>
<script data-cfasync="false" data-wpfc-render="false" type="text/javascript" id="monsterinsights-frontend-script-js-extra">/* <![CDATA[ */
var monsterinsights_frontend = {"js_events_tracking":"true","download_extensions":"doc,pdf,ppt,zip,xls,docx,pptx,xlsx","inbound_paths":"[{\"path\":\"\\\/go\\\/\",\"label\":\"affiliate\"},{\"path\":\"\\\/recommend\\\/\",\"label\":\"affiliate\"}]","home_url":"https:\/\/aerophoto.com.ua","hash_tracking":"false","ua":"UA-27325158-1","v4_id":""};/* ]]> */
</script>
<script type="text/javascript" id="nextchat-js-js-extra">
/* <![CDATA[ */
var nextchat = {"url":"https:\/\/aerophoto.com.ua\/wp-admin\/admin-ajax.php"};
/* ]]> */
</script>
<script type="text/javascript" src="%D0%9A%D0%B0%D0%BA%20%D0%B2%D0%BA%D0%BB%D1%8E%D1%87%D0%B8%D1%82%D1%8C%20%D1%80%D0%B5%D0%B6%D0%B8%D0%BC%20ATTI%20%D0%BD%D0%B0%20DJI%20Mavic%203,%20%D0%B8%20%D0%B7%D0%B0%D0%BA%D1%80%D1%8B%D1%82%D1%8B%D0%B5%20%D0%BD%D0%B0%D1%81%D1%82%D1%80%D0%BE%D0%B9%D0%BA%D0%B8%20%D0%B4%D1%80%D0%BE%D0%BD%D0%B0%20-%20aerophoto.com_files/functions.js" id="nextchat-js-js"></script>
<script type="text/javascript" src="%D0%9A%D0%B0%D0%BA%20%D0%B2%D0%BA%D0%BB%D1%8E%D1%87%D0%B8%D1%82%D1%8C%20%D1%80%D0%B5%D0%B6%D0%B8%D0%BC%20ATTI%20%D0%BD%D0%B0%20DJI%20Mavic%203,%20%D0%B8%20%D0%B7%D0%B0%D0%BA%D1%80%D1%8B%D1%82%D1%8B%D0%B5%20%D0%BD%D0%B0%D1%81%D1%82%D1%80%D0%BE%D0%B9%D0%BA%D0%B8%20%D0%B4%D1%80%D0%BE%D0%BD%D0%B0%20-%20aerophoto.com_files/rbtools.min.js" id="tp-tools-js"></script>
<script type="text/javascript" src="%D0%9A%D0%B0%D0%BA%20%D0%B2%D0%BA%D0%BB%D1%8E%D1%87%D0%B8%D1%82%D1%8C%20%D1%80%D0%B5%D0%B6%D0%B8%D0%BC%20ATTI%20%D0%BD%D0%B0%20DJI%20Mavic%203,%20%D0%B8%20%D0%B7%D0%B0%D0%BA%D1%80%D1%8B%D1%82%D1%8B%D0%B5%20%D0%BD%D0%B0%D1%81%D1%82%D1%80%D0%BE%D0%B9%D0%BA%D0%B8%20%D0%B4%D1%80%D0%BE%D0%BD%D0%B0%20-%20aerophoto.com_files/rs6.min.js" id="revmin-js"></script>
<script type="text/javascript" id="dt-above-fold-js-extra">
/* <![CDATA[ */
var dtLocal = {"themeUrl":"https:\/\/aerophoto.com.ua\/wp-content\/themes\/dt-the7","passText":"\u0414\u043b\u044f \u043f\u0440\u043e\u0441\u043c\u043e\u0442\u0440\u0430 \u044d\u0442\u043e\u0439 \u0437\u0430\u043a\u0440\u044b\u0442\u043e\u0439 \u043f\u0443\u0431\u043b\u0438\u043a\u0430\u0446\u0438\u0438, \u0432\u0432\u0435\u0434\u0438\u0442\u0435 \u043f\u0430\u0440\u043e\u043b\u044c \u043d\u0438\u0436\u0435:","moreButtonText":{"loading":"\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430 ...","loadMore":"\u0417\u0430\u0433\u0440\u0443\u0437\u0438\u0442\u044c \u0435\u0449\u0451"},"postID":"5513","ajaxurl":"https:\/\/aerophoto.com.ua\/wp-admin\/admin-ajax.php","REST":{"baseUrl":"https:\/\/aerophoto.com.ua\/wp-json\/the7\/v1","endpoints":{"sendMail":"\/send-mail"}},"contactMessages":{"required":"One or more fields have an error. Please check and try again.","terms":"Please accept the privacy policy.","fillTheCaptchaError":"Please, fill the captcha."},"captchaSiteKey":"","ajaxNonce":"8d39265f8a","pageData":"","themeSettings":{"smoothScroll":"off","lazyLoading":false,"accentColor":{"mode":"solid","color":"#ec7834"},"desktopHeader":{"height":0},"ToggleCaptionEnabled":"disabled","ToggleCaption":"Navigation","floatingHeader":{"showAfter":160,"showMenu":true,"height":70,"logo":{"showLogo":true,"html":"","url":"https:\/\/aerophoto.com.ua\/"}},"topLine":{"floatingTopLine":{"logo":{"showLogo":false,"html":""}}},"mobileHeader":{"firstSwitchPoint":1060,"secondSwitchPoint":778,"firstSwitchPointHeight":70,"secondSwitchPointHeight":60,"mobileToggleCaptionEnabled":"disabled","mobileToggleCaption":"\u041c\u0435\u043d\u044e"},"stickyMobileHeaderFirstSwitch":{"logo":{"html":""}},"stickyMobileHeaderSecondSwitch":{"logo":{"html":""}},"content":{"textColor":"#444444","headerColor":"#000000"},"sidebar":{"switchPoint":990},"boxedWidth":"1280px","stripes":{"stripe1":{"textColor":"#4d4f51","headerColor":"#4d4f51"},"stripe2":{"textColor":"#ffffff","headerColor":"#ffffff"},"stripe3":{"textColor":"#ffffff","headerColor":"#ffffff"}}},"VCMobileScreenWidth":"768"};
var dtShare = {"shareButtonText":{"facebook":"\u041f\u043e\u0434\u0435\u043b\u0438\u0442\u0441\u044f Facebook","twitter":"Tweet","pinterest":"Pin it","linkedin":"\u041f\u043e\u0434\u0435\u043b\u0438\u0442\u0441\u044f Linkedin","whatsapp":"Share on Whatsapp"},"overlayOpacity":"85"};
/* ]]> */
</script>
<script type="text/javascript" src="%D0%9A%D0%B0%D0%BA%20%D0%B2%D0%BA%D0%BB%D1%8E%D1%87%D0%B8%D1%82%D1%8C%20%D1%80%D0%B5%D0%B6%D0%B8%D0%BC%20ATTI%20%D0%BD%D0%B0%20DJI%20Mavic%203,%20%D0%B8%20%D0%B7%D0%B0%D0%BA%D1%80%D1%8B%D1%82%D1%8B%D0%B5%20%D0%BD%D0%B0%D1%81%D1%82%D1%80%D0%BE%D0%B9%D0%BA%D0%B8%20%D0%B4%D1%80%D0%BE%D0%BD%D0%B0%20-%20aerophoto.com_files/above-the-fold.min.js" id="dt-above-fold-js"></script>
<link rel="https://api.w.org/" href="https://aerophoto.com.ua/wp-json/"><link rel="alternate" type="application/json" href="https://aerophoto.com.ua/wp-json/wp/v2/posts/5513"><link rel="EditURI" type="application/rsd+xml" title="RSD" href="https://aerophoto.com.ua/xmlrpc.php?rsd">
<link rel="wlwmanifest" type="application/wlwmanifest+xml" href="https://aerophoto.com.ua/wp-includes/wlwmanifest.xml"> 
<meta name="generator" content="WordPress 5.7.7">
<link rel="shortlink" href="https://aerophoto.com.ua/?p=5513">
<link rel="alternate" type="application/json+oembed" href="https://aerophoto.com.ua/wp-json/oembed/1.0/embed?url=https%3A%2F%2Faerophoto.com.ua%2F2022%2F05%2F18%2Fatti-for-mavic-3%2F">
<link rel="alternate" type="text/xml+oembed" href="https://aerophoto.com.ua/wp-json/oembed/1.0/embed?url=https%3A%2F%2Faerophoto.com.ua%2F2022%2F05%2F18%2Fatti-for-mavic-3%2F&amp;format=xml">
<meta name="generator" content="WPML ver:4.4.10 stt:45,54;">


<!-- This site is optimized with the Schema plugin v1.7.9.5 - https://schema.press -->
<script type="application/ld+json">[{"@context":"http:\/\/schema.org\/","@type":"WPHeader","url":"https:\/\/aerophoto.com.ua\/2022\/05\/18\/atti-for-mavic-3\/","headline":"Как включить режим ATTI на DJI Mavic 3, и закрытые настройки дрона","description":"Режим ATTI и хак параметров полета на дроне DJI Mavic 3 1. Что такое режим АTI на дронах..."},{"@context":"http:\/\/schema.org\/","@type":"WPFooter","url":"https:\/\/aerophoto.com.ua\/2022\/05\/18\/atti-for-mavic-3\/","headline":"Как включить режим ATTI на DJI Mavic 3, и закрытые настройки дрона","description":"Режим ATTI и хак параметров полета на дроне DJI Mavic 3 1. Что такое режим АTI на дронах...","copyrightYear":"2022"}]</script>



<!-- This site is optimized with the Schema plugin v1.7.9.5 - https://schema.press -->
<script type="application/ld+json">{"@context":"https:\/\/schema.org\/","@type":"BlogPosting","mainEntityOfPage":{"@type":"WebPage","@id":"https:\/\/aerophoto.com.ua\/2022\/05\/18\/atti-for-mavic-3\/"},"url":"https:\/\/aerophoto.com.ua\/2022\/05\/18\/atti-for-mavic-3\/","headline":"Как включить режим ATTI на DJI Mavic 3, и закрытые настройки дрона","datePublished":"2022-05-18T16:11:06+03:00","dateModified":"2022-09-27T22:04:39+03:00","publisher":{"@type":"Organization","@id":"https:\/\/aerophoto.com.ua\/#organization","name":"aerophoto.com.ua","logo":{"@type":"ImageObject","url":"https:\/\/aerophoto.com.ua\/wp-content\/uploads\/2020\/09\/dmitrij-slediuk-drone-school.jpg","width":600,"height":60}},"image":{"@type":"ImageObject","url":"https:\/\/aerophoto.com.ua\/wp-content\/uploads\/2022\/05\/dji_mavic_3.jpg","width":1276,"height":638},"articleSection":"Статьи","description":"Режим ATTI и хак параметров полета на дроне DJI Mavic 3 1. Что такое режим АTI на дронах DJI, и как он работает. 2. История вопроса. Почему был, а потом исчез режим АТТI на дронах DJI. 3. Зачем включать режим АТТI на дронах DJI. 4. Что понадобится для открытия","author":{"@type":"Person","name":"admin","url":"https:\/\/aerophoto.com.ua\/author\/admin\/","image":{"@type":"ImageObject","url":"https:\/\/secure.gravatar.com\/avatar\/55398a9a753ce36a23a18d8d5d794030?s=96&d=mm&r=g","height":96,"width":96}}}</script>

<link rel="pingback" href="https://aerophoto.com.ua/xmlrpc.php">
<style type="text/css">.recentcomments a{display:inline !important;padding:0 !important;margin:0 !important;}</style><meta name="generator" content="Powered by WPBakery Page Builder - drag and drop page builder for WordPress.">


<!-- This site is optimized with the Schema plugin v1.7.9.5 - https://schema.press -->
<script type="application/ld+json">{
    "@context": "http://schema.org",
    "@type": "BreadcrumbList",
    "itemListElement": [
        {
            "@type": "ListItem",
            "position": 1,
            "item": {
                "@id": "https://aerophoto.com.ua",
                "name": "Home"
            }
        },
        {
            "@type": "ListItem",
            "position": 2,
            "item": {
                "@id": "https://aerophoto.com.ua/2022/05/18/atti-for-mavic-3/",
                "name": "\u041a\u0430\u043a \u0432\u043a\u043b\u044e\u0447\u0438\u0442\u044c \u0440\u0435\u0436\u0438\u043c ATTI \u043d\u0430 DJI Mavic 3, \u0438 \u0437\u0430\u043a\u0440\u044b\u0442\u044b\u0435 \u043d\u0430\u0441\u0442\u0440\u043e\u0439\u043a\u0438 \u0434\u0440\u043e\u043d\u0430",
                "image": "https://aerophoto.com.ua/wp-content/uploads/2022/05/dji_mavic_3.jpg"
            }
        }
    ]
}</script>

<meta name="generator" content="Powered by Slider Revolution 6.4.11 - responsive, Mobile-Friendly Slider Plugin for WordPress with comfortable drag and drop interface.">
<script type="text/javascript" id="the7-loader-script">
document.addEventListener("DOMContentLoaded", function(event) { 
	var load = document.getElementById("load");
	if(!load.classList.contains('loader-removed')){
		var removeLoading = setTimeout(function() {
			load.className += " loader-removed";
		}, 300);
	}
});
</script>
		<link rel="icon" href="https://aerophoto.com.ua/wp-content/uploads/2019/12/favicon.ico" type="image/x-icon" sizes="16x16"><script type="text/javascript">function setREVStartSize(e){
			//window.requestAnimationFrame(function() {				 
				window.RSIW = window.RSIW===undefined ? window.innerWidth : window.RSIW;	
				window.RSIH = window.RSIH===undefined ? window.innerHeight : window.RSIH;	
				try {								
					var pw = document.getElementById(e.c).parentNode.offsetWidth,
						newh;
					pw = pw===0 || isNaN(pw) ? window.RSIW : pw;
					e.tabw = e.tabw===undefined ? 0 : parseInt(e.tabw);
					e.thumbw = e.thumbw===undefined ? 0 : parseInt(e.thumbw);
					e.tabh = e.tabh===undefined ? 0 : parseInt(e.tabh);
					e.thumbh = e.thumbh===undefined ? 0 : parseInt(e.thumbh);
					e.tabhide = e.tabhide===undefined ? 0 : parseInt(e.tabhide);
					e.thumbhide = e.thumbhide===undefined ? 0 : parseInt(e.thumbhide);
					e.mh = e.mh===undefined || e.mh=="" || e.mh==="auto" ? 0 : parseInt(e.mh,0);		
					if(e.layout==="fullscreen" || e.l==="fullscreen") 						
						newh = Math.max(e.mh,window.RSIH);					
					else{					
						e.gw = Array.isArray(e.gw) ? e.gw : [e.gw];
						for (var i in e.rl) if (e.gw[i]===undefined || e.gw[i]===0) e.gw[i] = e.gw[i-1];					
						e.gh = e.el===undefined || e.el==="" || (Array.isArray(e.el) && e.el.length==0)? e.gh : e.el;
						e.gh = Array.isArray(e.gh) ? e.gh : [e.gh];
						for (var i in e.rl) if (e.gh[i]===undefined || e.gh[i]===0) e.gh[i] = e.gh[i-1];
											
						var nl = new Array(e.rl.length),
							ix = 0,						
							sl;					
						e.tabw = e.tabhide>=pw ? 0 : e.tabw;
						e.thumbw = e.thumbhide>=pw ? 0 : e.thumbw;
						e.tabh = e.tabhide>=pw ? 0 : e.tabh;
						e.thumbh = e.thumbhide>=pw ? 0 : e.thumbh;					
						for (var i in e.rl) nl[i] = e.rl[i]<window.RSIW ? 0 : e.rl[i];
						sl = nl[0];									
						for (var i in nl) if (sl>nl[i] && nl[i]>0) { sl = nl[i]; ix=i;}															
						var m = pw>(e.gw[ix]+e.tabw+e.thumbw) ? 1 : (pw-(e.tabw+e.thumbw)) / (e.gw[ix]);					
						newh =  (e.gh[ix] * m) + (e.tabh + e.thumbh);
					}				
					if(window.rs_init_css===undefined) window.rs_init_css = document.head.appendChild(document.createElement("style"));					
					document.getElementById(e.c).height = newh+"px";
					window.rs_init_css.innerHTML += "#"+e.c+"_wrapper { height: "+newh+"px }";				
				} catch(e){
					console.log("Failure at Presize of Slider:" + e)
				}					   
			//});
		  };</script>
<link rel="alternate" type="application/rss+xml" title="RSS" href="https://aerophoto.com.ua/rsslatest.xml">		<style type="text/css" id="wp-custom-css">
			.wpml-ls-menu-item a {
	margin: 0 !important;
}
.wpml-ls-menu-item a .decoration-line {
	display: none;
}
.wpml-ls-menu-item a:hover {
    background-color: transparent !important;
}
.wsp-posts-title, .wsp-pages-title {
    display: none;
}
#main {
    padding: 0 !important;
}
#main-slideshow a {
	color: #fff !important;
	text-decoration: none;
}
.wpml-ls-item .sub-nav {
    width: auto !important;
    margin-left: 10px;
}		</style>
		<style type="text/css" data-type="vc_shortcodes-custom-css">.vc_custom_1652880563022{margin-top: 0px !important;margin-bottom: 0px !important;border-top-width: 0px !important;border-bottom-width: 0px !important;padding-top: 0px !important;padding-bottom: 0px !important;}.vc_custom_1652880578555{margin-top: 0px !important;margin-bottom: 0px !important;border-top-width: 0px !important;border-bottom-width: 0px !important;padding-top: 0px !important;padding-bottom: 0px !important;}.vc_custom_1652880594428{margin-top: 0px !important;margin-bottom: 0px !important;border-top-width: 0px !important;border-bottom-width: 0px !important;padding-top: 0px !important;padding-bottom: 0px !important;}.vc_custom_1652880610526{margin-top: 0px !important;margin-bottom: 0px !important;border-top-width: 0px !important;border-bottom-width: 0px !important;padding-top: 0px !important;padding-bottom: 0px !important;}.vc_custom_1652953486393{margin-top: 0px !important;margin-bottom: 0px !important;border-top-width: 0px !important;border-bottom-width: 0px !important;padding-top: 0px !important;padding-bottom: 0px !important;}.vc_custom_1652946655278{margin-top: 0px !important;margin-bottom: 0px !important;border-top-width: 0px !important;border-bottom-width: 0px !important;padding-top: 0px !important;padding-bottom: 0px !important;}.vc_custom_1662648294908{margin-top: 0px !important;margin-bottom: 0px !important;border-top-width: 0px !important;border-bottom-width: 0px !important;padding-top: 0px !important;padding-bottom: 0px !important;}.vc_custom_1652946655278{margin-top: 0px !important;margin-bottom: 0px !important;border-top-width: 0px !important;border-bottom-width: 0px !important;padding-top: 0px !important;padding-bottom: 0px !important;}.vc_custom_1664304922687{margin-top: 0px !important;margin-bottom: 0px !important;border-top-width: 0px !important;border-bottom-width: 0px !important;padding-top: 0px !important;padding-bottom: 0px !important;}.vc_custom_1664304633847{margin-bottom: 0px !important;border-bottom-width: 0px !important;padding-bottom: 0px !important;}.vc_custom_1664305474414{margin-top: 0px !important;margin-bottom: 0px !important;border-top-width: 0px !important;border-bottom-width: 0px !important;padding-top: 0px !important;padding-bottom: 0px !important;}.vc_custom_1662649085777{margin-top: 0px !important;margin-bottom: 0px !important;border-top-width: 0px !important;border-bottom-width: 0px !important;padding-top: 0px !important;padding-bottom: 0px !important;}.vc_custom_1662703511170{margin-bottom: 0px !important;border-bottom-width: 0px !important;padding-bottom: 0px !important;}.vc_custom_1662649285024{margin-top: 0px !important;margin-bottom: 0px !important;border-top-width: 0px !important;border-bottom-width: 0px !important;padding-top: 0px !important;padding-bottom: 0px !important;}.vc_custom_1652880640000{margin-top: 0px !important;margin-bottom: 0px !important;border-top-width: 0px !important;border-bottom-width: 0px !important;padding-top: 0px !important;padding-bottom: 0px !important;}.vc_custom_1652946655278{margin-top: 0px !important;margin-bottom: 0px !important;border-top-width: 0px !important;border-bottom-width: 0px !important;padding-top: 0px !important;padding-bottom: 0px !important;}.vc_custom_1654001213667{margin-top: 0px !important;margin-bottom: 0px !important;border-top-width: 0px !important;border-bottom-width: 0px !important;padding-top: 0px !important;padding-bottom: 0px !important;}.vc_custom_1654001252804{margin-top: 0px !important;margin-bottom: 0px !important;border-top-width: 0px !important;border-bottom-width: 0px !important;padding-top: 0px !important;padding-bottom: 0px !important;}.vc_custom_1654007760624{margin-top: 0px !important;margin-bottom: 0px !important;border-top-width: 0px !important;border-bottom-width: 0px !important;padding-top: 0px !important;padding-bottom: 0px !important;}.vc_custom_1654006403200{margin-bottom: 0px !important;border-bottom-width: 0px !important;padding-bottom: 0px !important;}.vc_custom_1654005922771{margin-top: 0px !important;margin-bottom: 0px !important;border-top-width: 0px !important;border-bottom-width: 0px !important;padding-top: 0px !important;padding-bottom: 0px !important;}.vc_custom_1654007572529{margin-top: 0px !important;margin-bottom: 0px !important;border-top-width: 0px !important;border-bottom-width: 0px !important;padding-top: 0px !important;padding-bottom: 0px !important;}.vc_custom_1654007955929{margin-bottom: 0px !important;border-bottom-width: 0px !important;padding-bottom: 0px !important;}.vc_custom_1654007989009{margin-top: 0px !important;margin-bottom: 0px !important;border-top-width: 0px !important;border-bottom-width: 0px !important;padding-top: 0px !important;padding-bottom: 0px !important;}.vc_custom_1654008326104{margin-top: 0px !important;margin-bottom: 0px !important;border-top-width: 0px !important;border-bottom-width: 0px !important;padding-top: 0px !important;padding-bottom: 0px !important;}.vc_custom_1654008517417{margin-bottom: 0px !important;border-bottom-width: 0px !important;padding-bottom: 0px !important;}.vc_custom_1654008399376{margin-top: 0px !important;margin-bottom: 0px !important;border-top-width: 0px !important;border-bottom-width: 0px !important;padding-top: 0px !important;padding-bottom: 0px !important;}.vc_custom_1662235095494{margin-top: 0px !important;margin-bottom: 0px !important;border-top-width: 0px !important;border-bottom-width: 0px !important;padding-top: 0px !important;padding-bottom: 0px !important;}.vc_custom_1652946667958{margin-top: 0px !important;margin-bottom: 0px !important;border-top-width: 0px !important;border-bottom-width: 0px !important;padding-top: 0px !important;padding-bottom: 0px !important;}.vc_custom_1652946678973{margin-top: 0px !important;margin-bottom: 0px !important;border-top-width: 0px !important;border-bottom-width: 0px !important;padding-top: 0px !important;padding-bottom: 0px !important;}.vc_custom_1652953672509{margin-bottom: 0px !important;border-bottom-width: 0px !important;padding-bottom: 0px !important;}.vc_custom_1652953719527{margin-top: 0px !important;margin-bottom: 0px !important;border-top-width: 0px !important;border-bottom-width: 0px !important;padding-top: 0px !important;padding-bottom: 0px !important;}.vc_custom_1652953810510{margin-bottom: 0px !important;border-bottom-width: 0px !important;padding-bottom: 0px !important;}.vc_custom_1652953837468{margin-top: 0px !important;margin-bottom: 0px !important;border-top-width: 0px !important;border-bottom-width: 0px !important;padding-top: 0px !important;padding-bottom: 0px !important;}.vc_custom_1652946667958{margin-top: 0px !important;margin-bottom: 0px !important;border-top-width: 0px !important;border-bottom-width: 0px !important;padding-top: 0px !important;padding-bottom: 0px !important;}.vc_custom_1652946678973{margin-top: 0px !important;margin-bottom: 0px !important;border-top-width: 0px !important;border-bottom-width: 0px !important;padding-top: 0px !important;padding-bottom: 0px !important;}.vc_custom_1652946583819{margin-bottom: 0px !important;border-bottom-width: 0px !important;padding-bottom: 0px !important;}.vc_custom_1652946893214{margin-top: 0px !important;margin-bottom: 0px !important;border-top-width: 0px !important;border-bottom-width: 0px !important;padding-top: 0px !important;padding-bottom: 0px !important;}.vc_custom_1652950800974{margin-bottom: 0px !important;border-bottom-width: 0px !important;padding-bottom: 0px !important;}.vc_custom_1652950910336{margin-top: 0px !important;margin-bottom: 0px !important;border-top-width: 0px !important;border-bottom-width: 0px !important;padding-top: 0px !important;padding-bottom: 0px !important;}.vc_custom_1652946667958{margin-top: 0px !important;margin-bottom: 0px !important;border-top-width: 0px !important;border-bottom-width: 0px !important;padding-top: 0px !important;padding-bottom: 0px !important;}.vc_custom_1652946678973{margin-top: 0px !important;margin-bottom: 0px !important;border-top-width: 0px !important;border-bottom-width: 0px !important;padding-top: 0px !important;padding-bottom: 0px !important;}.vc_custom_1652953211058{margin-bottom: 0px !important;border-bottom-width: 0px !important;padding-bottom: 0px !important;}.vc_custom_1652953265267{margin-top: 0px !important;margin-bottom: 0px !important;border-top-width: 0px !important;border-bottom-width: 0px !important;padding-top: 0px !important;padding-bottom: 0px !important;}.vc_custom_1652953399641{margin-bottom: 0px !important;border-bottom-width: 0px !important;padding-bottom: 0px !important;}.vc_custom_1652953433086{margin-top: 0px !important;margin-bottom: 0px !important;border-top-width: 0px !important;border-bottom-width: 0px !important;padding-top: 0px !important;padding-bottom: 0px !important;}</style><noscript><style> .wpb_animate_when_almost_visible { opacity: 1; }</style></noscript><script type="text/javascript">
    jQuery(document).ready(function () {
        jQuery('.breadcrumbs li a').each(function () {
            if (
                                    jQuery(this).html() == 'Project') {
                jQuery(this).html('Портфолио');
            }
        });
        jQuery('.wsp-posts-title').html('Статьи');     
    });
</script>

<style id="the7-custom-inline-css" type="text/css">
html {
	scroll-behavior: smooth;
}
.content h1, .content h2, .content h3, .content h4, .content h5, .content h6 {
    clear: none;
    margin-top: 20px;
}
.page-title-breadcrumbs {
    max-width: 100%;
		width: 50%
}
.wsp-category-title {
	display: none;
}
.wsp-posts-list {
    list-style: none !important;
	margin-left: 10px !important;
}
.wsp-posts-list ul {
    list-style: disc !important;
}
.wrapper-nextchat-plugin-view .default-button, .wrapper-nextchat-plugin-view .default-button span {
    background: #ec7834 !important;
}
.mini-widgets .text-area a {
    text-decoration: none !important;
    margin-left: 20px;
}
.owl-carousel.blog-carousel-shortcode .entry-title {
	  margin: 0;
    font-size: 14px !important;
    line-height: 20px !important;
}
.owl-carousel.blog-carousel-shortcode .post-entry-content {
	    width: 100%;
    background: rgba(0,0,0,0.8) !important;
    background: -moz-linear-gradient(top,rgba(0,0,0,0) 0%,rgba(0,0,0,0.8) 65%,rgba(0,0,0,0.8) 100%) !important;
    background: -webkit-linear-gradient(top,rgba(0,0,0,0) 0%,rgba(0,0,0,0.65) 65%,rgba(0,0,0,0.75) 100%) !important;
    background: linear-gradient(to bottom,rgba(0,0,0,0) 0%,rgba(0, 0, 0, 0.5) 65%,rgba(0, 0, 0, 0.8) 100%) !important;
}
.wpb_content_element p em, article p em {
	font-size: 14px !important;
    line-height: 20px !important;
}
.single .post-thumbnail {
    width: 50%;
    margin: auto;
}
/*
.vc_single_image-wrapper {
   background-color: #ebebeb;
	  padding: 6px;
}

 */



.content h6 {
	margin-top: 10px;
}



/* Media Querry */
@media screen and (max-width: 768px) {
	.page-title-breadcrumbs {
    max-width: 100%;
		width: 100%
}
	.assistive-text {
    display: none;
}
	.page-title-responsive-enabled.page-title.title-left .breadcrumbs {
    width: 100%;
}
	.uvc-heading h2 {
    font-size: 34px !important;
    line-height: 44px !important;
}
	.uvc-sub-heading {
    font-size: 24px !important;
    line-height: 34px !important;
}
}
</style>
</head>
<body id="the7-body" class="post-template-default single single-post postid-5513 single-format-standard wp-embed-responsive the7-core-ver-2.7.0 dt-responsive-on right-mobile-menu-close-icon ouside-menu-close-icon mobile-hamburger-close-bg-enable mobile-hamburger-close-bg-hover-enable fade-medium-mobile-menu-close-icon fade-small-menu-close-icon srcset-enabled btn-flat custom-btn-color custom-btn-hover-color phantom-slide phantom-shadow-decoration phantom-custom-logo-on sticky-mobile-header top-header first-switch-logo-left first-switch-menu-right second-switch-logo-left second-switch-menu-right right-mobile-menu layzr-loading-on popup-message-style dt-fa-compatibility the7-ver-9.10.1 wpb-js-composer js-comp-ver-6.6.0.1 vc_responsive no-mobile closed-overlay-mobile-header">
<!-- The7 9.10.1 -->
<div id="load" class="ring-loader loader-removed">
	<div class="load-wrap"></div>
</div>
<div id="page" class="closed-mobile-header">
	<a class="skip-link screen-reader-text" href="#content">Перейти к содержанию</a>

<div class="mobile-header-space"></div><div class="masthead classic-header justify bg-behind-menu logo-center widgets surround shadow-mobile-header-decoration small-mobile-menu-icon mobile-menu-icon-bg-on mobile-menu-icon-hover-bg-on dt-parent-menu-clickable show-sub-menu-on-hover show-device-logo show-mobile-logo" role="banner">

	<div class="top-bar top-bar-line-hide">
	<div class="top-bar-bg"></div>
	<div class="left-widgets mini-widgets"><div class="text-area show-on-desktop near-logo-first-switch hide-on-second-switch first"><p><a href="tel:+38 067-710-78-57" class="mini-contacts phone show-on-desktop in-top-bar-left in-menu-second-switch first"><i class=" icomoon-the7-font-the7-phone-04"></i>+38 067-710-78-57</a><a href="mailto:pilot@aerophoto.com.ua" class="mini-contacts email show-on-desktop in-top-bar-left in-menu-second-switch"><i class=" icomoon-the7-font-the7-mail-08"></i>pilot@aerophoto.com.ua</a><a href="https://msng.link/vi/+380%2067%20710%2078%2057" class="mini-contacts email show-on-desktop in-top-bar-left in-menu-second-switch"><i class="moon-icon fab fa-viber"></i>+38 067-710-78-57</a><a href="https://telegram.me/+380%2067%20710%2078%2057" class="mini-contacts email show-on-desktop in-top-bar-left in-menu-second-switch"><i class="moon-icon fab fa-telegram"></i>+38 067-710-78-57</a></p>
</div><span class="mini-contacts multipurpose_1 show-on-desktop near-logo-first-switch in-menu-second-switch last"><i class="fa-fw fas fa-user-circle"></i>Дмитрий Следюк</span><a href="tel:+38 067-710-78-57" class="mini-contacts phone in-top-bar-left in-menu-second-switch hide-on-desktop show-on-first-switch hide-on-second-switch display-none"><i class=" icomoon-the7-font-the7-phone-04"></i>+38 067-710-78-57</a><a href="mailto:pilot@aerophoto.com.ua" class="mini-contacts email in-top-bar-left in-menu-second-switch hide-on-desktop show-on-first-switch hide-on-second-switch display-none"><i class=" icomoon-the7-font-the7-mail-08"></i>pilot@aerophoto.com.ua</a><a href="https://msng.link/vi/+380%2067%20710%2078%2057" class="mini-contacts email in-top-bar-left in-menu-second-switch hide-on-desktop show-on-first-switch hide-on-second-switch display-none"><i class="moon-icon fab fa-viber"></i>+38 067-710-78-57</a><a href="https://telegram.me/+380%2067%20710%2078%2057" class="mini-contacts email in-top-bar-left in-menu-second-switch hide-on-desktop show-on-first-switch hide-on-second-switch display-none"><i class="moon-icon fab fa-telegram"></i>+38 067-710-78-57</a></div><div class="right-widgets mini-widgets"><div class="mini-search show-on-desktop near-logo-first-switch near-logo-second-switch popup-search custom-icon first last"><form class="searchform mini-widget-searchform" role="search" method="get" action="https://aerophoto.com.ua/">

	<div class="screen-reader-text">Поиск:</div>

	
		<a href="" class="submit text-disable"><i class=" mw-icon the7-mw-icon-search-bold"></i></a>
		<div class="popup-search-wrap">
			<input type="text" class="field searchform-s" name="s" placeholder="Поиск …" title="Search form">
			<a href="" class="search-icon"><i class="the7-mw-icon-search-bold"></i></a>
		</div>

	<input type="hidden" name="lang" value="ru">		<input type="submit" class="assistive-text searchsubmit" value="Вперед!">
</form>
</div></div></div>

	<header class="header-bar">

		<div class="branding">
	<div id="site-title" class="assistive-text">aerophoto.com.ua</div>
	<div id="site-description" class="assistive-text">Аэрофотосъемка с дронов в Украине</div>
	<div class="mini-widgets"></div><div class="mini-widgets"></div></div>

		<nav class="navigation">

			<ul id="primary-menu" class="main-nav bg-outline-decoration hover-bg-decoration hover-line-decoration active-bg-decoration active-line-decoration level-arrows-on outside-item-remove-margin" role="menubar"><li class="menu-item menu-item-type-post_type menu-item-object-page menu-item-home menu-item-3587 first" role="presentation"><a href="https://aerophoto.com.ua/" data-level="1" role="menuitem"><span class="menu-item-text"><span class="menu-text">Главная</span></span><span class="decoration-line"></span></a></li> <li class="menu-item menu-item-type-post_type menu-item-object-page menu-item-4287" role="presentation"><a href="https://aerophoto.com.ua/drone-pilot-school/" data-level="1" role="menuitem"><span class="menu-item-text"><span class="menu-text">Школа пилотов</span></span><span class="decoration-line"></span></a></li> <li class="menu-item menu-item-type-post_type menu-item-object-page menu-item-has-children menu-item-2683 has-children" role="presentation"><a href="https://aerophoto.com.ua/uslugi-s-pomoshhyu-dronov/" data-level="1" role="menuitem"><span class="menu-item-text"><span class="menu-text">Услуги</span></span><span class="decoration-line"></span></a><i class="next-level-button"></i><ul class="sub-nav hover-style-bg level-arrows-on" role="menubar"><li class="menu-item menu-item-type-post_type menu-item-object-page menu-item-3321 first" role="presentation"><a href="https://aerophoto.com.ua/uslugi-s-pomoshhyu-dronov/aerovideosemka/" data-level="2" role="menuitem"><span class="menu-item-text"><span class="menu-text">Аэровидеосъемка</span></span></a></li> <li class="menu-item menu-item-type-post_type menu-item-object-page menu-item-3400" role="presentation"><a href="https://aerophoto.com.ua/uslugi-s-pomoshhyu-dronov/aerogeodeziya-i-kartografiya-s-pomoshhyu-dronov/" data-level="2" role="menuitem"><span class="menu-item-text"><span class="menu-text">Аэрогеодезия и картография</span></span></a></li> <li class="menu-item menu-item-type-post_type menu-item-object-page menu-item-3612" role="presentation"><a href="https://aerophoto.com.ua/drones-with-thermal-cameras/" data-level="2" role="menuitem"><span class="menu-item-text"><span class="menu-text">Тепловизионная съемка</span></span></a></li> <li class="menu-item menu-item-type-post_type menu-item-object-page menu-item-2687" role="presentation"><a href="https://aerophoto.com.ua/uslugi-s-pomoshhyu-dronov/aerofotosemka-panoram-i-virtualnyh-turov/" data-level="2" role="menuitem"><span class="menu-item-text"><span class="menu-text">Съемка виртуальных туров</span></span></a></li> </ul></li> <li class="menu-item menu-item-type-post_type menu-item-object-page menu-item-has-children menu-item-2681 has-children" role="presentation"><a href="https://aerophoto.com.ua/portfolio/" data-level="1" role="menuitem"><span class="menu-item-text"><span class="menu-text">Портфолио</span></span><span class="decoration-line"></span></a><i class="next-level-button"></i><ul class="sub-nav hover-style-bg level-arrows-on" role="menubar" style="left: 0px; opacity: 0; visibility: hidden;"><li class="menu-item menu-item-type-post_type menu-item-object-page menu-item-2701 first" role="presentation"><a href="https://aerophoto.com.ua/uslugi-s-pomoshhyu-dronov/istoriya-i-arheologiya/" data-level="2" role="menuitem"><span class="menu-item-text"><span class="menu-text">История и археология</span></span></a></li> <li class="menu-item menu-item-type-post_type menu-item-object-page menu-item-2689" role="presentation"><a href="https://aerophoto.com.ua/uslugi-s-pomoshhyu-dronov/zemelnye-uchastki/" data-level="2" role="menuitem"><span class="menu-item-text"><span class="menu-text">Земельные участки</span></span></a></li> <li class="menu-item menu-item-type-post_type menu-item-object-page menu-item-2685" role="presentation"><a href="https://aerophoto.com.ua/uslugi-s-pomoshhyu-dronov/reklama/" data-level="2" role="menuitem"><span class="menu-item-text"><span class="menu-text">Воздушная съемка с дронов для рекламы</span></span></a></li> <li class="menu-item menu-item-type-custom menu-item-object-custom menu-item-3145" role="presentation"><a href="https://aerophoto.com.ua/project/virtualnye-tury-portfolio/" data-level="2" role="menuitem"><span class="menu-item-text"><span class="menu-text">Виртуальные туры портфолио</span></span></a></li> <li class="menu-item menu-item-type-post_type menu-item-object-page menu-item-2704" role="presentation"><a href="https://aerophoto.com.ua/uslugi-s-pomoshhyu-dronov/ekologiya/" data-level="2" role="menuitem"><span class="menu-item-text"><span class="menu-text">Воздушная съемка с дронов в экологии</span></span></a></li> </ul></li> <li class="menu-item menu-item-type-post_type menu-item-object-page menu-item-2680" role="presentation"><a href="https://aerophoto.com.ua/stati/" data-level="1" role="menuitem"><span class="menu-item-text"><span class="menu-text">Статьи</span></span><span class="decoration-line"></span></a></li> <li class="menu-item menu-item-type-post_type menu-item-object-page menu-item-2682" role="presentation"><a href="https://aerophoto.com.ua/vopros-otvet/" data-level="1" role="menuitem"><span class="menu-item-text"><span class="menu-text">Вопрос / Ответ</span></span><span class="decoration-line"></span></a></li> <li class="menu-item menu-item-type-post_type menu-item-object-page menu-item-2690" role="presentation"><a href="https://aerophoto.com.ua/prajs-list/" data-level="1" role="menuitem"><span class="menu-item-text"><span class="menu-text">Прайс-лист</span></span><span class="decoration-line"></span></a></li> <li class="menu-item menu-item-type-post_type menu-item-object-page menu-item-2699" role="presentation"><a href="https://aerophoto.com.ua/o-kompanii/" data-level="1" role="menuitem"><span class="menu-item-text"><span class="menu-text">О компании</span></span><span class="decoration-line"></span></a></li> <li class="menu-item wpml-ls-slot-11 wpml-ls-item wpml-ls-item-ru wpml-ls-current-language wpml-ls-menu-item wpml-ls-first-item wpml-ls-last-item menu-item-type-wpml_ls_menu_item menu-item-object-wpml_ls_menu_item menu-item-wpml-ls-11-ru" role="presentation"><a href="https://aerophoto.com.ua/2022/05/18/atti-for-mavic-3/" title="Руc" data-level="1" role="menuitem"><span class="menu-item-text"><span class="menu-text"><span class="wpml-ls-native" lang="ru">Руc</span></span></span><span class="decoration-line"></span></a></li> </ul>
			<div class="mini-widgets"></div>
		</nav>

	</header>

<div class="mobile-header-bar"><div class="mobile-navigation"><a href="#" class="dt-mobile-menu-icon" aria-label="Mobile menu icon"><div class="lines-button "><span class="menu-line"></span><span class="menu-line"></span><span class="menu-line"></span></div></a></div><div class="mobile-mini-widgets"><div class="text-area show-on-desktop near-logo-first-switch hide-on-second-switch show-on-first-switch"><p><a href="tel:+38 067-710-78-57" class="mini-contacts phone show-on-desktop in-top-bar-left in-menu-second-switch first"><i class=" icomoon-the7-font-the7-phone-04"></i>+38 067-710-78-57</a><a href="mailto:pilot@aerophoto.com.ua" class="mini-contacts email show-on-desktop in-top-bar-left in-menu-second-switch"><i class=" icomoon-the7-font-the7-mail-08"></i>pilot@aerophoto.com.ua</a><a href="https://msng.link/vi/+380%2067%20710%2078%2057" class="mini-contacts email show-on-desktop in-top-bar-left in-menu-second-switch"><i class="moon-icon fab fa-viber"></i>+38 067-710-78-57</a><a href="https://telegram.me/+380%2067%20710%2078%2057" class="mini-contacts email show-on-desktop in-top-bar-left in-menu-second-switch"><i class="moon-icon fab fa-telegram"></i>+38 067-710-78-57</a></p>
</div><span class="mini-contacts multipurpose_1 show-on-desktop near-logo-first-switch in-menu-second-switch show-on-first-switch"><i class="fa-fw fas fa-user-circle"></i>Дмитрий Следюк</span><div class="mini-search show-on-desktop near-logo-first-switch near-logo-second-switch popup-search custom-icon show-on-first-switch"><form class="searchform mini-widget-searchform" role="search" method="get" action="https://aerophoto.com.ua/">

	<div class="screen-reader-text">Поиск:</div>

	
		<a href="" class="submit text-disable"><i class=" mw-icon the7-mw-icon-search-bold"></i></a>
		<div class="popup-search-wrap">
			<input type="text" class="field searchform-s" name="s" placeholder="Поиск …" title="Search form">
			<a href="" class="search-icon"><i class="the7-mw-icon-search-bold"></i></a>
		</div>

	<input type="hidden" name="lang" value="ru">		<input type="submit" class="assistive-text searchsubmit" value="Вперед!">
</form>
</div><div class="mini-search show-on-desktop near-logo-first-switch near-logo-second-switch popup-search custom-icon show-on-second-switch"><form class="searchform mini-widget-searchform" role="search" method="get" action="https://aerophoto.com.ua/">

	<div class="screen-reader-text">Поиск:</div>

	
		<a href="" class="submit text-disable"><i class=" mw-icon the7-mw-icon-search-bold"></i></a>
		<div class="popup-search-wrap">
			<input type="text" class="field searchform-s" name="s" placeholder="Поиск …" title="Search form">
			<a href="" class="search-icon"><i class="the7-mw-icon-search-bold"></i></a>
		</div>

	<input type="hidden" name="lang" value="ru">		<input type="submit" class="assistive-text searchsubmit" value="Вперед!">
</form>
</div></div><div class="mobile-branding"></div></div></div>
<div class="dt-mobile-header mobile-menu-show-divider dt-parent-menu-clickable"><div class="mobile-header-scrollbar-wrap">
	<div class="dt-close-mobile-menu-icon"><div class="close-line-wrap"><span class="close-line"></span><span class="close-line"></span><span class="close-line"></span></div></div>	<ul id="mobile-menu" class="mobile-main-nav" role="menubar">
		<li class="menu-item menu-item-type-post_type menu-item-object-page menu-item-home menu-item-3587 first" role="presentation"><a href="https://aerophoto.com.ua/" data-level="1" role="menuitem"><span class="menu-item-text"><span class="menu-text">Главная</span></span></a></li> <li class="menu-item menu-item-type-post_type menu-item-object-page menu-item-4287" role="presentation"><a href="https://aerophoto.com.ua/drone-pilot-school/" data-level="1" role="menuitem"><span class="menu-item-text"><span class="menu-text">Школа пилотов</span></span></a></li> <li class="menu-item menu-item-type-post_type menu-item-object-page menu-item-has-children menu-item-2683 has-children" role="presentation"><a href="https://aerophoto.com.ua/uslugi-s-pomoshhyu-dronov/" data-level="1" role="menuitem"><span class="menu-item-text"><span class="menu-text">Услуги</span></span></a><i class="next-level-button"></i><ul class="sub-nav level-arrows-on" role="menubar"><li class="menu-item menu-item-type-post_type menu-item-object-page menu-item-3321 first" role="presentation"><a href="https://aerophoto.com.ua/uslugi-s-pomoshhyu-dronov/aerovideosemka/" data-level="2" role="menuitem"><span class="menu-item-text"><span class="menu-text">Аэровидеосъемка</span></span></a></li> <li class="menu-item menu-item-type-post_type menu-item-object-page menu-item-3400" role="presentation"><a href="https://aerophoto.com.ua/uslugi-s-pomoshhyu-dronov/aerogeodeziya-i-kartografiya-s-pomoshhyu-dronov/" data-level="2" role="menuitem"><span class="menu-item-text"><span class="menu-text">Аэрогеодезия и картография</span></span></a></li> <li class="menu-item menu-item-type-post_type menu-item-object-page menu-item-3612" role="presentation"><a href="https://aerophoto.com.ua/drones-with-thermal-cameras/" data-level="2" role="menuitem"><span class="menu-item-text"><span class="menu-text">Тепловизионная съемка</span></span></a></li> <li class="menu-item menu-item-type-post_type menu-item-object-page menu-item-2687" role="presentation"><a href="https://aerophoto.com.ua/uslugi-s-pomoshhyu-dronov/aerofotosemka-panoram-i-virtualnyh-turov/" data-level="2" role="menuitem"><span class="menu-item-text"><span class="menu-text">Съемка виртуальных туров</span></span></a></li> </ul></li> <li class="menu-item menu-item-type-post_type menu-item-object-page menu-item-has-children menu-item-2681 has-children" role="presentation"><a href="https://aerophoto.com.ua/portfolio/" data-level="1" role="menuitem"><span class="menu-item-text"><span class="menu-text">Портфолио</span></span></a><i class="next-level-button"></i><ul class="sub-nav level-arrows-on" role="menubar"><li class="menu-item menu-item-type-post_type menu-item-object-page menu-item-2701 first" role="presentation"><a href="https://aerophoto.com.ua/uslugi-s-pomoshhyu-dronov/istoriya-i-arheologiya/" data-level="2" role="menuitem"><span class="menu-item-text"><span class="menu-text">История и археология</span></span></a></li> <li class="menu-item menu-item-type-post_type menu-item-object-page menu-item-2689" role="presentation"><a href="https://aerophoto.com.ua/uslugi-s-pomoshhyu-dronov/zemelnye-uchastki/" data-level="2" role="menuitem"><span class="menu-item-text"><span class="menu-text">Земельные участки</span></span></a></li> <li class="menu-item menu-item-type-post_type menu-item-object-page menu-item-2685" role="presentation"><a href="https://aerophoto.com.ua/uslugi-s-pomoshhyu-dronov/reklama/" data-level="2" role="menuitem"><span class="menu-item-text"><span class="menu-text">Воздушная съемка с дронов для рекламы</span></span></a></li> <li class="menu-item menu-item-type-custom menu-item-object-custom menu-item-3145" role="presentation"><a href="https://aerophoto.com.ua/project/virtualnye-tury-portfolio/" data-level="2" role="menuitem"><span class="menu-item-text"><span class="menu-text">Виртуальные туры портфолио</span></span></a></li> <li class="menu-item menu-item-type-post_type menu-item-object-page menu-item-2704" role="presentation"><a href="https://aerophoto.com.ua/uslugi-s-pomoshhyu-dronov/ekologiya/" data-level="2" role="menuitem"><span class="menu-item-text"><span class="menu-text">Воздушная съемка с дронов в экологии</span></span></a></li> </ul></li> <li class="menu-item menu-item-type-post_type menu-item-object-page menu-item-2680" role="presentation"><a href="https://aerophoto.com.ua/stati/" data-level="1" role="menuitem"><span class="menu-item-text"><span class="menu-text">Статьи</span></span></a></li> <li class="menu-item menu-item-type-post_type menu-item-object-page menu-item-2682" role="presentation"><a href="https://aerophoto.com.ua/vopros-otvet/" data-level="1" role="menuitem"><span class="menu-item-text"><span class="menu-text">Вопрос / Ответ</span></span></a></li> <li class="menu-item menu-item-type-post_type menu-item-object-page menu-item-2690" role="presentation"><a href="https://aerophoto.com.ua/prajs-list/" data-level="1" role="menuitem"><span class="menu-item-text"><span class="menu-text">Прайс-лист</span></span></a></li> <li class="menu-item menu-item-type-post_type menu-item-object-page menu-item-2699" role="presentation"><a href="https://aerophoto.com.ua/o-kompanii/" data-level="1" role="menuitem"><span class="menu-item-text"><span class="menu-text">О компании</span></span></a></li> <li class="menu-item wpml-ls-slot-11 wpml-ls-item wpml-ls-item-ru wpml-ls-current-language wpml-ls-menu-item wpml-ls-first-item wpml-ls-last-item menu-item-type-wpml_ls_menu_item menu-item-object-wpml_ls_menu_item menu-item-wpml-ls-11-ru" role="presentation"><a href="https://aerophoto.com.ua/2022/05/18/atti-for-mavic-3/" title="Руc" data-level="1" role="menuitem"><span class="menu-item-text"><span class="menu-text"><span class="wpml-ls-native" lang="ru">Руc</span></span></span></a></li> 	</ul>
	<div class="mobile-mini-widgets-in-menu first-switch-no-widgets"><a href="tel:+38 067-710-78-57" class="mini-contacts phone show-on-desktop in-top-bar-left in-menu-second-switch first hide-on-desktop hide-on-first-switch show-on-second-switch"><i class=" icomoon-the7-font-the7-phone-04"></i>+38 067-710-78-57</a><a href="mailto:pilot@aerophoto.com.ua" class="mini-contacts email show-on-desktop in-top-bar-left in-menu-second-switch hide-on-desktop hide-on-first-switch show-on-second-switch"><i class=" icomoon-the7-font-the7-mail-08"></i>pilot@aerophoto.com.ua</a><a href="https://msng.link/vi/+380%2067%20710%2078%2057" class="mini-contacts email show-on-desktop in-top-bar-left in-menu-second-switch hide-on-desktop hide-on-first-switch show-on-second-switch"><i class="moon-icon fab fa-viber"></i>+38 067-710-78-57</a><a href="https://telegram.me/+380%2067%20710%2078%2057" class="mini-contacts email show-on-desktop in-top-bar-left in-menu-second-switch hide-on-desktop hide-on-first-switch show-on-second-switch"><i class="moon-icon fab fa-telegram"></i>+38 067-710-78-57</a><span class="mini-contacts multipurpose_1 show-on-desktop near-logo-first-switch in-menu-second-switch last hide-on-desktop hide-on-first-switch show-on-second-switch"><i class="fa-fw fas fa-user-circle"></i>Дмитрий Следюк</span></div>
</div></div>


		<div class="page-title title-left solid-bg page-title-responsive-enabled">
			<div class="wf-wrap">

				<div class="page-title-head hgroup"><h1 class="entry-title">Как включить режим ATTI на DJI Mavic 3, и закрытые настройки дрона</h1></div><div class="page-title-breadcrumbs"><div class="assistive-text">Вы здесь:</div><ol class="breadcrumbs text-small" itemscope="" itemtype="https://schema.org/BreadcrumbList"><li itemprop="itemListElement" itemscope="" itemtype="https://schema.org/ListItem"><a itemprop="item" href="https://aerophoto.com.ua/" title=""><span itemprop="name">Главная</span></a><meta itemprop="position" content="1"></li><li itemprop="itemListElement" itemscope="" itemtype="https://schema.org/ListItem"><a itemprop="item" href="https://aerophoto.com.ua/category/stati/" title=""><span itemprop="name">Статьи</span></a><meta itemprop="position" content="2"></li><li class="current" itemprop="itemListElement" itemscope="" itemtype="https://schema.org/ListItem"><span itemprop="name">Как включить режим ATTI на…</span><meta itemprop="position" content="3"></li></ol></div>			</div>
		</div>

		

<div id="main" class="sidebar-none sidebar-divider-off">

	
	<div class="main-gradient"></div>
	<div class="wf-wrap">
	<div class="wf-container-main">

	

			<div id="content" class="content" role="main">

				
<article id="post-5513" class="post-5513 post type-post status-publish format-standard has-post-thumbnail category-stati category-2 description-off">

	<div class="post-thumbnail"><img class="preload-me lazy-load is-loaded" src="%D0%9A%D0%B0%D0%BA%20%D0%B2%D0%BA%D0%BB%D1%8E%D1%87%D0%B8%D1%82%D1%8C%20%D1%80%D0%B5%D0%B6%D0%B8%D0%BC%20ATTI%20%D0%BD%D0%B0%20DJI%20Mavic%203,%20%D0%B8%20%D0%B7%D0%B0%D0%BA%D1%80%D1%8B%D1%82%D1%8B%D0%B5%20%D0%BD%D0%B0%D1%81%D1%82%D1%80%D0%BE%D0%B9%D0%BA%D0%B8%20%D0%B4%D1%80%D0%BE%D0%BD%D0%B0%20-%20aerophoto.com_files/dji_mavic_3.jpg" title="Как включить ATTI на DJI Mavic 3" alt="Как включить ATTI на DJI Mavic 3" style="will-change: auto;" srcset="%D0%9A%D0%B0%D0%BA%20%D0%B2%D0%BA%D0%BB%D1%8E%D1%87%D0%B8%D1%82%D1%8C%20%D1%80%D0%B5%D0%B6%D0%B8%D0%BC%20ATTI%20%D0%BD%D0%B0%20DJI%20Mavic%203,%20%D0%B8%20%D0%B7%D0%B0%D0%BA%D1%80%D1%8B%D1%82%D1%8B%D0%B5%20%D0%BD%D0%B0%D1%81%D1%82%D1%80%D0%BE%D0%B9%D0%BA%D0%B8%20%D0%B4%D1%80%D0%BE%D0%BD%D0%B0%20-%20aerophoto.com_files/dji_mavic_3.jpg 1276w" width="1276" height="638"></div><div class="entry-content"><div class="vc_row wpb_row vc_row-fluid"><div class="wpb_column vc_column_container vc_col-sm-12"><div class="vc_column-inner"><div class="wpb_wrapper">
	<div class="wpb_text_column wpb_content_element ">
		<div class="wpb_wrapper">
			<h2>Режим ATTI и хак параметров полета на дроне DJI Mavic 3</h2>

		</div>
	</div>

	<div class="wpb_text_column wpb_content_element ">
		<div class="wpb_wrapper">
			<p style="padding-left: 40px;">1. <a href="#1">Что такое режим АTI на дронах DJI, и как он работает.</a><br>
2. <a href="#2">История вопроса. Почему был, а потом исчез режим АТТI на дронах DJI.</a><br>
3. <a href="#3">Зачем включать режим АТТI на дронах DJI.</a><br>
4. <a href="#4">Что понадобится для открытия режима АТТI на DJI Mavic 3.</a><br>
5. <a href="#5">Процесс взлома DJI Mavic 3 и включения АТТI.</a><br>
5a. <a href="#5-1">Процесс взлома DJI Mavic Pro и включения АТТI.</a><br>
6. <a href="#6">Если мы уже взломали DJI Mavic 3, что еще можно улучшить. </a><br>
7. <a href="#7">Особенности режима АТТI на DJI Mavic 3. </a><br>
8. <a href="#8">Выключение ходовых огней Mavic 3. </a><br>
9. <a href="#9">Отключение автопосадки дрона DJI Mavic 3 при разряде батареи. </a><br>
10. <a href="#10">Отключение режима Precission Landing ан DJI Mavic 3. </a><br>
11. <a href="#11">Отключение перезагрузки GPS при ошибке компаса на DJI Mavic 3. </a></p>

		</div>
	</div>

	<div class="wpb_text_column wpb_content_element  vc_custom_1652880563022">
		<div class="wpb_wrapper">
			<p><a name="1"></a><br>
1 Все модели дронов DJI семейства Mavic летают только в режиме GPS 
навигации. Если вы не подаете управляющих команд, дрон весит на одном 
месте сопротивляясь сносу от ветра. Режим ATTI (ATTITUDE), это режим 
полета, при котором не используется навигационная система дрона 
основанная на GPS. Игнорируются также и все датчики безопасности. На 
дроне работает только удержание высоты. В режиме ATTI дрон не удерживает
 позицию. Со стороны может показаться, что управление дроном 
перехватили, и уводят его от вас, однако это не так, дрон просто уносит 
ветром. Его навигационная система продолжает работать в фоновом режиме, и
 при потере связи с пультом дрон как положено перейдет в режим RTF, и 
автоматически вернется к месту старта. На старых моделях дронов DJI 
переключение в режим ATTI выполняется штатно, переключателем режимов 
полета (FGPS — ATTI — PGPS).</p>

		</div>
	</div>

	<div class="wpb_text_column wpb_content_element  vc_custom_1652880578555">
		<div class="wpb_wrapper">
			<p><a name="2"></a><br>
2 К большому сожалению, переключение в режим ATTI на дроне DJI Mavic 3 
не предусмотрено производителем. Обычные радиоуправляемые модели летают в
 похожем на ATTI режиме, только без удержания высоты. Для них это чаще 
всего единственный режим полета. В первых дронах DJI изначально был 
режим ATTI, начиная с Phantom 1. Перейти в ATTI можно было с помощью 
переключателя режимов полета на пульте. Этот режим присутствует и на 
обоих поколениях дронов DJI Inspire. С появлением семейства Mavic, 
компания DJI удалила возможность включать ATTI. Вместо него ввели режимы
 Normal, Sport, Tripod или Cinematic Mode. Во всех этих режимах 
навигационная система не отключается. По всей видимости это было сделано
 для повышения безопасности дронов в руках неопытных пилотов.</p>

		</div>
	</div>

	<div class="wpb_text_column wpb_content_element  vc_custom_1652880594428">
		<div class="wpb_wrapper">
			<p><a name="3"></a><br>
3 Несмотря на то, что управлять дроном в режиме ATTI сложнее чем в GPS 
режимах, такой навык все же необходим, так как любой дрон сам переходит в
 ATTI при отказе навигационной системы из за ошибки компаса или глушения
 спутников (системы РЭБ против дронов). Кроме того, умение управлять 
дроном в режиме ATTI пригодится для полетов в помещении, где не доступна
 работа GPS. В некоторых случаях лучше самому переключиться в этот 
режим, например при слабом сигнале или малом количестве используемых для
 навигации спутников, так как дрон при этом начинает хаотически 
двигаться из за снижения точности пзиционирования. К стати, для 
получения лицензии коммерческого пилота дрона, один из тестов на 
экзамене, это полет в режиме ATTI.</p>

		</div>
	</div>

	<div class="wpb_text_column wpb_content_element  vc_custom_1652880610526">
		<div class="wpb_wrapper">
			<p><a name="4"></a><br>
4 Для включения режима ATTI на Mavic 3 вам понадобится следующее:</p>
<p style="padding-left: 40px;">1. Компьютер под управлением Windows, лучше всего 10 версия.<br>
2. Установленная версия DJI Assistant 2 (Consumer Drones Series), с сайта DJI, вкладка Downloads, раздел посвященный DJI Mavic 3<br>
3. Программа DroneHack, которая собственно нужна для взлома дрона, она бесплатно скачивается с одноименного сайта.<br>
4. Кабель USB Type C для подключения дрона к компьютеру. Лучше брать 
качественный кабель, с ферритовым кольцом, для устранения 
высокочастотных наводок от радиотракта дрона на вход компьютера.</p>

		</div>
	</div>

	<div class="wpb_text_column wpb_content_element  vc_custom_1652953486393">
		<div class="wpb_wrapper">
			<p><a name="5"></a><br>
5 Запускаем на компьютере программу Assistant 2, включаем дрон, и через 
несколько секунд подключаем его кабелем к компьютеру. Спустя некоторое 
воемя, вы должны увидеть иконку дрона появившуюся в окне программы. Если
 это так, драйвера встали правильно. Затем, обязательно выходим из 
программы Acssistant, это важно! Не отключая дрон от компьютера 
запускаем программу DroneHack. Если все происходит штатно, спустя 
несколько секунд начнется обмен данными между дроном и программой 
DroneHack. К сожалению, процедура открытия режима ATTI может развиваться
 по разным сценариям. В некоторых случаях все проходит с первого раза и 
гладко, иногда нужно переподключать дрон к компьютеру и перезагружать 
программу DroneHack по несколько раз, пока не установится соединение 
между дроном и программой, и начнется обмен данными между ними.</p>

		</div>
	</div>
<div class="vc_empty_space" style="height: 15px"><span class="vc_empty_space_inner"></span></div><div class="vc_row wpb_row vc_inner vc_row-fluid vc_custom_1652946655278 vc_row-has-fill"><div class="wpb_column vc_column_container vc_col-sm-6 vc_col-has-fill"><div class="vc_column-inner vc_custom_1652946667958"><div class="wpb_wrapper">
	<div class="wpb_single_image wpb_content_element vc_align_center  vc_custom_1652953672509">
		
		<figure class="wpb_wrapper vc_figure photoswipe-item photoswipe-wrapper">
			<a href="https://aerophoto.com.ua/wp-content/uploads/2022/05/dji_mavic3_assistant-1024x656.jpg" target="_self" class="vc_single_image-wrapper vc_box_border_grey dt-pswp-item rollover rollover-zoom pspw-wrap-ready this-ready" data-large_image_width="1024" data-large_image_height="656"><img src="%D0%9A%D0%B0%D0%BA%20%D0%B2%D0%BA%D0%BB%D1%8E%D1%87%D0%B8%D1%82%D1%8C%20%D1%80%D0%B5%D0%B6%D0%B8%D0%BC%20ATTI%20%D0%BD%D0%B0%20DJI%20Mavic%203,%20%D0%B8%20%D0%B7%D0%B0%D0%BA%D1%80%D1%8B%D1%82%D1%8B%D0%B5%20%D0%BD%D0%B0%D1%81%D1%82%D1%80%D0%BE%D0%B9%D0%BA%D0%B8%20%D0%B4%D1%80%D0%BE%D0%BD%D0%B0%20-%20aerophoto.com_files/dji_mavic3_assistant-300x192.jpg" class="vc_single_image-img attachment-medium" alt="Mavic 3 в программе DJI Assistant" loading="lazy" srcset="%D0%9A%D0%B0%D0%BA%20%D0%B2%D0%BA%D0%BB%D1%8E%D1%87%D0%B8%D1%82%D1%8C%20%D1%80%D0%B5%D0%B6%D0%B8%D0%BC%20ATTI%20%D0%BD%D0%B0%20DJI%20Mavic%203,%20%D0%B8%20%D0%B7%D0%B0%D0%BA%D1%80%D1%8B%D1%82%D1%8B%D0%B5%20%D0%BD%D0%B0%D1%81%D1%82%D1%80%D0%BE%D0%B9%D0%BA%D0%B8%20%D0%B4%D1%80%D0%BE%D0%BD%D0%B0%20-%20aerophoto.com_files/dji_mavic3_assistant-300x192.jpg 300w, %D0%9A%D0%B0%D0%BA%20%D0%B2%D0%BA%D0%BB%D1%8E%D1%87%D0%B8%D1%82%D1%8C%20%D1%80%D0%B5%D0%B6%D0%B8%D0%BC%20ATTI%20%D0%BD%D0%B0%20DJI%20Mavic%203,%20%D0%B8%20%D0%B7%D0%B0%D0%BA%D1%80%D1%8B%D1%82%D1%8B%D0%B5%20%D0%BD%D0%B0%D1%81%D1%82%D1%80%D0%BE%D0%B9%D0%BA%D0%B8%20%D0%B4%D1%80%D0%BE%D0%BD%D0%B0%20-%20aerophoto.com_files/dji_mavic3_assistant-1024x656.jpg 1024w, %D0%9A%D0%B0%D0%BA%20%D0%B2%D0%BA%D0%BB%D1%8E%D1%87%D0%B8%D1%82%D1%8C%20%D1%80%D0%B5%D0%B6%D0%B8%D0%BC%20ATTI%20%D0%BD%D0%B0%20DJI%20Mavic%203,%20%D0%B8%20%D0%B7%D0%B0%D0%BA%D1%80%D1%8B%D1%82%D1%8B%D0%B5%20%D0%BD%D0%B0%D1%81%D1%82%D1%80%D0%BE%D0%B9%D0%BA%D0%B8%20%D0%B4%D1%80%D0%BE%D0%BD%D0%B0%20-%20aerophoto.com_files/dji_mavic3_assistant-768x492.jpg 768w, %D0%9A%D0%B0%D0%BA%20%D0%B2%D0%BA%D0%BB%D1%8E%D1%87%D0%B8%D1%82%D1%8C%20%D1%80%D0%B5%D0%B6%D0%B8%D0%BC%20ATTI%20%D0%BD%D0%B0%20DJI%20Mavic%203,%20%D0%B8%20%D0%B7%D0%B0%D0%BA%D1%80%D1%8B%D1%82%D1%8B%D0%B5%20%D0%BD%D0%B0%D1%81%D1%82%D1%80%D0%BE%D0%B9%D0%BA%D0%B8%20%D0%B4%D1%80%D0%BE%D0%BD%D0%B0%20-%20aerophoto.com_files/dji_mavic3_assistant.jpg 1113w" sizes="(max-width: 300px) 100vw, 300px" data-dt-location="https://aerophoto.com.ua/2022/05/18/atti-for-mavic-3/dji_mavic3_assistant/" width="300" height="192"><i></i></a>
		</figure>
	</div>

	<div class="wpb_text_column wpb_content_element  vc_custom_1652953719527">
		<div class="wpb_wrapper">
			<h6 style="text-align: center;">Окно программы DJI Assistant с Mavic 3</h6>

		</div>
	</div>
</div></div></div><div class="wpb_column vc_column_container vc_col-sm-6 vc_col-has-fill"><div class="vc_column-inner vc_custom_1652946678973"><div class="wpb_wrapper">
	<div class="wpb_single_image wpb_content_element vc_align_center  vc_custom_1652953810510">
		
		<figure class="wpb_wrapper vc_figure photoswipe-item photoswipe-wrapper">
			<a href="https://aerophoto.com.ua/wp-content/uploads/2022/05/drone_hacks_error-1024x697.jpg" target="_self" class="vc_single_image-wrapper vc_box_border_grey dt-pswp-item rollover rollover-zoom pspw-wrap-ready this-ready" data-large_image_width="1024" data-large_image_height="697"><img src="%D0%9A%D0%B0%D0%BA%20%D0%B2%D0%BA%D0%BB%D1%8E%D1%87%D0%B8%D1%82%D1%8C%20%D1%80%D0%B5%D0%B6%D0%B8%D0%BC%20ATTI%20%D0%BD%D0%B0%20DJI%20Mavic%203,%20%D0%B8%20%D0%B7%D0%B0%D0%BA%D1%80%D1%8B%D1%82%D1%8B%D0%B5%20%D0%BD%D0%B0%D1%81%D1%82%D1%80%D0%BE%D0%B9%D0%BA%D0%B8%20%D0%B4%D1%80%D0%BE%D0%BD%D0%B0%20-%20aerophoto.com_files/drone_hacks_error-300x204.jpg" class="vc_single_image-img attachment-medium" alt="Ошибка подключения дрона в программе Drone Hacks" loading="lazy" srcset="%D0%9A%D0%B0%D0%BA%20%D0%B2%D0%BA%D0%BB%D1%8E%D1%87%D0%B8%D1%82%D1%8C%20%D1%80%D0%B5%D0%B6%D0%B8%D0%BC%20ATTI%20%D0%BD%D0%B0%20DJI%20Mavic%203,%20%D0%B8%20%D0%B7%D0%B0%D0%BA%D1%80%D1%8B%D1%82%D1%8B%D0%B5%20%D0%BD%D0%B0%D1%81%D1%82%D1%80%D0%BE%D0%B9%D0%BA%D0%B8%20%D0%B4%D1%80%D0%BE%D0%BD%D0%B0%20-%20aerophoto.com_files/drone_hacks_error-300x204.jpg 300w, %D0%9A%D0%B0%D0%BA%20%D0%B2%D0%BA%D0%BB%D1%8E%D1%87%D0%B8%D1%82%D1%8C%20%D1%80%D0%B5%D0%B6%D0%B8%D0%BC%20ATTI%20%D0%BD%D0%B0%20DJI%20Mavic%203,%20%D0%B8%20%D0%B7%D0%B0%D0%BA%D1%80%D1%8B%D1%82%D1%8B%D0%B5%20%D0%BD%D0%B0%D1%81%D1%82%D1%80%D0%BE%D0%B9%D0%BA%D0%B8%20%D0%B4%D1%80%D0%BE%D0%BD%D0%B0%20-%20aerophoto.com_files/drone_hacks_error-1024x697.jpg 1024w, %D0%9A%D0%B0%D0%BA%20%D0%B2%D0%BA%D0%BB%D1%8E%D1%87%D0%B8%D1%82%D1%8C%20%D1%80%D0%B5%D0%B6%D0%B8%D0%BC%20ATTI%20%D0%BD%D0%B0%20DJI%20Mavic%203,%20%D0%B8%20%D0%B7%D0%B0%D0%BA%D1%80%D1%8B%D1%82%D1%8B%D0%B5%20%D0%BD%D0%B0%D1%81%D1%82%D1%80%D0%BE%D0%B9%D0%BA%D0%B8%20%D0%B4%D1%80%D0%BE%D0%BD%D0%B0%20-%20aerophoto.com_files/drone_hacks_error-768x523.jpg 768w, %D0%9A%D0%B0%D0%BA%20%D0%B2%D0%BA%D0%BB%D1%8E%D1%87%D0%B8%D1%82%D1%8C%20%D1%80%D0%B5%D0%B6%D0%B8%D0%BC%20ATTI%20%D0%BD%D0%B0%20DJI%20Mavic%203,%20%D0%B8%20%D0%B7%D0%B0%D0%BA%D1%80%D1%8B%D1%82%D1%8B%D0%B5%20%D0%BD%D0%B0%D1%81%D1%82%D1%80%D0%BE%D0%B9%D0%BA%D0%B8%20%D0%B4%D1%80%D0%BE%D0%BD%D0%B0%20-%20aerophoto.com_files/drone_hacks_error.jpg 1052w" sizes="(max-width: 300px) 100vw, 300px" data-dt-location="https://aerophoto.com.ua/2022/05/18/atti-for-mavic-3/drone_hacks_error/" width="300" height="204"><i></i></a>
		</figure>
	</div>

	<div class="wpb_text_column wpb_content_element  vc_custom_1652953837468">
		<div class="wpb_wrapper">
			<h6 style="text-align: center;">Одна из возможных проблем — ошибка подключения дрона в программе Drone Hacks</h6>

		</div>
	</div>
</div></div></div></div><div class="vc_empty_space" style="height: 15px"><span class="vc_empty_space_inner"></span></div>
	<div class="wpb_text_column wpb_content_element  vc_custom_1662648294908">
		<div class="wpb_wrapper">
			<p>По моим наблюдениям, важно, чтобы компьютер во время этих 
манипуляций был подключен к Интернет. Повторяйте описанные действия до 
тех пор, пока дрон и программа не начнут обмен данными между собой. 
Когда обмен данными произойдет, у вас станет активна вкладка «Hack 
Parameters». Переходите в эту вкладку и нажимайте кнопку «Advanced 
Parameters». Теперь в строке поиска нужно ввести первые буквы названия 
ключа реестра дрона, который нужно будет изменить. В нашем случае это 
будет “fsw”, находим три ключа с названием fswitch_selection. Вам нужен 
ключ с параметром «12», меняем его значение на «3», нажимаем кнопку Save
 Parameters, экран поиска закрывается, и в первом экране нажимаем Write 
Parameters To Drone. Если все получилось, вы заменили на дроне режим 
полета «Cinematic Mode» на режим «ATTI». Лично я рекомендую менять на 
режим «ATTI» не «Cinematic Mode», а режим «Sport». Режим «Sport» по 
своему назначению — увеличение скорости полета лучше подходит для замены
 на режим «ATTI», так как скорость полета в «ATTI» тоже увеличена, и 
может быть даже больше чем в «Sport»&nbsp; при попутном ветре. Режим 
«Cinematic Mode» ценен сам по себе, так как помогает выполнять плавные и
 аккуратные движения, точно прицеливаясь камерой.</p>

		</div>
	</div>
<div class="vc_empty_space" style="height: 15px"><span class="vc_empty_space_inner"></span></div><div class="vc_row wpb_row vc_inner vc_row-fluid vc_custom_1652946655278 vc_row-has-fill"><div class="wpb_column vc_column_container vc_col-sm-6 vc_col-has-fill"><div class="vc_column-inner vc_custom_1652946667958"><div class="wpb_wrapper">
	<div class="wpb_single_image wpb_content_element vc_align_center  vc_custom_1652946583819">
		
		<figure class="wpb_wrapper vc_figure photoswipe-item photoswipe-wrapper">
			<a href="https://aerophoto.com.ua/wp-content/uploads/2022/05/drone-hack_hack_parameters-1024x695.jpg" target="_self" class="vc_single_image-wrapper vc_box_border_grey dt-pswp-item rollover rollover-zoom pspw-wrap-ready this-ready" data-large_image_width="1024" data-large_image_height="695"><img src="%D0%9A%D0%B0%D0%BA%20%D0%B2%D0%BA%D0%BB%D1%8E%D1%87%D0%B8%D1%82%D1%8C%20%D1%80%D0%B5%D0%B6%D0%B8%D0%BC%20ATTI%20%D0%BD%D0%B0%20DJI%20Mavic%203,%20%D0%B8%20%D0%B7%D0%B0%D0%BA%D1%80%D1%8B%D1%82%D1%8B%D0%B5%20%D0%BD%D0%B0%D1%81%D1%82%D1%80%D0%BE%D0%B9%D0%BA%D0%B8%20%D0%B4%D1%80%D0%BE%D0%BD%D0%B0%20-%20aerophoto.com_files/drone-hack_hack_parameters-300x204.jpg" class="vc_single_image-img attachment-medium" alt="Программа Drone Hack, вкладка Hack Parameters" loading="lazy" srcset="%D0%9A%D0%B0%D0%BA%20%D0%B2%D0%BA%D0%BB%D1%8E%D1%87%D0%B8%D1%82%D1%8C%20%D1%80%D0%B5%D0%B6%D0%B8%D0%BC%20ATTI%20%D0%BD%D0%B0%20DJI%20Mavic%203,%20%D0%B8%20%D0%B7%D0%B0%D0%BA%D1%80%D1%8B%D1%82%D1%8B%D0%B5%20%D0%BD%D0%B0%D1%81%D1%82%D1%80%D0%BE%D0%B9%D0%BA%D0%B8%20%D0%B4%D1%80%D0%BE%D0%BD%D0%B0%20-%20aerophoto.com_files/drone-hack_hack_parameters-300x204.jpg 300w, %D0%9A%D0%B0%D0%BA%20%D0%B2%D0%BA%D0%BB%D1%8E%D1%87%D0%B8%D1%82%D1%8C%20%D1%80%D0%B5%D0%B6%D0%B8%D0%BC%20ATTI%20%D0%BD%D0%B0%20DJI%20Mavic%203,%20%D0%B8%20%D0%B7%D0%B0%D0%BA%D1%80%D1%8B%D1%82%D1%8B%D0%B5%20%D0%BD%D0%B0%D1%81%D1%82%D1%80%D0%BE%D0%B9%D0%BA%D0%B8%20%D0%B4%D1%80%D0%BE%D0%BD%D0%B0%20-%20aerophoto.com_files/drone-hack_hack_parameters-1024x695.jpg 1024w, %D0%9A%D0%B0%D0%BA%20%D0%B2%D0%BA%D0%BB%D1%8E%D1%87%D0%B8%D1%82%D1%8C%20%D1%80%D0%B5%D0%B6%D0%B8%D0%BC%20ATTI%20%D0%BD%D0%B0%20DJI%20Mavic%203,%20%D0%B8%20%D0%B7%D0%B0%D0%BA%D1%80%D1%8B%D1%82%D1%8B%D0%B5%20%D0%BD%D0%B0%D1%81%D1%82%D1%80%D0%BE%D0%B9%D0%BA%D0%B8%20%D0%B4%D1%80%D0%BE%D0%BD%D0%B0%20-%20aerophoto.com_files/drone-hack_hack_parameters-768x521.jpg 768w, %D0%9A%D0%B0%D0%BA%20%D0%B2%D0%BA%D0%BB%D1%8E%D1%87%D0%B8%D1%82%D1%8C%20%D1%80%D0%B5%D0%B6%D0%B8%D0%BC%20ATTI%20%D0%BD%D0%B0%20DJI%20Mavic%203,%20%D0%B8%20%D0%B7%D0%B0%D0%BA%D1%80%D1%8B%D1%82%D1%8B%D0%B5%20%D0%BD%D0%B0%D1%81%D1%82%D1%80%D0%BE%D0%B9%D0%BA%D0%B8%20%D0%B4%D1%80%D0%BE%D0%BD%D0%B0%20-%20aerophoto.com_files/drone-hack_hack_parameters.jpg 1048w" sizes="(max-width: 300px) 100vw, 300px" data-dt-location="https://aerophoto.com.ua/2022/05/18/atti-for-mavic-3/drone-hack_hack_parameters/" width="300" height="204"><i></i></a>
		</figure>
	</div>

	<div class="wpb_text_column wpb_content_element  vc_custom_1652946893214">
		<div class="wpb_wrapper">
			<h6 style="text-align: center;">Вкладка Hack Parameters программы Drone-Hacks</h6>

		</div>
	</div>
</div></div></div><div class="wpb_column vc_column_container vc_col-sm-6 vc_col-has-fill"><div class="vc_column-inner vc_custom_1652946678973"><div class="wpb_wrapper">
	<div class="wpb_single_image wpb_content_element vc_align_center  vc_custom_1652950800974">
		
		<figure class="wpb_wrapper vc_figure photoswipe-item photoswipe-wrapper">
			<a href="https://aerophoto.com.ua/wp-content/uploads/2022/05/drone-hack_atti_on-1024x569.jpg" target="_self" class="vc_single_image-wrapper vc_box_border_grey dt-pswp-item rollover rollover-zoom pspw-wrap-ready this-ready" data-large_image_width="1024" data-large_image_height="569"><img src="%D0%9A%D0%B0%D0%BA%20%D0%B2%D0%BA%D0%BB%D1%8E%D1%87%D0%B8%D1%82%D1%8C%20%D1%80%D0%B5%D0%B6%D0%B8%D0%BC%20ATTI%20%D0%BD%D0%B0%20DJI%20Mavic%203,%20%D0%B8%20%D0%B7%D0%B0%D0%BA%D1%80%D1%8B%D1%82%D1%8B%D0%B5%20%D0%BD%D0%B0%D1%81%D1%82%D1%80%D0%BE%D0%B9%D0%BA%D0%B8%20%D0%B4%D1%80%D0%BE%D0%BD%D0%B0%20-%20aerophoto.com_files/drone-hack_atti_on-300x167.jpg" class="vc_single_image-img attachment-medium" alt="Включение режима ATTI для DJI Mavic 2" loading="lazy" srcset="%D0%9A%D0%B0%D0%BA%20%D0%B2%D0%BA%D0%BB%D1%8E%D1%87%D0%B8%D1%82%D1%8C%20%D1%80%D0%B5%D0%B6%D0%B8%D0%BC%20ATTI%20%D0%BD%D0%B0%20DJI%20Mavic%203,%20%D0%B8%20%D0%B7%D0%B0%D0%BA%D1%80%D1%8B%D1%82%D1%8B%D0%B5%20%D0%BD%D0%B0%D1%81%D1%82%D1%80%D0%BE%D0%B9%D0%BA%D0%B8%20%D0%B4%D1%80%D0%BE%D0%BD%D0%B0%20-%20aerophoto.com_files/drone-hack_atti_on-300x167.jpg 300w, %D0%9A%D0%B0%D0%BA%20%D0%B2%D0%BA%D0%BB%D1%8E%D1%87%D0%B8%D1%82%D1%8C%20%D1%80%D0%B5%D0%B6%D0%B8%D0%BC%20ATTI%20%D0%BD%D0%B0%20DJI%20Mavic%203,%20%D0%B8%20%D0%B7%D0%B0%D0%BA%D1%80%D1%8B%D1%82%D1%8B%D0%B5%20%D0%BD%D0%B0%D1%81%D1%82%D1%80%D0%BE%D0%B9%D0%BA%D0%B8%20%D0%B4%D1%80%D0%BE%D0%BD%D0%B0%20-%20aerophoto.com_files/drone-hack_atti_on-1024x569.jpg 1024w, %D0%9A%D0%B0%D0%BA%20%D0%B2%D0%BA%D0%BB%D1%8E%D1%87%D0%B8%D1%82%D1%8C%20%D1%80%D0%B5%D0%B6%D0%B8%D0%BC%20ATTI%20%D0%BD%D0%B0%20DJI%20Mavic%203,%20%D0%B8%20%D0%B7%D0%B0%D0%BA%D1%80%D1%8B%D1%82%D1%8B%D0%B5%20%D0%BD%D0%B0%D1%81%D1%82%D1%80%D0%BE%D0%B9%D0%BA%D0%B8%20%D0%B4%D1%80%D0%BE%D0%BD%D0%B0%20-%20aerophoto.com_files/drone-hack_atti_on-768x427.jpg 768w, %D0%9A%D0%B0%D0%BA%20%D0%B2%D0%BA%D0%BB%D1%8E%D1%87%D0%B8%D1%82%D1%8C%20%D1%80%D0%B5%D0%B6%D0%B8%D0%BC%20ATTI%20%D0%BD%D0%B0%20DJI%20Mavic%203,%20%D0%B8%20%D0%B7%D0%B0%D0%BA%D1%80%D1%8B%D1%82%D1%8B%D0%B5%20%D0%BD%D0%B0%D1%81%D1%82%D1%80%D0%BE%D0%B9%D0%BA%D0%B8%20%D0%B4%D1%80%D0%BE%D0%BD%D0%B0%20-%20aerophoto.com_files/drone-hack_atti_on.jpg 1314w" sizes="(max-width: 300px) 100vw, 300px" data-dt-location="https://aerophoto.com.ua/2022/05/18/atti-for-mavic-3/drone-hack_atti_on/" width="300" height="167"><i></i></a>
		</figure>
	</div>

	<div class="wpb_text_column wpb_content_element  vc_custom_1652950910336">
		<div class="wpb_wrapper">
			<h6 style="text-align: center;">Для включения режима ATTI вместо Cinematic Mode замените параметр 12 на параметр 3 в ключе _mode[0]</h6>

		</div>
	</div>
</div></div></div></div><div class="vc_empty_space" style="height: 15px"><span class="vc_empty_space_inner"></span></div>
	<div class="wpb_text_column wpb_content_element  vc_custom_1664304922687">
		<div class="wpb_wrapper">
			<p>Если вы решили включить режим «ATTI» на вашем DJI Mavic 3 вместо 
режима «Sport», то вам нужно найти ключ с параметром «8», и заменить его
 значение на «3».</p>

		</div>
	</div>
<div class="vc_empty_space" style="height: 15px"><span class="vc_empty_space_inner"></span></div>
	<div class="wpb_single_image wpb_content_element vc_align_center  vc_custom_1664304633847">
		
		<figure class="wpb_wrapper vc_figure photoswipe-item photoswipe-wrapper">
			<a href="https://aerophoto.com.ua/wp-content/uploads/2022/05/mavic-3-sport-atti-1024x694.png" target="_self" class="vc_single_image-wrapper vc_box_border_grey dt-pswp-item rollover rollover-zoom pspw-wrap-ready this-ready" data-large_image_width="1024" data-large_image_height="694"><img src="%D0%9A%D0%B0%D0%BA%20%D0%B2%D0%BA%D0%BB%D1%8E%D1%87%D0%B8%D1%82%D1%8C%20%D1%80%D0%B5%D0%B6%D0%B8%D0%BC%20ATTI%20%D0%BD%D0%B0%20DJI%20Mavic%203,%20%D0%B8%20%D0%B7%D0%B0%D0%BA%D1%80%D1%8B%D1%82%D1%8B%D0%B5%20%D0%BD%D0%B0%D1%81%D1%82%D1%80%D0%BE%D0%B9%D0%BA%D0%B8%20%D0%B4%D1%80%D0%BE%D0%BD%D0%B0%20-%20aerophoto.com_files/mavic-3-sport-atti-300x203.png" class="vc_single_image-img attachment-medium" alt="Установка режима ATTI вместо режима Sport на Mavic 3" loading="lazy" srcset="%D0%9A%D0%B0%D0%BA%20%D0%B2%D0%BA%D0%BB%D1%8E%D1%87%D0%B8%D1%82%D1%8C%20%D1%80%D0%B5%D0%B6%D0%B8%D0%BC%20ATTI%20%D0%BD%D0%B0%20DJI%20Mavic%203,%20%D0%B8%20%D0%B7%D0%B0%D0%BA%D1%80%D1%8B%D1%82%D1%8B%D0%B5%20%D0%BD%D0%B0%D1%81%D1%82%D1%80%D0%BE%D0%B9%D0%BA%D0%B8%20%D0%B4%D1%80%D0%BE%D0%BD%D0%B0%20-%20aerophoto.com_files/mavic-3-sport-atti-300x203.png 300w, %D0%9A%D0%B0%D0%BA%20%D0%B2%D0%BA%D0%BB%D1%8E%D1%87%D0%B8%D1%82%D1%8C%20%D1%80%D0%B5%D0%B6%D0%B8%D0%BC%20ATTI%20%D0%BD%D0%B0%20DJI%20Mavic%203,%20%D0%B8%20%D0%B7%D0%B0%D0%BA%D1%80%D1%8B%D1%82%D1%8B%D0%B5%20%D0%BD%D0%B0%D1%81%D1%82%D1%80%D0%BE%D0%B9%D0%BA%D0%B8%20%D0%B4%D1%80%D0%BE%D0%BD%D0%B0%20-%20aerophoto.com_files/mavic-3-sport-atti-1024x694.png 1024w, %D0%9A%D0%B0%D0%BA%20%D0%B2%D0%BA%D0%BB%D1%8E%D1%87%D0%B8%D1%82%D1%8C%20%D1%80%D0%B5%D0%B6%D0%B8%D0%BC%20ATTI%20%D0%BD%D0%B0%20DJI%20Mavic%203,%20%D0%B8%20%D0%B7%D0%B0%D0%BA%D1%80%D1%8B%D1%82%D1%8B%D0%B5%20%D0%BD%D0%B0%D1%81%D1%82%D1%80%D0%BE%D0%B9%D0%BA%D0%B8%20%D0%B4%D1%80%D0%BE%D0%BD%D0%B0%20-%20aerophoto.com_files/mavic-3-sport-atti-768x520.png 768w, %D0%9A%D0%B0%D0%BA%20%D0%B2%D0%BA%D0%BB%D1%8E%D1%87%D0%B8%D1%82%D1%8C%20%D1%80%D0%B5%D0%B6%D0%B8%D0%BC%20ATTI%20%D0%BD%D0%B0%20DJI%20Mavic%203,%20%D0%B8%20%D0%B7%D0%B0%D0%BA%D1%80%D1%8B%D1%82%D1%8B%D0%B5%20%D0%BD%D0%B0%D1%81%D1%82%D1%80%D0%BE%D0%B9%D0%BA%D0%B8%20%D0%B4%D1%80%D0%BE%D0%BD%D0%B0%20-%20aerophoto.com_files/mavic-3-sport-atti-1536x1040.png 1536w, %D0%9A%D0%B0%D0%BA%20%D0%B2%D0%BA%D0%BB%D1%8E%D1%87%D0%B8%D1%82%D1%8C%20%D1%80%D0%B5%D0%B6%D0%B8%D0%BC%20ATTI%20%D0%BD%D0%B0%20DJI%20Mavic%203,%20%D0%B8%20%D0%B7%D0%B0%D0%BA%D1%80%D1%8B%D1%82%D1%8B%D0%B5%20%D0%BD%D0%B0%D1%81%D1%82%D1%80%D0%BE%D0%B9%D0%BA%D0%B8%20%D0%B4%D1%80%D0%BE%D0%BD%D0%B0%20-%20aerophoto.com_files/mavic-3-sport-atti-2048x1387.png 2048w" sizes="(max-width: 300px) 100vw, 300px" data-dt-location="https://aerophoto.com.ua/2022/05/18/atti-for-mavic-3/mavic-3-sport-atti/" width="300" height="203"><i></i></a>
		</figure>
	</div>

	<div class="wpb_text_column wpb_content_element  vc_custom_1664305474414">
		<div class="wpb_wrapper">
			<h6 style="text-align: center;">Скриншот с настройками режима «ATTI» вместо «Sport» для DJI Mavic 3</h6>

		</div>
	</div>

	<div class="wpb_text_column wpb_content_element  vc_custom_1662649085777">
		<div class="wpb_wrapper">
			<p><a name="5-1"></a><br>
5a. Если вы включаете режим «ATTI» на вашем DJI Mavic Pro, то процесс 
отличается тем, что вам нужно найти другие ключи и заменить параметры в 
них. Для DJI Mavic Pro вым нужно искать ключ&nbsp;&nbsp; 
g_config.control.control.mode[1] (рисунок ниже) и менять в нем параметр 
12 на 3. В этом случае вы замените на двухпозиционном переключателе 
режимов полета режим «Sport» на режим «ATTI».</p>

		</div>
	</div>
<div class="vc_empty_space" style="height: 15px"><span class="vc_empty_space_inner"></span></div>
	<div class="wpb_single_image wpb_content_element vc_align_center  vc_custom_1662703511170">
		
		<figure class="wpb_wrapper vc_figure photoswipe-item photoswipe-wrapper">
			<a href="https://aerophoto.com.ua/wp-content/uploads/2022/05/atti-mavpro-1024x636.jpg" target="_self" class="vc_single_image-wrapper vc_box_border_grey dt-pswp-item rollover rollover-zoom pspw-wrap-ready this-ready" data-large_image_width="1024" data-large_image_height="636"><img src="%D0%9A%D0%B0%D0%BA%20%D0%B2%D0%BA%D0%BB%D1%8E%D1%87%D0%B8%D1%82%D1%8C%20%D1%80%D0%B5%D0%B6%D0%B8%D0%BC%20ATTI%20%D0%BD%D0%B0%20DJI%20Mavic%203,%20%D0%B8%20%D0%B7%D0%B0%D0%BA%D1%80%D1%8B%D1%82%D1%8B%D0%B5%20%D0%BD%D0%B0%D1%81%D1%82%D1%80%D0%BE%D0%B9%D0%BA%D0%B8%20%D0%B4%D1%80%D0%BE%D0%BD%D0%B0%20-%20aerophoto.com_files/atti-mavpro-300x186.jpg" class="vc_single_image-img attachment-medium" alt="Включение режима ATTI на DJI Mavic Pro" loading="lazy" srcset="%D0%9A%D0%B0%D0%BA%20%D0%B2%D0%BA%D0%BB%D1%8E%D1%87%D0%B8%D1%82%D1%8C%20%D1%80%D0%B5%D0%B6%D0%B8%D0%BC%20ATTI%20%D0%BD%D0%B0%20DJI%20Mavic%203,%20%D0%B8%20%D0%B7%D0%B0%D0%BA%D1%80%D1%8B%D1%82%D1%8B%D0%B5%20%D0%BD%D0%B0%D1%81%D1%82%D1%80%D0%BE%D0%B9%D0%BA%D0%B8%20%D0%B4%D1%80%D0%BE%D0%BD%D0%B0%20-%20aerophoto.com_files/atti-mavpro-300x186.jpg 300w, %D0%9A%D0%B0%D0%BA%20%D0%B2%D0%BA%D0%BB%D1%8E%D1%87%D0%B8%D1%82%D1%8C%20%D1%80%D0%B5%D0%B6%D0%B8%D0%BC%20ATTI%20%D0%BD%D0%B0%20DJI%20Mavic%203,%20%D0%B8%20%D0%B7%D0%B0%D0%BA%D1%80%D1%8B%D1%82%D1%8B%D0%B5%20%D0%BD%D0%B0%D1%81%D1%82%D1%80%D0%BE%D0%B9%D0%BA%D0%B8%20%D0%B4%D1%80%D0%BE%D0%BD%D0%B0%20-%20aerophoto.com_files/atti-mavpro-1024x636.jpg 1024w, %D0%9A%D0%B0%D0%BA%20%D0%B2%D0%BA%D0%BB%D1%8E%D1%87%D0%B8%D1%82%D1%8C%20%D1%80%D0%B5%D0%B6%D0%B8%D0%BC%20ATTI%20%D0%BD%D0%B0%20DJI%20Mavic%203,%20%D0%B8%20%D0%B7%D0%B0%D0%BA%D1%80%D1%8B%D1%82%D1%8B%D0%B5%20%D0%BD%D0%B0%D1%81%D1%82%D1%80%D0%BE%D0%B9%D0%BA%D0%B8%20%D0%B4%D1%80%D0%BE%D0%BD%D0%B0%20-%20aerophoto.com_files/atti-mavpro-768x477.jpg 768w, %D0%9A%D0%B0%D0%BA%20%D0%B2%D0%BA%D0%BB%D1%8E%D1%87%D0%B8%D1%82%D1%8C%20%D1%80%D0%B5%D0%B6%D0%B8%D0%BC%20ATTI%20%D0%BD%D0%B0%20DJI%20Mavic%203,%20%D0%B8%20%D0%B7%D0%B0%D0%BA%D1%80%D1%8B%D1%82%D1%8B%D0%B5%20%D0%BD%D0%B0%D1%81%D1%82%D1%80%D0%BE%D0%B9%D0%BA%D0%B8%20%D0%B4%D1%80%D0%BE%D0%BD%D0%B0%20-%20aerophoto.com_files/atti-mavpro-1536x953.jpg 1536w, %D0%9A%D0%B0%D0%BA%20%D0%B2%D0%BA%D0%BB%D1%8E%D1%87%D0%B8%D1%82%D1%8C%20%D1%80%D0%B5%D0%B6%D0%B8%D0%BC%20ATTI%20%D0%BD%D0%B0%20DJI%20Mavic%203,%20%D0%B8%20%D0%B7%D0%B0%D0%BA%D1%80%D1%8B%D1%82%D1%8B%D0%B5%20%D0%BD%D0%B0%D1%81%D1%82%D1%80%D0%BE%D0%B9%D0%BA%D0%B8%20%D0%B4%D1%80%D0%BE%D0%BD%D0%B0%20-%20aerophoto.com_files/atti-mavpro-2048x1271.jpg 2048w" sizes="(max-width: 300px) 100vw, 300px" data-dt-location="https://aerophoto.com.ua/2022/05/18/atti-for-mavic-3/atti-mavpro/" width="300" height="186"><i></i></a>
		</figure>
	</div>

	<div class="wpb_text_column wpb_content_element  vc_custom_1662649285024">
		<div class="wpb_wrapper">
			<h6 style="text-align: center;">Скриншот с настройками режима «ATTI» для DJI Mavic Pro</h6>

		</div>
	</div>

	<div class="wpb_text_column wpb_content_element  vc_custom_1652880640000">
		<div class="wpb_wrapper">
			<p><a name="6"></a><br>
6 Если уже вам удалось включить полетный режим ATTI, на вашем DJI Mavic 
3, возможно вы захотите изменить еще некоторые полётное характеристики 
дрона. У вас есть возможность увеличить горизонтальную скорость, 
скорость набора высоты и скорость снижения дрона, отдельно в режимах 
Normal и Sport. Эти настройки можно делать перемещая соответствующие 
ползунки на экране Advanced Parameters. Изменение параметров скорости и 
скороподъёмности дрона являются критическими и небезопасными. Лучше 
изменять эти параметры понемногу, контролируя результат пробными 
полетами.</p>

		</div>
	</div>
<div class="vc_empty_space" style="height: 15px"><span class="vc_empty_space_inner"></span></div><div class="vc_row wpb_row vc_inner vc_row-fluid vc_custom_1652946655278 vc_row-has-fill"><div class="wpb_column vc_column_container vc_col-sm-6 vc_col-has-fill"><div class="vc_column-inner vc_custom_1652946667958"><div class="wpb_wrapper">
	<div class="wpb_single_image wpb_content_element vc_align_center  vc_custom_1652953211058">
		
		<figure class="wpb_wrapper vc_figure photoswipe-item photoswipe-wrapper">
			<a href="https://aerophoto.com.ua/wp-content/uploads/2022/05/drone-hack_verical_climb_parameters-1024x695.jpg" target="_self" class="vc_single_image-wrapper vc_box_border_grey dt-pswp-item rollover rollover-zoom pspw-wrap-ready this-ready" data-large_image_width="1024" data-large_image_height="695"><img src="%D0%9A%D0%B0%D0%BA%20%D0%B2%D0%BA%D0%BB%D1%8E%D1%87%D0%B8%D1%82%D1%8C%20%D1%80%D0%B5%D0%B6%D0%B8%D0%BC%20ATTI%20%D0%BD%D0%B0%20DJI%20Mavic%203,%20%D0%B8%20%D0%B7%D0%B0%D0%BA%D1%80%D1%8B%D1%82%D1%8B%D0%B5%20%D0%BD%D0%B0%D1%81%D1%82%D1%80%D0%BE%D0%B9%D0%BA%D0%B8%20%D0%B4%D1%80%D0%BE%D0%BD%D0%B0%20-%20aerophoto.com_files/drone-hack_verical_climb_parameters-300x204.jpg" class="vc_single_image-img attachment-medium" alt="Увеличение скороподъемности DJI Mavic 3 в режиме Sport" loading="lazy" srcset="%D0%9A%D0%B0%D0%BA%20%D0%B2%D0%BA%D0%BB%D1%8E%D1%87%D0%B8%D1%82%D1%8C%20%D1%80%D0%B5%D0%B6%D0%B8%D0%BC%20ATTI%20%D0%BD%D0%B0%20DJI%20Mavic%203,%20%D0%B8%20%D0%B7%D0%B0%D0%BA%D1%80%D1%8B%D1%82%D1%8B%D0%B5%20%D0%BD%D0%B0%D1%81%D1%82%D1%80%D0%BE%D0%B9%D0%BA%D0%B8%20%D0%B4%D1%80%D0%BE%D0%BD%D0%B0%20-%20aerophoto.com_files/drone-hack_verical_climb_parameters-300x204.jpg 300w, %D0%9A%D0%B0%D0%BA%20%D0%B2%D0%BA%D0%BB%D1%8E%D1%87%D0%B8%D1%82%D1%8C%20%D1%80%D0%B5%D0%B6%D0%B8%D0%BC%20ATTI%20%D0%BD%D0%B0%20DJI%20Mavic%203,%20%D0%B8%20%D0%B7%D0%B0%D0%BA%D1%80%D1%8B%D1%82%D1%8B%D0%B5%20%D0%BD%D0%B0%D1%81%D1%82%D1%80%D0%BE%D0%B9%D0%BA%D0%B8%20%D0%B4%D1%80%D0%BE%D0%BD%D0%B0%20-%20aerophoto.com_files/drone-hack_verical_climb_parameters-1024x695.jpg 1024w, %D0%9A%D0%B0%D0%BA%20%D0%B2%D0%BA%D0%BB%D1%8E%D1%87%D0%B8%D1%82%D1%8C%20%D1%80%D0%B5%D0%B6%D0%B8%D0%BC%20ATTI%20%D0%BD%D0%B0%20DJI%20Mavic%203,%20%D0%B8%20%D0%B7%D0%B0%D0%BA%D1%80%D1%8B%D1%82%D1%8B%D0%B5%20%D0%BD%D0%B0%D1%81%D1%82%D1%80%D0%BE%D0%B9%D0%BA%D0%B8%20%D0%B4%D1%80%D0%BE%D0%BD%D0%B0%20-%20aerophoto.com_files/drone-hack_verical_climb_parameters-768x521.jpg 768w, %D0%9A%D0%B0%D0%BA%20%D0%B2%D0%BA%D0%BB%D1%8E%D1%87%D0%B8%D1%82%D1%8C%20%D1%80%D0%B5%D0%B6%D0%B8%D0%BC%20ATTI%20%D0%BD%D0%B0%20DJI%20Mavic%203,%20%D0%B8%20%D0%B7%D0%B0%D0%BA%D1%80%D1%8B%D1%82%D1%8B%D0%B5%20%D0%BD%D0%B0%D1%81%D1%82%D1%80%D0%BE%D0%B9%D0%BA%D0%B8%20%D0%B4%D1%80%D0%BE%D0%BD%D0%B0%20-%20aerophoto.com_files/drone-hack_verical_climb_parameters.jpg 1048w" sizes="(max-width: 300px) 100vw, 300px" data-dt-location="https://aerophoto.com.ua/2022/05/18/atti-for-mavic-3/drone-hack_verical_climb_parameters/" width="300" height="204"><i></i></a>
		</figure>
	</div>

	<div class="wpb_text_column wpb_content_element  vc_custom_1652953265267">
		<div class="wpb_wrapper">
			<h6 style="text-align: center;">Ползунок изменения максимальной скорости набора высоты в спортивном режиме</h6>

		</div>
	</div>
</div></div></div><div class="wpb_column vc_column_container vc_col-sm-6 vc_col-has-fill"><div class="vc_column-inner vc_custom_1652946678973"><div class="wpb_wrapper">
	<div class="wpb_single_image wpb_content_element vc_align_center  vc_custom_1652953399641">
		
		<figure class="wpb_wrapper vc_figure photoswipe-item photoswipe-wrapper">
			<a href="https://aerophoto.com.ua/wp-content/uploads/2022/05/drone-hack_verical_discend_parameters-1024x695.jpg" target="_self" class="vc_single_image-wrapper vc_box_border_grey dt-pswp-item rollover rollover-zoom pspw-wrap-ready this-ready" data-large_image_width="1024" data-large_image_height="695"><img src="%D0%9A%D0%B0%D0%BA%20%D0%B2%D0%BA%D0%BB%D1%8E%D1%87%D0%B8%D1%82%D1%8C%20%D1%80%D0%B5%D0%B6%D0%B8%D0%BC%20ATTI%20%D0%BD%D0%B0%20DJI%20Mavic%203,%20%D0%B8%20%D0%B7%D0%B0%D0%BA%D1%80%D1%8B%D1%82%D1%8B%D0%B5%20%D0%BD%D0%B0%D1%81%D1%82%D1%80%D0%BE%D0%B9%D0%BA%D0%B8%20%D0%B4%D1%80%D0%BE%D0%BD%D0%B0%20-%20aerophoto.com_files/drone-hack_verical_discend_parameters-300x204.jpg" class="vc_single_image-img attachment-medium" alt="Увеличение скjhjcnb спуска DJI Mavic 3 в режиме Sport" loading="lazy" srcset="%D0%9A%D0%B0%D0%BA%20%D0%B2%D0%BA%D0%BB%D1%8E%D1%87%D0%B8%D1%82%D1%8C%20%D1%80%D0%B5%D0%B6%D0%B8%D0%BC%20ATTI%20%D0%BD%D0%B0%20DJI%20Mavic%203,%20%D0%B8%20%D0%B7%D0%B0%D0%BA%D1%80%D1%8B%D1%82%D1%8B%D0%B5%20%D0%BD%D0%B0%D1%81%D1%82%D1%80%D0%BE%D0%B9%D0%BA%D0%B8%20%D0%B4%D1%80%D0%BE%D0%BD%D0%B0%20-%20aerophoto.com_files/drone-hack_verical_discend_parameters-300x204.jpg 300w, %D0%9A%D0%B0%D0%BA%20%D0%B2%D0%BA%D0%BB%D1%8E%D1%87%D0%B8%D1%82%D1%8C%20%D1%80%D0%B5%D0%B6%D0%B8%D0%BC%20ATTI%20%D0%BD%D0%B0%20DJI%20Mavic%203,%20%D0%B8%20%D0%B7%D0%B0%D0%BA%D1%80%D1%8B%D1%82%D1%8B%D0%B5%20%D0%BD%D0%B0%D1%81%D1%82%D1%80%D0%BE%D0%B9%D0%BA%D0%B8%20%D0%B4%D1%80%D0%BE%D0%BD%D0%B0%20-%20aerophoto.com_files/drone-hack_verical_discend_parameters-1024x695.jpg 1024w, %D0%9A%D0%B0%D0%BA%20%D0%B2%D0%BA%D0%BB%D1%8E%D1%87%D0%B8%D1%82%D1%8C%20%D1%80%D0%B5%D0%B6%D0%B8%D0%BC%20ATTI%20%D0%BD%D0%B0%20DJI%20Mavic%203,%20%D0%B8%20%D0%B7%D0%B0%D0%BA%D1%80%D1%8B%D1%82%D1%8B%D0%B5%20%D0%BD%D0%B0%D1%81%D1%82%D1%80%D0%BE%D0%B9%D0%BA%D0%B8%20%D0%B4%D1%80%D0%BE%D0%BD%D0%B0%20-%20aerophoto.com_files/drone-hack_verical_discend_parameters-768x521.jpg 768w, %D0%9A%D0%B0%D0%BA%20%D0%B2%D0%BA%D0%BB%D1%8E%D1%87%D0%B8%D1%82%D1%8C%20%D1%80%D0%B5%D0%B6%D0%B8%D0%BC%20ATTI%20%D0%BD%D0%B0%20DJI%20Mavic%203,%20%D0%B8%20%D0%B7%D0%B0%D0%BA%D1%80%D1%8B%D1%82%D1%8B%D0%B5%20%D0%BD%D0%B0%D1%81%D1%82%D1%80%D0%BE%D0%B9%D0%BA%D0%B8%20%D0%B4%D1%80%D0%BE%D0%BD%D0%B0%20-%20aerophoto.com_files/drone-hack_verical_discend_parameters.jpg 1048w" sizes="(max-width: 300px) 100vw, 300px" data-dt-location="https://aerophoto.com.ua/2022/05/18/atti-for-mavic-3/drone-hack_verical_discend_parameters/" width="300" height="204"><i></i></a>
		</figure>
	</div>

	<div class="wpb_text_column wpb_content_element  vc_custom_1652953433086">
		<div class="wpb_wrapper">
			<h6 style="text-align: center;">Ползунок изменения скорости снижения в режиме спорт</h6>

		</div>
	</div>
</div></div></div></div>
	<div class="wpb_text_column wpb_content_element  vc_custom_1654001213667">
		<div class="wpb_wrapper">
			<p><a name="7"></a><br>
7 Нужно отметить один важный момент. В интерфейсе программы DJI FLY 
показываются режимы полета в зависимости от положения переключателя 
режимов полета. После разблокировки режима ATTI намDJI Mavic 3, он хотя и
 будет включаться вместо режима «Cinematic Mode», название режима «ATTI»
 у вас в интерфейсе не появится, будет по прежнему обозначение «С», но 
при этом дрон будет летать в режиме «ATTI».</p>

		</div>
	</div>

	<div class="wpb_text_column wpb_content_element  vc_custom_1654001252804">
		<div class="wpb_wrapper">
			<p><a name="8"></a><br>
8 Выключение ходовых огней, передних и задних светодиодов на DJI Mavic 
3, нужно делать для уменьшения заметности дрона в темное время. Для 
этого не обязательно выковыривать светодиоды на лучах дрона, или 
заклеивать / закрашивать фонари. Можно все сделать программно. Выключить
 светодиоды на Mavic 3 можно двумя способами. В первом способе ищем ключ
 с тексом ‘led’, таких ключей несколько, большинство из них в качестве 
параметра содержат «0», один из ключей имеет параметр в виде 
трехзначного числа, этот параметр меняем на «0», сохраняем, записываем 
изменения в дрон. Во втором случае ищем ключ «lamp», и тоже меняем его 
параметр на «0», сохраняем, записываем изменения в дрон, огни 
выключаются.</p>

		</div>
	</div>

	<div class="wpb_text_column wpb_content_element  vc_custom_1654007760624">
		<div class="wpb_wrapper">
			<p><a name="9"></a><br>
9 Отключение авто посадки при втором уровне разряда батареи. Это будет 
полезно при экстремально дальних полетах, когда вы возвращаетесь на 
последних процентах батареи, и дрон автоматически снижается. Отключение 
авто посадки может добавить вам столь необходимые секунды при 
возвращении дрона. Как показывает практика, даже при уровне батареи 0%, 
дрон еще некоторое время может находиться в воздухе. Автоматическая 
посадка является одним из контуров безопасности дрона, и отключать ее 
следует только тогда, когда вы хорошо понимаете последствия своих 
действий.</p>
<ol>
<li style="list-style-type: none;">
<ol>
<li>Ищем ключ «dji_bat_level_1|g_config.voltage2.level_1_voltage» и меняем параметр на значение «10», сохраняем параметр.</li>
<li>Ищем ключ «bat_level_2_action|g_config.voltage.level_2_protect_type» и меняем параметр на значение «0», сохраняем параметр.</li>
<li>Ищем ключ 
«level1_smart_battert_gohome|g_config.voltage2.level2_smart_battert_gohome»
 и меняем параметр на значение «0», сохраняем параметр.</li>
<li>Ищем ключ 
«level2_smart_battert_land|g_config.voltage2.level2_smart_battert_land» и
 меняем параметр на значение «0», сохраняем параметр.</li>
<li>Ищем ключ «bat_enable_smart_bat_landing_protect» и меняем параметр на значение «0», сохраняем параметр.</li>
<li>Записываем изменения в дрон.</li>
</ol>
</li>
</ol>
<p>Я привожу ниже для проверки скрин со всеми сделанными изменениями.</p>

		</div>
	</div>

	<div class="wpb_single_image wpb_content_element vc_align_center  vc_custom_1654006403200">
		
		<figure class="wpb_wrapper vc_figure photoswipe-item photoswipe-wrapper">
			<a href="https://aerophoto.com.ua/wp-content/uploads/2022/05/bat-nolanding-1024x458.jpg" target="_self" class="vc_single_image-wrapper vc_box_outline vc_box_border_grey dt-pswp-item rollover rollover-zoom pspw-wrap-ready this-ready" data-large_image_width="1024" data-large_image_height="458"><img src="%D0%9A%D0%B0%D0%BA%20%D0%B2%D0%BA%D0%BB%D1%8E%D1%87%D0%B8%D1%82%D1%8C%20%D1%80%D0%B5%D0%B6%D0%B8%D0%BC%20ATTI%20%D0%BD%D0%B0%20DJI%20Mavic%203,%20%D0%B8%20%D0%B7%D0%B0%D0%BA%D1%80%D1%8B%D1%82%D1%8B%D0%B5%20%D0%BD%D0%B0%D1%81%D1%82%D1%80%D0%BE%D0%B9%D0%BA%D0%B8%20%D0%B4%D1%80%D0%BE%D0%BD%D0%B0%20-%20aerophoto.com_files/bat-nolanding-300x134.jpg" class="vc_single_image-img attachment-medium" alt="Отключение автопасадки дрона при разряде батареи" loading="lazy" srcset="%D0%9A%D0%B0%D0%BA%20%D0%B2%D0%BA%D0%BB%D1%8E%D1%87%D0%B8%D1%82%D1%8C%20%D1%80%D0%B5%D0%B6%D0%B8%D0%BC%20ATTI%20%D0%BD%D0%B0%20DJI%20Mavic%203,%20%D0%B8%20%D0%B7%D0%B0%D0%BA%D1%80%D1%8B%D1%82%D1%8B%D0%B5%20%D0%BD%D0%B0%D1%81%D1%82%D1%80%D0%BE%D0%B9%D0%BA%D0%B8%20%D0%B4%D1%80%D0%BE%D0%BD%D0%B0%20-%20aerophoto.com_files/bat-nolanding-300x134.jpg 300w, %D0%9A%D0%B0%D0%BA%20%D0%B2%D0%BA%D0%BB%D1%8E%D1%87%D0%B8%D1%82%D1%8C%20%D1%80%D0%B5%D0%B6%D0%B8%D0%BC%20ATTI%20%D0%BD%D0%B0%20DJI%20Mavic%203,%20%D0%B8%20%D0%B7%D0%B0%D0%BA%D1%80%D1%8B%D1%82%D1%8B%D0%B5%20%D0%BD%D0%B0%D1%81%D1%82%D1%80%D0%BE%D0%B9%D0%BA%D0%B8%20%D0%B4%D1%80%D0%BE%D0%BD%D0%B0%20-%20aerophoto.com_files/bat-nolanding-1024x458.jpg 1024w, %D0%9A%D0%B0%D0%BA%20%D0%B2%D0%BA%D0%BB%D1%8E%D1%87%D0%B8%D1%82%D1%8C%20%D1%80%D0%B5%D0%B6%D0%B8%D0%BC%20ATTI%20%D0%BD%D0%B0%20DJI%20Mavic%203,%20%D0%B8%20%D0%B7%D0%B0%D0%BA%D1%80%D1%8B%D1%82%D1%8B%D0%B5%20%D0%BD%D0%B0%D1%81%D1%82%D1%80%D0%BE%D0%B9%D0%BA%D0%B8%20%D0%B4%D1%80%D0%BE%D0%BD%D0%B0%20-%20aerophoto.com_files/bat-nolanding-768x344.jpg 768w, %D0%9A%D0%B0%D0%BA%20%D0%B2%D0%BA%D0%BB%D1%8E%D1%87%D0%B8%D1%82%D1%8C%20%D1%80%D0%B5%D0%B6%D0%B8%D0%BC%20ATTI%20%D0%BD%D0%B0%20DJI%20Mavic%203,%20%D0%B8%20%D0%B7%D0%B0%D0%BA%D1%80%D1%8B%D1%82%D1%8B%D0%B5%20%D0%BD%D0%B0%D1%81%D1%82%D1%80%D0%BE%D0%B9%D0%BA%D0%B8%20%D0%B4%D1%80%D0%BE%D0%BD%D0%B0%20-%20aerophoto.com_files/bat-nolanding-1536x687.jpg 1536w, %D0%9A%D0%B0%D0%BA%20%D0%B2%D0%BA%D0%BB%D1%8E%D1%87%D0%B8%D1%82%D1%8C%20%D1%80%D0%B5%D0%B6%D0%B8%D0%BC%20ATTI%20%D0%BD%D0%B0%20DJI%20Mavic%203,%20%D0%B8%20%D0%B7%D0%B0%D0%BA%D1%80%D1%8B%D1%82%D1%8B%D0%B5%20%D0%BD%D0%B0%D1%81%D1%82%D1%80%D0%BE%D0%B9%D0%BA%D0%B8%20%D0%B4%D1%80%D0%BE%D0%BD%D0%B0%20-%20aerophoto.com_files/bat-nolanding-2048x916.jpg 2048w" sizes="(max-width: 300px) 100vw, 300px" data-dt-location="https://aerophoto.com.ua/2022/05/18/atti-for-mavic-3/bat-nolanding/" width="300" height="134"><i></i></a>
		</figure>
	</div>

	<div class="wpb_text_column wpb_content_element  vc_custom_1654005922771">
		<div class="wpb_wrapper">
			<h6 style="text-align: center;">Скриншот со всеми изменениями для отключения автопосадки при разряде батареии</h6>

		</div>
	</div>

	<div class="wpb_text_column wpb_content_element  vc_custom_1654007572529">
		<div class="wpb_wrapper">
			<p><a name="10"></a><br>
10 Все кто сажал Mavic 3 в руку, помнят о том, как дрон стремится 
подскочить, если вы недостаточно проворно его схватили, да еще и 
вырывается вверх, пока вы выключаете двигатели. За это поведение 
отвечает режим «Precission Landing», который по замыслу разработчиков 
должен облегчить и автоматизировать аккуратную посадку на землю. Для 
тех, кто чаще ловит дрон руками, чем сажает на грунт, есть возможность 
отключить этот режим. Кроме того, это будет полезно, если вы что то 
крепите под дроном, или летаете в тумане и облаках.<br>
Для отключения режима «Precission Landing» ищем ключ 
«g_config.flying_limit.avoid_ground_and_smart_landing_enable» и меняем 
его значение на «0»</p>

		</div>
	</div>

	<div class="wpb_single_image wpb_content_element vc_align_center  vc_custom_1654007955929">
		
		<figure class="wpb_wrapper vc_figure photoswipe-item photoswipe-wrapper">
			<a href="https://aerophoto.com.ua/wp-content/uploads/2022/05/smart-landing-off-1024x428.jpg" target="_self" class="vc_single_image-wrapper vc_box_outline vc_box_border_grey dt-pswp-item rollover rollover-zoom pspw-wrap-ready this-ready" data-large_image_width="1024" data-large_image_height="428"><img src="%D0%9A%D0%B0%D0%BA%20%D0%B2%D0%BA%D0%BB%D1%8E%D1%87%D0%B8%D1%82%D1%8C%20%D1%80%D0%B5%D0%B6%D0%B8%D0%BC%20ATTI%20%D0%BD%D0%B0%20DJI%20Mavic%203,%20%D0%B8%20%D0%B7%D0%B0%D0%BA%D1%80%D1%8B%D1%82%D1%8B%D0%B5%20%D0%BD%D0%B0%D1%81%D1%82%D1%80%D0%BE%D0%B9%D0%BA%D0%B8%20%D0%B4%D1%80%D0%BE%D0%BD%D0%B0%20-%20aerophoto.com_files/smart-landing-off-300x125.jpg" class="vc_single_image-img attachment-medium" alt="Отключение режима Precission Landing" loading="lazy" srcset="%D0%9A%D0%B0%D0%BA%20%D0%B2%D0%BA%D0%BB%D1%8E%D1%87%D0%B8%D1%82%D1%8C%20%D1%80%D0%B5%D0%B6%D0%B8%D0%BC%20ATTI%20%D0%BD%D0%B0%20DJI%20Mavic%203,%20%D0%B8%20%D0%B7%D0%B0%D0%BA%D1%80%D1%8B%D1%82%D1%8B%D0%B5%20%D0%BD%D0%B0%D1%81%D1%82%D1%80%D0%BE%D0%B9%D0%BA%D0%B8%20%D0%B4%D1%80%D0%BE%D0%BD%D0%B0%20-%20aerophoto.com_files/smart-landing-off-300x125.jpg 300w, %D0%9A%D0%B0%D0%BA%20%D0%B2%D0%BA%D0%BB%D1%8E%D1%87%D0%B8%D1%82%D1%8C%20%D1%80%D0%B5%D0%B6%D0%B8%D0%BC%20ATTI%20%D0%BD%D0%B0%20DJI%20Mavic%203,%20%D0%B8%20%D0%B7%D0%B0%D0%BA%D1%80%D1%8B%D1%82%D1%8B%D0%B5%20%D0%BD%D0%B0%D1%81%D1%82%D1%80%D0%BE%D0%B9%D0%BA%D0%B8%20%D0%B4%D1%80%D0%BE%D0%BD%D0%B0%20-%20aerophoto.com_files/smart-landing-off-1024x428.jpg 1024w, %D0%9A%D0%B0%D0%BA%20%D0%B2%D0%BA%D0%BB%D1%8E%D1%87%D0%B8%D1%82%D1%8C%20%D1%80%D0%B5%D0%B6%D0%B8%D0%BC%20ATTI%20%D0%BD%D0%B0%20DJI%20Mavic%203,%20%D0%B8%20%D0%B7%D0%B0%D0%BA%D1%80%D1%8B%D1%82%D1%8B%D0%B5%20%D0%BD%D0%B0%D1%81%D1%82%D1%80%D0%BE%D0%B9%D0%BA%D0%B8%20%D0%B4%D1%80%D0%BE%D0%BD%D0%B0%20-%20aerophoto.com_files/smart-landing-off-768x321.jpg 768w, %D0%9A%D0%B0%D0%BA%20%D0%B2%D0%BA%D0%BB%D1%8E%D1%87%D0%B8%D1%82%D1%8C%20%D1%80%D0%B5%D0%B6%D0%B8%D0%BC%20ATTI%20%D0%BD%D0%B0%20DJI%20Mavic%203,%20%D0%B8%20%D0%B7%D0%B0%D0%BA%D1%80%D1%8B%D1%82%D1%8B%D0%B5%20%D0%BD%D0%B0%D1%81%D1%82%D1%80%D0%BE%D0%B9%D0%BA%D0%B8%20%D0%B4%D1%80%D0%BE%D0%BD%D0%B0%20-%20aerophoto.com_files/smart-landing-off-1536x642.jpg 1536w, %D0%9A%D0%B0%D0%BA%20%D0%B2%D0%BA%D0%BB%D1%8E%D1%87%D0%B8%D1%82%D1%8C%20%D1%80%D0%B5%D0%B6%D0%B8%D0%BC%20ATTI%20%D0%BD%D0%B0%20DJI%20Mavic%203,%20%D0%B8%20%D0%B7%D0%B0%D0%BA%D1%80%D1%8B%D1%82%D1%8B%D0%B5%20%D0%BD%D0%B0%D1%81%D1%82%D1%80%D0%BE%D0%B9%D0%BA%D0%B8%20%D0%B4%D1%80%D0%BE%D0%BD%D0%B0%20-%20aerophoto.com_files/smart-landing-off-2048x855.jpg 2048w" sizes="(max-width: 300px) 100vw, 300px" data-dt-location="https://aerophoto.com.ua/2022/05/18/atti-for-mavic-3/smart-landing-off/" width="300" height="125"><i></i></a>
		</figure>
	</div>

	<div class="wpb_text_column wpb_content_element  vc_custom_1654007989009">
		<div class="wpb_wrapper">
			<h6 style="text-align: center;">Отключение режима Precission Landing</h6>

		</div>
	</div>

	<div class="wpb_text_column wpb_content_element  vc_custom_1654008326104">
		<div class="wpb_wrapper">
			<p><a name="11"></a><br>
11 При ошибке компаса, что бывает нередко, у дронов DJI происходит 
перезагрузка модуля GPS, что замедляет процесс восстановления работы 
навигационной системы. Мы можем отключить этот алгоритм, это будет 
особенно полезно при полетах в условиях РЭБ. Делается это так: ищем ключ
 «g_config.fdi_switch.gps.with_fdi» и ставим значение параметра «0». Не 
забываем сохранить изменения и записать их в дрон.</p>

		</div>
	</div>

	<div class="wpb_single_image wpb_content_element vc_align_center  vc_custom_1654008517417">
		
		<figure class="wpb_wrapper vc_figure photoswipe-item photoswipe-wrapper">
			<a href="https://aerophoto.com.ua/wp-content/uploads/2022/05/gps-restart-off-1024x437.jpg" target="_self" class="vc_single_image-wrapper vc_box_outline vc_box_border_grey dt-pswp-item rollover rollover-zoom pspw-wrap-ready this-ready" data-large_image_width="1024" data-large_image_height="437"><img src="%D0%9A%D0%B0%D0%BA%20%D0%B2%D0%BA%D0%BB%D1%8E%D1%87%D0%B8%D1%82%D1%8C%20%D1%80%D0%B5%D0%B6%D0%B8%D0%BC%20ATTI%20%D0%BD%D0%B0%20DJI%20Mavic%203,%20%D0%B8%20%D0%B7%D0%B0%D0%BA%D1%80%D1%8B%D1%82%D1%8B%D0%B5%20%D0%BD%D0%B0%D1%81%D1%82%D1%80%D0%BE%D0%B9%D0%BA%D0%B8%20%D0%B4%D1%80%D0%BE%D0%BD%D0%B0%20-%20aerophoto.com_files/gps-restart-off-300x128.jpg" class="vc_single_image-img attachment-medium" alt="Отключение перезагрузки модуля GPS на дроне при ошибке компаса" loading="lazy" srcset="%D0%9A%D0%B0%D0%BA%20%D0%B2%D0%BA%D0%BB%D1%8E%D1%87%D0%B8%D1%82%D1%8C%20%D1%80%D0%B5%D0%B6%D0%B8%D0%BC%20ATTI%20%D0%BD%D0%B0%20DJI%20Mavic%203,%20%D0%B8%20%D0%B7%D0%B0%D0%BA%D1%80%D1%8B%D1%82%D1%8B%D0%B5%20%D0%BD%D0%B0%D1%81%D1%82%D1%80%D0%BE%D0%B9%D0%BA%D0%B8%20%D0%B4%D1%80%D0%BE%D0%BD%D0%B0%20-%20aerophoto.com_files/gps-restart-off-300x128.jpg 300w, %D0%9A%D0%B0%D0%BA%20%D0%B2%D0%BA%D0%BB%D1%8E%D1%87%D0%B8%D1%82%D1%8C%20%D1%80%D0%B5%D0%B6%D0%B8%D0%BC%20ATTI%20%D0%BD%D0%B0%20DJI%20Mavic%203,%20%D0%B8%20%D0%B7%D0%B0%D0%BA%D1%80%D1%8B%D1%82%D1%8B%D0%B5%20%D0%BD%D0%B0%D1%81%D1%82%D1%80%D0%BE%D0%B9%D0%BA%D0%B8%20%D0%B4%D1%80%D0%BE%D0%BD%D0%B0%20-%20aerophoto.com_files/gps-restart-off-1024x437.jpg 1024w, %D0%9A%D0%B0%D0%BA%20%D0%B2%D0%BA%D0%BB%D1%8E%D1%87%D0%B8%D1%82%D1%8C%20%D1%80%D0%B5%D0%B6%D0%B8%D0%BC%20ATTI%20%D0%BD%D0%B0%20DJI%20Mavic%203,%20%D0%B8%20%D0%B7%D0%B0%D0%BA%D1%80%D1%8B%D1%82%D1%8B%D0%B5%20%D0%BD%D0%B0%D1%81%D1%82%D1%80%D0%BE%D0%B9%D0%BA%D0%B8%20%D0%B4%D1%80%D0%BE%D0%BD%D0%B0%20-%20aerophoto.com_files/gps-restart-off-768x328.jpg 768w, %D0%9A%D0%B0%D0%BA%20%D0%B2%D0%BA%D0%BB%D1%8E%D1%87%D0%B8%D1%82%D1%8C%20%D1%80%D0%B5%D0%B6%D0%B8%D0%BC%20ATTI%20%D0%BD%D0%B0%20DJI%20Mavic%203,%20%D0%B8%20%D0%B7%D0%B0%D0%BA%D1%80%D1%8B%D1%82%D1%8B%D0%B5%20%D0%BD%D0%B0%D1%81%D1%82%D1%80%D0%BE%D0%B9%D0%BA%D0%B8%20%D0%B4%D1%80%D0%BE%D0%BD%D0%B0%20-%20aerophoto.com_files/gps-restart-off-1536x656.jpg 1536w, %D0%9A%D0%B0%D0%BA%20%D0%B2%D0%BA%D0%BB%D1%8E%D1%87%D0%B8%D1%82%D1%8C%20%D1%80%D0%B5%D0%B6%D0%B8%D0%BC%20ATTI%20%D0%BD%D0%B0%20DJI%20Mavic%203,%20%D0%B8%20%D0%B7%D0%B0%D0%BA%D1%80%D1%8B%D1%82%D1%8B%D0%B5%20%D0%BD%D0%B0%D1%81%D1%82%D1%80%D0%BE%D0%B9%D0%BA%D0%B8%20%D0%B4%D1%80%D0%BE%D0%BD%D0%B0%20-%20aerophoto.com_files/gps-restart-off-2048x874.jpg 2048w" sizes="(max-width: 300px) 100vw, 300px" data-dt-location="https://aerophoto.com.ua/2022/05/18/atti-for-mavic-3/gps-restart-off/" width="300" height="128"><i></i></a>
		</figure>
	</div>

	<div class="wpb_text_column wpb_content_element  vc_custom_1654008399376">
		<div class="wpb_wrapper">
			<h6 style="text-align: center;">Отключение перезагрузки модуля GPS на дроне, при ошибке компаса</h6>

		</div>
	</div>

	<div class="wpb_text_column wpb_content_element  vc_custom_1662235095494">
		<div class="wpb_wrapper">
			<p>Если у вас остались вопросы по настройкам, задавайте их в 
комментариях, я постараюсь помочь каждому и дополню статью недостающим 
материалом.</p>

		</div>
	</div>
</div></div></div></div>
</div><div class="single-share-box">
	<div class="share-link-description">Поделиться</div>
	<div class="share-buttons">
		<a class="facebook" href="https://www.facebook.com/sharer.php?u=https%3A%2F%2Faerophoto.com.ua%2F2022%2F05%2F18%2Fatti-for-mavic-3%2F&amp;t=%D0%9A%D0%B0%D0%BA+%D0%B2%D0%BA%D0%BB%D1%8E%D1%87%D0%B8%D1%82%D1%8C+%D1%80%D0%B5%D0%B6%D0%B8%D0%BC+ATTI+%D0%BD%D0%B0+DJI+Mavic+3%2C+%D0%B8+%D0%B7%D0%B0%D0%BA%D1%80%D1%8B%D1%82%D1%8B%D0%B5+%D0%BD%D0%B0%D1%81%D1%82%D1%80%D0%BE%D0%B9%D0%BA%D0%B8+%D0%B4%D1%80%D0%BE%D0%BD%D0%B0" title="Facebook" target="_blank"><span class="soc-font-icon"></span><span class="social-text">Share on Facebook</span><span class="screen-reader-text">Share on Facebook</span></a>
<a class="twitter" href="https://twitter.com/share?url=https%3A%2F%2Faerophoto.com.ua%2F2022%2F05%2F18%2Fatti-for-mavic-3%2F&amp;text=%D0%9A%D0%B0%D0%BA+%D0%B2%D0%BA%D0%BB%D1%8E%D1%87%D0%B8%D1%82%D1%8C+%D1%80%D0%B5%D0%B6%D0%B8%D0%BC+ATTI+%D0%BD%D0%B0+DJI+Mavic+3%2C+%D0%B8+%D0%B7%D0%B0%D0%BA%D1%80%D1%8B%D1%82%D1%8B%D0%B5+%D0%BD%D0%B0%D1%81%D1%82%D1%80%D0%BE%D0%B9%D0%BA%D0%B8+%D0%B4%D1%80%D0%BE%D0%BD%D0%B0" title="Twitter" target="_blank"><span class="soc-font-icon"></span><span class="social-text">Tweet</span><span class="screen-reader-text">Share on Twitter</span></a>
<a class="pinterest pinit-marklet" href="https://pinterest.com/pin/create/button/" title="Pinterest" target="_blank" data-pin-config="above" data-pin-do="buttonBookmark"><span class="soc-font-icon"></span><span class="social-text">Pin it</span><span class="screen-reader-text">Share on Pinterest</span></a>
<a class="linkedin" href="https://www.linkedin.com/shareArticle?mini=true&amp;url=https%3A%2F%2Faerophoto.com.ua%2F2022%2F05%2F18%2Fatti-for-mavic-3%2F&amp;title=%D0%9A%D0%B0%D0%BA%20%D0%B2%D0%BA%D0%BB%D1%8E%D1%87%D0%B8%D1%82%D1%8C%20%D1%80%D0%B5%D0%B6%D0%B8%D0%BC%20ATTI%20%D0%BD%D0%B0%20DJI%20Mavic%203%2C%20%D0%B8%20%D0%B7%D0%B0%D0%BA%D1%80%D1%8B%D1%82%D1%8B%D0%B5%20%D0%BD%D0%B0%D1%81%D1%82%D1%80%D0%BE%D0%B9%D0%BA%D0%B8%20%D0%B4%D1%80%D0%BE%D0%BD%D0%B0&amp;summary=&amp;source=aerophoto.com.ua" title="LinkedIn" target="_blank"><span class="soc-font-icon"></span><span class="social-text">Share on LinkedIn</span><span class="screen-reader-text">Share on LinkedIn</span></a>
	</div>
</div>
</article>

	<div id="comments" class="comments-area">

			<h3>7 комментариев</h3>

		
		<ol class="comment-list">
						<li class="comment even thread-even depth-1" id="comment-5">
				<article id="div-comment-5" class="comment-body">
					<footer class="comment-meta">
						<div class="comment-author vcard">
							<span class="avatar no-avatar"></span>							<span class="comment-author-name h4-size">Александр</span> <span class="says">говорит:</span>						</div><!-- .comment-author -->

						<div class="comment-metadata">
							<a href="https://aerophoto.com.ua/2022/05/18/atti-for-mavic-3/#comment-5">
								<time datetime="2022-09-08T16:08:01+03:00">
									08.09.2022 в 16:08								</time>
							</a>
													</div><!-- .comment-metadata -->

											</footer><!-- .comment-meta -->

					<div class="comment-content">
						<p>Как убрать ограничение высоты На Мавик 3</p>
					</div><!-- .comment-content -->

					<div class="reply"><a rel="nofollow" class="comment-reply-link" href="#comment-5" data-commentid="5" data-postid="5513" data-belowelement="div-comment-5" data-respondelement="respond" data-replyto="Ответить автору: “Александр”" aria-label="Ответить автору: “Александр”"><i class="dt-icon-the7-misc-099" aria-hidden="true"></i>&nbsp;Ответить</a></div>				</article><!-- .comment-body -->
		<ul class="children">
			<li class="comment byuser comment-author-admin bypostauthor odd alt depth-2" id="comment-11">
				<article id="div-comment-11" class="comment-body">
					<footer class="comment-meta">
						<div class="comment-author vcard">
							<span class="avatar no-avatar"></span>							<span class="comment-author-name h4-size">admin</span> <span class="says">говорит:</span>						</div><!-- .comment-author -->

						<div class="comment-metadata">
							<a href="https://aerophoto.com.ua/2022/05/18/atti-for-mavic-3/#comment-11">
								<time datetime="2022-09-26T22:16:41+03:00">
									26.09.2022 в 22:16								</time>
							</a>
													</div><!-- .comment-metadata -->

											</footer><!-- .comment-meta -->

					<div class="comment-content">
						<p>К сожалению, пока что убрать ограничения по высоте и NFZ для 
Mavic 3 никак нельзя. DJI все еще не выложили SDK дрона в общий доступ.</p>
					</div><!-- .comment-content -->

					<div class="reply"><a rel="nofollow" class="comment-reply-link" href="#comment-11" data-commentid="11" data-postid="5513" data-belowelement="div-comment-11" data-respondelement="respond" data-replyto="Ответить автору: “admin”" aria-label="Ответить автору: “admin”"><i class="dt-icon-the7-misc-099" aria-hidden="true"></i>&nbsp;Ответить</a></div>				</article><!-- .comment-body -->
		</li><!-- #comment-## -->
</ul><!-- .children -->
</li><!-- #comment-## -->
			<li class="comment even thread-odd thread-alt depth-1" id="comment-9">
				<article id="div-comment-9" class="comment-body">
					<footer class="comment-meta">
						<div class="comment-author vcard">
							<span class="avatar no-avatar"></span>							<span class="comment-author-name h4-size">Артур</span> <span class="says">говорит:</span>						</div><!-- .comment-author -->

						<div class="comment-metadata">
							<a href="https://aerophoto.com.ua/2022/05/18/atti-for-mavic-3/#comment-9">
								<time datetime="2022-09-23T20:19:15+03:00">
									23.09.2022 в 20:19								</time>
							</a>
													</div><!-- .comment-metadata -->

											</footer><!-- .comment-meta -->

					<div class="comment-content">
						<p>У меня Mavic 3 выдает ошибку калибровки видеодатчиков из-за этого не позволяет взлет. Подскажите как это исправить?</p>
					</div><!-- .comment-content -->

					<div class="reply"><a rel="nofollow" class="comment-reply-link" href="#comment-9" data-commentid="9" data-postid="5513" data-belowelement="div-comment-9" data-respondelement="respond" data-replyto="Ответить автору: “Артур”" aria-label="Ответить автору: “Артур”"><i class="dt-icon-the7-misc-099" aria-hidden="true"></i>&nbsp;Ответить</a></div>				</article><!-- .comment-body -->
		<ul class="children">
			<li class="comment byuser comment-author-admin bypostauthor odd alt depth-2" id="comment-12">
				<article id="div-comment-12" class="comment-body">
					<footer class="comment-meta">
						<div class="comment-author vcard">
							<span class="avatar no-avatar"></span>							<span class="comment-author-name h4-size">admin</span> <span class="says">говорит:</span>						</div><!-- .comment-author -->

						<div class="comment-metadata">
							<a href="https://aerophoto.com.ua/2022/05/18/atti-for-mavic-3/#comment-12">
								<time datetime="2022-09-26T22:17:50+03:00">
									26.09.2022 в 22:17								</time>
							</a>
													</div><!-- .comment-metadata -->

											</footer><!-- .comment-meta -->

					<div class="comment-content">
						<p>Попробуйте откалибровать датчики через DJI Assistant. В случае с Mavic 2 мне это помогло.</p>
					</div><!-- .comment-content -->

					<div class="reply"><a rel="nofollow" class="comment-reply-link" href="#comment-12" data-commentid="12" data-postid="5513" data-belowelement="div-comment-12" data-respondelement="respond" data-replyto="Ответить автору: “admin”" aria-label="Ответить автору: “admin”"><i class="dt-icon-the7-misc-099" aria-hidden="true"></i>&nbsp;Ответить</a></div>				</article><!-- .comment-body -->
		</li><!-- #comment-## -->
</ul><!-- .children -->
</li><!-- #comment-## -->
			<li class="comment even thread-even depth-1" id="comment-10">
				<article id="div-comment-10" class="comment-body">
					<footer class="comment-meta">
						<div class="comment-author vcard">
							<span class="avatar no-avatar"></span>							<span class="comment-author-name h4-size">Сергей Даценко</span> <span class="says">говорит:</span>						</div><!-- .comment-author -->

						<div class="comment-metadata">
							<a href="https://aerophoto.com.ua/2022/05/18/atti-for-mavic-3/#comment-10">
								<time datetime="2022-09-26T20:23:03+03:00">
									26.09.2022 в 20:23								</time>
							</a>
													</div><!-- .comment-metadata -->

											</footer><!-- .comment-meta -->

					<div class="comment-content">
						<p>Согласен, что менять на атти логичнее режим спорт, как 
правильно указано в статье. Однако, какой же именно ключ при этом 
следует редактировать не указано.</p>
					</div><!-- .comment-content -->

					<div class="reply"><a rel="nofollow" class="comment-reply-link" href="#comment-10" data-commentid="10" data-postid="5513" data-belowelement="div-comment-10" data-respondelement="respond" data-replyto="Ответить автору: “Сергей Даценко”" aria-label="Ответить автору: “Сергей Даценко”"><i class="dt-icon-the7-misc-099" aria-hidden="true"></i>&nbsp;Ответить</a></div>				</article><!-- .comment-body -->
		<ul class="children">
			<li class="comment byuser comment-author-admin bypostauthor odd alt depth-2" id="comment-13">
				<article id="div-comment-13" class="comment-body">
					<footer class="comment-meta">
						<div class="comment-author vcard">
							<span class="avatar no-avatar"></span>							<span class="comment-author-name h4-size">admin</span> <span class="says">говорит:</span>						</div><!-- .comment-author -->

						<div class="comment-metadata">
							<a href="https://aerophoto.com.ua/2022/05/18/atti-for-mavic-3/#comment-13">
								<time datetime="2022-09-26T22:21:58+03:00">
									26.09.2022 в 22:21								</time>
							</a>
													</div><!-- .comment-metadata -->

											</footer><!-- .comment-meta -->

					<div class="comment-content">
						<p>Спасибо за ваш интерес, завтра добавлю к статье этот момент</p>
					</div><!-- .comment-content -->

					<div class="reply"><a rel="nofollow" class="comment-reply-link" href="#comment-13" data-commentid="13" data-postid="5513" data-belowelement="div-comment-13" data-respondelement="respond" data-replyto="Ответить автору: “admin”" aria-label="Ответить автору: “admin”"><i class="dt-icon-the7-misc-099" aria-hidden="true"></i>&nbsp;Ответить</a></div>				</article><!-- .comment-body -->
		<ul class="children">
			<li class="comment byuser comment-author-admin bypostauthor even depth-3" id="comment-14">
				<article id="div-comment-14" class="comment-body">
					<footer class="comment-meta">
						<div class="comment-author vcard">
							<span class="avatar no-avatar"></span>							<span class="comment-author-name h4-size">admin</span> <span class="says">говорит:</span>						</div><!-- .comment-author -->

						<div class="comment-metadata">
							<a href="https://aerophoto.com.ua/2022/05/18/atti-for-mavic-3/#comment-14">
								<time datetime="2022-09-27T22:06:47+03:00">
									27.09.2022 в 22:06								</time>
							</a>
													</div><!-- .comment-metadata -->

											</footer><!-- .comment-meta -->

					<div class="comment-content">
						<p>Добавил в статью: «Если вы решили включить режим «ATTI» на 
вашем DJI Mavic 3 вместо режима «Sport», то вам нужно найти ключ с 
параметром «8», и заменить его значение на «3»».</p>
					</div><!-- .comment-content -->

					<div class="reply"><a rel="nofollow" class="comment-reply-link" href="#comment-14" data-commentid="14" data-postid="5513" data-belowelement="div-comment-14" data-respondelement="respond" data-replyto="Ответить автору: “admin”" aria-label="Ответить автору: “admin”"><i class="dt-icon-the7-misc-099" aria-hidden="true"></i>&nbsp;Ответить</a></div>				</article><!-- .comment-body -->
		</li><!-- #comment-## -->
</ul><!-- .children -->
</li><!-- #comment-## -->
</ul><!-- .children -->
</li><!-- #comment-## -->
		</ol><!-- .comment-list -->

		
	
		
		<div id="respond" class="comment-respond">
		<h3 id="reply-title" class="comment-reply-title">Добавить комментарий <small><a rel="nofollow" id="cancel-comment-reply-link" href="https://aerophoto.com.ua/2022/05/18/atti-for-mavic-3/#respond" style="display:none;">Отменить ответ</a></small></h3><form action="https://aerophoto.com.ua/wp-comments-post.php" method="post" id="commentform" class="comment-form"><p class="comment-notes text-small">Ваш электронный адрес не будет опубликован. Обязательные для заполнения поля помечены <span class="required">*</span></p><p class="comment-form-comment"><label class="assistive-text" for="comment">Комментарий</label><textarea id="comment" placeholder="Комментарий" name="comment" cols="45" rows="8" aria-required="true"></textarea></p><input name="wpml_language_code" type="hidden" value="ru"><div class="form-fields"><span class="comment-form-author"><label class="assistive-text" for="author">Имя *</label><input id="author" name="author" type="text" placeholder="Имя*" size="30" aria-required="true"></span>
<span class="comment-form-email"><label class="assistive-text" for="email">Email *</label><input id="email" name="email" type="text" placeholder="Email*" size="30" aria-required="true"></span>
<span class="comment-form-url"><label class="assistive-text" for="url">Сайт</label><input id="url" name="url" type="text" placeholder="Сайт" size="30"></span></div>
<p class="comment-form-cookies-consent"><input id="wp-comment-cookies-consent" name="wp-comment-cookies-consent" type="checkbox" value="yes"><label for="wp-comment-cookies-consent">Save my name, email, and website in this browser for the next time I comment.</label></p>
<p class="form-submit"><input name="submit" type="submit" id="submit" class="submit" value="Отправить комментарий"> <a href="javascript:void(0);" class="dt-btn dt-btn-m"><span>Отправить</span></a><input type="hidden" name="comment_post_ID" value="5513" id="comment_post_ID">
<input type="hidden" name="comment_parent" id="comment_parent" value="0">
</p><p style="display: none !important;"><label>Δ<textarea name="ak_hp_textarea" cols="45" rows="8" maxlength="100"></textarea></label><input type="hidden" id="ak_js_1" name="ak_js" value="1664561550287"><script>document.getElementById( "ak_js_1" ).setAttribute( "value", ( new Date() ).getTime() );</script></p></form>	</div><!-- #respond -->
	
	</div><!-- #comments .comments-area -->

			</div><!-- #content -->

			
			</div><!-- .wf-container -->
		</div><!-- .wf-wrap -->

	
	</div><!-- #main -->

	

	
	<!-- !Footer -->
	<footer id="footer" class="footer solid-bg">

		
			<div class="wf-wrap">
				<div class="wf-container-footer">
					<div class="wf-container">
						<section id="custom_html-2" class="widget_text widget widget_custom_html wf-cell wf-1-4"><div class="widget-title">КОНТАКТЫ</div><div class="textwidget custom-html-widget"><p>Украина, Киев</p>

<p>ВДНГ, павильон 116</p>

<p>+38 (067) 710 78 57</p>

<p> 
	<a href="mailto:pilot@aerophoto.com.ua">
	pilot@aerophoto.com.ua</a>
</p>
	
<p> 
	<a href="https://aerophoto.com.ua/karta-sajta/">
	КАРТА САЙТА</a>
</p>
<p> 
	<a href="https://goo.gl/maps/DYLnBwVB2JJHALxD9">
	<span style="color: #ff0000;">ПОКАЗАТЬ НА GOOGLE КАРТАХ</span></a>
</p>
</div></section><section id="text-5" class="widget widget_text wf-cell wf-1-4"><div class="widget-title">НАШИ УСЛУГИ</div>			<div class="textwidget"><p><a href="https://aerophoto.com.ua/uslugi/aerovideosemka/">Аэрофото- и видеосъемка</a></p>
<p><a href="https://aerophoto.com.ua/drone-pilot-school/">Профессиональное обучение</a></p>
<p><a href="http://https//aerophoto.com.ua/uslugi/aerogeodeziya-i-kartografiya-s-pomoshhyu-dronov/">Оперативная геодезия и картография</a></p>
<p><a href="https://aerophoto.com.ua/drones-with-thermal-cameras/">Тепловизионная съемка и мониторинг</a></p>
<p><a href="https://aerophoto.com.ua/2020/03/19/drones-in-agriculture/">Мультиспектральная съемка</a></p>
<p><a href="https://aerophoto.com.ua/uslugi-s-pomoshhyu-dronov/aerofotosemka-panoram-i-virtualnyh-turov/">Видео-360, панорамы, виртуальные туры</a></p>
<p><a href="https://aerophoto.com.ua/2020/03/19/drones-in-agriculture/">Услуги агродронов</a></p>
</div>
		</section><section id="text-6" class="widget widget_text wf-cell wf-1-4"><div class="widget-title">НАШИ ПРОЕКТЫ</div>			<div class="textwidget"><p><a href="https://aerophoto.com.ua/uslugi-s-pomoshhyu-dronov/aerovideosemka/">Кинопроизводство</a></p>
<p><a href="https://aerophoto.com.ua/uslugi-s-pomoshhyu-dronov/aerogeodeziya-i-kartografiya-s-pomoshhyu-dronov/">Аэрогеодезия</a></p>
<p><a href="https://aerophoto.com.ua/uslugi-s-pomoshhyu-dronov/aerovideosemka/">Рекламная съемка</a></p>
<p><a href="https://aerophoto.com.ua/uslugi-s-pomoshhyu-dronov/aerofotosemka-panoram-i-virtualnyh-turov/">Сферическое видео</a></p>
<p><a href="https://aerophoto.com.ua/uslugi-s-pomoshhyu-dronov/aerofotosemka-panoram-i-virtualnyh-turov/">Виртуальные туры</a></p>
<p><a href="https://aerophoto.com.ua/uslugi-s-pomoshhyu-dronov/istoriya-i-arheologiya/">Археология</a></p>
</div>
		</section><section id="custom_html-3" class="widget_text widget widget_custom_html wf-cell wf-1-4"><div class="widget-title">НАШИ ВАКАНСИИ</div><div class="textwidget custom-html-widget"><p><a href="https://aerophoto.com.ua/vakansii/">Пилоты дронов</a></p>
<p><a href="https://aerophoto.com.ua/vakansii/">Пилоты агродронов</a></p>
<p><a href="https://aerophoto.com.ua/vakansii/">Техники</a></p>
<p><a href="https://aerophoto.com.ua/vakansii/">Геодезисты</a></p>
</div></section>					</div><!-- .wf-container -->
				</div><!-- .wf-container-footer -->
			</div><!-- .wf-wrap -->

			
<!-- !Bottom-bar -->
<div id="bottom-bar" class="solid-bg logo-center" role="contentinfo">
    <div class="wf-wrap">
        <div class="wf-container-bottom">

			
                <div class="wf-float-left">

					<i class="fa fa-copyright"></i> aerophoto.com.ua
                </div>

			
            <div class="wf-float-right">

				
            </div>

        </div><!-- .wf-container-bottom -->
    </div><!-- .wf-wrap -->
</div><!-- #bottom-bar -->
	</footer><!-- #footer -->


	<a href="#" class="scroll-top off"><span class="screen-reader-text">Вверх</span></a>

</div><!-- #page -->

    <div class="wrapper-nextchat-plugin-view" style="right:10px;bottom:80px;">
        <div class="wrapper-position-nextchat-plugin">
            
            <div class="default-button" style="height:50px; width:50px; background:#e91e63;">
                <img src="%D0%9A%D0%B0%D0%BA%20%D0%B2%D0%BA%D0%BB%D1%8E%D1%87%D0%B8%D1%82%D1%8C%20%D1%80%D0%B5%D0%B6%D0%B8%D0%BC%20ATTI%20%D0%BD%D0%B0%20DJI%20Mavic%203,%20%D0%B8%20%D0%B7%D0%B0%D0%BA%D1%80%D1%8B%D1%82%D1%8B%D0%B5%20%D0%BD%D0%B0%D1%81%D1%82%D1%80%D0%BE%D0%B9%D0%BA%D0%B8%20%D0%B4%D1%80%D0%BE%D0%BD%D0%B0%20-%20aerophoto.com_files/smooth.png" alt="">

                <span style="right: calc(100% + 10px); margin-right: -15px; background: #e91e63" class="title">
                    Есть вопросы?                </span>
            </div>
            <div class="collapse-button" style="bottom: 100%; padding-bottom: 10px; left: calc(50% - 21.25px)">
                                        <div class="wrap-chanel-button">
                            <a class="chanel-button" target="" rel="noopener noreferrer" href="sms:++380 67 710 78 57" style="height:42.5px; width:42.5px;">
                                <img src="%D0%9A%D0%B0%D0%BA%20%D0%B2%D0%BA%D0%BB%D1%8E%D1%87%D0%B8%D1%82%D1%8C%20%D1%80%D0%B5%D0%B6%D0%B8%D0%BC%20ATTI%20%D0%BD%D0%B0%20DJI%20Mavic%203,%20%D0%B8%20%D0%B7%D0%B0%D0%BA%D1%80%D1%8B%D1%82%D1%8B%D0%B5%20%D0%BD%D0%B0%D1%81%D1%82%D1%80%D0%BE%D0%B9%D0%BA%D0%B8%20%D0%B4%D1%80%D0%BE%D0%BD%D0%B0%20-%20aerophoto.com_files/sms.png" alt="">
                            </a>
                            <span style="right: calc(100% + 10px); margin-right: -15px;" class="sub-title">
                                sms                            </span>
                        </div>
                                            <div class="wrap-chanel-button">
                            <a class="chanel-button" target="_blank" rel="noopener noreferrer" href="https://telegram.me/+380%2067%20710%2078%2057" style="height:42.5px; width:42.5px;">
                                <img src="%D0%9A%D0%B0%D0%BA%20%D0%B2%D0%BA%D0%BB%D1%8E%D1%87%D0%B8%D1%82%D1%8C%20%D1%80%D0%B5%D0%B6%D0%B8%D0%BC%20ATTI%20%D0%BD%D0%B0%20DJI%20Mavic%203,%20%D0%B8%20%D0%B7%D0%B0%D0%BA%D1%80%D1%8B%D1%82%D1%8B%D0%B5%20%D0%BD%D0%B0%D1%81%D1%82%D1%80%D0%BE%D0%B9%D0%BA%D0%B8%20%D0%B4%D1%80%D0%BE%D0%BD%D0%B0%20-%20aerophoto.com_files/telegram.png" alt="">
                            </a>
                            <span style="right: calc(100% + 10px); margin-right: -15px;" class="sub-title">
                                telegram                            </span>
                        </div>
                                            <div class="wrap-chanel-button">
                            <a class="chanel-button" target="" rel="noopener noreferrer" href="tel:++380 67 710 78 57" style="height:42.5px; width:42.5px;">
                                <img src="%D0%9A%D0%B0%D0%BA%20%D0%B2%D0%BA%D0%BB%D1%8E%D1%87%D0%B8%D1%82%D1%8C%20%D1%80%D0%B5%D0%B6%D0%B8%D0%BC%20ATTI%20%D0%BD%D0%B0%20DJI%20Mavic%203,%20%D0%B8%20%D0%B7%D0%B0%D0%BA%D1%80%D1%8B%D1%82%D1%8B%D0%B5%20%D0%BD%D0%B0%D1%81%D1%82%D1%80%D0%BE%D0%B9%D0%BA%D0%B8%20%D0%B4%D1%80%D0%BE%D0%BD%D0%B0%20-%20aerophoto.com_files/phone.png" alt="">
                            </a>
                            <span style="right: calc(100% + 10px); margin-right: -15px;" class="sub-title">
                                phone                            </span>
                        </div>
                                            <div class="wrap-chanel-button">
                            <a class="chanel-button" target="" rel="noopener noreferrer" href="mailto:pilot@aerophoto.com.ua" style="height:42.5px; width:42.5px;">
                                <img src="%D0%9A%D0%B0%D0%BA%20%D0%B2%D0%BA%D0%BB%D1%8E%D1%87%D0%B8%D1%82%D1%8C%20%D1%80%D0%B5%D0%B6%D0%B8%D0%BC%20ATTI%20%D0%BD%D0%B0%20DJI%20Mavic%203,%20%D0%B8%20%D0%B7%D0%B0%D0%BA%D1%80%D1%8B%D1%82%D1%8B%D0%B5%20%D0%BD%D0%B0%D1%81%D1%82%D1%80%D0%BE%D0%B9%D0%BA%D0%B8%20%D0%B4%D1%80%D0%BE%D0%BD%D0%B0%20-%20aerophoto.com_files/email.png" alt="">
                            </a>
                            <span style="right: calc(100% + 10px); margin-right: -15px;" class="sub-title">
                                email                            </span>
                        </div>
                                            <div class="wrap-chanel-button">
                            <a class="chanel-button" target="_blank" rel="noopener noreferrer" href="https://msng.link/vi/+380%2067%20710%2078%2057" style="height:42.5px; width:42.5px;">
                                <img src="%D0%9A%D0%B0%D0%BA%20%D0%B2%D0%BA%D0%BB%D1%8E%D1%87%D0%B8%D1%82%D1%8C%20%D1%80%D0%B5%D0%B6%D0%B8%D0%BC%20ATTI%20%D0%BD%D0%B0%20DJI%20Mavic%203,%20%D0%B8%20%D0%B7%D0%B0%D0%BA%D1%80%D1%8B%D1%82%D1%8B%D0%B5%20%D0%BD%D0%B0%D1%81%D1%82%D1%80%D0%BE%D0%B9%D0%BA%D0%B8%20%D0%B4%D1%80%D0%BE%D0%BD%D0%B0%20-%20aerophoto.com_files/viber.png" alt="">
                            </a>
                            <span style="right: calc(100% + 10px); margin-right: -15px;" class="sub-title">
                                viber                            </span>
                        </div>
                                </div>

        </div>
    </div>
<script type="text/html" id="wpb-modifications"></script><script type="text/javascript" src="%D0%9A%D0%B0%D0%BA%20%D0%B2%D0%BA%D0%BB%D1%8E%D1%87%D0%B8%D1%82%D1%8C%20%D1%80%D0%B5%D0%B6%D0%B8%D0%BC%20ATTI%20%D0%BD%D0%B0%20DJI%20Mavic%203,%20%D0%B8%20%D0%B7%D0%B0%D0%BA%D1%80%D1%8B%D1%82%D1%8B%D0%B5%20%D0%BD%D0%B0%D1%81%D1%82%D1%80%D0%BE%D0%B9%D0%BA%D0%B8%20%D0%B4%D1%80%D0%BE%D0%BD%D0%B0%20-%20aerophoto.com_files/main.min.js" id="dt-main-js"></script>
<script type="text/javascript" src="%D0%9A%D0%B0%D0%BA%20%D0%B2%D0%BA%D0%BB%D1%8E%D1%87%D0%B8%D1%82%D1%8C%20%D1%80%D0%B5%D0%B6%D0%B8%D0%BC%20ATTI%20%D0%BD%D0%B0%20DJI%20Mavic%203,%20%D0%B8%20%D0%B7%D0%B0%D0%BA%D1%80%D1%8B%D1%82%D1%8B%D0%B5%20%D0%BD%D0%B0%D1%81%D1%82%D1%80%D0%BE%D0%B9%D0%BA%D0%B8%20%D0%B4%D1%80%D0%BE%D0%BD%D0%B0%20-%20aerophoto.com_files/wp-polyfill.min.js" id="wp-polyfill-js"></script>
<script type="text/javascript" id="wp-polyfill-js-after">
( 'fetch' in window ) || document.write( '<script src="https://aerophoto.com.ua/wp-includes/js/dist/vendor/wp-polyfill-fetch.min.js?ver=3.0.0"></scr' + 'ipt>' );( document.contains ) || document.write( '<script src="https://aerophoto.com.ua/wp-includes/js/dist/vendor/wp-polyfill-node-contains.min.js?ver=3.42.0"></scr' + 'ipt>' );( window.DOMRect ) || document.write( '<script src="https://aerophoto.com.ua/wp-includes/js/dist/vendor/wp-polyfill-dom-rect.min.js?ver=3.42.0"></scr' + 'ipt>' );( window.URL && window.URL.prototype && window.URLSearchParams ) || document.write( '<script src="https://aerophoto.com.ua/wp-includes/js/dist/vendor/wp-polyfill-url.min.js?ver=3.6.4"></scr' + 'ipt>' );( window.FormData && window.FormData.prototype.keys ) || document.write( '<script src="https://aerophoto.com.ua/wp-includes/js/dist/vendor/wp-polyfill-formdata.min.js?ver=3.0.12"></scr' + 'ipt>' );( Element.prototype.matches && Element.prototype.closest ) || document.write( '<script src="https://aerophoto.com.ua/wp-includes/js/dist/vendor/wp-polyfill-element-closest.min.js?ver=2.0.2"></scr' + 'ipt>' );( 'objectFit' in document.documentElement.style ) || document.write( '<script src="https://aerophoto.com.ua/wp-includes/js/dist/vendor/wp-polyfill-object-fit.min.js?ver=2.3.4"></scr' + 'ipt>' );
</script>
<script type="text/javascript" id="contact-form-7-js-extra">
/* <![CDATA[ */
var wpcf7 = {"api":{"root":"https:\/\/aerophoto.com.ua\/wp-json\/","namespace":"contact-form-7\/v1"},"cached":"1"};
/* ]]> */
</script>
<script type="text/javascript" src="%D0%9A%D0%B0%D0%BA%20%D0%B2%D0%BA%D0%BB%D1%8E%D1%87%D0%B8%D1%82%D1%8C%20%D1%80%D0%B5%D0%B6%D0%B8%D0%BC%20ATTI%20%D0%BD%D0%B0%20DJI%20Mavic%203,%20%D0%B8%20%D0%B7%D0%B0%D0%BA%D1%80%D1%8B%D1%82%D1%8B%D0%B5%20%D0%BD%D0%B0%D1%81%D1%82%D1%80%D0%BE%D0%B9%D0%BA%D0%B8%20%D0%B4%D1%80%D0%BE%D0%BD%D0%B0%20-%20aerophoto.com_files/index.js" id="contact-form-7-js"></script>
<script type="text/javascript" src="%D0%9A%D0%B0%D0%BA%20%D0%B2%D0%BA%D0%BB%D1%8E%D1%87%D0%B8%D1%82%D1%8C%20%D1%80%D0%B5%D0%B6%D0%B8%D0%BC%20ATTI%20%D0%BD%D0%B0%20DJI%20Mavic%203,%20%D0%B8%20%D0%B7%D0%B0%D0%BA%D1%80%D1%8B%D1%82%D1%8B%D0%B5%20%D0%BD%D0%B0%D1%81%D1%82%D1%80%D0%BE%D0%B9%D0%BA%D0%B8%20%D0%B4%D1%80%D0%BE%D0%BD%D0%B0%20-%20aerophoto.com_files/legacy.min.js" id="dt-legacy-js"></script>
<script type="text/javascript" src="%D0%9A%D0%B0%D0%BA%20%D0%B2%D0%BA%D0%BB%D1%8E%D1%87%D0%B8%D1%82%D1%8C%20%D1%80%D0%B5%D0%B6%D0%B8%D0%BC%20ATTI%20%D0%BD%D0%B0%20DJI%20Mavic%203,%20%D0%B8%20%D0%B7%D0%B0%D0%BA%D1%80%D1%8B%D1%82%D1%8B%D0%B5%20%D0%BD%D0%B0%D1%81%D1%82%D1%80%D0%BE%D0%B9%D0%BA%D0%B8%20%D0%B4%D1%80%D0%BE%D0%BD%D0%B0%20-%20aerophoto.com_files/comment-reply.min.js" id="comment-reply-js"></script>
<script type="text/javascript" src="%D0%9A%D0%B0%D0%BA%20%D0%B2%D0%BA%D0%BB%D1%8E%D1%87%D0%B8%D1%82%D1%8C%20%D1%80%D0%B5%D0%B6%D0%B8%D0%BC%20ATTI%20%D0%BD%D0%B0%20DJI%20Mavic%203,%20%D0%B8%20%D0%B7%D0%B0%D0%BA%D1%80%D1%8B%D1%82%D1%8B%D0%B5%20%D0%BD%D0%B0%D1%81%D1%82%D1%80%D0%BE%D0%B9%D0%BA%D0%B8%20%D0%B4%D1%80%D0%BE%D0%BD%D0%B0%20-%20aerophoto.com_files/jquery-mousewheel.min.js" id="jquery-mousewheel-js"></script>
<script type="text/javascript" src="%D0%9A%D0%B0%D0%BA%20%D0%B2%D0%BA%D0%BB%D1%8E%D1%87%D0%B8%D1%82%D1%8C%20%D1%80%D0%B5%D0%B6%D0%B8%D0%BC%20ATTI%20%D0%BD%D0%B0%20DJI%20Mavic%203,%20%D0%B8%20%D0%B7%D0%B0%D0%BA%D1%80%D1%8B%D1%82%D1%8B%D0%B5%20%D0%BD%D0%B0%D1%81%D1%82%D1%80%D0%BE%D0%B9%D0%BA%D0%B8%20%D0%B4%D1%80%D0%BE%D0%BD%D0%B0%20-%20aerophoto.com_files/custom-scrollbar.min.js" id="the7-custom-scrollbar-js"></script>
<script type="text/javascript" src="%D0%9A%D0%B0%D0%BA%20%D0%B2%D0%BA%D0%BB%D1%8E%D1%87%D0%B8%D1%82%D1%8C%20%D1%80%D0%B5%D0%B6%D0%B8%D0%BC%20ATTI%20%D0%BD%D0%B0%20DJI%20Mavic%203,%20%D0%B8%20%D0%B7%D0%B0%D0%BA%D1%80%D1%8B%D1%82%D1%8B%D0%B5%20%D0%BD%D0%B0%D1%81%D1%82%D1%80%D0%BE%D0%B9%D0%BA%D0%B8%20%D0%B4%D1%80%D0%BE%D0%BD%D0%B0%20-%20aerophoto.com_files/post-type.min.js" id="the7-core-js"></script>
<script type="text/javascript" src="%D0%9A%D0%B0%D0%BA%20%D0%B2%D0%BA%D0%BB%D1%8E%D1%87%D0%B8%D1%82%D1%8C%20%D1%80%D0%B5%D0%B6%D0%B8%D0%BC%20ATTI%20%D0%BD%D0%B0%20DJI%20Mavic%203,%20%D0%B8%20%D0%B7%D0%B0%D0%BA%D1%80%D1%8B%D1%82%D1%8B%D0%B5%20%D0%BD%D0%B0%D1%81%D1%82%D1%80%D0%BE%D0%B9%D0%BA%D0%B8%20%D0%B4%D1%80%D0%BE%D0%BD%D0%B0%20-%20aerophoto.com_files/wp-embed.min.js" id="wp-embed-js"></script>
<script type="text/javascript" src="%D0%9A%D0%B0%D0%BA%20%D0%B2%D0%BA%D0%BB%D1%8E%D1%87%D0%B8%D1%82%D1%8C%20%D1%80%D0%B5%D0%B6%D0%B8%D0%BC%20ATTI%20%D0%BD%D0%B0%20DJI%20Mavic%203,%20%D0%B8%20%D0%B7%D0%B0%D0%BA%D1%80%D1%8B%D1%82%D1%8B%D0%B5%20%D0%BD%D0%B0%D1%81%D1%82%D1%80%D0%BE%D0%B9%D0%BA%D0%B8%20%D0%B4%D1%80%D0%BE%D0%BD%D0%B0%20-%20aerophoto.com_files/js_composer_front.min.js" id="wpb_composer_front_js-js"></script>

<div class="pswp" tabindex="-1" role="dialog" aria-hidden="true">
	<div class="pswp__bg"></div>
	<div class="pswp__scroll-wrap">
		<div class="pswp__container">
			<div class="pswp__item"></div>
			<div class="pswp__item"></div>
			<div class="pswp__item"></div>
		</div>
		<div class="pswp__ui pswp__ui--hidden">
			<div class="pswp__top-bar">
				<div class="pswp__counter"></div>
				<button class="pswp__button pswp__button--close" title="Close (Esc)" aria-label="Close (Esc)"></button>
				<button class="pswp__button pswp__button--share" title="Share" aria-label="Share"></button>
				<button class="pswp__button pswp__button--fs" title="Toggle fullscreen" aria-label="Toggle fullscreen"></button>
				<button class="pswp__button pswp__button--zoom" title="Zoom in/out" aria-label="Zoom in/out"></button>
				<div class="pswp__preloader">
					<div class="pswp__preloader__icn">
						<div class="pswp__preloader__cut">
							<div class="pswp__preloader__donut"></div>
						</div>
					</div>
				</div>
			</div>
			<div class="pswp__share-modal pswp__share-modal--hidden pswp__single-tap">
				<div class="pswp__share-tooltip"></div> 
			</div>
			<button class="pswp__button pswp__button--arrow--left" title="Previous (arrow left)" aria-label="Previous (arrow left)">
			</button>
			<button class="pswp__button pswp__button--arrow--right" title="Next (arrow right)" aria-label="Next (arrow right)">
			</button>
			<div class="pswp__caption">
				<div class="pswp__caption__center"></div>
			</div>
		</div>
	</div>
</div>


<div class="mobile-sticky-header-overlay"></div><div id="phantom" class="masthead classic-header justify bg-behind-menu logo-center widgets surround shadow-mobile-header-decoration small-mobile-menu-icon mobile-menu-icon-bg-on mobile-menu-icon-hover-bg-on dt-parent-menu-clickable show-sub-menu-on-hover show-device-logo show-mobile-logo hide-phantom" style=""><div class="ph-wrap"><div class="logo-box"></div><div class="menu-box"><ul class="main-nav bg-outline-decoration hover-bg-decoration hover-line-decoration active-bg-decoration active-line-decoration level-arrows-on outside-item-remove-margin" role="menubar"><li class="menu-item menu-item-type-post_type menu-item-object-page menu-item-home menu-item-3587 first" role="presentation"><a href="https://aerophoto.com.ua/" data-level="1" role="menuitem"><span class="menu-item-text"><span class="menu-text">Главная</span></span><span class="decoration-line"></span></a></li> <li class="menu-item menu-item-type-post_type menu-item-object-page menu-item-4287" role="presentation"><a href="https://aerophoto.com.ua/drone-pilot-school/" data-level="1" role="menuitem"><span class="menu-item-text"><span class="menu-text">Школа пилотов</span></span><span class="decoration-line"></span></a></li> <li class="menu-item menu-item-type-post_type menu-item-object-page menu-item-has-children menu-item-2683 has-children" role="presentation"><a href="https://aerophoto.com.ua/uslugi-s-pomoshhyu-dronov/" data-level="1" role="menuitem"><span class="menu-item-text"><span class="menu-text">Услуги</span></span><span class="decoration-line"></span></a><i class="next-level-button"></i><ul class="sub-nav hover-style-bg level-arrows-on" role="menubar"><li class="menu-item menu-item-type-post_type menu-item-object-page menu-item-3321 first" role="presentation"><a href="https://aerophoto.com.ua/uslugi-s-pomoshhyu-dronov/aerovideosemka/" data-level="2" role="menuitem"><span class="menu-item-text"><span class="menu-text">Аэровидеосъемка</span></span></a></li> <li class="menu-item menu-item-type-post_type menu-item-object-page menu-item-3400" role="presentation"><a href="https://aerophoto.com.ua/uslugi-s-pomoshhyu-dronov/aerogeodeziya-i-kartografiya-s-pomoshhyu-dronov/" data-level="2" role="menuitem"><span class="menu-item-text"><span class="menu-text">Аэрогеодезия и картография</span></span></a></li> <li class="menu-item menu-item-type-post_type menu-item-object-page menu-item-3612" role="presentation"><a href="https://aerophoto.com.ua/drones-with-thermal-cameras/" data-level="2" role="menuitem"><span class="menu-item-text"><span class="menu-text">Тепловизионная съемка</span></span></a></li> <li class="menu-item menu-item-type-post_type menu-item-object-page menu-item-2687" role="presentation"><a href="https://aerophoto.com.ua/uslugi-s-pomoshhyu-dronov/aerofotosemka-panoram-i-virtualnyh-turov/" data-level="2" role="menuitem"><span class="menu-item-text"><span class="menu-text">Съемка виртуальных туров</span></span></a></li> </ul></li> <li class="menu-item menu-item-type-post_type menu-item-object-page menu-item-has-children menu-item-2681 has-children" role="presentation"><a href="https://aerophoto.com.ua/portfolio/" data-level="1" role="menuitem"><span class="menu-item-text"><span class="menu-text">Портфолио</span></span><span class="decoration-line"></span></a><i class="next-level-button"></i><ul class="sub-nav hover-style-bg level-arrows-on" role="menubar"><li class="menu-item menu-item-type-post_type menu-item-object-page menu-item-2701 first" role="presentation"><a href="https://aerophoto.com.ua/uslugi-s-pomoshhyu-dronov/istoriya-i-arheologiya/" data-level="2" role="menuitem"><span class="menu-item-text"><span class="menu-text">История и археология</span></span></a></li> <li class="menu-item menu-item-type-post_type menu-item-object-page menu-item-2689" role="presentation"><a href="https://aerophoto.com.ua/uslugi-s-pomoshhyu-dronov/zemelnye-uchastki/" data-level="2" role="menuitem"><span class="menu-item-text"><span class="menu-text">Земельные участки</span></span></a></li> <li class="menu-item menu-item-type-post_type menu-item-object-page menu-item-2685" role="presentation"><a href="https://aerophoto.com.ua/uslugi-s-pomoshhyu-dronov/reklama/" data-level="2" role="menuitem"><span class="menu-item-text"><span class="menu-text">Воздушная съемка с дронов для рекламы</span></span></a></li> <li class="menu-item menu-item-type-custom menu-item-object-custom menu-item-3145" role="presentation"><a href="https://aerophoto.com.ua/project/virtualnye-tury-portfolio/" data-level="2" role="menuitem"><span class="menu-item-text"><span class="menu-text">Виртуальные туры портфолио</span></span></a></li> <li class="menu-item menu-item-type-post_type menu-item-object-page menu-item-2704" role="presentation"><a href="https://aerophoto.com.ua/uslugi-s-pomoshhyu-dronov/ekologiya/" data-level="2" role="menuitem"><span class="menu-item-text"><span class="menu-text">Воздушная съемка с дронов в экологии</span></span></a></li> </ul></li> <li class="menu-item menu-item-type-post_type menu-item-object-page menu-item-2680" role="presentation"><a href="https://aerophoto.com.ua/stati/" data-level="1" role="menuitem"><span class="menu-item-text"><span class="menu-text">Статьи</span></span><span class="decoration-line"></span></a></li> <li class="menu-item menu-item-type-post_type menu-item-object-page menu-item-2682" role="presentation"><a href="https://aerophoto.com.ua/vopros-otvet/" data-level="1" role="menuitem"><span class="menu-item-text"><span class="menu-text">Вопрос / Ответ</span></span><span class="decoration-line"></span></a></li> <li class="menu-item menu-item-type-post_type menu-item-object-page menu-item-2690" role="presentation"><a href="https://aerophoto.com.ua/prajs-list/" data-level="1" role="menuitem"><span class="menu-item-text"><span class="menu-text">Прайс-лист</span></span><span class="decoration-line"></span></a></li> <li class="menu-item menu-item-type-post_type menu-item-object-page menu-item-2699" role="presentation"><a href="https://aerophoto.com.ua/o-kompanii/" data-level="1" role="menuitem"><span class="menu-item-text"><span class="menu-text">О компании</span></span><span class="decoration-line"></span></a></li> <li class="menu-item wpml-ls-slot-11 wpml-ls-item wpml-ls-item-ru wpml-ls-current-language wpml-ls-menu-item wpml-ls-first-item wpml-ls-last-item menu-item-type-wpml_ls_menu_item menu-item-object-wpml_ls_menu_item menu-item-wpml-ls-11-ru" role="presentation"><a href="https://aerophoto.com.ua/2022/05/18/atti-for-mavic-3/" title="Руc" data-level="1" role="menuitem"><span class="menu-item-text"><span class="menu-text"><span class="wpml-ls-native" lang="ru">Руc</span></span></span><span class="decoration-line"></span></a></li> </ul></div><div class="widget-box"><div class="mini-widgets"></div></div></div></div><div class="iso-preloader dt-posts-preload dt-posts-preload-active" style="display: none;"><div class="dt-posts-preload-activity"></div></div></body></html>