<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>	
<%
	Date nowTime = new Date();
	SimpleDateFormat sf = new SimpleDateFormat("a hh:mm");
%>
<c:set var="now" value="<%=new java.util.Date()%>" />

<html lang="ko" data-n-head="%7B%22lang%22:%7B%22ssr%22:%22ko%22%7D%7D">

<head>
<title>THE HarmM</title>
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
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>

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

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/pop.css">
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

<body class="vsc-initialized">

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
											href="${pageContext.request.contextPath}/social/trendings"
											class="gnb_link" data-v-147586e1=""> STYLE </a></li>
										<li class="gnb_item" data-v-147586e1=""><a
											href="${pageContext.request.contextPath}/product/productlist?page=1"
											class="gnb_link" data-v-147586e1=""> SHOP </a></li>
										<li class="gnb_item" data-v-147586e1=""><a href="/showlive/showlivelist"
											target="_blank" class="gnb_link" data-v-147586e1="" style="color:red">
												LIVE </a></li>
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
												<li class="nav_item" data-v-0eda3817=""><a
													href="${pageContext.request.contextPath}/social/trendings"
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
						<div class="toast-container position-absolute top-0 end-0 p-3"
							id="toastContainer">
							
							</div>
					</div>
					<!-- 알람 모달  -->
					<sec:authorize access="hasRole('ROLE_MEMBER')">
						<sec:authentication property="principal.username" var="MID" />
					</sec:authorize>
					<input type="hidden" name="mid" id="mid" value="${MID}">

					<!-- 챗봇 모달 -->
					<!--  채팅 -->
						<div href="javascript:void(0)" class="chat_message">
				<a role="button" class="chat_open_btn" id="chatBtn"></a>
				<div class="chat_open_wrap">
					<span class="chat_btn_txt_wrap">
						<a class="chat_btn_txt" href="javascript:getKakaoChbotCustInf('', '');" onclick="GA_Event('PC_공통','채팅상담플로팅','채팅상담버튼')" style="display: none;">입점 브랜드가 궁금하신가요?</a>
						<a class="chat_btn_txt" href="javascript:getKakaoChbotCustInf('', '');" onclick="GA_Event('PC_공통','채팅상담플로팅','채팅상담버튼')" style="display: none;">궁금한 건 젤뽀에게 물어보세요!</a>
						<a class="chat_btn_txt on" href="javascript:getKakaoChbotCustInf('', '');" onclick="GA_Event('PC_공통','채팅상담플로팅','채팅상담버튼')" style="display: inline;">골프장의 날씨도 알려드릴 수 있어요</a>
					</span>
					<button class="chat_close_btn">close</button>
				</div>
			</div>
					<!-- 챗봇 모달 -->
<div class="KEP-WebChatArea " style = "display: none" id="chatbotcontainer">
    <div class="KEP-FloatingButtonBlock">
        <img class="KEP-FloatingButton none" width="100%"
            src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAFAAAABQCAYAAACOEfKtAAAACXBIWXMAAAsTAAALEwEAmpwYAAAEY0lEQVR4nO2cTYhVZRiAH/U2ihm0KAZ/SgYxibB0oYa6EVsITQYZNqltUqZNpouQWaQuXCj4h6CUTCmV1Q1qU4hhTAsXKjRWNCBhWhFFC5MuKGlm3hbvuXnmux7Pz/ude86J94GLfO/xe+97n5nvfD/36Jhms4mRnbFFF1B1TKASE6jEBCoxgUpMoBITqMQEKjGBSkygEhOoxAQqMYFKTKCSWtaOfX19Puu4HS8BG4Ae4EdgH3Awzzes1+up+2QWmDPbgNdC7YeBN4BpwOZCKoqgjEP4AWAg4tpAcL00lFHgIqJHRg1Y2MFaYimjwD9jrl/tSBUJKaPAE8DliGuXg+uloYwCG8jse9OJ3wzijQ7Xc0fKKBDgMLDDie0P4qWirAKhfRjH3RsLocwCK0EnFtITgNnIjuLeFP3mO+05QH+K/g1kBzMCXEvRLxV5CawBK4AXgKWIRC3LgldargFDwLvAx8AND7X8Rx5DuBc4C9SBJ/EjT8OEoI46Ulevz+Q+BY5HNvufAjM95vXJTKS+g0CXj4S+hvBE4BNkuN6OX4BzwK90ZidRA7qBx5ADCJd+YAawHOXs7kPgOOAD2uU1kWGzE/jaw/tkZQ6wCXiO0SNuKVL3M8A/WZP7GMIDyE8yzHlkFl1FsfIAvgnqWIDUFWY50Sc/idAKfIj287kR4HFgWJnbN8NIXSNOfDMwK2tSrcCtyOTR4iLwNHBJmTcvLiG/dRdDsfHAlqwJNQK7gZVObAOyeC0zPwGvOLGVyOdJjUbgCkZPQq21XxX4EKm3RWvhnxqNwCVO+x1k5q0CTeBtJxa1BLsjGoGznfaQIlcRfOG0H8mSRCNwitN2lwhJmQw8AUxN2W9q0G9yxvd163U/TyI0Au9x2o0MOdYjN/XPgz83Juy30em3PsN7N5y2+3kSUeR5YA+wh1t70hqwm/g12azg77UmsK4gT08ONcZSpMD5tG8lxwLzYvrNo73uGu3nhx2hSIHfR8R/iOl3ISJ+TlFLZooU+BUw6MQOASdj+p0C3nJigxS05y762Zh+4CNgLvAtcCxhv3XI6fKjiLjjuVSXAI3AG07/u4C/M+Q5TjYBx0guPIq420UsGoEN4L5Quxs5OK0SM7QJNPdAdyE6V1NIVdEI/NJpP6UppKpoBB512s8D9yvyVRLNPXAI+ZKotYedBGxHZsiysQx4MNT+GfjMR2LtLLwL2BuKrQVOA29qisqBl5HvhlscxZNA7UL6deA7J3YAWKPMWxm0Av9CZF0PxbqQxygGGb3M+V/iYyt3BniR9tPodchR0xHgWeRJ+0xHRh64AvwRel3xldjXVu49ROAhRn9LdzewOngVSS+Qyz9s8XmY8D6wmIJORYrC92nMMPJdyavAb55zl5I8jrOuIyfG05GhcwC5T/6O52fzysAY+6+fdNgz0kpMoBITqMQEKjGBSkygEhOoxAQqMYFKTKASE6jEBCoxgUpMoBITqMQEKjGBSkygEhOoxAQq+Rc06qudlH1eqwAAAABJRU5ErkJggg=="
            style="display: none !important">
    </div>
    <div class="KEP-ChatContainer" style="height: calc(83vh - 40px) !important;">
        <header class="KEP-ChatHeader">
            <div class="KEP-ChatHeader__center">
                <p class="KEP-ChatHeader__botName">
                    TheHarm
                    <svg class="KEP-ChatHeader__arrow" xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                        viewBox="0 0 16 16" fill="none" style="display: inline-block !important;">
                        <path fill-rule="evenodd" clip-rule="evenodd" d="M8.5 11L11.5 7H5.5L8.5 11Z" fill="black">
                        </path>
                    </svg>
                    <ul class="KEP-ChatHeader__botList" style="display: none !important;">
                        <li class="KEP-ChatHeader__botItem" obbi="63039c3b9798e74cfeaf5b27"
                            ebbi="kep0LUJ6zbOS5WA8lfVu8qLDQ" buildertype="">
                            <div class="KEP-ChatHeader__botItemAvatar">
                                <svg width="34" height="34" viewBox="0 0 34 34" fill="none"
                                    xmlns="http://www.w3.org/2000/svg">
                                    <defs>
                                        <path id="shapeSquircle"
                                            d="M17 0C29.4003 0 34 4.59973 34 17C34 29.4003 29.4003 34 17 34C4.59973 34 0 29.4003 0 17C0 4.59973 4.59973 0 17 0Z">
                                        </path>
                                        <clipPath id="clipSquircle2">
                                            <use xlink:href="#shapeSquircle"></use>
                                        </clipPath>
                                    </defs>
                                    <image width="100%" height="100%" preserveAspectRatio="xMidYMid slice"
                                        clip-path="url(#clipSquircle2)"
                                        xlink:href="https://objectstorage.kr-central-1.kakaoi.io/v1/735f5d2ed4d742468bcbcd6e533b26aa/builder-prod/OU9mbkRta1VhdTFXRUJfQ0hBVEJPVF9wcm9maWw=">
                                    </image>
                                </svg>
                            </div>
                            <span class="KEP-ChatHeader__botItemName">TheHarm</span>
                        </li>
                        <li class="KEP-ChatHeader__botItem" obbi="6304614a9798e74cfeaf6ad5"
                            ebbi="kepr4KuE1z5ROGtanfL0VF73Q" buildertype="">
                            <div class="KEP-ChatHeader__botItemAvatar">
                                <svg width="34" height="34" viewBox="0 0 34 34" fill="none"
                                    xmlns="http://www.w3.org/2000/svg">
                                    <defs>
                                        <path id="shapeSquircle"
                                            d="M17 0C29.4003 0 34 4.59973 34 17C34 29.4003 29.4003 34 17 34C4.59973 34 0 29.4003 0 17C0 4.59973 4.59973 0 17 0Z">
                                        </path>
                                        <clipPath id="clipSquircle2">
                                            <use xlink:href="#shapeSquircle"></use>
                                        </clipPath>
                                    </defs>
                                    <image width="100%" height="100%" preserveAspectRatio="xMidYMid slice"
                                        clip-path="url(#clipSquircle2)"
                                        xlink:href="https://objectstorage.kr-central-1.kakaoi.io/v1/735f5d2ed4d742468bcbcd6e533b26aa/builder-prod/OU9mbkRta1VhdTFkNVdFQl9DSEFUQk9UX3Byb2ZpbA==">
                                    </image>
                                </svg>
                            </div>
                        </li>
                    </ul>
                </p>
                <p class="KEP-ChatHeader__botState">대화중</p>
            </div>
            <button class="KEP-ChatHeader__btnArrowDown" aria-label="접기" id = "chatcloseBtn">
                <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path d="M3.5 8L11.5 16L19.5 8" stroke="#303030" strokewidth="2"></path>
                </svg>
            </button>
        </header>
        <!-- 채팅 영역 -->
        <div class="KEP-ChatArea" style="background-image: url() !important; " id = "chatArea">

            <div class="KEP-Receiver">
                <div class="KEP-Receiver__avatar">
                    <svg width="34" height="34" viewBox="0 0 34 34" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <defs>
                            <path id="shapeSquircle"
                                d="M17 0C29.4003 0 34 4.59973 34 17C34 29.4003 29.4003 34 17 34C4.59973 34 0 29.4003 0 17C0 4.59973 4.59973 0 17 0Z">
                            </path>
                            <clipPath id="clipSquircle">
                                <use xlink:href="#shapeSquircle"></use>
                            </clipPath>
                        </defs>
                        <image width="100%" height="100%" preserveAspectRatio="xMidYMid slice"
                            clip-path="url(#clipSquircle)"
                            xlink:href="/resources/images/logo_the.png">
                        </image>
                    </svg>
                </div>
                <div class="KEP-Receiver__msgArea">
                    <div class="KEP-Receiver__nickName">젤뽀</div>
                    <div class="KEP-Receiver__blocksArea">
                        <div class="KEP-Receiver__speech">안녕하세요! <br>TheHarm웹사이트에 오신걸 환영합니다.<br><br>궁금한 내용을 질문해
                            주세요♥<span class="KEP-Receiver__time"><%= sf.format(nowTime) %></span>
                        </div>
                    </div>
                </div>
            </div>
<!--             <div class="KEP-Sender">
                <div class="KEP-Sender__msgArea">
                    <div class="KEP-Sender__blocksArea">
                        <div class="KEP-Sender__speech" style=" background: #8770BA !important; color: #FFFFFF !important; ">
                            <span class="KEP-Sender__tail">
                                <svg width="11" height="11" viewBox="0 0 11 11" fill="none"
                                    xmlns="http://www.w3.org/2000/svg">
                                    <path d="M1 0H8.58579C9.47669 0 9.92286 1.07714 9.29289 1.70711L1 10V0Z"
                                        fill="#8770BA"></path>
                                    <path
                                        d="M0.966666 0.52002H8.59556C9.02257 0.52002 9.23701 1.03577 8.93588 1.33852L0.45 9.87002"
                                        stroke="black" stroke-opacity="0.03"></path>
                                    <rect width="1" height="11" transform="matrix(-1 0 0 1 1 0)" fill="#8770BA"></rect>
                                </svg>
                            </span>
                            안녕<span class="KEP-Sender__read">읽음</span>
                            <span class="KEP-Sender__time">오전 11:27</span>
                        </div>
                    </div>
                </div>
            </div> -->

        </div>

        <!-- 퀵리플라이 영역 -->
        <div class="KEP-ChatQuickReplyGroup">
            <button class="KEP-ChatQuickReplyGroup__move isLeft" hidden=""
                style="background: rgb(25, 74, 120) !important; border-right: 1px solid rgb(25, 74, 120) !important; border-left: 1px solid rgb(25, 74, 120) !important;">
                <svg width="9" height="14" viewBox="0 0 9 14" fill="none">
                    <path d="M8 1L2 7L8 13" stroke="#fff" strokewidth="1.5"></path>
                </svg>
            </button>
            <button class="KEP-ChatQuickReplyGroup__move isRight" hidden=""
                style="background: rgb(25, 74, 120) !important; border-right: 1px solid rgb(25, 74, 120) !important; border-left: 1px solid rgb(25, 74, 120) !important;">
                <svg width="9" height="14" viewBox="0 0 9 14" fill="none">
                    <path d="M1 13L7 7L1 1" stroke="#fff" strokewidth="1.5"></path>
                </svg>
            </button>
        </div>

        <!-- 커스텀 메뉴 영역 -->
        <div class="KEP-ChatQuickButtonGroup" hidden="" style="background-color: rgb(135, 112, 186) !important;">
            <button class="KEP-ChatQuickButton">
                <img class="KEP-ChatQuickButton__icon"
                    src="data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMjAiIGhlaWdodD0iMjAiIHZpZXdCb3g9IjAgMCAyMCAyMCIgZmlsbD0ibm9uZSIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KPHBhdGggZD0iTTAuNSAxMUw5LjIzMTc0IDMuM0M5LjY4MTk2IDIuOSAxMC4zMTggMi45IDEwLjc2ODMgMy4zTDE5LjUgMTEiIHN0cm9rZT0id2hpdGUiIHN0cm9rZS1saW5lam9pbj0icm91bmQiLz4KPHBhdGggZD0iTTE2LjUgOC41VjE3LjcyOTJDMTYuNSAxOC4xNTQyIDE2LjE3NSAxOC41IDE1Ljc3NjkgMTguNUg0LjIyMzEyQzMuODI1IDE4LjUgMy41IDE4LjE1NDIgMy41IDE3LjcyOTJWOC41IiBzdHJva2U9IndoaXRlIi8+Cjwvc3ZnPgo=">
                <span class="KEP-ChatQuickButton__text" style="color: #FFFFFF !important;">메인 메뉴</span>
            </button>
            <button class="KEP-ChatQuickButton">
                <img class="KEP-ChatQuickButton__icon"
                    src="data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMjAiIGhlaWdodD0iMjAiIHZpZXdCb3g9IjAgMCAyMCAyMCIgZmlsbD0ibm9uZSIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KPHBhdGggZmlsbC1ydWxlPSJldmVub2RkIiBjbGlwLXJ1bGU9ImV2ZW5vZGQiIGQ9Ik0xLjM1OTM4IDE2LjQ2NDhDMS4zNTkzOCAxMS40OTQxIDUuMjc2ODIgNy40NjQ4NCAxMC4xMDk2IDcuNDY0ODRDMTQuOTQxOSA3LjQ2NDg0IDE4Ljg1OTQgMTEuNDk0MSAxOC44NTk0IDE2LjQ2NDhIMS4zNTkzOFoiIHN0cm9rZT0id2hpdGUiLz4KPHBhdGggZD0iTTE5IDE4LjVIMSIgc3Ryb2tlPSJ3aGl0ZSIvPgo8cGF0aCBmaWxsLXJ1bGU9ImV2ZW5vZGQiIGNsaXAtcnVsZT0iZXZlbm9kZCIgZD0iTTguNDQ3MjcgMTEuNzkyOEM4LjQ0NzI3IDEwLjk2NDYgNy43NzU1NiAxMC4yOTMgNi45NDcyNyAxMC4yOTNDNi4xMTg5NyAxMC4yOTMgNS40NDcyNyAxMC45NjQ2IDUuNDQ3MjcgMTEuNzkyOEM1LjQ0NzI3IDEyLjYyMTMgNi4xMTg5NyAxMy4yOTMgNi45NDcyNyAxMy4yOTNDNy43NzU1NiAxMy4yOTMgOC40NDcyNyAxMi42MjEzIDguNDQ3MjcgMTEuNzkyOFoiIHN0cm9rZT0id2hpdGUiLz4KPHBhdGggZmlsbC1ydWxlPSJldmVub2RkIiBjbGlwLXJ1bGU9ImV2ZW5vZGQiIGQ9Ik0xNC42NjAyIDExLjc5MjhDMTQuNjYwMiAxMC45NjQ2IDEzLjk4ODQgMTAuMjkzIDEzLjE2MDIgMTAuMjkzQzEyLjMzMTUgMTAuMjkzIDExLjY2MDIgMTAuOTY0NiAxMS42NjAyIDExLjc5MjhDMTEuNjYwMiAxMi42MjEzIDEyLjMzMTUgMTMuMjkzIDEzLjE2MDIgMTMuMjkzQzEzLjk4ODQgMTMuMjkzIDE0LjY2MDIgMTIuNjIxMyAxNC42NjAyIDExLjc5MjhaIiBzdHJva2U9IndoaXRlIi8+CjxwYXRoIGZpbGwtcnVsZT0iZXZlbm9kZCIgY2xpcC1ydWxlPSJldmVub2RkIiBkPSJNMTEuNDI4NiAzLjQ3NDA3QzExLjQyODYgMi42NTk5NCAxMC43Njc2IDIgOS45NTI1NiAyQzkuMTM3NTIgMiA4LjQ3NjU2IDIuNjU5OTQgOC40NzY1NiAzLjQ3NDA3QzguNDc2NTYgNC4yODgyMSA5LjEzNzUyIDQuOTQ3NzggOS45NTI1NiA0Ljk0Nzc4QzEwLjc2NzYgNC45NDc3OCAxMS40Mjg2IDQuMjg4MjEgMTEuNDI4NiAzLjQ3NDA3WiIgc3Ryb2tlPSJ3aGl0ZSIvPgo8cGF0aCBkPSJNOS45NTMxMiA0Ljk0OTIyVjcuNDY4MTkiIHN0cm9rZT0id2hpdGUiLz4KPC9zdmc+Cg==">
                <span class="KEP-ChatQuickButton__text" style="color: #FFFFFF !important;">챗봇 사용법</span>
            </button>
            <button class="KEP-ChatQuickButton">
                <img class="KEP-ChatQuickButton__icon"
                    src="data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMjAiIGhlaWdodD0iMjAiIHZpZXdCb3g9IjAgMCAyMCAyMCIgZmlsbD0ibm9uZSIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KPHBhdGggZD0iTTEyIDE3LjVIMy40OUMyLjY2NzE1IDE3LjUgMiAxNi43ODM4IDIgMTUuOTAwNVY4LjUiIHN0cm9rZT0id2hpdGUiIHN0cm9rZS13aWR0aD0iMC45NSIvPgo8cGF0aCBkPSJNMTggOC41VjExLjUiIHN0cm9rZT0id2hpdGUiLz4KPHBhdGggZmlsbC1ydWxlPSJldmVub2RkIiBjbGlwLXJ1bGU9ImV2ZW5vZGQiIGQ9Ik0xIDMuMTkyNThWNi41NzU2NEMxIDguMTkxMjEgMi4zNDMyOSA5LjUgMy45OTk1OSA5LjVDNS42NTYzIDkuNSA3IDguMTkxMjEgNyA2LjU3NTY0VjEuNUgyLjYyMTg0QzEuNzI2MTggMS41IDEgMi4yNTc4NSAxIDMuMTkyNThaIiBzdHJva2U9IndoaXRlIi8+CjxwYXRoIGZpbGwtcnVsZT0iZXZlbm9kZCIgY2xpcC1ydWxlPSJldmVub2RkIiBkPSJNMTMgMS41VjYuNTc1NjRDMTMgOC4xOTEyMSAxNC4zNDMyIDkuNSAxNS45OTk4IDkuNUMxNy42NTY4IDkuNSAxOSA4LjE5MTIxIDE5IDYuNTc1NjRWMy4xOTI1OEMxOSAyLjI1Nzg1IDE4LjI3NDEgMS41IDE3LjM3ODcgMS41SDEzWiIgc3Ryb2tlPSJ3aGl0ZSIvPgo8cGF0aCBmaWxsLXJ1bGU9ImV2ZW5vZGQiIGNsaXAtcnVsZT0iZXZlbm9kZCIgZD0iTTcgMS41VjYuNTc1NjRDNyA4LjE5MTIxIDguMzQyOTMgOS41IDEwIDkuNUMxMS42NTY3IDkuNSAxMyA4LjE5MTIxIDEzIDYuNTc1NjRWMS41SDdaIiBzdHJva2U9IndoaXRlIi8+CjxwYXRoIGQ9Ik0xNS41IDE4LjVDMTcuNDMzIDE4LjUgMTkgMTYuOTMzIDE5IDE1QzE5IDEzLjA2NyAxNy40MzMgMTEuNSAxNS41IDExLjVDMTMuNTY3IDExLjUgMTIgMTMuMDY3IDEyIDE1QzEyIDE2LjkzMyAxMy41NjcgMTguNSAxNS41IDE4LjVaIiBzdHJva2U9IndoaXRlIi8+CjxwYXRoIGQ9Ik0xNS43NDYxIDEzLjVWMTQuNSIgc3Ryb2tlPSJ3aGl0ZSIgc3Ryb2tlLWxpbmVjYXA9InNxdWFyZSIvPgo8cGF0aCBkPSJNMTUuNDk5NyAxNi41SDE1Ljc0NjEiIHN0cm9rZT0id2hpdGUiIHN0cm9rZS1saW5lY2FwPSJzcXVhcmUiLz4KPC9zdmc+Cg==">
                <span class="KEP-ChatQuickButton__text" style="color: #FFFFFF !important;">브랜드 찾기</span>
            </button>
            <button class="KEP-ChatQuickButton">
                <img class="KEP-ChatQuickButton__icon"
                    src="data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMjAiIGhlaWdodD0iMjAiIHZpZXdCb3g9IjAgMCAyMCAyMCIgZmlsbD0ibm9uZSIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KPHBhdGggZmlsbC1ydWxlPSJldmVub2RkIiBjbGlwLXJ1bGU9ImV2ZW5vZGQiIGQ9Ik0xNC41IDEuNUMxNC45MTQyIDEuNSAxNS4yODkyIDEuNjY3ODkgMTUuNTYwNyAxLjkzOTM0QzE1LjgzMjEgMi4yMTA3OSAxNiAyLjU4NTc5IDE2IDNWMTguNUgyLjVDMi4wODU3OSAxOC41IDEuNzEwNzkgMTguMzMyMSAxLjQzOTM0IDE4LjA2MDdDMS4xNjc4OSAxNy43ODkyIDEgMTcuNDE0MiAxIDE3VjNDMSAyLjU4NTc5IDEuMTY3ODkgMi4yMTA3OSAxLjQzOTM0IDEuOTM5MzRDMS43MTA3OSAxLjY2Nzg5IDIuMDg1NzkgMS41IDIuNSAxLjVIMTQuNVoiIHN0cm9rZT0id2hpdGUiLz4KPHBhdGggZmlsbC1ydWxlPSJldmVub2RkIiBjbGlwLXJ1bGU9ImV2ZW5vZGQiIGQ9Ik0xOC41IDYuNUwxOSAxOEwxNi41IDE4LjVMMTYgN0wxOC41IDYuNVoiIHN0cm9rZT0id2hpdGUiLz4KPHBhdGggZD0iTTEyIDVINUM0LjcyMzg2IDUgNC41IDUuMjIzODYgNC41IDUuNUM0LjUgNS43NzYxNCA0LjcyMzg2IDYgNSA2SDEyQzEyLjI3NjEgNiAxMi41IDUuNzc2MTQgMTIuNSA1LjVDMTIuNSA1LjIyMzg2IDEyLjI3NjEgNSAxMiA1WiIgZmlsbD0id2hpdGUiLz4KPHBhdGggZD0iTTEyIDlINUM0LjcyMzg2IDkgNC41IDkuMjIzODYgNC41IDkuNUM0LjUgOS43NzYxNCA0LjcyMzg2IDEwIDUgMTBIMTJDMTIuMjc2MSAxMCAxMi41IDkuNzc2MTQgMTIuNSA5LjVDMTIuNSA5LjIyMzg2IDEyLjI3NjEgOSAxMiA5WiIgZmlsbD0id2hpdGUiLz4KPC9zdmc+Cg==">
                <span class="KEP-ChatQuickButton__text" style="color: #FFFFFF !important;">쇼핑뉴스</span>
            </button>
            <button class="KEP-ChatQuickButton">
                <img class="KEP-ChatQuickButton__icon"
                    src="data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMjAiIGhlaWdodD0iMjAiIHZpZXdCb3g9IjAgMCAyMCAyMCIgZmlsbD0ibm9uZSIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KPHBhdGggZmlsbC1ydWxlPSJldmVub2RkIiBjbGlwLXJ1bGU9ImV2ZW5vZGQiIGQ9Ik0xNi41IDNDMTcuMTkwNCAzIDE3LjgxNTQgMy4yNzk4MiAxOC4yNjc4IDMuNzMyMjNDMTguNzIwMiA0LjE4NDY0IDE5IDQuODA5NjQgMTkgNS41VjE0LjVDMTkgMTUuMTkwNCAxOC43MjAyIDE1LjgxNTQgMTguMjY3OCAxNi4yNjc4QzE3LjgxNTQgMTYuNzIwMiAxNy4xOTA0IDE3IDE2LjUgMTdIMy41QzIuODA5NjQgMTcgMi4xODQ2NCAxNi43MjAyIDEuNzMyMjMgMTYuMjY3OEMxLjI3OTgyIDE1LjgxNTQgMSAxNS4xOTA0IDEgMTQuNVY1LjVDMSA0LjgwOTY0IDEuMjc5ODIgNC4xODQ2NCAxLjczMjIzIDMuNzMyMjNDMi4xODQ2NCAzLjI3OTgyIDIuODA5NjQgMyAzLjUgM0gxNi41WiIgc3Ryb2tlPSJ3aGl0ZSIvPgo8cGF0aCBkPSJNNCA1LjVWMTMuNSIgc3Ryb2tlPSJ3aGl0ZSIvPgo8cGF0aCBkPSJNNiA1LjVWOC40OTg2MVYxMS41IiBzdHJva2U9IndoaXRlIi8+CjxwYXRoIGQ9Ik04IDUuNVY5LjQ5ODE1VjEzLjUiIHN0cm9rZT0id2hpdGUiLz4KPHBhdGggZD0iTTEyIDUuNVY5LjQ5ODE1VjEzLjUiIHN0cm9rZT0id2hpdGUiLz4KPHBhdGggZD0iTTE2IDUuNVY5LjQ5ODE1VjEzLjUiIHN0cm9rZT0id2hpdGUiLz4KPHBhdGggZD0iTTEwIDUuNVYxMS41IiBzdHJva2U9IndoaXRlIi8+CjxwYXRoIGQ9Ik0xNCA1LjVWOC40OTg2MVYxMS41IiBzdHJva2U9IndoaXRlIi8+Cjwvc3ZnPgo=">
                <span class="KEP-ChatQuickButton__text" style="color: #FFFFFF !important;">카드 신청</span>
            </button>
            <button class="KEP-ChatQuickButton">
                <img class="KEP-ChatQuickButton__icon"
                    src="data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMjAiIGhlaWdodD0iMjAiIHZpZXdCb3g9IjAgMCAyMCAyMCIgZmlsbD0ibm9uZSIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KPHBhdGggZD0iTTEwIDE5LjVDMTUuMjQ2NyAxOS41IDE5LjUgMTUuMjQ2NyAxOS41IDEwQzE5LjUgNC43NTMyOSAxNS4yNDY3IDAuNSAxMCAwLjVDNC43NTMyOSAwLjUgMC41IDQuNzUzMjkgMC41IDEwQzAuNSAxNS4yNDY3IDQuNzUzMjkgMTkuNSAxMCAxOS41WiIgc3Ryb2tlPSJ3aGl0ZSIvPgo8cGF0aCBkPSJNNy41IDguMDM4N0M3LjUgNy44MjI5OSA3LjUyNDY4IDcuNjEyMyA3LjU3NDAzIDcuNDE2NjZDNy44NTA0MiA2LjMwMyA4Ljg0NzQxIDUuNDgwMjkgMTAuMDM2OSA1LjUwMDM2QzExLjMxNTIgNS41MjA0MyAxMi40ODQ5IDYuNzA0MzIgMTIuNDk5NyA4LjAwMzU4QzEyLjUxNDUgOS4wMDY4OCAxMS45NTY4IDkuODc5NzUgMTEuMTM3NSAxMC4zMDYxQzkuOTk3MzkgMTAuNzM3NiA5LjYwMjU0IDExLjMyOTUgOS42MDI1NCAxMi4xMDJWMTMiIHN0cm9rZT0id2hpdGUiIHN0cm9rZS13aWR0aD0iMS4yIi8+CjxwYXRoIGQ9Ik05Ljc1IDE2LjI1QzEwLjMwMjMgMTYuMjUgMTAuNzUgMTUuODAyMyAxMC43NSAxNS4yNUMxMC43NSAxNC42OTc3IDEwLjMwMjMgMTQuMjUgOS43NSAxNC4yNUM5LjE5NzcyIDE0LjI1IDguNzUgMTQuNjk3NyA4Ljc1IDE1LjI1QzguNzUgMTUuODAyMyA5LjE5NzcyIDE2LjI1IDkuNzUgMTYuMjVaIiBmaWxsPSJ3aGl0ZSIvPgo8L3N2Zz4K">
                <span class="KEP-ChatQuickButton__text" style="color: #FFFFFF !important;">FAQ</span>
            </button>
        </div>

        <!-- 상담원 연결/챗봇전환 버튼 영역-->
        <div class="KEP-CounselingMenu" hidden="">
            <button>챗봇 전환</button>
        </div>

        <!-- 사용자 발화 영역 -->
        <div class="KEP-ChatInputArea">
            <button class="KEP-ChatInputArea__btnMenu" aria-label="메뉴">
                <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path d="M4 5.5H20" stroke="#707070" strokewidth="1.25"></path>
                    <path d="M4 12.5H20" stroke="#707070" strokewidth="1.25"></path>
                    <path d="M4 19.5H20" stroke="#707070" strokewidth="1.25"></path>
                </svg>
            </button>
            <form class="KEP-ChatInputArea__form" id="chatForm" enctype="multipart/form-data">
                <input type="text" placeholder="궁금한 점을 입력해주세요" class="KEP-ChatInputArea__input" id="inputText" name="inputText" >
                <!-- 1:1 문의 대량 테스트를 위해 1000자 제한 임시 제거 -->
                <!-- <input type="text" placeholder="궁금한 점을 입력해주세요" class="KEP-ChatInputArea__input" maxlength="1000"/>-->
                <button class="KEP-ChatInputArea__btnSend" aria-label="전송" type="submit">
                    <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <path fill="currentColor" fill-rule="evenodd" clip-rule="evenodd"
                            d="M4.00073 2C4.1736 2 4.34351 2.04482 4.4939 2.13007L19.9321 10.8818C20.4125 11.1542 20.5813 11.7645 20.3089 12.2449C20.2197 12.4023 20.0894 12.5326 19.9321 12.6218L4.4939 21.3735C4.01344 21.6459 3.40316 21.4772 3.1308 20.9968C3.04555 20.8464 3.00073 20.6765 3.00073 20.5036L3 13.05L11.2188 11.7518L3 10.452L3.00073 3C3.00073 2.44771 3.44845 2 4.00073 2Z">
                        </path>
                    </svg>
                </button>
            </form>
        </div>
    </div>
</div>
					<!-- 챗봇 --></div>

									<style type="text/css">

/* 2022-04-06 추가 : S */
#header .chat-message	{position:fixed; z-index: 9999; right:0; top:151px; }
#header .chat-message	h2 {margin: 0;}
#header .chat-message	h2 a {overflow: hidden; display: block; position: relative; width:70px; height: 70px; font-size: 0; white-space: nowrap; text-indent: 100%; color: #ffffff; text-decoration: none;}
#header .chat-message	h2 a:after {content: ''; display: block; position: absolute; top: 0; right: 0; bottom: 0; left: 0; z-index: -1; background-image: url(/images/webhome/outlets/layout/chat_message.png); background-repeat: no-repeat; background-position: 0 0;}
/* 2022-04-06 추가 : E */

/* 2022-11-22 추가 [S] */
.chat_message{position: fixed; bottom:56px; right:60px; z-index: 1000; width: 70px; border-radius: 35px;  overflow: hidden; height: 70px; transition: 0.3s; display: flex; flex-direction: row; align-items: center; background-color: #fff;cursor:pointer;}
.chat_message.active{width: 400px; transition: width 0.3s;}
.chat_message a:hover{text-decoration: none;}
.chat_message .chat_open_wrap{position: relative; display: flex; flex-direction: row; align-items: center; padding-left: 80px;  background-color: black;}
.chat_message .chat_open_btn{width: 70px; height: 70px; background:url(/resources/images/logo3.jpg) no-repeat; background-size: 70px 70px; position: absolute; left: 0; top: 0; z-index: 1000;  background-color: black;}
.chat_message .chat_close_btn{display: none; width:25px; height: 25px; background:url(https://www.ehyundai.com/images/webhome/outlets/layout/chatbot_off.png) no-repeat; background-size: 100%; font-size:0; margin-left: 30px; position: absolute; right: 0;}
.chat_message.active .chat_close_btn{display: block;}
.chat_btn_txt_wrap{width: 305px;}
.chat_message .chat_btn_txt{display: none;  font-size: 18px; color: #222;z-index: -2; padding-right: 30px; height: 70px; line-height: 70px;}
.chat_message .chat_btn_txt.on{display: inline-block!important; height: 70px;}

/* NOTE: 이 아래로 복붙 */
.KEP-WebChatArea {
  position: fixed !important;
  right: 20px !important;
  bottom: 20px !important;
  z-index: 99999 !important;
}
.KEP-WebChatArea.is-mobile {
  top: 0 !important;
  left: 0 !important;
  right: 0 !important;
  bottom: 0 !important;
}
.KEP-FloatingButton {
  position: relative !important;
  display: flex !important;
  justify-content: center !important;
  align-items: center !important;
  width: 52px !important;
  height: 52px !important;
  border-radius: 100% !important;
  border: 1px solid #e3e4e6 !important;
  background: #fff !important;
  cursor: pointer !important;
}

.KEP-FloatingButton:hover .KEP-FloatingTooltip {
  display: block !important;
}

.KEP-FloatingTooltip {
  display: none !important;
  position: absolute !important;
  top: 11px !important;
  right: calc(100% + 13px) !important;
  margin: -13px !important;
  padding: 13px !important;
}

.KEP-FloatingTooltip__inner {
  position: relative !important;
  display: flex !important;
  padding: 9px !important;
  max-width: 238px !important;
  width: max-content !important;
  border: 1px solid #e3e3e3 !important;
  border-radius: 6px !important;
  background-color: #fff !important;
  font-size: 13px !important;
  line-height: 21px !important;
  color: #202020 !important;
  cursor: default !important;
}

.KEP-FloatingTooltip p {
  display: -webkit-box !important;
  -webkit-box-orient: vertical !important;
  -webkit-line-clamp: 2 !important;
  max-height: 42px !important;
  line-height: 21px !important;
  text-overflow: ellipsis !important;
  overflow: hidden !important;
  margin: 0 !important;
  cursor: default !important;
}

.KEP-FloatingTooltip svg {
  flex-shrink: 0 !important;
  cursor: pointer !important;
}

.KEP-FloatingTooltip__inner::before {
  content: "" !important;
  position: absolute !important;
  top: 9px !important;
  right: -10px !important;
  display: block !important;
  width: 11px !important;
  height: 11px !important;
  background-image: url("data:image/svg+xml,%3Csvg width='11' height='11' viewBox='0 0 11 11' fill='none' xmlns='http://www.w3.org/2000/svg'%3E%3Cpath d='M1 0H8.58579C9.47669 0 9.92286 1.07714 9.29289 1.70711L1 10V0Z' fill='white'/%3E%3Cpath d='M0.966666 0.52002H8.59556C9.02257 0.52002 9.23701 1.03577 8.93588 1.33852L0.45 9.87002' stroke='%23e3e3e3' /%3E%3Crect width='1' height='11' transform='matrix(-1 0 0 1 1 0)' fill='white'/%3E%3C/svg%3E%0A") !important;
  background-repeat: no-repeat !important;
  background-position: center !important;
  background-size: contain !important;
  z-index: 1 !important;
}

/* ======= container - Reset CSS ======= */
.KEP-ChatContainer * {
  box-sizing: border-box !important;
  margin: 0 !important;
  padding: 0 !important;
  border: 0 !important;
  font-family: -apple-system, BlinkMacSystemFont, "Malgun Gothic", "맑은 고딕", helvetica, "Apple SD Gothic Neo" !important;
  background: none !important;
  box-shadow: none !important;
  letter-spacing: -0.5px !important;
  -webkit-appearance: none !important;
  -webkit-tap-highlight-color: transparent !important;
}
.KEP-ChatContainer *[hidden] {
  display: none !important;
}
.KEP-ChatContainer *::-webkit-scrollbar {
  display: none !important;
}

.KEP-ChatContainer input {
  font-size: 14px !important;
  color: #303030 !important;
}
.KEP-ChatContainer input::placeholder {
  font-weight: 500 !important;
  color: #abb6bb !important;
  opacity: 1 !important;
}
.KEP-ChatContainer input:-ms-input-placeholder {
  font-weight: 500 !important;
  color: #abb6bb !important;
  opacity: 1 !important;
}
.KEP-ChatContainer input::-ms-clear,
input::-ms-reveal {
  display: none !important;
}
.KEP-ChatContainer button {
  text-indent: 0 !important;
}
.KEP-ChatContainer button:not(:disabled) {
  cursor: pointer !important;
}
.KEP-ChatContainer button svg {
  display: flex !important;
  align-items: center !important;
}
.KEP-ChatContainer img {
  width: auto !important;
}

/* container */
.KEP-ChatContainer {
  box-sizing: border-box !important;
  position: relative !important;
  display: flex !important;
  flex-direction: column !important;
  padding-top: 60px !important;
  width: 362px !important;
  height: 100% !important;
  /* min-height: 550px !important; */
  max-height: 740px !important;
  border-radius: 12px !important;
  border: 1px solid rgba(0, 0, 0, 0.08) !important;
  background-color: #e8eaed !important;
  overflow: hidden !important;
  box-shadow: 0px 4px 20px rgba(0, 0, 0, 0.1) !important;
  scroll-behavior: smooth !important;
  -webkit-font-smoothing: antialiased !important;
  -moz-osx-font-smoothing: grayscale !important;
}

.KEP-ChatContainer.is-flexible {
  width: 100% !important;
  /*height: 100vh !important;*/
  max-height: none !important;
}

.KEP-ChatHeader button,
.KEP-ChatInputArea__btnMenu,
.KEP-ChatInputArea__btnImg {
  display: inline-flex !important;
  justify-content: center !important;
  align-items: center !important;
  width: 24px !important;
  height: 24px !important;
  border-radius: 4px !important;
}

@media (any-hover: hover) {
  .KEP-ChatHeader button:hover,
  .KEP-ChatInputArea__btnMenu:hover,
  .KEP-ChatInputArea__btnImg:hover,
  .KEP-CounselingMenu button:hover {
    background-color: rgba(0, 0, 0, 0.06) !important;
  }
}

/* header */
.KEP-ChatHeader {
  position: absolute !important;
  top: 0 !important;
  left: 0 !important;
  right: 0 !important;
  display: flex !important;
  justify-content: center !important;
  align-items: center !important;
  padding: 10px 15px !important;
  height: 60px !important;
  border-bottom: 1px solid rgba(0, 0, 0, 0.04) !important;
  background-color: rgba(255, 255, 255, 0.4) !important;
  text-align: center !important;
}
.KEP-ChatHeader__center {
  position: relative !important;
}
.KEP-ChatHeader__botName {
  font-size: 18px !important;
  font-weight: 700 !important;
  line-height: 21px !important;
  color: #101010 !important;
}
.KEP-ChatHeader__arrow {
  margin-left: 4px !important;
  display: none !important;
}
.KEP-ChatHeader__botList {
  position: absolute !important;
  top: 25px !important;
  left: 50% !important;
  list-style: none !important;
  padding: 4px !important;
  width: 200px !important;
  border-radius: 6px !important;
  background-color: #fff !important;
  box-shadow: 0px 0px 2px #d3e0ed, 0px 6px 11px rgba(27, 29, 31, 0.05), 0px 10px 15px rgba(27, 29, 31, 0.05),
    0px 0px 1px rgba(27, 29, 31, 0.25) !important;
  transform: translateX(-50%) !important;
  z-index: 200 !important;
}
.KEP-ChatHeader__botItem {
  display: flex !important;
  align-items: center !important;
  padding: 8px !important;
  border-radius: 4px !important;
  cursor: pointer !important;
}
@media (any-hover: hover) {
  .KEP-ChatHeader__botItem:hover {
    background-color: #f5f5f7 !important;
  }
}
.KEP-ChatHeader__botItemAvatar {
  margin-right: 8px !important;
  width: 24px !important;
  height: 24px !important;
}
.KEP-ChatHeader__botItemAvatar svg {
  width: 100% !important;
  height: 100% !important;
}
.KEP-ChatHeader__botItemName {
  font-size: 14px !important;
  color: #212121 !important;
}

.KEP-ChatHeader__botState {
  margin-top: 4px !important;
  font-size: 10px !important;
  font-weight: 500 !important;
  line-height: 15px !important;
  color: #606060 !important;
}
.KEP-ChatHeader__botState::before {
  content: "" !important;
  display: inline-block !important;
  margin-right: 3px !important;
  width: 6px !important;
  height: 6px !important;
  border-radius: 100% !important;
  background-color: #00cb20 !important;
}

.KEP-ChatHeader__btnArrowDown {
  position: absolute !important;
  top: 50% !important;
  right: 15px !important;
  transform: translateY(-50%) !important;
}

/* chatArea */
.KEP-ChatArea {
  overflow-y: auto !important;
  -webkit-overflow-scrolling: touch !important;
  -ms-overflow-style: none !important;
  scrollbar-width: none !important;
  flex: 1 !important;
  background-size: cover !important;
}

.KEP-ChatArea::after {
  content: "" !important;
  display: block !important;
  height: 24px !important;
}

/* Notice */
.KEP-Block__Notice {
  position: sticky !important;
  top: 9px !important;
  left: 0 !important;
  right: 0 !important;
  margin: 9px 8px 0 !important;
  padding: 6px 12px !important;
  border-radius: 6px !important;
  font-size: 14px !important;
  line-height: 21px !important;
  background-color: #fff !important;
  box-shadow: 0px 1px 4px rgba(0, 0, 0, 0.08) !important;
  word-break: break-all !important;
  z-index: 100 !important;
}

.KEP-Block__Notice a {
  text-decoration-line: none !important;
}

/* replyGroup */
.KEP-ChatQuickReplyGroup {
  position: relative !important;
}

.KEP-ChatQuickReplyGroup__move {
  position: absolute !important;
  top: 0 !important;
  display: flex !important;
  justify-content: center !important;
  align-items: center !important;
  width: 36px !important;
  height: calc(100% - 1px) !important;
  background-color: #5967c4 !important;
}

.KEP-ChatQuickReplyGroup__move.hidden {
  display: none !important;
}

.KEP-ChatQuickReplyGroup__move.isLeft {
  left: 0 !important;
  border-right: 1px solid #5967c4 !important;
}

@media (any-hover: hover) {
  .KEP-ChatQuickReplyGroup__move.isLeft:hover {
    border-right: 1px solid rgba(0, 0, 0, 0.08) !important;
  }
}

.KEP-ChatQuickReplyGroup__move.isRight {
  right: 0 !important;
  border-left: 1px solid #5967c4 !important;
}

@media (any-hover: hover) {
  .KEP-ChatQuickReplyGroup__move.isRight:hover {
    border-left: 1px solid rgba(0, 0, 0, 0.08) !important;
  }
}

.KEP-ChatQuickReplyGroup__inner {
  display: flex !important;
  align-items: center !important;
  flex-shrink: 0 !important;
  flex-wrap: nowrap !important;
  height: 60px !important;
  overflow-x: auto !important;
  overflow-y: hidden !important;
  white-space: nowrap !important;
  border-top: 1px solid rgba(0, 0, 0, 0.08) !important;
  border-bottom: 1px solid rgba(255, 255, 255, 0.08) !important;
  background-color: #5967c4 !important;
  -webkit-appearance: none !important;
  -webkit-overflow-scrolling: touch !important;
  -ms-overflow-style: none !important;
  scrollbar-width: none !important;
  scroll-behavior: smooth !important;
}

.KEP-ChatQuickReplyGroup__inner::before,
.KEP-ChatQuickReplyGroup__inner::after {
  content: "" !important;
  flex-shrink: 0 !important;
  display: block !important;
  width: 16px !important;
  height: 100% !important;
}

.KEP-ChatQuickReplyButton {
  padding: 6px 10px !important;
  border-radius: 8px !important;
  border: 1px solid rgba(255, 255, 255, 0.5) !important;
  font-size: 14px !important;
  line-height: 19px !important;
  color: #fff !important;
}

@media (any-hover: hover) {
  .KEP-ChatQuickReplyButton:hover {
    background: rgba(255, 255, 255, 0.08) !important;
  }
}

.KEP-ChatQuickReplyButton + .KEP-ChatQuickReplyButton {
  margin-left: 6px !important;
}

/* buttonGroup */
.KEP-ChatQuickButtonGroup {
  display: flex !important;
  flex-wrap: wrap !important;
  flex-shrink: 0 !important;
  background-color: #5967c4 !important;
}

.KEP-ChatQuickButton {
  display: flex !important;
  flex-shrink: 0 !important;
  flex-direction: column !important;
  justify-content: center !important;
  align-items: center !important;
  width: 33.333% !important;
  height: 80px !important;
  color: #fff !important;
}

.KEP-ChatQuickButton .KEP-ChatQuickButton__icon {
  width: 26px !important;
  height: 26px !important;
}

@media (any-hover: hover) {
  .KEP-ChatQuickButton:hover {
    background-color: rgba(0, 0, 0, 0.08) !important;
  }
}

.KEP-ChatQuickButton__text {
  margin-top: 6px !important;
  font-size: 12px !important;
  line-height: 15px !important;
}

/* auto complete */
.KEP-ChatAutoComplete {
  position: absolute !important;
  bottom: 84px !important;
  left: 0 !important;
  right: 0 !important;
  max-height: 200px !important;
  overflow: auto !important;
  z-index: 10 !important;
}
.KEP-ChatAutoCompleteList {
  padding: 0 4px !important;
  background-color: #fff !important;
}

.KEP-ChatAutoCompleteItem {
  padding: 0 12px !important;
  line-height: 40px !important;
  height: 40px !important;
  font-size: 14px !important;
  border-radius: 4px !important;
  background-color: #fff !important;
  color: #303030 !important;
  cursor: pointer !important;
  white-space: nowrap !important;
  text-overflow: ellipsis !important;
  display: block !important;
  overflow: hidden !important;
}

@media (any-hover: hover) {
  .KEP-ChatAutoCompleteItem:hover {
    background-color: rgba(0, 0, 0, 0.03) !important;
  }
}

.KEP-ChatAutoCompleteItem .highlight {
  color: #5967c4 !important;
}

/* input */
.KEP-ChatQuickButtonGroup + .KEP-ChatInputArea {
  margin-top: 0 !important;
}

.KEP-ChatInputArea {
  display: flex !important;
  flex-shrink: 0 !important;
  align-items: center !important;
  margin-top: auto !important;
  padding: 0 15px 0 16px !important;
  height: 56px !important;
  border-top: 1px solid rgba(0, 0, 0, 0.08) !important;
  border-bottom: 1px solid rgba(0, 0, 0, 0.08) !important;
  background-color: #fff !important;
}

.KEP-ChatInputArea button + button {
  margin-left: 10px !important;
}

.KEP-ChatInputArea__btnImg {
  cursor: pointer !important;
}

.KEP-ChatInputArea__form {
  display: flex !important;
  flex: 1 !important;
  height: 100% !important;
}

button + .KEP-ChatInputArea__form {
  margin-left: 16px !important;
  border-left: 1px solid rgba(0, 0, 0, 0.08) !important;
}

button + .KEP-ChatInputArea__form .KEP-ChatInputArea__input {
  padding-left: 16px !important;
}

.KEP-ChatInputArea__input {
  flex: 1 !important;
  height: auto !important;
}

.KEP-ChatInputArea__input:focus {
  outline: none !important;
}

/* send button */
.KEP-ChatInputArea__btnSend {
  color: #c2cccf !important;
  padding-left: 16px !important;
}

.KEP-ChatInputArea__btnSend-active {
  color: #5967c4 !important;
}

/* footer */
.KEP-ChatFooter {
  display: flex !important;
  flex-shrink: 0 !important;
  justify-content: center !important;
  align-items: center !important;
  height: 28px !important;
  background-color: rgba(0, 0, 0, 0.04) !important;
  font-size: 10px !important;
  letter-spacing: -0.2px !important;
  color: rgba(0, 0, 0, 0.2) !important;
}

/* receiver */
.KEP-Receiver {
  position: relative !important;
  display: flex !important;
  flex: 1 !important;
  margin-top: 24px !important;
}
.KEP-Receiver__avatar {
  position: absolute !important;
  top: 0 !important;
  left: 12px !important;
  flex-shrink: 0 !important;
  width: 34px !important;
  height: 34px !important;
  opacity: 1 !important;
  transition: opacity 0.35s ease !important;
}
.KEP-Receiver__avatar.isBorderless::after {
  display: none !important;
}
.KEP-Receiver__avatar.hidden {
  opacity: 0 !important;
}
.KEP-Receiver__avatar svg {
  width: 100% !important;
  height: 100% !important;
}
.KEP-Receiver__avatar::after {
  content: "" !important;
  position: absolute !important;
  top: 0 !important;
  left: 0 !important;
  right: 0 !important;
  bottom: 0 !important;
  display: block !important;
  background-image: url("data:image/svg+xml,%3csvg width='34' height='34' viewBox='0 0 34 34' fill='none' xmlns='http://www.w3.org/2000/svg'%3e%3cpath fill-rule='evenodd' clip-rule='evenodd' d='M17 0.5C29.0356 0.5 33.5 4.96444 33.5 17C33.5 29.0356 29.0356 33.5 17 33.5C4.96444 33.5 0.5 29.0356 0.5 17C0.5 4.96444 4.96444 0.5 17 0.5Z' stroke='black' stroke-opacity='0.12'/%3e%3c/svg%3e") !important;
  background-repeat: no-repeat !important;
  background-position: center !important;
  background-size: cover !important;
}
.KEP-Receiver__msgArea {
  position: relative !important;
}
.KEP-Receiver__msgArea.isRow {
  overflow: hidden !important;
}

.KEP-Receiver__nickName {
  padding-top: 1px !important;
  padding-left: 54px !important;
  line-height: 18px !important;
  font-size: 12px !important;
  font-weight: 500 !important;
  color: #111 !important;
}
.KEP-Receiver__blocksArea {
  margin-top: 4px !important;
  padding-left: 56px !important;
}
.KEP-Receiver__time {
  display: block !important;
  max-width: 272px !important;
  margin-top: 4px !important;
  font-size: 11px !important;
  color: rgba(11, 11, 11, 0.5) !important;
  text-align: right !important;
  white-space: nowrap !important;
}
.KEP-Receiver__speech .KEP-Receiver__time {
  position: absolute !important;
  bottom: 0 !important;
  right: 0 !important;
  -ms-transform: translateX(100%) translateX(4px) !important;
  transform: translateX(calc(100% + 4px)) !important;
}

/* sender */
.KEP-Sender {
  display: flex !important;
  justify-content: flex-end !important;
  flex: 1 !important;
  margin-top: 24px !important;
}

.KEP-Sender__msgArea {
  position: relative !important;
  display: inline-block !important;
}

.KEP-Sender__speech {
  box-sizing: border-box !important;
  position: relative !important;
  padding: 9px 16px !important;
  margin-right: 10px !important;
  margin-left: auto !important;
  max-width: 210px !important;
  font-size: 14px !important;
  line-height: 18px !important;
  border-radius: 8px !important;
  border: 1px solid rgba(0, 0, 0, 0.03) !important;
  background-color: #5967c4 !important;
  color: #fff !important;
}
.KEP-Sender__tail {
  position: absolute !important;
  top: 10px !important;
  right: -10px !important;
  display: block !important;
  width: 11px !important;
  height: 11px !important;
  color: #5967c4 !important;
  z-index: 1 !important;
}
.KEP-Sender__speech + .KEP-Sender__speech {
  margin-top: 8px !important;
}
.KEP-Sender__speech + .KEP-Sender__speech .KEP-Sender__tail {
  display: none !important;
}

.KEP-Sender__read {
  position: absolute !important;
  left: 0 !important;
  bottom: 15px !important;
  font-size: 11px !important;
  color: #5967c4 !important;
  text-align: right !important;
  -ms-transform: translateX(-100%) translateX(-4px) !important;
  transform: translateX(calc(-100% - 4px)) !important;
}
.KEP-Sender__time {
  position: absolute !important;
  left: 0 !important;
  bottom: 0 !important;
  font-size: 11px !important;
  color: rgba(11, 11, 11, 0.5) !important;
  text-align: right !important;
  -ms-transform: translateX(-100%) translateX(-4px) !important;
  transform: translateX(calc(-100% - 4px)) !important;
  white-space: nowrap !important;
}

/* ============== block kit ============== */
.KEP-Block__rowGroup {
  position: relative !important;
}
.KEP-Block__rowGroup + .KEP-Block__rowGroup {
  margin-top: 8px !important;
}

.KEP-Block {
  position: relative !important;
  font-size: 14px !important;
}

@media all and (-ms-high-contrast: active), (-ms-high-contrast: none) {
  /* for ie11 */
  .KEP-Block::after {
    content: "" !important;
    display: inline-flex !important;
    flex-shrink: 0 !important;
    width: 16px !important;
    height: auto !important;
  }
}

.KEP-Block::-webkit-scrollbar {
  display: none !important;
}

.KEP-Receiver__blocksArea.isRow {
  position: relative !important;
  width: 100% !important;
  margin-left: 0 !important;
  overflow: hidden !important;
}
.KEP-Receiver__blocksArea.isRow .KEP-Block {
  display: flex !important;
  flex-shrink: 0 !important;
  margin-left: -56px !important;
  padding-left: 56px !important;
  padding-right: 12px !important;
  /* width: 360px !important; */
  overflow-x: auto !important;
  overflow-y: hidden !important;
  white-space: nowrap !important;
  scroll-behavior: smooth !important;
  z-index: 1 !important;
}

.KEP-Block * {
  box-sizing: border-box !important;
  margin: 0 !important;
  padding: 0 !important;
  border: 0 !important;
  font-family: -apple-system, BlinkMacSystemFont, "Malgun Gothic", "맑은 고딕", helvetica, "Apple SD Gothic Neo" !important;
  background: none !important;
  box-shadow: none !important;
  white-space: initial !important;
  -webkit-appearance: none !important;
  -webkit-overflow-scrolling: touch !important;
  -ms-overflow-style: none !important;
  scrollbar-width: none !important;
}

.KEP-Block + .KEP-Block {
  margin: 8px 0 0 !important;
}
.KEP-Block__insideArea + .KEP-Block__insideArea {
  margin: 0 0 0 12px !important;
}

.KEP-Block__move {
  position: absolute !important;
  top: 50% !important;
  display: block !important;
  width: 36px !important;
  height: 36px !important;
  border-radius: 100% !important;
  background-color: #fff !important;
  box-shadow: 0px 0px 4px rgba(0, 0, 0, 0.16) !important;
  transform: translateY(-50%) !important;
  z-index: 10 !important;
}

.KEP-Block__move.isLeft {
  left: calc(-56px + 12px) !important;
}
.KEP-Block__move.isRight {
  right: 12px !important;
}

.KEP-Block__insideArea {
  display: inline-flex !important;
  flex-direction: column !important;
  flex-shrink: 0 !important;
  padding: 0 16px 16px !important;
  width: 272px !important;
  border-radius: 8px !important;
  border: 1px solid rgba(0, 0, 0, 0.08) !important;
  background-color: #fff !important;
  color: #202020 !important;
  vertical-align: top !important;
  overflow: hidden !important;
}

/* Receiver speeach, Text */
.KEP-Receiver__speech,
.KEP-Block__Text {
  position: relative !important;
  margin-top: 0 !important;
  display: inline-block !important;
  padding: 9px 16px !important;
  width: 272px !important;
  border-radius: 8px !important;
  border: 1px solid rgba(0, 0, 0, 0.08) !important;
  background-color: #fff !important;
  line-height: 21px !important;
  font-size: 14px !important;
  color: #202020 !important;
  vertical-align: top !important;
  overflow: visible !important;
  word-break: break-all !important;
}

.KEP-Receiver__speech,
.KEP-Sender__speech {
  display: flex !important;
  flex-direction: column !important;
  max-width: 242px !important;
  width: max-content !important;
  word-break: break-all !important;
}

.KEP-Receiver__speech p,
.KEP-Block__Text p {
  margin: 0 !important;
}

.KEP-Receiver__speech a,
.KEP-Block__Text a {
  margin: 0 !important;
  color: #5967c4 !important;
}

.KEP-Receiver__speech button,
.KEP-Block__Text button {
  margin-bottom: 7px !important;
}

/* max-content 안되는 IE 전용 스타일 */
@media all and (-ms-high-contrast: active), (-ms-high-contrast: none) {
  .KEP-Receiver__speech,
  .KEP-Sender__speech,
  .KEP-FloatingTooltip__inner {
    display: table !important;
    width: auto !important;
  }
}

.KEP-Block__Text {
  box-sizing: border-box !important;
  font-size: 14px !important;
  line-height: 21px !important;
  white-space: pre-wrap !important; /* for ie */
}

.KEP-Receiver__speech + .KEP-Receiver__speech,
.KEP-Receiver__speech + .KEP-Block__rowGroup,
.KEP-Block__Text + .KEP-Block__Text,
.KEP-Block__Text + .KEP-Block,
.KEP-Block + .KEP-Block__Text {
  margin-top: 8px !important;
}

.KEP-Receiver__speech::before,
.KEP-Block__Text::before {
  content: "" !important;
  position: absolute !important;
  top: 9px !important;
  left: -10px !important;
  display: block !important;
  width: 11px !important;
  height: 11px !important;
  background-image: url("data:image/svg+xml,%0A%3Csvg width='11' height='11' viewBox='0 0 11 11' fill='none' xmlns='http://www.w3.org/2000/svg'%3E%3Cpath d='M10 0H2.41421C1.52331 0 1.07714 1.07714 1.70711 1.70711L10 10V0Z' fill='white'/%3E%3Cpath d='M10.0333 0.52002H2.40444C1.97743 0.52002 1.76299 1.03577 2.06412 1.33852L10.55 9.87002' stroke='black' stroke-opacity='0.08'/%3E%3Crect x='10' width='1' height='11' fill='white'/%3E%3C/svg%3E%0A") !important;
  background-repeat: no-repeat !important;
  background-position: center !important;
  background-size: contain !important;
  z-index: 1 !important;
}

.KEP-Receiver__speech + .KEP-Receiver__speech::before,
.KEP-Block__Text + .KEP-Block__Text::before,
.KEP-Block + .KEP-Block__Text::before {
  display: none !important;
}

.KEP-Block .KEP-Block__Text {
  margin-top: 12px !important;
  padding: 0 !important;
  width: auto !important;
  border: 0 !important;
}

.KEP-Block .KEP-Block__Text::before {
  display: none !important;
}

/* 멀티 텍스트 220929 */
.KEP-Block__MultiTextArea {
  margin-left: -16px !important;
  margin-right: -16px !important;
  padding: 16px !important;
}
.KEP-Block__MultiTextArea:last-of-type {
  margin-bottom: -16px !important;
}
.KEP-Block__MultiTextArea.hasHover:hover {
  background-color: rgba(0, 0, 0, 0.04) !important;
  cursor: pointer !important;
}
.KEP-Block__MultiText {
  display: flex !important;
  justify-content: space-between !important;
  font-size: 15px !important;
  line-height: 20px !important;
  flex-flow: row wrap !important;
}
.KEP-Block__MultiText + .KEP-Block__MultiText {
  margin-top: 8px !important;
}
.KEP-Block__MultiText.isSmall {
  font-size: 13px !important;
  color: #606060 !important;
}
.KEP-Block__MultiText .isBold {
  font-weight: 700 !important;
} 
.KEP-Block__MultiText .isDanger {
  color: #e4665e !important;
}
.KEP-Block__MultiText .isBlue {
  color: #4f55be !important;
}
.KEP-Block__MultiText .isGrey {
  color: #909090 !important;
}
.KEP-Block__MultiText > p {
  white-space: pre-line !important;
  flex: 50% !important;
}
.KEP-Block__MultiText__Leading  , 
.KEP-Block__MultiText__Sub__Leading {
  text-align: left !important;
}
.KEP-Block__MultiText__Trailing, 
.KEP-Block__MultiText__Sub__Trailing {
  text-align: right !important;
}

/* 이미지 단독블럭 */
.KEP-Sender__speech.isOnlyImage,
.KEP-Receiver__speech.isOnlyImage {
  padding: 0 !important;
  border: 0 !important;
  background-color: #fff !important;
}
.KEP-Sender__speech.isOnlyImage::before,
.KEP-Receiver__speech.isOnlyImage::before {
  display: none !important;
}
.KEP-Sender__speech .img-area,
.KEP-Receiver__speech .img-area {
  border-radius: 8px !important;
  overflow: hidden !important;
}
.KEP-Receiver__speech .img-area {
  aspect-ratio: 1 / 1 !important;
}
.KEP-Sender__speech .img-area.temp-size,
.KEP-Receiver__speech .img-area.temp-size {
  display: flex !important;
  width: 234px !important;
  height: 234px !important;
  background-color: rgba(0, 0, 0, 0.06) !important;
}
.KEP-Sender__speech .img-area img,
.KEP-Receiver__speech .img-area img {
  display: block !important;
  width: 100% !important;
  height: 100% !important;
}
.KEP-Sender__speech .img-area .icon,
.KEP-Receiver__speech .img-area .icon {
  margin: auto !important;
}

/* Header */
.KEP-Block__Header {
  margin: 0 -16px -12px !important;
  padding: 16px 16px 12px !important;
  line-height: 22px !important;
  font-size: 15px !important;
  font-weight: 700 !important;
  letter-spacing: -0.25px !important;
}

.KEP-Block__Header.bgPrimary {
  margin-bottom: 0 !important;
  background-color: rgba(213, 234, 255) !important;
}

.KEP-Block__Header.colorPrimary {
  color: rgb(213, 234, 255) !important;
}

.KEP-Block__Header.bgDanger {
  margin-bottom: 0 !important;
  background-color: rgba(254, 209, 210) !important;
}
.KEP-Block__Header.bgDangerWeak {
  margin-bottom: 0 !important;
  background-color: rgba(254, 209, 210, 0.2) !important;
}

.KEP-Block__Header.colorDanger {
  color: rgb(254, 209, 210) !important;
}

.KEP-Block__Header.bgWarning {
  margin-bottom: 0 !important;
  background-color: rgba(255, 245, 195) !important;
}

.KEP-Block__Header.colorWarning {
  color: rgb(255, 245, 195) !important;
}

.KEP-Block__Header.bgPrimary + .KEP-Block__Divider,
.KEP-Block__Header.bgDanger + .KEP-Block__Divider {
  margin-top: 0 !important;
}

/* ImageLink */
.KEP-Block__ImageLink {
  margin: 12px -16px 0 !important;
  width: 272px !important;
  height: 136px !important;
  background-size: cover !important;
  background-position: center center !important;
}

.KEP-Block__ImageLink:first-of-type {
  margin-top: -12px !important;
}

.KEP-Block__ImageLink img {
  display: block !important;
  cursor: pointer !important;
}

/* Divider */
.KEP-Block__Divider {
  margin-top: 12px !important;
  border-top: 1px solid rgba(0, 0, 0, 0.08) !important;
}
.KEP-Block__Divider.isNoMargin {
  margin-top: 0 !important;
}
.KEP-Block__Divider.isNoPadding {
  margin-left: -16px !important;
  margin-right: -16px !important;
}

/* Description */
.KEP-Block__Description {
  display: flex !important;
  flex-wrap: wrap !important;
  margin-top: 12px !important;
  opacity: 1 !important;
}
.KEP-Block__Description.isDimmed {
  opacity: 0.3 !important;
}

.KEP-Block__Description-title {
  flex-shrink: 0 !important;
  width: 48px !important;
  font-size: 12px !important;
  line-height: 22px !important;
  font-weight: 700 !important;
  color: #606060 !important;
}

.KEP-Block__Description-desc {
  flex-shrink: 0 !important;
  margin-left: 2px !important;
  width: calc(100% - 50px) !important;
  font-size: 14px !important;
  line-height: 22px !important;
}

/* Context */
.KEP-Block__Context {
  display: flex !important;
  align-items: center !important;
  margin-top: 12px !important;
}

.KEP-Block__Context-img {
  flex-shrink: 0 !important;
  margin-right: 8px !important;
  border-radius: 2px !important;
}

.KEP-Block__Context-text {
  font-size: 13px !important;
  color: #606060 !important;
  text-overflow: ellipsis !important;
  white-space: nowrap !important;
  overflow: hidden !important;
}

/* Section */
.KEP-Block__Section {
  display: flex !important;
  margin-top: 6px !important;
  margin-left: -16px !important;
  margin-right: -16px !important;
  padding: 6px 16px !important;
}

.KEP-Block__Section.isClickable {
  display: flex !important;
  align-items: center !important;
  cursor: pointer !important;
}

@media (any-hover: hover) {
  .KEP-Block__Section.isClickable:hover {
    background-color: rgba(0, 0, 0, 0.04) !important;
  }
}

.KEP-Block__Section.isClickable .KEP-Block__Section-text {
  display: -webkit-box !important;
  -webkit-box-orient: vertical !important;
  -webkit-line-clamp: 2 !important;
  max-height: 42px !important;
  line-height: 21px !important;
  text-overflow: ellipsis !important;
  overflow: hidden !important;
}

.KEP-Block__Section.isClickable + .KEP-Block__Section.isClickable {
  margin-top: 0 !important;
}

.KEP-Block__Section:only-of-type {
  margin-top: 16px !important;
}

.KEP-Block__Section-text {
  flex: 1 !important;
  font-size: 14px !important;
  line-height: 21px !important;
  word-break: break-all !important;
}

.KEP-Block__Section-img {
  flex-shrink: 0 !important;
  margin-left: 8px !important;
  border-radius: 4px !important;
}

/* Action, Button */
.KEP-Block__Action {
  display: flex !important;
}

.KEP-Block__Action > .KEP-Block__Button + .KEP-Block__Button {
  margin-left: 8px !important;
}

.KEP-Block__marginTopAuto {
  margin-top: auto !important;
}

.KEP-Block__Button {
  position: relative !important;
  display: block !important;
  /* flex: 1 !important; */
  margin-top: 12px !important;
  padding: 10px !important;
  width: 100% !important;
  border: 0 !important;
  border-radius: 3px !important;
  background-color: #f1f1f1 !important;
  line-height: 21px !important;
  font-size: 14px !important;
  color: #202020 !important;
  overflow: hidden !important;
  cursor: pointer !important;
}

.KEP-Block__Button::before {
  content: "" !important;
  position: absolute !important;
  top: 0 !important;
  left: 0 !important;
  right: 0 !important;
  bottom: 0 !important;
  display: block !important;
  background-color: rgba(0, 0, 0, 0.08) !important;
  opacity: 0 !important;
}

@media (any-hover: hover) {
  .KEP-Block__Button:hover::before {
    opacity: 1 !important;
  }
}

.KEP-Block__Button.bgPrimary {
  background-color: rgb(213, 234, 255) !important;
  color: #000000 !important;
}

.KEP-Block__Button.bgDanger {
  background-color: rgb(254, 209, 210) !important;
  color: #000000 !important;
}

.KEP-Block__Button.bgWarning {
  background-color: rgb(255, 245, 195) !important;
  color: #000000 !important;
}

.KEP-CounselingMenu {
  background: #c4c4c44d !important;
  height: 36px !important;
  display: flex !important;
  align-items: center !important;
  justify-content: flex-end !important;
}

.KEP-CounselingMenu button {
  position: relative !important;
  width: 76px !important;
  height: 25px !important;
  border-radius: 10px !important;
  background: #c4c4c4 !important;
  margin-right: 4px !important;
  font-size: 13px !important;
}

.KEP-ChatContainer.none {
  display: none !important;
}

.KEP-FloatingButton.none {
  display: none !important;
}

</style>
<script>
	
	
	


	$(document).ready(function () {
		
		let sock = null;
		var formDate = "";
		var inputText = "";
		
		function onOpen() {
	   			chatMode = "adminChat";
	   			var now = new Date(); // 현재 시간
	   			var utcNow = now.getTime() + (now.getTimezoneOffset() * 60 * 1000); // 현재 시간을 utc로 변환한 밀리세컨드값
	   			var koreaTimeDiff = 9 * 60 * 60 * 1000; // 한국 시간은 UTC보다 9시간 빠름(9시간의 밀리세컨드 표현)
	   			var koreaNow = new Date(utcNow + koreaTimeDiff);
	   			
	   			   const msg = {
	   			         "chat_no" : 0,
	   			         "room_no" : 0,
	   			     	 "member_name" : "신미림",
	   			         "member_email" : "tlsalfla96@naver.com",
	   			         "chat_message" : "ENTER-CHAT",
	   			         "chat_type" : "enter",
	   			         "chat_date" : koreaNow,
	   			         "room_host" : "tlsalfla96@naver.com"
	   			       
	   			         }
	   			      console.log('start socket : ' + msg);
	   			      let jsonData = JSON.stringify(msg);
	   			      
	   			      
	   			      sock.send(jsonData);
	   		}
	   		
	   		// 메시지 전송
	   		function sendMessage() {
				let chatType = "client";
				var now = new Date(); // 현재 시간
				var utcNow = now.getTime() + (now.getTimezoneOffset() * 60 * 1000); // 현재 시간을 utc로 변환한 밀리세컨드값
				var koreaTimeDiff = 9 * 60 * 60 * 1000; // 한국 시간은 UTC보다 9시간 빠름(9시간의 밀리세컨드 표현)
				var koreaNow = new Date(utcNow + koreaTimeDiff);
	   		   
	   		   const msg = {
	   			   "chat_no" : 0,
	   		       "room_no" : 0,
	   		       "member_name" : "신미림",
	   		       "member_email" : "tlsalfla96@naver.com",
	   		       "chat_message" : inputText,
	   		       "chat_type" : chatType,
	   		       "chat_date" : koreaNow,
	   		       "room_host" : "tlsalfla96@naver.com"
	   		   }
	   		   
	   		   let jsonData = JSON.stringify(msg);
	   		   console.log(jsonData);
	   		   sock.send(jsonData);
	   		}
	   		
	   		// 서버로부터 메시지를 받았을 때
	   		function onMessage(msg) {
				
	   			
	   		   console.log(msg);
	   		   let receive = msg.data.split(",");
	   		   console.log(receive);
	   		   const data = {
	   		   "member_name" : receive[0],
	   		   "member_email" : receive[1],
	   		   "chat_message" : receive[2],
	   		   "chat_type" : receive[3],
	   		   "chat_no" : receive[4],
	   		   "chat_date": receive[5]
	   		   };
	   		   
	   		   let msghtml ="";
	   		   if(data.member_email=="tlsalfla96@naver.com"){
	   			   msghtml += 
	   				     `
	   				          <div class="KEP-Sender">
	   				             <div class="KEP-Sender__msgArea">
	   				                 <div class="KEP-Sender__blocksArea">
	   				                     <div class="KEP-Sender__speech" style=" background: #8770BA !important; color: #FFFFFF !important; ">
	   				                         <span class="KEP-Sender__tail">
	   				                             <svg width="11" height="11" viewBox="0 0 11 11" fill="none"
	   				                                 xmlns="http://www.w3.org/2000/svg">
	   				                                 <path d="M1 0H8.58579C9.47669 0 9.92286 1.07714 9.29289 1.70711L1 10V0Z"
	   				                                     fill="#8770BA"></path>
	   				                                 <path
	   				                                     d="M0.966666 0.52002H8.59556C9.02257 0.52002 9.23701 1.03577 8.93588 1.33852L0.45 9.87002"
	   				                                     stroke="black" stroke-opacity="0.03"></path>
	   				                                 <rect width="1" height="11" transform="matrix(-1 0 0 1 1 0)" fill="#8770BA"></rect>
	   				                             </svg>
	   				                         </span>`+ data.chat_message +`<span class="KEP-Sender__read">전송됨</span>
	   				                         <span class="KEP-Sender__time">`+data.chat_date+`</span>
	   				                     </div>
	   				                 </div>
	   				             </div>
	   				         </div>
	   				     ` 
	   		   }
	   		   else{
	   			msghtml += 
	   			   `
	   	             <div class="KEP-Receiver">
	   	                 <div class="KEP-Receiver__avatar">
	   	                     <svg width="34" height="34" viewBox="0 0 34 34" fill="none" xmlns="http://www.w3.org/2000/svg">
	   	                         <defs>
	   	                             <path id="shapeSquircle"
	   	                                 d="M17 0C29.4003 0 34 4.59973 34 17C34 29.4003 29.4003 34 17 34C4.59973 34 0 29.4003 0 17C0 4.59973 4.59973 0 17 0Z">
	   	                             </path>
	   	                             <clipPath id="clipSquircle">
	   	                                 <use xlink:href="#shapeSquircle"></use>
	   	                             </clipPath>
	   	                         </defs>
	   	                         <image width="100%" height="100%" preserveAspectRatio="xMidYMid slice"
	   	                             clip-path="url(#clipSquircle)"
	   	                             xlink:href="https://objectstorage.kr-central-1.kakaoi.io/v1/735f5d2ed4d742468bcbcd6e533b26aa/builder-prod/OU9mbkRta1VhdTFXRUJfQ0hBVEJPVF9wcm9maWw=">
	   	                         </image>
	   	                     </svg>
	   	                 </div>
	   	                 <div class="KEP-Receiver__msgArea">
	   	                     <div class="KEP-Receiver__nickName">젤뽀</div>
	   	                     <div class="KEP-Receiver__blocksArea">
	   	                         <div class="KEP-Receiver__speech">`+data.chat_message+`<span class="KEP-Receiver__time">`+data.chat_date+`</span>
	   	                         </div>
	   	                     </div>
	   	                 </div>
	   	             </div>
	   	 			`
	   		   }
	   		   $("#chatArea").append(msghtml); 
	   	 		$('.KEP-ChatArea').scrollTop($('.KEP-ChatArea')[0].scrollHeight);
	   	 	    $("#inputText").val("");
	   		}
	   		// 서버와 연결을 끊었을 때
	   		function onClose(evt) {
	   			var now = new Date(); // 현재 시간
				var utcNow = now.getTime() + (now.getTimezoneOffset() * 60 * 1000); // 현재 시간을 utc로 변환한 밀리세컨드값
				var koreaTimeDiff = 9 * 60 * 60 * 1000; // 한국 시간은 UTC보다 9시간 빠름(9시간의 밀리세컨드 표현)
				var koreaNow = new Date(utcNow + koreaTimeDiff);
	   			
	   		   console.log("연결이 끊겼습니다. 다시 접속하세요.");
	   		   chatMode = "bot";
	   		   const msg = {
	   				   "chat_no" : 0,
	   			       "room_no" : 0,
	   			       "member_email" : "tlsalfla96@naver.com",
	   			       "chat_date" : koreaNow,
	   			       "room_host" : "tlsalfla96@naver.com",
	   			       "chat_message" : "CLOSE-CHAT",
	   			       "chat_type" : "close"
	   			         }
	   			      console.log('end socket : ' + msg);
	   			      let jsonData = JSON.stringify(msg);
	   			      
	   			      
	   			      sock.send(jsonData);
	   		}
	        	 
	    			
	    			
		var mid = $("#mid").val();
		console.log("mid-------------" + mid);
		
		if (mid != "") {
			countAlarm(mid);
		}
		
		
		function countAlarm(mid) {
			console.log(mid);
			$.ajax({		
				url: "/alarm/countAlarm"

			}).done(function (data) {
				console.log("countAlarm " + data);
				//$('#alarmCnt').addClass('bell-badge-danger bell-badge')
				$('#alarmCnt').text(data);
			});	
		}
		
        // 검색목록 클릭시
        $(document).on("click", ".btn-close", function (e) {
        	console.log(e.currentTarget.dataset.alarmid);
        	var alarmid = e.currentTarget.dataset.alarmid;
        	
        	console.log(alarmid);
        	
			$.ajax({		
				url: "/alarm/deleteAlarm",
				data: {
						"alarmid" : alarmid
					}
			}).done(function (data) {
				console.log("deleteAlarm " + data);
				if (data == 1) {
					console.log("알람창" + document.getElementById('alarmid'+alarmid).style.display);
					document.getElementById('alarmid'+alarmid).style.display = "none";
					countAlarm(mid);
				} else {
					console.log("알람창 삭제 오류");
				}
				
			});	
        });
       
		function showAlarmList () {
			console.log(mid);
			$.ajax({		
				url: "/alarm/getAlarmList"

			}).done(function (data) {
				console.log("알람 리스트 반환" + data);
				alarm_array = data.alarms;
				let html = "";

				for (let i = 0; i < alarm_array.length; i++) { 
					let alarm = alarm_array.at(i);
					let tmp_html = "";
					let msg = "";
					
					if("reply" == alarm.cmd) {
						msg = alarm.caller + "님이 " + "<a type='external' href='${pageContext.request.contextPath}/social/user/details?post_id="+alarm.seq+"'>"  + alarm.seq + "</a> 번 게시글의"+ alarm.receiver +"님에게 댓글을 남겼습니다."
					} else if("followin" == alarm.cmd) {
						msg = alarm.caller + "님이 " + alarm.receiver + "님을 팔로우를 시작했습니다."
					} else if("followdel" == alarm.cmd) {
						msg = alarm.caller + "님이 " + alarm.receiver + "님을 팔로우 취소 했습니다."
					} else if("auctionbidder" == alarm.cmd){
						msg = alarm.seq + "번방 쇼라이브에서 물건을 낙찰 되셨습니다. 결제를 하셔야 합니다. "
					}
					
					tmp_html =
						 `
						<div class="toast align-items-center text-white bg-primary border-0" role="alert" aria-live="assertive" style="display : block; font-size: 1.3rem; background-color: rosybrown; box-shadow: 5px 5px 10px grey;"
						    aria-atomic="true" data-alarmid="`+alarm.alarmid +`"  id = "alarmid`+alarm.alarmid+`">
						    <div class="d-flex">
						        <div class="toast-body">`+ msg + `</div>
						        <button type="button" class="btn-close btn-close-white me-2 m-auto" data-bs-dismiss="toast"
						            aria-label="Close" data-alarmid="`+alarm.alarmid+`"></button>
						    </div>
						</div>
         			`   		
	   
					html += tmp_html;
				}
 				if (alarm_array.length > 0) {
					console.log("알람 변경");
				} 
				$("#toastContainer").html(html); 
			});	
		}
		
		
		 $("#showAlarm").on("click", function (e) {
				if (mid != "") {
					 showAlarmList ();
					 $("#toastContainer").slideToggle(200);
				} else {
					alert("로그인 후 확인해 주세요")
				}
		 });
		 
		 $("#chatBtn").on("click", function (e) {
			 //showAlarmList ();
			 console.log("챗봇클릭")
			 if (document.getElementById('chatbotcontainer').style.display == 'none') {
				 document.getElementById('chatbotcontainer').style.display = 'block';
			 } else {
				 document.getElementById('chatbotcontainer').style.display = 'none';				 
			 }
			
		 });
		 
		 $("#chatcloseBtn").on("click", function (e) {
			 document.getElementById('chatbotcontainer').style.display = 'none';
		 });
		 
		
		let chatMode = "bot";
		// submit 했을 때 처리
		 $('#chatForm').on('submit', function (event) {
		     event.preventDefault();
		     
		      let csrfHeaderName ="${_csrf.headerName}";
		     let csrfTokenValue="${_csrf.token}";
		     
		     formData = new FormData($('#chatForm')[0]);
			 console.log(formData);
			 inputText = $("#inputText").val();
			 console.log(inputText);
			 if(chatMode == "bot"){
				 
			 
			 
		     tmphtml = "";
		     tmphtml += 
			     `
			          <div class="KEP-Sender">
			             <div class="KEP-Sender__msgArea">
			                 <div class="KEP-Sender__blocksArea">
			                     <div class="KEP-Sender__speech" style=" background: #8770BA !important; color: #FFFFFF !important; ">
			                         <span class="KEP-Sender__tail">
			                             <svg width="11" height="11" viewBox="0 0 11 11" fill="none"
			                                 xmlns="http://www.w3.org/2000/svg">
			                                 <path d="M1 0H8.58579C9.47669 0 9.92286 1.07714 9.29289 1.70711L1 10V0Z"
			                                     fill="#8770BA"></path>
			                                 <path
			                                     d="M0.966666 0.52002H8.59556C9.02257 0.52002 9.23701 1.03577 8.93588 1.33852L0.45 9.87002"
			                                     stroke="black" stroke-opacity="0.03"></path>
			                                 <rect width="1" height="11" transform="matrix(-1 0 0 1 1 0)" fill="#8770BA"></rect>
			                             </svg>
			                         </span>`+ inputText +`<span class="KEP-Sender__read">읽음</span>
			                         <span class="KEP-Sender__time"><fmt:formatDate value="${now}" pattern="a hh:mm" /></span>
			                     </div>
			                 </div>
			             </div>
			         </div>
			     ` 
		     
		     $("#chatArea").append(tmphtml);
			 $('.KEP-ChatArea').scrollTop($('.KEP-ChatArea')[0].scrollHeight);
			 $("#inputText").val("");

		     $.ajax({
		         type : "post",
		         enctype : "multipart/form-data",
		         url : "/chatbotSend",
		         data : formData,
		         processData : false, // 필수
		         contentType : false, // 필수
		         beforeSend: function(xhr) {
		             xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
		         },
		         dataType: "json",
		         success:function (result) {
		        	 tmpresponse = "";
		        	 tmpresponse +=
		        		 
		             console.log(result);
		        	
 		        	 tmpres = 
		        	 `
		             <div class="KEP-Receiver">
		                 <div class="KEP-Receiver__avatar">
		                     <svg width="34" height="34" viewBox="0 0 34 34" fill="none" xmlns="http://www.w3.org/2000/svg">
		                         <defs>
		                             <path id="shapeSquircle"
		                                 d="M17 0C29.4003 0 34 4.59973 34 17C34 29.4003 29.4003 34 17 34C4.59973 34 0 29.4003 0 17C0 4.59973 4.59973 0 17 0Z">
		                             </path>
		                             <clipPath id="clipSquircle">
		                                 <use xlink:href="#shapeSquircle"></use>
		                             </clipPath>
		                         </defs>
		                         <image width="100%" height="100%" preserveAspectRatio="xMidYMid slice"
		                             clip-path="url(#clipSquircle)"
		                             xlink:href="/resources/images/logo_the.png">
		                         </image>
		                     </svg>
		                 </div>
		                 <div class="KEP-Receiver__msgArea">
		                     <div class="KEP-Receiver__nickName">젤뽀</div>
		                     <div class="KEP-Receiver__blocksArea">
		                         <div class="KEP-Receiver__speech">`+result.msg+`<br>`+result.button+`<span class="KEP-Receiver__time">`+result.chatTime+`</span>
		                         </div>
		                     </div>
		                 </div>
		             </div>
		 			`
		 
		          $("#chatArea").append(tmpres); 
		 		  $('.KEP-ChatArea').scrollTop($('.KEP-ChatArea')[0].scrollHeight);
 		          $(".connectAdmin").on("click", function (e) {
 		        	 console.log("connectAdmin");
 		        	sock=new SockJS("http://localhost:8080/admin/chat");
 			   		console.log(sock);
 			   		sock.onmessage = onMessage;
 			   		sock.onopen = onOpen;
 			   		sock.onclose = onClose;
 		          });
 		   		
 		   		
		         },
		         error:function (e) {
		             alert("오류 발생" + e);
		         }
		     });
		     
			 }
			 else{
				 sendMessage();
				
			 }
		 })
		 
		
        
	});	
	
</script>