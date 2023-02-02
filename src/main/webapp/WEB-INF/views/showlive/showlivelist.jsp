<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta property="description" content="산지에서 해외까지, 생생한 리얼쇼핑">
<meta property="og:type" content="website">
<meta property="og:url" content="https://shoppinglive.naver.com">
<meta property="og:image"
	content="https://im.pstatic.net/selective/img/live_192_192.png">
<meta name="viewport"
	content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=0">
<link rel="shortcut icon"
	href="https://im.pstatic.net/selective/img/favicon_live_pc_32_32.ico">
<title>The harmM</title>
<meta name="next-head-count" content="10">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<link rel="canonical" href="https://shoppinglive.naver.com/home">
<link rel="preconnect" href="https://apis.naver.com" crossorigin="true">
<link rel="preconnect" href="https://im.pstatic.net" crossorigin="true">
<link rel="preconnect" href="https://g-selected.pstatic.net"
	crossorigin="true">
<link rel="preconnect" href="https://phinf.pstatic.net"
	crossorigin="true">
<link rel="preconnect" href="https://cdn.jsdelivr.net"
	crossorigin="true">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/flicking.css">
<noscript data-n-css=""></noscript>
<link rel="shortcut icon" href="#">
<!-- 한글 깨짐방지로 넣어봄 -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta data-n-head="ssr" charset="utf-8">
<meta data-n-head="ssr" data-hid="viewport" name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
<meta data-n-head="ssr" data-hid="google-site-verification"
	name="google-site-verification"
	content="n9xvZpoumVa_cedth9bLo1fgwQfIoGkw0Jmkray34FM">
<meta data-n-head="ssr" data-hid="naver-site-verification"
	name="naver-site-verification" property="naver-site-verification"
	content="ecf6ec0ed503754fbcec5f8c0a1fa4e94297f425">
<meta data-n-head="ssr" data-hid="og:type" name="og:type"
	property="og:type" content="website">
<meta data-n-head="ssr" data-hid="og:title" name="og:title"
	property="og:title" content="KREAM | 한정판 거래의 FLEX">
<meta data-n-head="ssr" data-hid="og:description" name="og:description"
	property="og:description" content="한정판을 거래하는 가장 확실한 방법">
<meta data-n-head="ssr" data-hid="og:image" name="og:image"
	property="og:image"
	content="https://kream.co.kr/images/index_og_kream.png">
<meta data-n-head="ssr" data-hid="format-detection"
	name="format-detection" content="telephone=no">
<meta data-n-head="ssr" data-hid="facebook-domain-verification"
	name="facebook-domain-verification"
	content="sk2tlhnlubmwgd31gjkbrmvh1q3dms">
<meta data-n-head="ssr" data-hid="description" name="description"
	content="한정판을 거래하는 가장 확실한 방법. 럭키드로우, 발매정보, 패션트렌드도 이제 KREAM(크림)!">
<link data-n-head="ssr" rel="icon" type="image/x-icon"
	href="/favicon.ico">
<link data-n-head="ssr" rel="search"
	type="application/opensearchdescription+xml"
	href="/resources/opensearch.xml" title="KREAM | 한정판 거래의 FLEX">
<link data-n-head="ssr" rel="preconnect"
	href="//kream-phinf.pstatic.net">
<link data-n-head="ssr" rel="preconnect"
	href="https://www.googletagmanager.com">
<link data-n-head="ssr" rel="preconnect"
	href="https://connect.facebook.net">
<script type="text/javascript" async=""
	src="https://www.google-analytics.com/analytics.js"></script>
<script type="text/javascript" async=""
	src="https://www.googletagmanager.com/gtag/js?id=UA-153398119-1&amp;l=dataLayer&amp;cx=c"></script>
<script async="" src="https://websdk.appsflyer.com?st=pba&amp;"></script>
<script async="" src="https://connect.facebook.net/en_US/fbevents.js"></script>

<!-- 부트스트랩  -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/bootstrap/bootstrap.min.css">
<script
	src="${pageContext.request.contextPath}/resources/bootstrap/bootstrap.min.js"></script>

<!-- 제이쿼리 cdn -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- sockJS -->
<script
	src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>

<script data-n-head="ssr" type="application/ld+json">
        {
            "@context": "http://schema.org",
            "@type": "Organization",
            "name": "KREAM",
            "url": "https://kream.co.kr/",
            "logo": "https://kream.co.kr/images/logo.png",
            "sameAs": ["https://apps.apple.com/app/id1490580239",
                "https://play.google.com/store/apps/details?id=com.fstudio.kream",
                "https://www.instagram.com/kream.co.kr/", "https://www.youtube.com/channel/UCHbInfTxnIbWlUFin7drigw"
            ]
        }
    </script>
<script type="text/javascript" async=""
	src="src/main/webapp/js/banner.js"></script>
<script data-n-head="ssr" type="application/ld+json">
        {
            "@context": "https://schema.org",
            "@type": "WebSite",
            "url": "https://kream.co.kr/",
            "potentialAction": {
                "@type": "SearchAction",
                "target": {
                    "@type": "EntryPoint",
                    "urlTemplate": "https://kream.co.kr/search?keyword={search_term_string}"
                },
                "query-input": "required name=search_term_string"
            }
        }
    </script>

<link rel="preload"
	href="${pageContext.request.contextPath}/resources/css/acdef89.css"
	as="style">
<link rel="preload"
	href="${pageContext.request.contextPath}/resources/css/4a42468.css"
	as="style">
<link rel="preload"
	href="${pageContext.request.contextPath}/resources/css/734fa9a.css"
	as="style">
<link rel="preload"
	href="${pageContext.request.contextPath}/resources/css/325de86.css"
	as="style">
<link rel="preload"
	href="${pageContext.request.contextPath}/resources/css/a52fa45.css"
	as="style">
<link rel="preload"
	href="${pageContext.request.contextPath}/resources/css/48656c7.css"
	as="style">
<link rel="preload"
	href="${pageContext.request.contextPath}/resources/css/ae12c7f.css"
	as="style">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/acdef89.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/4a42468.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/734fa9a.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/325de86.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/a52fa45.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/48656c7.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/ae12c7f.css">

<%-- <link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/pop.css"> --%>
<style type="text/css">
/*# sourceMappingURL=contenteditable.vue.map */
</style>
<script type="text/javascript" async=""
	src="https://wcs.naver.net/wcslog.js" id="naver-ads" data-loaded="true">
	
</script>
<script
	src="https://www.googletagmanager.com/gtag/js?l=dataLayer&amp;id=G-SRFKTMTR0R"
	async=""></script>
</head>
<body>
	<div id="__nuxt">
		<!---->
		<div id="__layout">
			<div tabindex="0" class="wrap win_os lg" data-v-3007c576="">
				<!---->
				<div class="header lg" data-v-147586e1="" data-v-3007c576="">
					<div class="header_top" style="" data-v-147586e1="">
						<div class="top_inner" data-v-147586e1="">
							<ul class="top_list" data-v-147586e1="">

								<li class="top_item" data-v-147586e1=""><a href="/notice"
									class="top_link" data-v-147586e1=""> 고객센터 </a></li>
								<li class="top_item" data-v-147586e1=""><a href="/my/wish"
									class="top_link" data-v-147586e1=""> 관심상품 </a></li>
								<li class="top_item" data-v-147586e1=""><a
									href="/member/my" class="top_link" data-v-147586e1="">
										마이페이지 </a></li>

								<!-- 로그인 안돼있으면 로그인버튼 -->
								<sec:authorize access="isAnonymous()">
									<li class="top_item" style="display:;" data-v-147586e1=""><a
										href="/member/loginpage" class="top_link" data-v-147586e1="">
											로그인 </a></li>
								</sec:authorize>

								<!-- 세션에 값이 있으면 로그아웃리으 출력 -->
								<sec:authorize access="isAuthenticated()">
									<li class="top_item" data-v-147586e1=""><a
										href="javascript:logoutAction();" class="top_link"
										data-v-147586e1=""> 로그아웃 </a></li>
									<form id='logoutAction' action="/member/myLogout" method='post'>
										<input type="hidden" name="${_csrf.parameterName}"
											value="${_csrf.token}" />
									</form>
								</sec:authorize>
								<script>
									function logoutAction() {
										$("#logoutAction").submit();
									}
								</script>

								<!-- <li class="top_item" style="display:;" data-v-147586e1=""><a
                           href="/member/loginpage" class="top_link" data-v-147586e1=""> 로그인 </a></li>
                        <li class="top_item" style="display: none;" data-v-147586e1=""><a
                           href="/" class="top_link" data-v-147586e1=""> 로그아웃 </a></li> -->
							</ul>
						</div>
					</div>
					<div class="header_main" data-v-147586e1="">
						<div class="main_inner" data-v-147586e1="">
							<!-- 알림창 -->

							<!-- 알림창 -->
							<h1 data-v-147586e1="">
								<a href="/" aria-label="홈" class="logo" data-v-147586e1="">
									<img
									src="${pageContext.request.contextPath}/resources/images/logo_the.png" />
								</a>
							</h1>
							<div class="gnb_area" data-v-147586e1="">
								<nav class="gnb" data-v-147586e1="">
									<ul class="gnb_list" data-v-147586e1="">
										<li class="gnb_item" data-v-147586e1=""><a
											href="/social/trending" class="gnb_link" data-v-147586e1="">
												STYLE </a></li>
										<li class="gnb_item" data-v-147586e1=""><a
											href="${pageContext.request.contextPath}/product/productlist?page=1"
											class="gnb_link" data-v-147586e1=""> SHOP </a></li>
										<li class="gnb_item" data-v-147586e1=""><a href="/about"
											target="_blank" class="gnb_link" data-v-147586e1="">
												ABOUT </a></li>
									</ul>
								</nav>
								<div class="search_btn_box" data-v-147586e1="" id="showAlarm">
									<notification-indicator> <a
										class="Header-link notification-indicator position-relative tooltipped tooltipped-sw"
										id="AppHeader-notifications-button"> <span
										data-target="notification-indicator.badge"
										class="mail-status unread" style="color: gray" id="alarmCnt">
											0 </span> <svg aria-hidden="true" height="16" viewBox="0 0 16 16"
											version="1.1" width="16" data-view-component="true"
											class="octicon octicon-bell">
											<path
												d="M8 16a2 2 0 001.985-1.75c.017-.137-.097-.25-.235-.25h-3.5c-.138 0-.252.113-.235.25A2 2 0 008 16z"></path>
											<path fill-rule="evenodd"
												d="M8 1.5A3.5 3.5 0 004.5 5v2.947c0 .346-.102.683-.294.97l-1.703 2.556a.018.018 0 00-.003.01l.001.006c0 .002.002.004.004.006a.017.017 0 00.006.004l.007.001h10.964l.007-.001a.016.016 0 00.006-.004.016.016 0 00.004-.006l.001-.007a.017.017 0 00-.003-.01l-1.703-2.554a1.75 1.75 0 01-.294-.97V5A3.5 3.5 0 008 1.5zM3 5a5 5 0 0110 0v2.947c0 .05.015.098.042.139l1.703 2.555A1.518 1.518 0 0113.482 13H2.518a1.518 1.518 0 01-1.263-2.36l1.703-2.554A.25.25 0 003 7.947V5z"></path>
</svg>
									</a> </notification-indicator>
								</div>
							</div>
							<div style="display: none;" data-v-147586e1="">
								<div value="" class="search_area" data-v-9a53d442=""
									data-v-147586e1="">
									<div class="search" data-v-9a53d442="">
										<svg xmlns="http://www.w3.org/2000/svg"
											class="ico-search-gray icon sprite-icons" data-v-9a53d442="">
                                            <use
												href="/resources/3182c3b1ca2f77da7bc3e1acf109306c.svg#i-ico-search-gray"
												xlink:href="/resources/3182c3b1ca2f77da7bc3e1acf109306c.svg#i-ico-search-gray"
												data-v-9a53d442=""></use>
                                        </svg>
										<input type="text" placeholder="" title="검색창" value=""
											class="input_search show_placeholder_on_focus"
											data-v-9a53d442="">
										<button class="btn_search_delete" style="display: none;"
											data-v-9a53d442="">
											<svg xmlns="http://www.w3.org/2000/svg"
												class="icon sprite-icons ico-delete-circle"
												data-v-9a53d442="">
                                                <use
													href="/resources/3182c3b1ca2f77da7bc3e1acf109306c.svg#i-ico-delete-circle"
													xlink:href="/resources/3182c3b1ca2f77da7bc3e1acf109306c.svg#i-ico-delete-circle"
													data-v-9a53d442=""></use>
                                            </svg>
										</button>
									</div>
								</div>
							</div>
							<div class="nav_btn_box" data-v-147586e1="">
								<button type="button" aria-label="검색" class="btn_search"
									style="display:;" data-v-147586e1="">
									<svg xmlns="http://www.w3.org/2000/svg"
										class="ico-search icon sprite-icons" data-v-147586e1="">
                                        <use
											href="/resources/3182c3b1ca2f77da7bc3e1acf109306c.svg#i-ico-search"
											xlink:href="/resources/3182c3b1ca2f77da7bc3e1acf109306c.svg#i-ico-search"
											data-v-147586e1=""></use>
                                    </svg>
								</button>
								<button type="button" aria-label="메뉴" class="btn_menu"
									data-v-147586e1="">
									<svg xmlns="http://www.w3.org/2000/svg"
										class="ico-menu icon sprite-icons" data-v-147586e1="">
                                        <use
											href="/resources/3182c3b1ca2f77da7bc3e1acf109306c.svg#i-ico-menu"
											xlink:href="/resources/3182c3b1ca2f77da7bc3e1acf109306c.svg#i-ico-menu"
											data-v-147586e1=""></use>
                                    </svg>
								</button>
							</div>
							<div style="display: none;" data-v-147586e1="">
								<div class="navigation_wrap" data-v-0eda3817=""
									data-v-147586e1="">
									<div class="navigation" data-v-0eda3817="">
										<div class="navigation_inner" data-v-0eda3817="">
											<ul class="nav_list" data-v-0eda3817="">
												<li class="nav_item" data-v-0eda3817=""><a href="#"
													class="nav_link" data-v-0eda3817=""> STYLE </a></li>
												<li class="nav_item" data-v-0eda3817=""><a
													href="${pageContext.request.contextPath}/product/productlist?page=1"
													class="nav_link" data-v-0eda3817=""> SHOP </a></li>
												<li class="nav_item" data-v-0eda3817=""><a href="#"
													class="nav_link" data-v-0eda3817=""> 자주 묻는 질문 </a></li>
												<li class="nav_item" data-v-0eda3817=""><a href="#"
													class="nav_link" data-v-0eda3817=""> 공지사항 </a></li>
												<li class="nav_item" style="display:;" data-v-0eda3817=""><a
													href="#" class="nav_link" data-v-0eda3817=""> 로그인 </a></li>
												<li class="nav_item" style="display: none;"
													data-v-0eda3817=""><a href="#" class="nav_link"
													data-v-0eda3817=""> 마이 페이지 </a></li>
											</ul>
											<div class="nav_logout" style="display: none;"
												data-v-0eda3817="">
												<button class="btn_logout" data-v-0eda3817="">로그아웃</button>
												<p class="text_mail" data-v-0eda3817=""></p>
											</div>
											<div class="nav_download" data-v-0eda3817="">
												<p class="download_txt" data-v-0eda3817="">KREAM 앱 설치 후
													사용해 보세요!</p>
												<div class="btn_appdown" data-v-0eda3817="">
													<a href="#" class="btn outline medium" data-v-575aff82=""
														data-v-0eda3817=""> 앱 다운로드 </a>
												</div>
											</div>
										</div>
										<button type="button" aria-label="닫기" class="btn_nav_close"
											data-v-0eda3817="">
											<svg xmlns="http://www.w3.org/2000/svg"
												class="ico-close icon sprite-icons" data-v-0eda3817="">
                                                <use
													href="/resources/3182c3b1ca2f77da7bc3e1acf109306c.svg#i-ico-close"
													xlink:href="/resources/3182c3b1ca2f77da7bc3e1acf109306c.svg#i-ico-close"
													data-v-0eda3817=""></use>
                                            </svg>
										</button>
									</div>
								</div>
							</div>
							<!---->
						</div>
					</div>
					<!-- 알람 모달 -->
					<div aria-live="polite" aria-atomic="true"
						class="position-relative">
						<!-- Position it: -->
						<!-- - `.toast-container` for spacing between toasts -->
						<!-- - `.position-absolute`, `top-0` & `end-0` to position the toasts in the upper right corner -->
						<!-- - `.p-3` to prevent the toasts from sticking to the edge of the container  -->
						<div class="toast-container position-absolute top-0 end-0 p-3"
							id="toastContainer"></div>
					</div>
					<!-- 알람 모달  -->
					<sec:authorize access="hasRole('ROLE_MEMBER')">
						<sec:authentication property="principal.username" var="MID" />
					</sec:authorize>
					<input type="hidden" name="mid" id="mid" value="${MID}">
				</div>
			</div>
		</div>
	</div>

	<div id="__next">
		<div class="LayoutWrapper_wrap_UDIY3">
			<header>
				<div class="Header_wrap_ozzx3">
					<div
						class="HeaderWrapper_wrap_jw7CW HeaderWrapper_bg_greyscale1500_h8ZdK HeaderWrapper_has_border_nTP3w">
						<div class="HomeLogo_wrap_qzHOL">
							<h1 class="Logo_wrap_eRpZV HomeLogo_logo_oE6JK">
								<a href="/" class="Logo_link_rhg8V HomeLogo_link_tSvag"><svg
										xmlns="http://www.w3.org/2000/svg" width="79" height="28"
										viewBox="0 0 79 28" focusable="false" aria-hidden="false"
										aria-labelledby="wa_logo_title" role="img"
										class="Logo_icon_default_Nehqm">
										<title id="wa_logo_title">쇼핑라이브</title><defs>
										<linearGradient id="logo_svg__a" x1="49.999%" x2="49.999%"
											y1="4.561%" y2="105.472%">
										<stop offset="0%" stop-color="#F4361D"></stop>
										<stop offset="100%" stop-color="#F61C00"></stop></linearGradient></defs>
										<g fill="none" fill-rule="evenodd">
										<path fill="url(#logo_svg__a)"
											d="m77.605.806-38.07 2.316a1.007 1.007 0 0 0-.946 1.006v17.376c0 .533.414.974.946 1.007l4.651.282v4.784c0 .166.188.261.322.163l6.153-4.554 26.944 1.64a1.009 1.009 0 0 0 1.07-1.006V1.813a1.01 1.01 0 0 0-1.07-1.007"></path>
										<path fill="#1E1E1E"
											d="M13.196 13.841h-2.524a.216.216 0 0 0-.216.216v3.623H7.885v-3.623a.215.215 0 0 0-.216-.216H5.145a.216.216 0 0 0-.216.216v3.623H.354a.215.215 0 0 0-.215.215v2.122c0 .12.096.216.215.216h17.633a.216.216 0 0 0 .215-.216v-2.122a.215.215 0 0 0-.215-.215h-4.575v-3.623a.216.216 0 0 0-.216-.216"></path>
										<path fill="#1E1E1E"
											d="M2.985 14.204 9.17 9.418l6.186 4.786a.215.215 0 0 0 .303-.041l1.403-1.873a.219.219 0 0 0-.041-.3L11.34 7.6a1.635 1.635 0 0 1-.632-1.29V4.222a.215.215 0 0 0-.215-.215H7.847a.214.214 0 0 0-.215.215V6.31c0 .505-.234.98-.633 1.29L1.32 11.99a.216.216 0 0 0-.041.3l1.401 1.873c.072.095.21.115.304.04M31.886 3.414v10.028c0 .12.097.216.217.216h2.544c.12 0 .215-.097.215-.216V3.414a.215.215 0 0 0-.215-.216h-2.544a.217.217 0 0 0-.217.216m-8.902 7.28h2.78V6.103h-2.78v4.59zm6.983 0H28.49V6.102h1.478c.12 0 .215-.096.215-.215V3.85a.215.215 0 0 0-.215-.216H18.706a.216.216 0 0 0-.215.216v2.037c0 .119.097.215.215.215h1.543v4.592h-1.543a.215.215 0 0 0-.215.215v2.037c0 .119.097.215.215.215h11.261c.12 0 .215-.096.215-.215v-2.037a.215.215 0 0 0-.215-.215zm1.237 8.586c0 1.336-1.14 2.424-2.54 2.424-1.401 0-2.54-1.088-2.54-2.424 0-1.336 1.139-2.423 2.54-2.423 1.4 0 2.54 1.087 2.54 2.423m-2.54-5.116c-2.97 0-5.386 2.295-5.386 5.116 0 2.821 2.416 5.116 5.386 5.116 2.969 0 5.385-2.295 5.385-5.116 0-2.821-2.416-5.116-5.385-5.116"></path>
										<path fill="#FFF"
											d="M46.525 7.175h-2.339v11.012h6.52v-2.319h-4.181zm6.159 11.012h2.339V7.175h-2.339zm21.067-8.693V7.175h-6.882v11.012h6.882v-2.319h-4.544v-2.104h3.8v-2.319h-3.8V9.494zM63.035 7.175l-1.954 8.223-1.953-8.223h-2.467l3.01 11.012h2.821l3.009-11.012z"></path></g></svg></a>
							</h1>
						</div>
					</div>
				</div>
			</header>
			<div role="main" id="content" class="ContentWrapper_wrap_5cM5M">
				<section
					class="TitleMoreLinkSection_wrap_mp+Z0 TitleMoreLinkSection_has_last_child_padding_GHBry TitleMoreLinkSection_tablet_k1mYW">
					<div class="TitleMoreLinkSection_area_title_4fy-o">
						<h3 class="TitleMoreLinkSection_title_+v0UA">
							<span class="TitleMoreLinkSection_text_OTm9e">바로 지금! 라이브
								찬스</span>
						</h3>
					</div>
					<div role="tabpanel" id="undefined_tabpanel_0"
						aria-labelledby="undefined_tab_0" tabindex="0">
						<div class="HorizontalCardList_wrap_w228_XbFy4">
							<div role="presentation"
								class="Draggable_wrap_ZoM+Y HorizontalCardList_scroll_jyFd-">
								<c:forEach items="${channelList}" var="item" varStatus="status">
									<div
										class="VideoBoxWrapper_wrap_Usbk7 HorizontalCardList_item_hESBz BroadcastUnderCard_tablet_XD7Qb">
										<a
											href="${pageContext.request.contextPath}/showlive/${item.showlive_no}"
											class="VideoBoxLinkWrapper_wrap_GLkZS"><div
												class="VideoBox_wrap_S8G2B VideoBox_ratio_w2h3_NQrX8 VideoBox_tablet_-FQO7">
												<div class="BroadcastAutoPlayCard_wrap_6irvX">
													<div class="inner">
														<!-- Player wrapper, forcing 16:9 aspect ratio -->
														<div class="player-wrapper">
															<div class="aspect-spacer"></div>
															<div class="pos-absolute full-width full-height top-0">
																<video controls id="video-player" class="el-player"
																	autoplay preload="auto"
																	style="width: 229px; height: 400px;">
																	<!-- playsinline -->
																</video>
															</div>
														</div>
													</div>
												</div>
												<div class="VideoBox_content_AS2US">
													<div class="VideoBox_top_9paAV">
														<span
															class="VideoViewCount_wrap_IQqYy VideoViewCount_tablet_NHUhO"><span
															class="LiveBadge_wrap_OfovT LiveBadge_tablet_OMu7J"><span
																class="blind">라이브</span></span><span
															class="VideoViewCount_count_CKLvb">${channelUserCountList[status.index]}명
																시청</span></span>
													</div>
													<div class="VideoBox_bottom_N3qIP">
														<div
															class="ProductBox_wrap_Id3Nl ProductBox_type_under_VxRxX ProductBox_tablet_E+dar"
															style="height: 40px;">
															<span
																class="CardThumbnail_wrap_TmtOY ProductBox_thumbnail_3RInI CardThumbnail_type_product_6wo0I"><svg
																	xmlns="http://www.w3.org/2000/svg" width="19"
																	height="15" viewBox="0 0 19 15" focusable="false"
																	aria-hidden="true" class="CardThumbnail_icon_OF8Ch">
																	</svg><img
																class="CardThumbnail_image_d88Hz"
																alt="${item.product_name}" referrerpolicy="no-referrer"
																src=""
																width="55" height="55" draggable="false" loading="eager"/></span>
															<div class="ProductBox_info_z1aIE">
																<span class="ProductBox_name_zybcC">${item.product_name}</span>
																<div class="ProductBox_price_wrap_0B+zk">
																	<span class="ProductBox_price_+L7cC"><strong>${item.showlive_start_price}만원</strong></span>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div> <span
											class="VideoTitle_wrap_fuxqM VideoTitle_ellipsis2_KBkev BroadcastUnderCard_title_hsd54 VideoTitle_size_s_Imup5">
												<b>제목 : ${item.showlive_name} 라이브</b>
										</span></a><a href="/channels/59520"
											class="VideoBoxLinkWrapper_wrap_GLkZS"><span
											class="ChannelProfile_wrap_biIV9 ChannelProfile_size_20_c5bcc BroadcastUnderCard_channel_5OCf8"><div
													class="ChannelProfile_thumbnail_9rQcB"></div> </span></a>
										<!-- <span>
												class="ChannelProfile_name_jT9wN BroadcastUnderCard_name_+7+cK">메이비투아</span></span></a>-->
									</div>
								</c:forEach>
							</div>
						</div>
					</div>
				</section>


			</div>
		</div>

	</div>
	<script
		src="https://player.live-video.net/1.6.1/amazon-ivs-player.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/test.js"
		defer=""></script>
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>