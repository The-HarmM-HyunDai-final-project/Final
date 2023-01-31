<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<html lang="ko" data-n-head="%7B%22lang%22:%7B%22ssr%22:%22ko%22%7D%7D">

<head>
<title>theharmm | 한정판 거래의 FLEX</title>
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
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/bootstrap/bootstrap.min.css">
<script
	src="${pageContext.request.contextPath}/resources/bootstrap/bootstrap.min.js"></script>
 
<!-- 제이쿼리 cdn -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- sockJS -->
<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>	

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
	src="https://www.googletagmanager.com/gtag/js?l=dataLayer&amp;id=G-SRFKTMTR0R" async=""></script>

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
								<div class="search_btn_box" data-v-147586e1="" id = "showAlarm">
									<notification-indicator> <a
										
										class="Header-link notification-indicator position-relative tooltipped tooltipped-sw"
										 id="AppHeader-notifications-button">

										<span data-target="notification-indicator.badge"
										class="mail-status unread" style="color: gray" id = "alarmCnt"> 0 </span> <svg
											aria-hidden="true" height="16" viewBox="0 0 16 16"
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
						class="position-relative" >
						<!-- Position it: -->
						<!-- - `.toast-container` for spacing between toasts -->
						<!-- - `.position-absolute`, `top-0` & `end-0` to position the toasts in the upper right corner -->
						<!-- - `.p-3` to prevent the toasts from sticking to the edge of the container  -->
						<div class="toast-container position-absolute top-0 end-0 p-3" id = "toastContainer">

						</div>
					</div>
					<!-- 알람 모달  -->
					<sec:authorize access="hasRole('ROLE_MEMBER')">
						<sec:authentication property="principal.username" var="MID" />
					</sec:authorize>
					<input type="hidden" name="mid" id="mid" value="${MID}">
				</div>

<script>
	$(document).ready(function () {
		
		var mid = $("#mid").val();
		console.log("mid-------------" + mid);
		
		countAlarm(mid);
		
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
						`	<div class="toast" role="alert" aria-live="assertive"  style="display : block; font-size: 1.5rem; background-color: rosybrown;" aria-atomic="true" data-alarmid = "`+alarm.alarmid +`" id = "alarmid`+alarm.alarmid+`">
								<div class="toast-header">
									<strong
										class="me-auto">ALARM</strong> 
									<button type="button" class="btn-close" data-bs-dismiss="toast" 
										aria-label="Close" data-alarmid = "`+alarm.alarmid+`"></button>
								</div>
								<div class="toast-body">`+ msg + `</div>
							</div> `	   		
	   
					html += tmp_html;
				}
				$("#toastContainer").html(html); 
			});	
		}
		
		
		 $("#showAlarm").on("click", function (e) {
			 showAlarmList ();
		 });
		
        
	});	
	
</script>