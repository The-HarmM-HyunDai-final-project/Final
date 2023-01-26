<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/f7eaa42.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/f9e0638.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/79b6124.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/5fe9657.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/79b6124.css">
<%-- <link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/pop.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/upload_edit_delete.css"> --%>

<sec:authorize access="hasRole('ROLE_MEMBER')">
	<sec:authentication property="principal.username" var="MID" />
</sec:authorize>

<input type="hidden" name="mid" id="mid" value="${MID}">

<div data-v-0e56f7c2="" data-v-ff904d02="" social=""
	class="container social lg">
	<div data-v-0e56f7c2="" class="content no-social-header">
		<div data-v-07ebf68b="" data-v-0e56f7c2="">
			<!---->
			<div data-v-a55f4638="" data-v-07ebf68b="" id="p681677"
				class="social_post_detail empty_comments">
				<div data-v-271ab2d7="" data-v-a55f4638="" class="social_user_state">
					<a data-v-271ab2d7="" href="#" class="user_state_box"><div
							data-v-271ab2d7="" class="profile_img_box">
							<img data-v-271ab2d7="" src="/images/account_img_default.png"
								alt="KREAM 프로필 이미지" class="profile_img">
						</div>
						<div data-v-271ab2d7="" class="profile_info">
							<p data-v-271ab2d7="" href="#" class="user_name">93f21v</p>
							<p data-v-271ab2d7="" class="upload_time">4일 전</p>
						</div> <!----></a>
				</div>
				<div data-v-46fdf25a="" data-v-a55f4638="" class="social_image_box">
					<div data-v-46fdf25a="" class="social_slide">
						<div data-v-3d1a4f76="" data-v-46fdf25a="" dir="ltr"
							class="slick-slider slick-initialized">
							<div data-v-46fdf25a="" data-v-3d1a4f76="" data-v-21137603=""
								class="custom-arrow slick-arrow slick-prev slick-disabled"></div>
							<div data-v-3d1a4f76="" class="slick-list">
								<div data-v-e4caeaf8="" data-v-3d1a4f76="" class="slick-track"
									style="width: 1440px; opacity: 1; transform: translate3d(0px, 0px, 0px);">
									<div data-v-e4caeaf8="" tabindex="-1" data-index="0"
										aria-hidden="false"
										class="slick-slide slick-active slick-current"
										style="outline: none; width: 720px;">
										<div data-v-e4caeaf8="">
											<div data-v-46fdf25a="" data-v-e4caeaf8="" tabindex="-1"
												class="slide_content"
												style="width: 100%; display: inline-block;">
												<div data-v-46fdf25a="" data-v-e4caeaf8=""
													class="slide_item">
													<div data-v-46fdf25a="" data-v-e4caeaf8="" class="img_box">
														<video id="video1" controls autoplay loop width="100%"
															height="60%" loop poster="" controlsList="nodownload"
															poster="${pageContext.request.contextPath}/${poster}">
															<source src="${pageContext.request.contextPath}/${video}">
														</video>
													</div>
												</div>
											</div>
										</div>
									</div>
									<div data-v-e4caeaf8="" tabindex="-1" data-index="1"
										aria-hidden="true" class="slick-slide"
										style="outline: none; width: 720px;">
										<div data-v-e4caeaf8="">
											<div data-v-46fdf25a="" data-v-e4caeaf8="" tabindex="-1"
												class="slide_content"
												style="width: 100%; display: inline-block;">
												<div data-v-46fdf25a="" data-v-e4caeaf8=""
													class="slide_item">
													<div data-v-46fdf25a="" data-v-e4caeaf8="" class="img_box">
														<picture data-v-878ec45c="" data-v-46fdf25a=""
															class="picture social_img" data-v-e4caeaf8="">
														<source data-v-878ec45c="" type="image/webp"
															srcset="https://kream-phinf.pstatic.net/MjAyMzAxMTdfNTMg/MDAxNjczOTQxMDQ1ODA4.aD3cXzOe6VevMCU3cibS6_xKU3wXnNbaP05vM-Bhe7wg.sFXFeHEhz2TAeR-aAU1xMtO0HeIF4Nv8mL6sWBY0jOwg.JPEG/p_9a3c35ad60ca42d58b26116558f0c8b8.jpeg?type=l_webp">
														<source data-v-878ec45c=""
															srcset="https://kream-phinf.pstatic.net/MjAyMzAxMTdfNTMg/MDAxNjczOTQxMDQ1ODA4.aD3cXzOe6VevMCU3cibS6_xKU3wXnNbaP05vM-Bhe7wg.sFXFeHEhz2TAeR-aAU1xMtO0HeIF4Nv8mL6sWBY0jOwg.JPEG/p_9a3c35ad60ca42d58b26116558f0c8b8.jpeg?type=l">
														<img data-v-878ec45c="" alt="소셜이미지"
															referrerpolicy="no-referrer"
															src="https://kream-phinf.pstatic.net/MjAyMzAxMTdfNTMg/MDAxNjczOTQxMDQ1ODA4.aD3cXzOe6VevMCU3cibS6_xKU3wXnNbaP05vM-Bhe7wg.sFXFeHEhz2TAeR-aAU1xMtO0HeIF4Nv8mL6sWBY0jOwg.JPEG/p_9a3c35ad60ca42d58b26116558f0c8b8.jpeg?type=l"
															loading="auto" class="image"></picture>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div data-v-46fdf25a="" data-v-3d1a4f76="" data-v-21137603=""
								class="custom-arrow slick-arrow slick-next"></div>
							<ul data-v-3d1a4f76="" class="slick-dots" style="display: block;">
								<li class="slick-active"><button>1</button></li>
								<li class=""><button>2</button></li>
							</ul>
						</div>

					</div>
				</div>
				<div data-v-2b4cbb7b="" data-v-a55f4638="" class="social_product">
					<div data-v-2b4cbb7b="">
						<div data-v-2b4cbb7b="" class="product_title">
							<span data-v-2b4cbb7b="" class="title_txt">상품 태그<strong
								data-v-2b4cbb7b="" class="num">${pcount}</strong>개
							</span>
							<!---->
						</div>
					</div>
					<div data-v-2b4cbb7b="" class="product_list_area single_list">
						<ul data-v-2b4cbb7b="" class="product_list"
							style="transform: translateX(0px);">
							<c:if test="${products != 'empty'}">
								<c:forEach items="${products}" var="item" varStatus="status">

									<li data-v-2b4cbb7b="" class="product_item"><a
										data-v-2b4cbb7b="" href="/products/28029" class="product_link">
											<div data-v-09fbcf09="" data-v-2b4cbb7b="" class="product"
												style="background-color: rgb(235, 240, 245);">
												<picture data-v-878ec45c="" data-v-09fbcf09=""
													class="picture product_img">
												<source data-v-878ec45c="" type="image/webp"
													srcset="${item.img1}">
												<source data-v-878ec45c="" srcset="${item.img1}">
												<img data-v-878ec45c="" alt="Nike Dunk Low Retro Black"
													src="${item.img1}" referrerpolicy="no-referrer"
													loading="auto" class="image"></picture>
												<!---->
												<!---->
												<!---->
												<!---->
											</div>
											<div data-v-2b4cbb7b="" class="product_desc">
												<p data-v-2b4cbb7b="" class="product_name">${item.pname_k}</p>
												<div data-v-2b4cbb7b="" class="price_box">
													<span data-v-2b4cbb7b="" class="amount">${item.release_price}</span><span
														data-v-2b4cbb7b="" class="unit">원</span>
												</div>
											</div>
									</a></li>

								</c:forEach>
							</c:if>
						</ul>
					</div>
				</div>
				<div data-v-6d810e86="" data-v-a55f4638="" class="social_contents">
					<div data-v-66774c6c="" data-v-6d810e86="" class="social_btn">
						<div data-v-66774c6c="" class="btn_bind">
							<a data-v-66774c6c="" href="#" aria-label="좋아요" class="btn like"><svg
									data-v-66774c6c="" xmlns="http://www.w3.org/2000/svg"
									class="icon sprite-icons social-like">
									<use data-v-66774c6c=""
										href="/_nuxt/3182c3b1ca2f77da7bc3e1acf109306c.svg#i-social-like"
										xlink:href="/_nuxt/3182c3b1ca2f77da7bc3e1acf109306c.svg#i-social-like"></use></svg></a><a
								data-v-66774c6c="" href="#" aria-label="댓글" class="btn comment"><svg
									data-v-66774c6c="" xmlns="http://www.w3.org/2000/svg"
									class="social-comment icon sprite-icons">
									<use data-v-66774c6c=""
										href="/_nuxt/3182c3b1ca2f77da7bc3e1acf109306c.svg#i-social-comment"
										xlink:href="/_nuxt/3182c3b1ca2f77da7bc3e1acf109306c.svg#i-social-comment"></use></svg></a>
						</div>
						<a data-v-66774c6c="" href="#" aria-label="공유" class="btn share"><svg
								data-v-66774c6c="" xmlns="http://www.w3.org/2000/svg"
								class="social-share icon sprite-icons">
								<use data-v-66774c6c=""
									href="/_nuxt/3182c3b1ca2f77da7bc3e1acf109306c.svg#i-social-share"
									xlink:href="/_nuxt/3182c3b1ca2f77da7bc3e1acf109306c.svg#i-social-share"></use></svg></a>
					</div>

					<div class="social_text" data-v-3524417a="" data-v-6d810e86="">
						<span href="#" class="text_link" data-v-3524417a=""><span
							class="text" data-v-3524417a="">${contents}</span></span>
						<p class="upload_time" data-v-3524417a="">3일 전</p>
					</div>

					<!-- 댓글 -->
					<div class="social_comment" data-v-44fd9edd="" data-v-6d810e86="">
						<div class="comment_area" data-v-44fd9edd="">
							<a href="#" class="comment_count" data-v-44fd9edd=""> 댓글 <strong
								data-v-44fd9edd="">5</strong>개
							</a>
							<div class="comment_list" data-v-44fd9edd="" >
							<div id="comment_list">
							 	<!-- 댓글  -->
							</div>						
								<a href="#" id="btn_more" class="btn_more" data-v-44fd9edd="">댓글
									더 보기...</a>
							</div>
						</div>
					</div>
					<!-- 댓글 -->
					<!-- 댓글 모달 -->
					<div data-v-1a009402="" data-v-e139a0b8="" data-v-6d810e86=""
						class="layer_social_comment layer md" id="replyModal"
						style="display: none">
						<div data-v-1a009402="" class="layer_container">
							<a data-v-e139a0b8="" data-v-1a009402="" class="btn_layer_close" id = "closeBtn">
								<div data-v-e139a0b8="" data-v-1a009402=""
									class="ico-close icon sprite-icons">
									<img src="/resources/icon/x_ic.png" alt="x" width="100%"
										class="">
								</div>
							</a>
							<div data-v-1a009402="" class="layer_header">
								<h2 data-v-e139a0b8="" data-v-1a009402="" class="title">댓글</h2>
							</div>
							<div data-v-1a009402="" class="layer_content">
								<div data-v-e139a0b8="" data-v-1a009402="" class="comment_top">
									<div data-v-e139a0b8="" data-v-1a009402=""
										class="comment_top_scroll">
										<div data-v-4862de99="" data-v-e139a0b8=""
											class="comment_unit" data-v-1a009402="">
											<div data-v-4862de99="" class="comment_box">
												<a data-v-4862de99="" href="/social/users/@moo_min_seo_"
													class="profile_link"><img data-v-4862de99=""
													src="https://kream-phinf.pstatic.net/MjAyMjExMDlfMjU2/MDAxNjY3OTU3ODY0MzY4.t3fpARn1DEJYhj-d0iTQwdakC1caQ_JQ0UsTg-pFpe4g.2RbzvEDyow1eUoRDMgLPnVncL8HG069N_242c-aQuyMg.JPEG/p_174ceb2e78124c53ac64163decaad402.jpeg?type=sl"
													alt="KREAM 프로필 이미지" class="profile_img"></a>
												<div data-v-4862de99="" class="comment_detail">
													<div data-v-4862de99="" class="main">
														<span data-v-4862de99="" class="user_name">${member_email}</span><span
															data-v-4862de99="" class="comment_txt"></span>
													</div>
													<!-- contents넣어야 함!!!!!!!!!!!! -->
													<div data-v-4862de99="" class="sub">
														<span data-v-4862de99="" class="upload_time">2022년
															11월 22일</span>
														<!---->
														<!---->
														<!---->
														<!---->
													</div>
												</div>
												<a data-v-4862de99="" href="#" class="btn_like"><svg
														data-v-4862de99="" xmlns="http://www.w3.org/2000/svg"
														class="icon sprite-icons social-like-gray-sm">
														<use data-v-4862de99=""
															href="/_nuxt/3182c3b1ca2f77da7bc3e1acf109306c.svg#i-social-like-gray-sm"
															xlink:href="/_nuxt/3182c3b1ca2f77da7bc3e1acf109306c.svg#i-social-like-gray-sm"></use></svg></a>
											</div>
										</div>
									</div>
								</div>
								<div data-v-e139a0b8="">
									<div data-v-748a5594="" data-v-e139a0b8=""
										class="social_comment_input_box">
										<!---->
										<div data-v-748a5594="" class="social_comment_input">
											<div data-v-748a5594="" class="comment_input">
												<a data-v-748a5594="" href="/social/users/@93f21v"
													class="profile_link"><img data-v-748a5594=""
													src="/images/account_img_default.png?type=sl"
													alt="KREAM 프로필 이미지" class="profile_img"></a>
												<div id="p_comment_user_textbox">
													<input type="text" id="reply" name="reply"
														placeholder="댓글을 남기세요" id="p_comment_user_text"> <input
														type="hidden" id="post_id" name="post_id"
														value="${post_id}"> <input type="hidden"
														id="member_email" name="member_email"
														value="${member_email}"> <input type="hidden"
														id="parent_id" name="parent_id" value=""> <input
														type="hidden" id="depth" name="depth" value="">
												</div>
												<nav id="registBtn" style="margin-left: 10px;">등록</nav>
											</div>
											<ul data-v-573055b0="" data-v-748a5594=""
												class="social_suggests" style="display: none;"></ul>
										</div>
									</div>
								</div>
								<div data-v-e139a0b8="" data-v-1a009402=""
									class="comment_content">
									<div data-v-e139a0b8="" data-v-1a009402=""
										class="comment_group" id="comment_group">

										<!---->
									</div>
								</div>
								<!---->
							</div>
						</div>
					</div>
					<!-- 댓글 모달 -->
					<!---->
					<!---->
					<!---->
					<!---->
				</div>
			</div>

			<div data-v-5f3540d5="" data-v-07ebf68b="" class="list_loading"
				style="display: none;">
				<img data-v-5f3540d5="" src="/_nuxt/img/loading.410eb77.gif"
					loading="lazy" alt="리스트 로딩중입니다." class="loading_img">
			</div>
		</div>
	</div>
</div>



<style>
<!--
#p_comment_user_textbox {
	margin-left: 10px;
}

#p_comment_user_textbox input {
	height: 40px;
	width: 280px;
	border-radius: 20px;
	padding-left: 10px;
	border: 1px rgb(204, 203, 203) solid;
	background-color: rgb(245, 240, 240);
}
-->
</style>
<script type="text/javascript">
	
</script>
<script type="text/javascript">
	$(window)
			.ready(
					function() {

						var post_id = document.getElementById('post_id').value;
						var member_email = document
								.getElementById('member_email').value;
						//post_id = document.getElementById('post_id').value;
						var content = document.getElementById('reply').value;
						var parent_id = 0;
						var depth = 0;
						var parent_member_emial = "";

						showReplyList(post_id);

						var mid = $("#mid").val();
						console.log("mid-------------" + mid);

						document
								.getElementById('btn_more')
								.addEventListener(
										'click',
										function() {
											console.log("댓글 모달");
											document
													.getElementById('replyModal').style.display = 'block';

										});
						document
						.getElementById('closeBtn')
						.addEventListener(
								'click',
								function() {
									console.log("댓글 모달");
									document.getElementById('replyModal').style.display = 'none';

								});
						

						document
								.getElementById('registBtn')
								.addEventListener(
										'click',
										function() {
											console.log("tkfk");

											var tmp_content = document
													.getElementById('reply').value;
											var tmpArr = tmp_content.split(" ");
											var content = "";

											if (tmpArr.length == 1) {
												content = tmp_content;
											} else {
												for (var i = 1; i < tmpArr.length; i++) {
													content += tmpArr[i] + " ";
												}
											}

											console.log("content" + content);

											$
													.ajax(
															{
																url : "/social/insertReply",
																data : {
																	"member_email" : member_email,
																	"post_id" : post_id,
																	"content" : content,
																	"parent_id" : parent_id,
																	"depth" : depth
																}
															})
													.done(
															function(data) {
																console
																		.log(data);
																if (data == 1) {
																	alert("댓글이 등록 되었습니다");
																	document
																			.getElementById('reply').value = "";
																	showReplyList(post_id);

																} else {
																	alert("댓글을 작성해 주세요");
																}
															});

										});

						// 검색목록 클릭시
						$(document)
								.on(
										"click",
										".writing_reply",
										function(e) {
											console
													.log(e.currentTarget.dataset.sid);
											depth = e.currentTarget.dataset.depth;
											parent_id = e.currentTarget.dataset.sid;
											parent_member_emial = e.currentTarget.dataset.member_email;

											document.getElementById('reply').value = "@"
													+ parent_member_emial + " ";

										});

						function showReplyList(post_id) {
							console.log("showlist 실행")
							$
									.ajax(
											{
												url : "${pageContext.request.contextPath}/social/getReplyList",
												data : {
													"post_id" : post_id
												}
											})
									.done(
											function(data) {
												console.log("data :" + data);
												reply_array = data.replyList;

												if (reply_array == null
														|| reply_array.length == 0) {
													$("#comment_group")
															.html("");
													return;
												}

												let html_tmp = "";
												let html_tmp3 = "";

												for (let i = 0; i < reply_array.length; i++) {
													let reply = reply_array
															.at(i);
													let subreplys = reply.Sreplys;
													let mainreply = reply.Mreply;
													/* 							
													 console.log(reply)
													 console.log(subreplys)
													 console.log(mainreply) */

													let tmp = "";
													let tmp3 = "";
													
													tmp3 = `			<div data-v-4862de99="" data-v-e139a0b8="" class="comment_unit" data-v-1a009402="">                                                                      `
														+ `						<div data-v-4862de99="" class="comment_box">                                                                                                         `
														+ `							<a data-v-4862de99="" href="/social/users/@u4vw97" class="profile_link"><img data-v-4862de99=""                                                  `+
`									src="/images/account_img_default.png" alt="KREAM 프로필 이미지" class="profile_img"></a>                                                 `
														+ `							<div data-v-4862de99="" class="comment_detail">                                                                                                  `
														+ `								<div data-v-4862de99="" class="main">                                                                                                        `
														+ `									<span data-v-4862de99="" class="user_name">`
														+ mainreply.member_email
														+ `</span>                                                                                 `
														+ `									<span data-v-4862de99="" class="comment_txt">`
														+ mainreply.content
														+ `</span>                                                             `
														+ `								</div>                                                                                                                                       `
														+ `								<div data-v-4862de99="" class="sub">                                                                                                         `
														+ `									<span data-v-4862de99="" class="upload_time">`
														+ mainreply.regdate
														+ `</span>  `
														+ `									<!---->                                                                                                                                  `
														+ `									<!---->                                                                                                                                  `
														+ `								</div>                                                                                                                                       `
														+ `							</div>                                                                                                                                           `
														+ `							<a data-v-4862de99="" href="#" class="btn_like"><svg data-v-4862de99="" xmlns="http://www.w3.org/2000/svg"                                       `+
`									class="icon sprite-icons social-like-gray-sm">                                                                                           `
														+ `									<use data-v-4862de99="" href="/_nuxt/3182c3b1ca2f77da7bc3e1acf109306c.svg#i-social-like-gray-sm"                                         `+
`										xlink:href="/_nuxt/3182c3b1ca2f77da7bc3e1acf109306c.svg#i-social-like-gray-sm"></use>                                                `
														+ `								</svg></a>                                                                                                                                   `
														+ `						</div>                                                                                                                                               `
														+ `				</div>                                                                                                                                               `;
														html_tmp3 += tmp3; 
													/* **********************************************8 */

													tmp = `			<div data-v-4862de99="" data-v-e139a0b8="" class="comment_unit" data-v-1a009402="">                                                                      `
															+ `						<div data-v-4862de99="" class="comment_box">                                                                                                         `
															+ `							<a data-v-4862de99="" href="/social/users/@u4vw97" class="profile_link"><img data-v-4862de99=""                                                  `+
`									src="/images/account_img_default.png" alt="KREAM 프로필 이미지" class="profile_img"></a>                                                 `
															+ `							<div data-v-4862de99="" class="comment_detail">                                                                                                  `
															+ `								<div data-v-4862de99="" class="main">                                                                                                        `
															+ `									<span data-v-4862de99="" class="user_name">`
															+ mainreply.member_email
															+ `</span>                                                                                 `
															+ `									<span data-v-4862de99="" class="comment_txt">`
															+ mainreply.content
															+ `</span>                                                             `
															+ `								</div>                                                                                                                                       `
															+ `								<div data-v-4862de99="" class="sub">                                                                                                         `
															+ `									<span data-v-4862de99="" class="upload_time">`
															+ mainreply.regdate
															+ `</span>  `
															+ `									<!---->                                                                                                                                  `
															+ `									<!---->                                                                                                                                  `
															+ `									<a data-v-4862de99="" href="#" class="writing_reply" data-member_email="`+ mainreply.member_email +`"data-sid="`+mainreply.sid+`" data-depth = "`+mainreply.sid+`" >                                                                                    `
															+ `										답글쓰기 </a>                                                                                                                        `
															+ `									<!---->                                                                                                                                  `
															+ `								</div>                                                                                                                                       `
															+ `							</div>                                                                                                                                           `
															+ `							<a data-v-4862de99="" href="#" class="btn_like"><svg data-v-4862de99="" xmlns="http://www.w3.org/2000/svg"                                       `+
`									class="icon sprite-icons social-like-gray-sm">                                                                                           `
															+ `									<use data-v-4862de99="" href="/_nuxt/3182c3b1ca2f77da7bc3e1acf109306c.svg#i-social-like-gray-sm"                                         `+
`										xlink:href="/_nuxt/3182c3b1ca2f77da7bc3e1acf109306c.svg#i-social-like-gray-sm"></use>                                                `
															+ `								</svg></a>                                                                                                                                   `
															+ `						</div>                                                                                                                                               `
															+ `						<div data-v-e139a0b8="" data-v-4862de99="" class="reply_bind">                                                                                       `;
													let tmp2 = "";
													console
															.log("222fffffffffffffffffffffffff22");
													console.log(reply);
													console.log(subreply
															+ "22222");
													console.log(subreplys);
													console
															.log(subreplys.length);
													for (let j = 0; j < subreplys.length; j++) {
														var subreply = subreplys
																.at(j);
														console.log(reply);
														console
																.log("222fffffffffffffffffffffffff22");
														tmp2 = `							<div data-v-4862de99="" data-v-e139a0b8="" class="comment_unit reply">                                                                           `
																+ `								<div data-v-4862de99="" class="comment_box">                                                                                                 `
																+ `									<a data-v-4862de99="" href="/social/users/@moo_min_seo_" class="profile_link"><img data-v-4862de99=""                                    `+
								`											src=""                                                                                                                           `+
								`											alt="KREAM 프로필 이미지" class="profile_img"></a>                                                                               `
																+ `									<div data-v-4862de99="" class="comment_detail">                                                                                          `
																+ `										<div data-v-4862de99="" class="main">                                                                                                `
																+ `											<span data-v-4862de99="" class="user_name">`
																+ subreply.member_email
																+ `</span><span data-v-4862de99=""                                           `+
								`												class="comment_txt"><a class="reply_user_name"                                                                               `+
								`													href="https://kream.co.kr/social/users/@u4vw97">@`
																+ subreply.parent_id
																+ `</a> `
																+ subreply.content
																+ `  </span>                                                           `
																+ `										</div>                                                                                                                               `
																+ `										<div data-v-4862de99="" class="sub">                                                                                                 `
																+ `											<span data-v-4862de99="" class="upload_time">`
																+ subreply.regdate
																+ ` </span>                                                                            `
																+ `											<!---->                                                                                                                          `
																+ `											<!---->                                                                                                                          `
																+ `											<a data-v-4862de99="" href="#" class="writing_reply" id="writing_reply" data-member_email="`+ subreply.member_email +`"data-sid="`+subreply.sid+`" data-depth = "`+subreply.depth+`">                                                                            `
																+ `												답글쓰기 </a>                                                                                                                `
																+ `											<!---->                                                                                                                          `
																+ `										</div>                                                                                                                               `
																+ `									</div>                                                                                                                                   `
																+ `									<a data-v-4862de99="" href="#" class="btn_like"><svg data-v-4862de99=""                                                                  `+
								`											xmlns="http://www.w3.org/2000/svg" class="icon sprite-icons social-like-gray-sm">                                                `
																+ `											<use data-v-4862de99="" href="/_nuxt/3182c3b1ca2f77da7bc3e1acf109306c.svg#i-social-like-gray-sm"                                 `+
								`												xlink:href="/_nuxt/3182c3b1ca2f77da7bc3e1acf109306c.svg#i-social-like-gray-sm"></use>                                        `
																+ `										</svg></a>                                                                                                                           `
																+ `								</div>                                                                                                                                       `
																+ `							</div>`;
														tmp += tmp2;
													}

													tmp += `					</div>                                                                                                                                           `
															+ `				</div>                                                                                                                                               `;

													html_tmp += tmp;
												}

												$("#comment_group").html(html_tmp);
												$("#comment_list").html(html_tmp3);
												
											});

						}
					});
</script>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>