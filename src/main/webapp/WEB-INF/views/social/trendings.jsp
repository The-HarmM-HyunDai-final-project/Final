<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
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
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/f9e0638.css"
	as="style">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/ff91585.js"
	as="script">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/49367b6.css"
	as="style">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/49b89ca.css"
	as="style">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/89cc0f2.css"
	as="style">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/4de604f.css"
	as="style">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/f9e0638.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/49367b6.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/49b89ca.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/89cc0f2.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/4de604f.css">
<link rel="stylesheet"
	href="/resources/css/61927c8.css">
	
<style type="text/css"> /*# sourceMappingURL=contenteditable.vue.map */
</style>
<script type="text/javascript" async=""
	src="https://wcs.naver.net/wcslog.js" id="naver-ads" data-loaded="true"></script>
<style data-emotion="css" data-s=""></style>
<script
	src="https://www.googletagmanager.com/gtag/js?l=dataLayer&amp;id=G-SRFKTMTR0R"
	async=""></script>
<link rel="preload" as="style"
	href="${pageContext.request.contextPath}/resources/css/6ab8508.css">
<link rel="preload" as="style"
	href="${pageContext.request.contextPath}/resources/css/c545406.css">
<link rel="preload" as="style"
	href="${pageContext.request.contextPath}/resources/css/d8eae0a.css">
<link rel="preload" as="style"
	href="${pageContext.request.contextPath}/resources/css/24dfaf3.css">
<link rel="preload" as="style"
	href="${pageContext.request.contextPath}/resources/css/07ff34c.css">
<link rel="preload" as="style"
	href="${pageContext.request.contextPath}/resources/css/34bdc77.css">
<link rel="preload" as="style"
	href="${pageContext.request.contextPath}/resources/css/style.css">
<link rel="preload" as="style"
	href="${pageContext.request.contextPath}/resources/css/pop.css">

<div data-v-067026cb="" data-v-78c3a0e6="" social=""
	class="container social lg">
	<div data-v-067026cb="" class="content">
		<div data-v-067026cb="" class="keyword_bind">
			<div class="brand_info" data-v-a1e4e5b6="">
				<p class="brand_name" data-v-a1e4e5b6="" style="text-shadow: 4px 2px 2px gray;">STYLE</p>
				
			</div>
		</div>





		<div data-v-013cc4d0="" data-v-47cbe816="" class="social_feeds2"
			style="height: 1000px;">
			<div data-v-013cc4d0="" transition-duration="0" item-selector=".item"
				gutter=".gutter_item" horizontal-order="true" class="masonry_posts"
				style="position: relative; height: 1462px;">
				<div data-v-013cc4d0="" class="gutter_item"></div>
<%-- 				<div>${list}</div>
				<div>${pageMaker }</div> --%>
				<c:forEach items="${list}" var="item" varStatus="status">
					<c:set var="i" value="${i+300}" />
					<div data-v-47728778="" data-v-013cc4d0=""
						class="feed_card item vertical"
						style="position: absolute; left: ${status.index*300%1200}px; top: ${(status.index/4-status.index%4/4) * 500 }px;">
						<a data-v-47728778=""
							href="${pageContext.request.contextPath}/social/trending/details?post_id=${item.post_id}&user=${item.member_email}">
							<div data-v-47728778="" class="card_box">
								<div data-v-47728778="" class="social_img_box vertical">
									<picture data-v-878ec45c="" data-v-47728778=""
										class="picture social_img"> <img referrerpolicy="no-referrer"
										src="${pageContext.request.contextPath}/${item.upload_path}/${item.uuid}_${item.file_name}"
										loading="auto" class="image"></picture>
								</div>
								<div data-v-47728778="" class="card_detail">
									<div data-v-47728778="" class="user_box">
										<picture data-v-878ec45c="" data-v-47728778=""
											class="picture img_profile"> <img
											data-v-878ec45c="" alt="사용자 프로필 이미지"
											referrerpolicy="no-referrer"
											src="https://kream.co.kr/_nuxt/img/blank_profile.4347742.png"
											loading="auto" class="image"></picture>
										<p data-v-47728778="" class="user_name">${item.member_email}</p>
										<span data-v-47728778="" aria-label="좋아요" role="button"
											class="btn like"><svg data-v-47728778=""
												xmlns="http://www.w3.org/2000/svg"
												class="icon sprite-icons social-like-gray-sm">
                                          <use data-v-47728778=""
													href="/_nuxt/3182c3b1ca2f77da7bc3e1acf109306c.svg#i-social-like-gray-sm"
													xlink:href="/_nuxt/3182c3b1ca2f77da7bc3e1acf109306c.svg#i-social-like-gray-sm"></use></svg><span
											data-v-47728778="" class="like_count">${item.post_id}</span></span>
									</div>
									<p data-v-47728778="" class="text_box">${item.contents}</p>
									<!---->
								</div>
							</div>
							<div data-v-47728778="" class="img_count">
								<span data-v-47728778="" class="count"></span>
							</div></a>
					</div>

				</c:forEach>
			</div>
		</div>




		<!-- 		<div data-v-013cc4d0="" data-v-067026cb="" class="social_feeds">
			<div data-v-013cc4d0="" transition-duration="0" item-selector=".item"
				gutter=".gutter_item" horizontal-order="true" class="masonry_posts"
				style="position: relative; height: 2466px;">
				<div data-v-013cc4d0="" class="gutter_item"></div>
				<div data-v-47728778="" data-v-013cc4d0=""
					class="feed_card item vertical"
					style="position: absolute; left: 0px; top: 0px;">
					<a data-v-47728778="" href="#"><div data-v-47728778=""
							class="card_box">
							<div data-v-47728778="" class="social_img_box vertical">
								<picture data-v-878ec45c="" data-v-47728778=""
									class="picture social_img">
								<source data-v-878ec45c="" type="image/webp"
									srcset="https://kream-phinf.pstatic.net/MjAyMzAxMTZfMjY3/MDAxNjczODYzODQxMjkw.ESAzEOdBr3uPlHST1yET2ht0qO_zAn8lrSt_GFUzJ9Mg.t9YGK_RYn5YYs5HsFCBNaQrM51wORb0VuOiaa5qt0qEg.JPEG/p_72d915cebc5e44bcae7bc50d1e60e814.jpeg?type=m_webp">
								<source data-v-878ec45c=""
									srcset="https://kream-phinf.pstatic.net/MjAyMzAxMTZfMjY3/MDAxNjczODYzODQxMjkw.ESAzEOdBr3uPlHST1yET2ht0qO_zAn8lrSt_GFUzJ9Mg.t9YGK_RYn5YYs5HsFCBNaQrM51wORb0VuOiaa5qt0qEg.JPEG/p_72d915cebc5e44bcae7bc50d1e60e814.jpeg?type=m">
								<img data-v-878ec45c="" alt="소셜이미지" referrerpolicy="no-referrer"
									src="https://kream-phinf.pstatic.net/MjAyMzAxMTZfMjY3/MDAxNjczODYzODQxMjkw.ESAzEOdBr3uPlHST1yET2ht0qO_zAn8lrSt_GFUzJ9Mg.t9YGK_RYn5YYs5HsFCBNaQrM51wORb0VuOiaa5qt0qEg.JPEG/p_72d915cebc5e44bcae7bc50d1e60e814.jpeg?type=m"
									loading="auto" class="image"></picture>
							</div>
							<div data-v-47728778="" class="card_detail">
								<div data-v-47728778="" class="user_box">
									<picture data-v-878ec45c="" data-v-47728778=""
										class="picture img_profile">
									<source data-v-878ec45c="" type="image/webp"
										srcset="https://kream-phinf.pstatic.net/MjAyMTEyMTdfMTkw/MDAxNjM5NzUxMTMyMjA1.IxGRr5-c0O9qfi4rTcq-8An3Ge9BcvTk1n9cWiGPJ0gg.Qw9MDZbEFc7LhpSQrcQKvofEKT1V1A-4TRhIJAYzmyYg.JPEG/p_f963dd8bd5dd4878a86919e399722e1f.jpeg?type=s_webp">
									<source data-v-878ec45c=""
										srcset="https://kream-phinf.pstatic.net/MjAyMTEyMTdfMTkw/MDAxNjM5NzUxMTMyMjA1.IxGRr5-c0O9qfi4rTcq-8An3Ge9BcvTk1n9cWiGPJ0gg.Qw9MDZbEFc7LhpSQrcQKvofEKT1V1A-4TRhIJAYzmyYg.JPEG/p_f963dd8bd5dd4878a86919e399722e1f.jpeg?type=s">
									<img data-v-878ec45c="" alt="사용자 프로필 이미지"
										referrerpolicy="no-referrer"
										src="https://kream-phinf.pstatic.net/MjAyMTEyMTdfMTkw/MDAxNjM5NzUxMTMyMjA1.IxGRr5-c0O9qfi4rTcq-8An3Ge9BcvTk1n9cWiGPJ0gg.Qw9MDZbEFc7LhpSQrcQKvofEKT1V1A-4TRhIJAYzmyYg.JPEG/p_f963dd8bd5dd4878a86919e399722e1f.jpeg?type=s"
										loading="auto" class="image"></picture>
									<p data-v-47728778="" class="user_name">ssroom</p>
									<span data-v-47728778="" aria-label="좋아요" role="button"
										class="btn like"><svg data-v-47728778=""
											xmlns="http://www.w3.org/2000/svg"
											class="icon sprite-icons social-like-gray-sm">
															<use data-v-47728778=""
												href="/_nuxt/3182c3b1ca2f77da7bc3e1acf109306c.svg#i-social-like-gray-sm"
												xlink:href="/_nuxt/3182c3b1ca2f77da7bc3e1acf109306c.svg#i-social-like-gray-sm"></use></svg><span
										data-v-47728778="" class="like_count">125</span></span>
								</div>
								<p data-v-47728778="" class="text_box">#스타일컬렉터 #크림스타일
									#크림챌린지KREAM챌린지 #크림코디</p>
								
							</div>
						</div>
						<div data-v-47728778="" class="img_count">
							<span data-v-47728778="" class="count">+5</span>
						</div></a>
				</div>
				<div data-v-47728778="" data-v-013cc4d0=""
					class="feed_card item vertical"
					style="position: absolute; left: 307px; top: 0px;">
					<a data-v-47728778="" href="#"><div data-v-47728778=""
							class="card_box">
							<div data-v-47728778="" class="social_img_box vertical">
								<picture data-v-878ec45c="" data-v-47728778=""
									class="picture social_img">
								<source data-v-878ec45c="" type="image/webp"
									srcset="https://kream-phinf.pstatic.net/MjAyMzAxMTlfMTcy/MDAxNjc0MTAxNzE2NzEw.0hQN1L2o_ZkUs0VgPSD8fSwefGn07EizBpxOZ5aIPmIg.qiPqLC0w-3wlCrHJ0bVgPXwdIWmyi_688sE5IwwnUdsg.JPEG/p_73845b72c39046eba1beed062bad124d.jpeg?type=m_webp">
								<source data-v-878ec45c=""
									srcset="https://kream-phinf.pstatic.net/MjAyMzAxMTlfMTcy/MDAxNjc0MTAxNzE2NzEw.0hQN1L2o_ZkUs0VgPSD8fSwefGn07EizBpxOZ5aIPmIg.qiPqLC0w-3wlCrHJ0bVgPXwdIWmyi_688sE5IwwnUdsg.JPEG/p_73845b72c39046eba1beed062bad124d.jpeg?type=m">
								<img data-v-878ec45c="" alt="소셜이미지" referrerpolicy="no-referrer"
									src="https://kream-phinf.pstatic.net/MjAyMzAxMTlfMTcy/MDAxNjc0MTAxNzE2NzEw.0hQN1L2o_ZkUs0VgPSD8fSwefGn07EizBpxOZ5aIPmIg.qiPqLC0w-3wlCrHJ0bVgPXwdIWmyi_688sE5IwwnUdsg.JPEG/p_73845b72c39046eba1beed062bad124d.jpeg?type=m"
									loading="auto" class="image"></picture>
							</div>
							<div data-v-47728778="" class="card_detail">
								<div data-v-47728778="" class="user_box">
									<picture data-v-878ec45c="" data-v-47728778=""
										class="picture img_profile">
									<source data-v-878ec45c="" type="image/webp"
										srcset="https://kream-phinf.pstatic.net/MjAyMjA4MTVfMTE3/MDAxNjYwNTY4MDE3Njky.0zVrmx90lZNps3j84PkG9JfPUBvTFWtaxl4z8Rqphswg.EXdo7lBoWslIhg4cvLiiwctCnw3w2tciLGdmKETk8bUg.JPEG/p_7ab4cc5829484631b3930e54850edb89.jpeg?type=s_webp">
									<source data-v-878ec45c=""
										srcset="https://kream-phinf.pstatic.net/MjAyMjA4MTVfMTE3/MDAxNjYwNTY4MDE3Njky.0zVrmx90lZNps3j84PkG9JfPUBvTFWtaxl4z8Rqphswg.EXdo7lBoWslIhg4cvLiiwctCnw3w2tciLGdmKETk8bUg.JPEG/p_7ab4cc5829484631b3930e54850edb89.jpeg?type=s">
									<img data-v-878ec45c="" alt="사용자 프로필 이미지"
										referrerpolicy="no-referrer"
										src="https://kream-phinf.pstatic.net/MjAyMjA4MTVfMTE3/MDAxNjYwNTY4MDE3Njky.0zVrmx90lZNps3j84PkG9JfPUBvTFWtaxl4z8Rqphswg.EXdo7lBoWslIhg4cvLiiwctCnw3w2tciLGdmKETk8bUg.JPEG/p_7ab4cc5829484631b3930e54850edb89.jpeg?type=s"
										loading="auto" class="image"></picture>
									<p data-v-47728778="" class="user_name">wnsur</p>
									<span data-v-47728778="" aria-label="좋아요" role="button"
										class="btn like"><svg data-v-47728778=""
											xmlns="http://www.w3.org/2000/svg"
											class="icon sprite-icons social-like-gray-sm">
															<use data-v-47728778=""
												href="/_nuxt/3182c3b1ca2f77da7bc3e1acf109306c.svg#i-social-like-gray-sm"
												xlink:href="/_nuxt/3182c3b1ca2f77da7bc3e1acf109306c.svg#i-social-like-gray-sm"></use></svg><span
										data-v-47728778="" class="like_count">18</span></span>
								</div>
								<p data-v-47728778="" class="text_box">#KREAMSTYLE #크림스타일
									#데일리룩</p>
								
							</div>
						</div>
						<div data-v-47728778="" class="img_count">
							<span data-v-47728778="" class="count">+3</span>
						</div></a>
				</div>

			</div>
		</div> -->
	</div>
</div>

<div data-v-78c3a0e6="">
	<!---->
	<div data-v-66ae1b7c="" id="toast" class="toast lg">
		<div data-v-66ae1b7c="" class="wrap">
			<svg data-v-66ae1b7c="" xmlns="http://www.w3.org/2000/svg"
				class="icon sprite-icons toast-icon toast-success">
								<use data-v-66ae1b7c=""
					href="/_nuxt/3182c3b1ca2f77da7bc3e1acf109306c.svg#i-toast-success"
					xlink:href="/_nuxt/3182c3b1ca2f77da7bc3e1acf109306c.svg#i-toast-success"></use></svg>
			<div data-v-66ae1b7c="" class="toast-content">
				<p data-v-66ae1b7c="">내용</p>
			</div>
		</div>
	</div>
</div>
<style>

.brand_name[data-v-a1e4e5b6] {
    font-size: 42px;
    letter-spacing: -.16px;
    font-weight: 600;
    line-height: 38px;
    margin-top: 40px;
}


.social_feeds2[data-v-013cc4d0] {
    padding: 100px 40px 0;
}
</style>
<link
	href="${pageContext.request.contextPath}/resources/css/4de604f.css"
	rel="stylesheet" type="text/css">
<link
	href="${pageContext.request.contextPath}/resources/css/89cc0f2.css"
	rel="stylesheet" type="text/css">
<link
	href="${pageContext.request.contextPath}/resources/css/49b89ca.css"
	rel="stylesheet" type="text/css">
<link
	href="${pageContext.request.contextPath}/resources/css/49367b6.css"
	rel="stylesheet" type="text/css">
<div id="__endic_crx__">
	<div class="css-diqpy0"></div>
</div>
<link
	href="${pageContext.request.contextPath}/resources/css/6ab8508.css"
	rel="stylesheet" type="text/css">
<link
	href="${pageContext.request.contextPath}/resources/css/c545406.css"
	rel="stylesheet" type="text/css">
<link
	href="${pageContext.request.contextPath}/resources/css/d8eae0a.css"
	rel="stylesheet" type="text/css">
<link
	href="${pageContext.request.contextPath}/resources/css/24dfaf3.css"
	rel="stylesheet" type="text/css">
<link
	href="${pageContext.request.contextPath}/resources/css/07ff34c.css"
	rel="stylesheet" type="text/css">
<link
	href="${pageContext.request.contextPath}/resources/css/34bdc77.css"
	rel="stylesheet" type="text/css">
<%@ include file="/WEB-INF/views/common/footer.jsp"%>