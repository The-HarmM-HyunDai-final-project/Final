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
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/flicking.css">
<noscript data-n-css=""></noscript>
</head>
<body>
	<h1>${RoomList}</h1>
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
											href="https://view.shoppinglive.naver.com/lives/831692?tr=lim&amp;fm=shoppinglive&amp;sn=home"
											class="VideoBoxLinkWrapper_wrap_GLkZS"><div
												class="VideoBox_wrap_S8G2B VideoBox_ratio_w2h3_NQrX8 VideoBox_tablet_-FQO7">
												<div class="BroadcastAutoPlayCard_wrap_6irvX">
													<span
														class="CardThumbnail_wrap_TmtOY BroadcastAutoPlayCard_thumbnail_yTn4G BroadcastAutoPlayCard_is_videoload_32tIg CardThumbnail_type_video_6xDGz"><svg
															xmlns="http://www.w3.org/2000/svg" width="52" height="35"
															viewBox="0 0 52 35" focusable="false" aria-hidden="true"
															class="CardThumbnail_icon_OF8Ch">
														<g fill="none" fill-rule="evenodd">
														<path fill="#000" opacity="0.1"
																d="m50.563.003-49.336 3A1.306 1.306 0 0 0 0 4.308v22.517c0 .69.538 1.262 1.227 1.305l6.028.365v5.69c0 .427.485.671.827.418l7.564-5.597 34.917 2.125a1.307 1.307 0 0 0 1.386-1.305V1.306c0-.753-.635-1.35-1.386-1.303"></path>
														<path fill="#F8F8F8"
																d="M36.018 17.895a2.33 2.33 0 1 1-.001-4.657 2.33 2.33 0 0 1 .001 4.658m-9.25-.001a2.33 2.33 0 1 1 0-4.657 2.33 2.33 0 0 1-.001 4.658m-9.249-.001a2.33 2.33 0 1 1 .001-4.661 2.33 2.33 0 0 1-.002 4.662"></path></g></svg><img
														class="CardThumbnail_image_d88Hz BroadcastAutoPlayCard_image_Fc64k"
														alt=""
														src="https://g-selected.pstatic.net/MjAyMzAxMjBfMTIg/MDAxNjc0MTc5MzIzNzAy.5OieABMtU0DWDZrYh2mJv74021ya8rtTbjgPw75QoZog.Rt-Ja4wryAmdYRYlWw6brGLgm7hbVy6eS8qcbS7g2H8g.JPEG/image.jpg?type=f320_480_q90"
														draggable="false" loading="eager"></span>
													<div class="BroadcastAutoPlayCard_react_player_ZO26T"
														style="width: 100%; height: 100%;">
														<video preload="auto" autoplay="" playsinline=""
															webkit-playsinline="" x5-playsinline=""
															src="blob:https://shoppinglive.naver.com/f30b456c-f622-43ad-93ca-4cfe407396a3"
															style="width: 100%; height: 100%;"></video>
													</div>
												</div>
												<div class="VideoBox_content_AS2US">
													<div class="VideoBox_top_9paAV">
														<span
															class="VideoViewCount_wrap_IQqYy VideoViewCount_tablet_NHUhO"><span
															class="LiveBadge_wrap_OfovT LiveBadge_tablet_OMu7J"><span
																class="blind">라이브</span></span><span
															class="VideoViewCount_count_CKLvb">901 시청</span></span>
													</div>
													<div class="VideoBox_bottom_N3qIP">
														<div
															class="ProductBox_wrap_Id3Nl ProductBox_type_under_VxRxX ProductBox_tablet_E+dar">
															<span
																class="CardThumbnail_wrap_TmtOY ProductBox_thumbnail_3RInI CardThumbnail_type_product_6wo0I"><svg
																	xmlns="http://www.w3.org/2000/svg" width="19"
																	height="15" viewBox="0 0 19 15" focusable="false"
																	aria-hidden="true" class="CardThumbnail_icon_OF8Ch">
																<g opacity="0.1" fill-rule="evenodd">
																<path
																		d="M18.638 7.917 11.233.512a1.311 1.311 0 0 0-.93-.386h-2.15l7.158 7.158a1.663 1.663 0 0 1 0 2.35l-4.275 4.276.804.804c.3.3.786.3 1.086 0l5.712-5.712c.3-.3.3-.785 0-1.085"></path>
																<path
																		d="M3.053 4.147a1.057 1.057 0 1 1 0-2.114 1.057 1.057 0 0 1 0 2.114m11.626 3.77L7.274.512a1.314 1.314 0 0 0-.93-.385H.858a.767.767 0 0 0-.767.767V6.38c0 .35.139.684.385.93l7.405 7.405c.3.3.786.3 1.085 0l5.713-5.712c.3-.3.3-.786 0-1.085"></path></g></svg><img
																class="CardThumbnail_image_d88Hz"
																alt="14k 18k 레디언트 파인 풀 큐빅 반지 - 꼬냑 가드링 쌍지 이터니티 명품 1부"
																src="https://phinf.pstatic.net/dthumb/?src=%22https%3A%2F%2Fshop-phinf.pstatic.net%2F20230125_133%2F1674626353164vlDhd_JPEG%2F75762241833738690_1170248128.jpg%22&amp;service=selective&amp;type=f240_240_q90"
																width="55" height="55" draggable="false" loading="eager"></span>
															<div class="ProductBox_info_z1aIE">
																<span class="ProductBox_name_zybcC">14k 18k 레디언트
																	파인 풀 큐빅 반지 - 꼬냑 가드링 쌍지 이터니티 명품 1부</span>
																<div class="ProductBox_price_wrap_0B+zk">
																	<span class="ProductBox_discount_-M6AK">58%</span><span
																		class="ProductBox_price_+L7cC"><strong>${item.showlive_start_price}원</strong></span>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div> <span
											class="VideoTitle_wrap_fuxqM VideoTitle_ellipsis2_KBkev BroadcastUnderCard_title_hsd54 VideoTitle_size_s_Imup5">[메이비투아]
												14K 18K 신제품 할인 라이브</span></a><a href="/channels/59520"
											class="VideoBoxLinkWrapper_wrap_GLkZS"><span
											class="ChannelProfile_wrap_biIV9 ChannelProfile_size_20_c5bcc BroadcastUnderCard_channel_5OCf8"><div
													class="ChannelProfile_thumbnail_9rQcB">
													<img class="ChannelProfile_image_hKVL-" alt=""
														src="https://phinf.pstatic.net/dthumb/?src=%22http%3A%2F%2Fshop1.phinf.naver.net%2F20200908_102%2F1599533193678t29qq_JPEG%2F668973403935301_1216046570.jpg%22&amp;service=selective&amp;type=f240_240_q90"
														width="20" height="20" draggable="false" loading="eager">
												</div> <span
												class="ChannelProfile_name_jT9wN BroadcastUnderCard_name_+7+cK">메이비투아</span></span></a>
									</div>
								</c:forEach>
							</div>
						</div>
					</div>
				</section>


			</div>
		</div>

	</div>
</body>
</html>