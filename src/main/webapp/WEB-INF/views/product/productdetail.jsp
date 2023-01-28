<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>

<link
	href="${pageContext.request.contextPath}/resources/css/b69f662.css"
	rel="stylesheet" type="text/css">
<link
	href="${pageContext.request.contextPath}/resources/css/reviews_ui.css"
	rel="stylesheet" type="text/css">
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css"> <!-- 배너추가 --> 
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/product_detail_tab.js" defer=""></script>
<script src="${pageContext.request.contextPath}/resources/js/reviewstab.js" defer=""></script>
 <script>
        let imgSlide = document.querySelector("#imgSlide");
        let imgList = ["${productDetailDTO.img1}","${productDetailDTO.img2}","${productDetailDTO.img3}","${productDetailDTO.img4}","${productDetailDTO.img5}"];
        let i = 0;

        function prev(){ // 이전
            i--;
            imgSlide.src = imgList[i];
            if(i<0){
                i = imgList.length-1;
                imgSlide.src = imgList[i];
            }
        }

        function next(){ // 다음
            i++;
            imgSlide.src = imgList[i];
            if(i >= imgList.length){
                i = 0;
                imgSlide.src = imgList[i];
            }
        }
 </script>
 
<div class="container detail lg" data-v-01e212dd="" data-v-3007c576="">
	<div class="content" data-v-01e212dd="">
		<h2 class="blind" data-v-01e212dd="">상품 상세</h2>
		<div class="column_bind" data-v-01e212dd="">
			
			<div class="column is_fixed" data-v-01e212dd="">
				<div class="spread" data-v-01e212dd=""></div>
				<div class="column_box" data-v-01e212dd="">
				<!-- 상품상세페이지 배너 -->
					<div class="detail_banner_area lg" data-v-07f24dc5=""
						data-v-01e212dd="">
						
						
					<%-- <div data-v-3d1a4f76="" data-v-07f24dc5="" dir="ltr"
							class="banner_slide detail_slide slick-slider slick-initialized">
							<button data-v-21137603="" data-v-3d1a4f76="" type="button"
								data-role="none" class="slick-arrow slick-prev slick-disabled"
								style="display: block;">Previous</button>
							<!---->
							<div data-v-3d1a4f76="" class="slick-list">
								<div data-v-e4caeaf8="" data-v-3d1a4f76="" class="slick-track"
									style="width: 2800px; opacity: 1;">
									<!---->
									<div data-v-e4caeaf8="" tabindex="-1" data-index="0"
										aria-hidden="false"
										class="slick-slide slick-active slick-current"
										style="outline: none; width: 560px; position: relative; left: 0px; opacity: 1; transition: opacity 500ms ease 0s, visibility 500ms ease 0s;">
										<div data-v-e4caeaf8="">
											<div data-v-07f24dc5="" data-v-e4caeaf8="" tabindex="-1"
												class="slide_content"
												style="width: 100%; display: inline-block;">
												<div data-v-07f24dc5="" data-v-e4caeaf8="" href="/"
													class="slide_item"
													style="background-color: rgb(${productDetailDTO.bg_r}, ${productDetailDTO.bg_g}, ${productDetailDTO.bg_b});">
													<div data-v-07f24dc5="" data-v-e4caeaf8=""
														class="item_inner">
														<div data-v-09fbcf09="" data-v-07f24dc5="" class="product"
															data-v-e4caeaf8=""
															style="background-color: rgb(${productDetailDTO.bg_r}, ${productDetailDTO.bg_g}, ${productDetailDTO.bg_b});">
															<picture data-v-878ec45c="" data-v-09fbcf09=""
																class="picture product_img">
															<img data-v-878ec45c="" referrerpolicy="no-referrer" alt="상품 이미지" 
																src="${productDetailDTO.img1}"
																loading="lazy" fetchpriority="high" class="image"></picture>
															<!---->
															<!---->
															<!---->
															<!---->
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
									<!---->
									<div data-v-e4caeaf8="" tabindex="-1" data-index="1"
										aria-hidden="true" class="slick-slide"
										style="outline: none; width: 560px; position: relative; left: -560px; opacity: 0; transition: opacity 500ms ease 0s, visibility 500ms ease 0s;">
										<div data-v-e4caeaf8="">
											<div data-v-07f24dc5="" data-v-e4caeaf8="" tabindex="-1"
												class="slide_content"
												style="width: 100%; display: inline-block;">
												<div data-v-07f24dc5="" data-v-e4caeaf8="" href="/"
													class="slide_item"
													style="background-color: rgb(${productDetailDTO.bg_r}, ${productDetailDTO.bg_g}, ${productDetailDTO.bg_b});">
													<div data-v-07f24dc5="" data-v-e4caeaf8=""
														class="item_inner">
														<div data-v-09fbcf09="" data-v-07f24dc5="" class="product"
															data-v-e4caeaf8=""
															style="background-color: rgb(${productDetailDTO.bg_r}, ${productDetailDTO.bg_g}, ${productDetailDTO.bg_b});">
															<picture data-v-878ec45c="" data-v-09fbcf09=""
																class="picture product_img">
															<img data-v-878ec45c="" referrerpolicy="no-referrer" alt="상품 이미지" 
																src="${productDetailDTO.img2}"
																loading="lazy" fetchpriority="high" class="image"></picture>
															<!---->
															<!---->
															<!---->
															<!---->
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
									<!---->
									<div data-v-e4caeaf8="" tabindex="-1" data-index="2"
										aria-hidden="true" class="slick-slide"
										style="outline: none; width: 560px; position: relative; left: -1120px; opacity: 0; transition: opacity 500ms ease 0s, visibility 500ms ease 0s;">
										<div data-v-e4caeaf8="">
											<div data-v-07f24dc5="" data-v-e4caeaf8="" tabindex="-1"
												class="slide_content"
												style="width: 100%; display: inline-block;">
												<div data-v-07f24dc5="" data-v-e4caeaf8="" href="/"
													class="slide_item"
													style="background-color: rgb(${productDetailDTO.bg_r}, ${productDetailDTO.bg_g}, ${productDetailDTO.bg_b});">
													<div data-v-07f24dc5="" data-v-e4caeaf8=""
														class="item_inner">
														<div data-v-09fbcf09="" data-v-07f24dc5="" class="product"
															data-v-e4caeaf8=""
															style="background-color: rgb(${productDetailDTO.bg_r}, ${productDetailDTO.bg_g}, ${productDetailDTO.bg_b});">
															<picture data-v-878ec45c="" data-v-09fbcf09=""
																class="picture product_img">
															<img data-v-878ec45c="" referrerpolicy="no-referrer" alt="상품 이미지" 
																src="${productDetailDTO.img3}"
																loading="lazy" fetchpriority="high" class="image"></picture>
															<!---->
															<!---->
															<!---->
															<!---->
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
									<!---->
									<div data-v-e4caeaf8="" tabindex="-1" data-index="3"
										aria-hidden="true" class="slick-slide"
										style="outline: none; width: 560px; position: relative; left: -1680px; opacity: 0; transition: opacity 500ms ease 0s, visibility 500ms ease 0s;">
										<div data-v-e4caeaf8="">
											<div data-v-07f24dc5="" data-v-e4caeaf8="" tabindex="-1"
												class="slide_content"
												style="width: 100%; display: inline-block;">
												<div data-v-07f24dc5="" data-v-e4caeaf8="" href="/"
													class="slide_item"
													style="background-color: rgb(${productDetailDTO.bg_r}, ${productDetailDTO.bg_g}, ${productDetailDTO.bg_b});">
													<div data-v-07f24dc5="" data-v-e4caeaf8=""
														class="item_inner">
														<div data-v-09fbcf09="" data-v-07f24dc5="" class="product"
															data-v-e4caeaf8=""
															style="background-color: rgb(${productDetailDTO.bg_r}, ${productDetailDTO.bg_g}, ${productDetailDTO.bg_b});">
															<picture data-v-878ec45c="" data-v-09fbcf09=""
																class="picture product_img">
															<img data-v-878ec45c="" referrerpolicy="no-referrer" alt="상품 이미지" 
																src="${productDetailDTO.img4}"
																loading="lazy" fetchpriority="high" class="image"></picture>
															<!---->
															<!---->
															<!---->
															<!---->
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
									<!---->
									<div data-v-e4caeaf8="" tabindex="-1" data-index="4"
										aria-hidden="true" class="slick-slide"
										style="outline: none; width: 560px; position: relative; left: -2240px; opacity: 0; transition: opacity 500ms ease 0s, visibility 500ms ease 0s;">
										<div data-v-e4caeaf8="">
											<div data-v-07f24dc5="" data-v-e4caeaf8="" tabindex="-1"
												class="slide_content"
												style="width: 100%; display: inline-block;">
												<div data-v-07f24dc5="" data-v-e4caeaf8="" href="/"
													class="slide_item"
													style="background-color: rgb(${productDetailDTO.bg_r}, ${productDetailDTO.bg_g}, ${productDetailDTO.bg_b});">
													<div data-v-07f24dc5="" data-v-e4caeaf8=""
														class="item_inner">
														<div data-v-09fbcf09="" data-v-07f24dc5="" class="product"
															data-v-e4caeaf8=""
															style="background-color: rgb(${productDetailDTO.bg_r}, ${productDetailDTO.bg_g}, ${productDetailDTO.bg_b});">
															<picture data-v-878ec45c="" data-v-09fbcf09=""
																class="picture product_img">
															<img data-v-878ec45c="" referrerpolicy="no-referrer" alt="상품 이미지" 
																src="${productDetailDTO.img5}"
																loading="lazy" fetchpriority="high" class="image"></picture>
															<!---->
															<!---->
															<!---->
															<!---->
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
									<!---->
								</div>
							</div>
							<button data-v-21137603="" data-v-3d1a4f76="" type="button"
								data-role="none" class="slick-arrow slick-next"
								style="display: block;">Next</button>
							<ul data-v-3d1a4f76="" class="slick-dots" style="display: block;">
								<li class="slick-active"><button>1</button></li>
								<li class=""><button>2</button></li>
								<li class=""><button>3</button></li>
								<li class=""><button>4</button></li>
								<li class=""><button>5</button></li>
							</ul>
						</div> --%>
						<!-- 여기다 -->
					</div>
					<div class="banner_alert lg" data-v-32b7052e="" data-v-01e212dd="">
						<a href="https://kream.co.kr/api/app/pages/notice_DZ5485-612.html"
							class="alert_wrap" data-v-32b7052e=""><div
								class="banner_alert_content" data-v-32b7052e="">
								<p class="alert_title" data-v-32b7052e="">
									<span class="care_mark" data-v-32b7052e="">주의</span><span
										class="alert_text" data-v-32b7052e="">상품 특이사항 안내</span>
								</p>
								<p class="alert_subtext" data-v-32b7052e="">해당 상품의 개체별 특이사항
									안내해드립니다.</p>
							</div>
							<div class="ico_arrow" style="display:;" data-v-32b7052e="">
								<svg xmlns="http://www.w3.org/2000/svg"
									class="ico-arr-type icon sprite-icons" data-v-32b7052e="">
									<use
										href="/_nuxt/3182c3b1ca2f77da7bc3e1acf109306c.svg#i-ico-arr-type"
										xlink:href="/_nuxt/3182c3b1ca2f77da7bc3e1acf109306c.svg#i-ico-arr-type"
										data-v-32b7052e=""></use></svg>
							</div></a>
					</div>
				</div>
			</div>
			<div class="column" data-v-01e212dd="">
				<div class="column_box" data-v-3900a1a2="" data-v-01e212dd="">
					<div class="column_top" data-v-3900a1a2="">
						<div class="detail_main_title lg" data-v-6e865099=""
							data-v-3900a1a2="">
							<div class="main_title_box" data-v-6e865099="">
								<div data-v-6e865099="">
									<a href="/brands/jordan" click.prevent="onClickBrand"
										class="brand" data-v-6e865099="">${productDetailDTO.brand}</a>
									<!---->
								</div>
								<p class="title" data-v-6e865099="">${productDetailDTO.pname_e}</p>
								<p class="sub_title" data-v-6e865099="">${productDetailDTO.pname_k}</p>
							</div>
						</div>
						<div class="product_figure_wrap lg" data-v-3900a1a2="">
							<div title="모든 사이즈" option-title="사이즈" class="detail_size"
								data-v-ddee2978="" data-v-3900a1a2="">
								<div class="title" data-v-ddee2978="">
									
								</div>
								<div class="size" data-v-ddee2978="">
								
								</div>
							</div>
							<div class="detail_price" data-v-679b6792="" data-v-3900a1a2="">
								<div class="title" data-v-679b6792="">
									<span class="title_txt" data-v-679b6792="">최근 거래가</span>
								</div>
								<div class="price" data-v-679b6792="">
									<div class="amount" data-v-679b6792="">
										<span class="num" data-v-679b6792="">${productDetailDTO.release_price}</span><span
											class="won" data-v-679b6792="">원</span>
									</div>
									<!-- 가격변화 추세 주석처리(임시) -->
									<!-- <div class="fluctuation increase" data-v-679b6792="">
										<p data-v-679b6792="">21,000원 (+5.3%)</p>
									</div> -->
								</div>
							</div>
						</div>
						<div data-v-3900a1a2="" class="btn_wrap">
							<div data-v-23bbaa82="" data-v-3900a1a2=""
								class="division_btn_box lg">
								<a data-v-23bbaa82="" href="/buy/select/${productDetailDTO.pid}?size=${size}" class="btn_division buy"><strong
									data-v-23bbaa82="" class="title">구매</strong>
									<div data-v-23bbaa82="" class="price">
										<span data-v-23bbaa82="" class="amount"><em
											data-v-23bbaa82="" class="num">${sellDTO.price}</em><span
											data-v-23bbaa82="" class="won">원</span></span><span
											data-v-23bbaa82="" class="desc">즉시 구매가</span>
									</div></a><a data-v-23bbaa82="" href="/sell/select/${productDetailDTO.pid}?size=${size}" class="btn_division sell"><strong
									data-v-23bbaa82="" class="title">판매</strong>
									<div data-v-23bbaa82="" class="price">
										<span data-v-23bbaa82="" class="amount"><em
											data-v-23bbaa82="" class="num">${buyDTO.price}</em><span
											data-v-23bbaa82="" class="won">원</span></span><span
											data-v-23bbaa82="" class="desc">즉시 판매가</span>
									</div></a>
							</div>
							
						</div>
					</div>
					<div class="product_info_wrap" data-v-3900a1a2="">
						<h3 class="detail_title info_title lg" data-v-52dd777b=""
							data-v-3900a1a2="">상품 정보</h3>
						<div class="detail_product_wrap" data-v-b809b0a6=""
							data-v-3900a1a2="">
							<dl class="detail_product" data-v-b809b0a6="">
								<div class="detail_box model_num" data-v-b809b0a6="">
									<dt class="product_title" data-v-b809b0a6="">모델번호</dt>
									<dd class="product_info" data-v-b809b0a6="">${productDetailDTO.model_number}</dd>
								</div>
								<div class="detail_box" data-v-b809b0a6="">
									<dt class="product_title" data-v-b809b0a6="">출시일</dt>
									<dd class="product_info" data-v-b809b0a6="">${productDetailDTO.release_date}</dd>
								</div>
								<div class="detail_box" data-v-b809b0a6="">
									<dt class="product_title" data-v-b809b0a6="">컬러</dt>
									<dd class="product_info" data-v-b809b0a6="">${productDetailDTO.color}</dd>
								</div>
								<div class="detail_box" data-v-b809b0a6="">
									<dt class="product_title" data-v-b809b0a6="">발매가</dt>
									<dd class="product_info" data-v-b809b0a6="">${productDetailDTO.release_price}원</dd>
								</div>
							</dl>
						</div>
					</div>
					<div class="delivery_way_wrap" data-v-3900a1a2="">
						<h3 class="detail_title lg" data-v-52dd777b="" data-v-3900a1a2="">
							배송 정보</h3>
						
						<div class="delivery_way" data-v-3584e297="" data-v-3900a1a2="">
							<div class="way_info" data-v-3584e297="">
								<div class="way_status_thumb" data-v-3584e297="">
									<img
										src="${pageContext.request.contextPath}/resources/images/delivery.jpg"
										alt="3,000원" class="way_img" data-v-3584e297="">
								</div>
								<div class="way_desc" data-v-3584e297="">
									<p class="company" data-v-3584e297="">
										<span class="badge_title" data-v-3584e297="">일반배송 </span><span
											class="title" data-v-3584e297="">3,000원</span>
										<!---->
									</p>
									<p class="sub_text" data-v-3584e297="">검수 후 배송 ・ 5-7일 내 도착
										예정</p>
								</div>
							</div>
							<!---->
						</div>
						
					</div>

					<div class="detail_wrap" data-v-3900a1a2=""
						style="margin-top: 30px">
						<div class="product_sales_graph" data-v-3900a1a2="">
							<div class="wrap_bids" data-v-4379daa7="" data-v-3900a1a2="">
								<div class="tab_area" data-v-b6b2883e="" data-v-4379daa7="">
									<ul role="tablist" class="tab_list" data-v-b6b2883e="">
										<li data-v-b6b2883e="" role="tab" aria-selected="true"
											aria-controls="panel1" class="item show on"><a
											data-v-b6b2883e="" href="#" class="item_link">체결 거래</a></li>
										<li data-v-b6b2883e="" role="tab" aria-selected="false"
											aria-controls="panel2" class="item"><a
											data-v-b6b2883e="" href="#" class="item_link">판매 입찰</a></li>
										<li data-v-b6b2883e="" role="tab" aria-selected="false"
											aria-controls="panel3" class="item"><a
											data-v-b6b2883e="" href="#" class="item_link">구매 입찰</a></li>
									</ul>
									<div id="panel1" role="tabpanel" span="sales"
										class="tab_content show" data-v-3c9dd7e9="" data-v-4379daa7=""
										data-v-b6b2883e="">
										<div class="table_wrap lg" data-v-50d58b3a=""
											data-v-4379daa7="" data-v-3c9dd7e9="">
											<table data-v-50d58b3a="">
												<caption data-v-50d58b3a="">
													<span class="blind" data-v-50d58b3a="">데이터 테이블</span>
												</caption>
												<colgroup data-v-50d58b3a="">
													<col style="width: 29.76%;" data-v-50d58b3a="">
													<col style="width: 36.52%;" data-v-50d58b3a="">
													<col style="width: 33.72%;" data-v-50d58b3a="">
												</colgroup>
												<thead data-v-50d58b3a="">
													<tr data-v-50d58b3a="">
														<th class="table_th" data-v-50d58b3a="">사이즈</th>
														<th class="table_th align_right" data-v-50d58b3a="">
															거래가</th>
														<th class="table_th align_right" data-v-50d58b3a="">
															거래일</th>
													</tr>
												</thead>
												<tbody data-v-50d58b3a="">
													<c:forEach var="allSignContract" items="${allSignContractList}">
														<tr data-v-50d58b3a="">
															<td class="table_td" data-v-50d58b3a="">${allSignContract.size_type } <!----></td>
															<td class="table_td align_right" data-v-50d58b3a="">
																${allSignContract.price }원 <i class="express_icon" data-v-50d58b3a=""><svg
																		xmlns="http://www.w3.org/2000/svg"
																		class="ico-express icon sprite-icons"
																		data-v-50d58b3a="">
																		<use
																			href="/_nuxt/3182c3b1ca2f77da7bc3e1acf109306c.svg#i-ico-express"
																			xlink:href="/_nuxt/3182c3b1ca2f77da7bc3e1acf109306c.svg#i-ico-express"
																			data-v-50d58b3a=""></use></svg><span class="blind"
																	data-v-50d58b3a="">빠른배송</span></i>
															</td>
															<td class="table_td align_right" data-v-50d58b3a="">
																${allSignContract.nowdate } <!---->
															</td>
														</tr>
													</c:forEach>
													
												</tbody>
											</table>
										</div>
										<a href="#" class="btn outlinegrey full medium"
											data-v-575aff82="" data-v-4379daa7="" data-v-3c9dd7e9="">
											체결 내역 더보기 </a>
									</div>
									<div id="panel2" role="tabpanel" span="asks"
										class="tab_content" data-v-3c9dd7e9="" data-v-4379daa7=""
										data-v-b6b2883e="">
										<div class="table_wrap lg" data-v-50d58b3a=""
											data-v-4379daa7="" data-v-3c9dd7e9="">
											<table data-v-50d58b3a="">
												<caption data-v-50d58b3a="">
													<span class="blind" data-v-50d58b3a="">데이터 테이블</span>
												</caption>
												<colgroup data-v-50d58b3a="">
													<col style="width: 29.76%;" data-v-50d58b3a="">
													<col style="width: 36.52%;" data-v-50d58b3a="">
													<col style="width: 33.72%;" data-v-50d58b3a="">
												</colgroup>
												<thead data-v-50d58b3a="">
													<tr data-v-50d58b3a="">
														<th class="table_th" data-v-50d58b3a="">사이즈</th>
														<th class="table_th align_right" data-v-50d58b3a="">
															판매 희망가</th>
														<th class="table_th align_right" data-v-50d58b3a="">
															수량</th>
													</tr>
												</thead>
												<tbody data-v-50d58b3a="">
												  <c:forEach var="allSellBid" items="${allSellBidList}">
													<tr data-v-50d58b3a="">
														<td class="table_td" data-v-50d58b3a="">${allSellBid.size_type}<!----></td>
														<td class="table_td align_right" data-v-50d58b3a="">
															${allSellBid.price}원 <!---->
														</td>
														<td class="table_td align_right" data-v-50d58b3a="">
															${allSellBid.amount}<!---->
														</td>
													</tr>
												</c:forEach>
												</tbody>
											</table>
										</div>
										<a href="#" class="btn outlinegrey full medium"
											data-v-575aff82="" data-v-4379daa7="" data-v-3c9dd7e9="">
											입찰 내역 더보기 </a>
									</div>
									<div id="panel3" role="tabpanel" span="bids"
										class="tab_content" data-v-3c9dd7e9="" data-v-4379daa7=""
										data-v-b6b2883e="">
										<div class="table_wrap lg" data-v-50d58b3a=""
											data-v-4379daa7="" data-v-3c9dd7e9="">
											<table data-v-50d58b3a="">
												<caption data-v-50d58b3a="">
													<span class="blind" data-v-50d58b3a="">데이터 테이블</span>
												</caption>
												<colgroup data-v-50d58b3a="">
													<col style="width: 29.76%;" data-v-50d58b3a="">
													<col style="width: 36.52%;" data-v-50d58b3a="">
													<col style="width: 33.72%;" data-v-50d58b3a="">
												</colgroup>
												<thead data-v-50d58b3a="">
													<tr data-v-50d58b3a="">
														<th class="table_th" data-v-50d58b3a="">사이즈</th>
														<th class="table_th align_right" data-v-50d58b3a="">
															구매 희망가</th>
														<th class="table_th align_right" data-v-50d58b3a="">
															수량</th>
													</tr>
												</thead>
												<tbody data-v-50d58b3a="">
												  <c:forEach var="allBuyBid" items="${allBuyBidList}">
													<tr data-v-50d58b3a="">
														<td class="table_td" data-v-50d58b3a="">${allBuyBid.size_type}<!----></td>
														<td class="table_td align_right" data-v-50d58b3a="">
															${allBuyBid.price}원 <!---->
														</td>
														<td class="table_td align_right" data-v-50d58b3a="">
															${allBuyBid.amount} <!---->
														</td>
													</tr>
												  </c:forEach>
												</tbody>
											</table>
										</div>
										<a href="#" class="btn outlinegrey full medium"
											data-v-575aff82="" data-v-4379daa7="" data-v-3c9dd7e9="">
											입찰 내역 더보기 </a>
									</div>
								</div>
							</div>
							<!---->
						</div>
						<!---->
					</div>
					<!---->
					<!---->
					<div class="floating_price lg" data-v-07cd4e36=""
						data-v-3900a1a2="">
						<div class="inner_box" data-v-07cd4e36="">
							<div data-v-07cd4e36="" class="product_area">
								<div data-v-07cd4e36="" class="product_thumb"
									style="background-color: rgb(246, 238, 237);">
									<picture data-v-878ec45c="" data-v-07cd4e36=""
										class="picture product_img">
									<source data-v-878ec45c="" type="image/webp"
										srcset="https://kream-phinf.pstatic.net/MjAyMjExMDRfMTkw/MDAxNjY3NTQzNTAxNjcw.yXF_j7EUnejzPqHyxvoziRB8ukEBpGX7RgDL8ziMtOEg.tjPT99BA1fdYa1THeylVQhNonJ_gqkCMxCTyqSEGhdQg.PNG/a_9388c64f95f54d29834d8fc13082a68e.png?type=m_webp">
									<source data-v-878ec45c=""
										srcset="https://kream-phinf.pstatic.net/MjAyMjExMDRfMTkw/MDAxNjY3NTQzNTAxNjcw.yXF_j7EUnejzPqHyxvoziRB8ukEBpGX7RgDL8ziMtOEg.tjPT99BA1fdYa1THeylVQhNonJ_gqkCMxCTyqSEGhdQg.PNG/a_9388c64f95f54d29834d8fc13082a68e.png?type=m">
									<img data-v-878ec45c="" alt="상품 이미지"
										src="https://kream-phinf.pstatic.net/MjAyMjExMDRfMTkw/MDAxNjY3NTQzNTAxNjcw.yXF_j7EUnejzPqHyxvoziRB8ukEBpGX7RgDL8ziMtOEg.tjPT99BA1fdYa1THeylVQhNonJ_gqkCMxCTyqSEGhdQg.PNG/a_9388c64f95f54d29834d8fc13082a68e.png?type=m"
										loading="lazy" class="image"></picture>
								</div>
								<div data-v-07cd4e36="" class="product_info">
									<p data-v-07cd4e36="" class="name">Jordan 1 Retro High OG
										Chicago 2022</p>
									<p data-v-07cd4e36="" class="translated_name">조던 1 레트로 하이
										OG 시카고 2022</p>
									<div data-v-6da6dff3="" data-v-07cd4e36=""
										class="badge badge_product shipping_express">빠른배송</div>
								</div>
							</div>
							<div class="btn_area" data-v-07cd4e36="">
								<a href="#" aria-label="관심상품"
									class="btn outlinegrey large btn_wish btn_wish_simple"
									data-v-575aff82="" data-v-2d0ab5c1="" data-v-07cd4e36=""><svg
										xmlns="http://www.w3.org/2000/svg"
										class="icon sprite-icons ico-wish-off" data-v-2d0ab5c1="">
										<use
											href="/_nuxt/3182c3b1ca2f77da7bc3e1acf109306c.svg#i-ico-wish-off"
											xlink:href="/_nuxt/3182c3b1ca2f77da7bc3e1acf109306c.svg#i-ico-wish-off"
											data-v-2d0ab5c1=""></use></svg> <!----> <span
									class="wish_count_num" data-v-2d0ab5c1="">3.2만</span></a>
								<div class="division_btn_box lg" data-v-23bbaa82=""
									data-v-07cd4e36="">
									<a href="/buy/select/${productDetailDTO.pid}?size=${size}" class="btn_division buy" data-v-23bbaa82=""><strong
										class="title" data-v-23bbaa82="">구매</strong>
										<div class="price" data-v-23bbaa82="">
											<span class="amount" data-v-23bbaa82=""><em
												class="num" data-v-23bbaa82="">405,000</em><span class="won"
												data-v-23bbaa82="">원</span></span><span class="desc"
												data-v-23bbaa82="">즉시 구매가</span>
										</div></a><a href="#" class="btn_division sell" data-v-23bbaa82=""><strong
										class="title" data-v-23bbaa82="">판매</strong>
										<div class="price" data-v-23bbaa82="">
											<span class="amount" data-v-23bbaa82=""><em
												class="num" data-v-23bbaa82="">554,000</em><span class="won"
												data-v-23bbaa82="">원</span></span><span class="desc"
												data-v-23bbaa82="">즉시 판매가</span>
										</div></a>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!---->
				<!---->
				<!---->
			</div>
		</div>
		<!---->
		<!---->
		<!---->
	</div>
	<div data-v-01e212dd="">
		<div class="other_stock" data-v-b5bc0164="" data-v-01e212dd="">
			<div class="title" data-v-b5bc0164="">
				<h3 class="title_text" data-v-b5bc0164="">
					<em>95점</em> 추천 상품
				</h3>
				<div class="title_desc" data-v-b5bc0164="">
					<a href="#" class="help_btn" data-v-b5bc0164="">95점<svg
							xmlns="http://www.w3.org/2000/svg"
							class="ico-help icon sprite-icons" data-v-b5bc0164="">
							<use
								href="/_nuxt/3182c3b1ca2f77da7bc3e1acf109306c.svg#i-ico-help"
								xlink:href="/_nuxt/3182c3b1ca2f77da7bc3e1acf109306c.svg#i-ico-help"
								data-v-b5bc0164=""></use></svg></a>
				</div>
			</div>
			<div class="other_stock_list" data-v-b5bc0164="">
				<div class="stock_list_item" data-v-2367be08="" data-v-b5bc0164="">
					<a href="/products/stock/1838312" class="item_inner"
						data-v-2367be08=""><div class="product_thumb"
							data-v-2367be08="">
							<div class="product" style="background-color: #f2f2f2;"
								data-v-09fbcf09="" data-v-2367be08="">
								<picture class="picture product_img" data-v-878ec45c=""
									data-v-09fbcf09="">
								<source type="image/webp"
									srcset="https://kream-phinf.pstatic.net/MjAyMjEyMDFfNDgg/MDAxNjY5ODc1MzI5ODcx.6mQdYYNr4LEpe-z89jGl5DqPP6oVsd_IkufyHaXS9AUg.Mr3n5Q4GEB9h-w4sB2vQS1GMBhpoFcDK427oaq_G_7cg.PNG/a_bd794001d93d41519a64b3178fe65da0.png?type=m_webp"
									data-v-878ec45c="">
								<source
									srcset="https://kream-phinf.pstatic.net/MjAyMjEyMDFfNDgg/MDAxNjY5ODc1MzI5ODcx.6mQdYYNr4LEpe-z89jGl5DqPP6oVsd_IkufyHaXS9AUg.Mr3n5Q4GEB9h-w4sB2vQS1GMBhpoFcDK427oaq_G_7cg.PNG/a_bd794001d93d41519a64b3178fe65da0.png?type=m"
									data-v-878ec45c="">
								<img alt="상품 이미지"
									src="https://kream-phinf.pstatic.net/MjAyMjEyMDFfNDgg/MDAxNjY5ODc1MzI5ODcx.6mQdYYNr4LEpe-z89jGl5DqPP6oVsd_IkufyHaXS9AUg.Mr3n5Q4GEB9h-w4sB2vQS1GMBhpoFcDK427oaq_G_7cg.PNG/a_bd794001d93d41519a64b3178fe65da0.png?type=m"
									loading="lazy" class="image" data-v-878ec45c=""></picture>
								<!---->
								<!---->
								<em class="stocked_status_mark" data-v-09fbcf09=""> 95점 </em>
								<!---->
							</div>
							<!---->
						</div>
						<div class="product_info" data-v-2367be08="">
							<div class="product_detail" data-v-2367be08="">
								<p class="size" data-v-2367be08="">310</p>
								<p class="name" data-v-2367be08="">Jordan 1 Retro High OG
									Chicago 2022</p>
								<span class="express_mark" data-v-2367be08="">빠른배송</span>
							</div>
							<div class="product_price" data-v-2367be08="">
								<p class="origin_price" data-v-2367be08="">550,000</p>
								<p class="discount_price" data-v-2367be08="">
									<em class="discount_per" data-v-2367be08="">10%</em><span
										class="amount" data-v-2367be08="">500,000</span><span
										class="won" data-v-2367be08="">원</span>
								</p>
								<p class="price_desc" data-v-2367be08="">95점 구매가</p>
							</div>
						</div></a>
				</div>
				<div class="stock_list_item" data-v-2367be08="" data-v-b5bc0164="">
					<a href="/products/stock/1915678" class="item_inner"
						data-v-2367be08=""><div class="product_thumb"
							data-v-2367be08="">
							<div class="product" style="background-color: #f2f2f2;"
								data-v-09fbcf09="" data-v-2367be08="">
								<picture class="picture product_img" data-v-878ec45c=""
									data-v-09fbcf09="">
								<source type="image/webp"
									srcset="https://kream-phinf.pstatic.net/MjAyMjEyMDlfMjE3/MDAxNjcwNTc0MDc3MTgz.FWHjFBpoe_ghXUO_6x_lnDNnmcIpXdR40XHavKzSl7Eg.a79X7Z-yqyDjcWv2-6p-9Ts6DUFQH7tBpwRQYAgsQbAg.PNG/a_c36d30fd18594badab0ad2b88e327d7f.png?type=m_webp"
									data-v-878ec45c="">
								<source
									srcset="https://kream-phinf.pstatic.net/MjAyMjEyMDlfMjE3/MDAxNjcwNTc0MDc3MTgz.FWHjFBpoe_ghXUO_6x_lnDNnmcIpXdR40XHavKzSl7Eg.a79X7Z-yqyDjcWv2-6p-9Ts6DUFQH7tBpwRQYAgsQbAg.PNG/a_c36d30fd18594badab0ad2b88e327d7f.png?type=m"
									data-v-878ec45c="">
								<img alt="상품 이미지"
									src="https://kream-phinf.pstatic.net/MjAyMjEyMDlfMjE3/MDAxNjcwNTc0MDc3MTgz.FWHjFBpoe_ghXUO_6x_lnDNnmcIpXdR40XHavKzSl7Eg.a79X7Z-yqyDjcWv2-6p-9Ts6DUFQH7tBpwRQYAgsQbAg.PNG/a_c36d30fd18594badab0ad2b88e327d7f.png?type=m"
									loading="lazy" class="image" data-v-878ec45c=""></picture>
								<!---->
								<!---->
								<em class="stocked_status_mark" data-v-09fbcf09=""> 95점 </em>
								<!---->
							</div>
							<!---->
						</div>
						<div class="product_info" data-v-2367be08="">
							<div class="product_detail" data-v-2367be08="">
								<p class="size" data-v-2367be08="">240(US 6)</p>
								<p class="name" data-v-2367be08="">Jordan 1 Retro High OG
									Chicago 2022</p>
								<span class="express_mark" data-v-2367be08="">빠른배송</span>
							</div>
							<div class="product_price" data-v-2367be08="">
								<!---->
								<p class="discount_price" data-v-2367be08="">
									<!---->
									<span class="amount" data-v-2367be08="">589,000</span><span
										class="won" data-v-2367be08="">원</span>
								</p>
								<p class="price_desc" data-v-2367be08="">95점 구매가</p>
							</div>
						</div></a>
				</div>
				<div class="stock_list_item" data-v-2367be08="" data-v-b5bc0164="">
					<a href="/products/stock/1916738" class="item_inner"
						data-v-2367be08=""><div class="product_thumb"
							data-v-2367be08="">
							<div class="product" style="background-color: #f2f2f2;"
								data-v-09fbcf09="" data-v-2367be08="">
								<picture class="picture product_img" data-v-878ec45c=""
									data-v-09fbcf09="">
								<source type="image/webp"
									srcset="https://kream-phinf.pstatic.net/MjAyMjEyMTJfMjQ4/MDAxNjcwODA4NDE0Nzgx.nTTvlTCVGNygglG5NkEdjv0cfdOPWlwD2ctHc-eu8wYg.bDmT0EzfsZGee54gkvuQvj-O_s4g0rek-wwBaJKMJlog.PNG/a_70a999b7fd5849f2b27cc36198ad6b52.png?type=m_webp"
									data-v-878ec45c="">
								<source
									srcset="https://kream-phinf.pstatic.net/MjAyMjEyMTJfMjQ4/MDAxNjcwODA4NDE0Nzgx.nTTvlTCVGNygglG5NkEdjv0cfdOPWlwD2ctHc-eu8wYg.bDmT0EzfsZGee54gkvuQvj-O_s4g0rek-wwBaJKMJlog.PNG/a_70a999b7fd5849f2b27cc36198ad6b52.png?type=m"
									data-v-878ec45c="">
								<img alt="상품 이미지"
									src="https://kream-phinf.pstatic.net/MjAyMjEyMTJfMjQ4/MDAxNjcwODA4NDE0Nzgx.nTTvlTCVGNygglG5NkEdjv0cfdOPWlwD2ctHc-eu8wYg.bDmT0EzfsZGee54gkvuQvj-O_s4g0rek-wwBaJKMJlog.PNG/a_70a999b7fd5849f2b27cc36198ad6b52.png?type=m"
									loading="lazy" class="image" data-v-878ec45c=""></picture>
								<!---->
								<!---->
								<em class="stocked_status_mark" data-v-09fbcf09=""> 95점 </em>
								<!---->
							</div>
							<!---->
						</div>
						<div class="product_info" data-v-2367be08="">
							<div class="product_detail" data-v-2367be08="">
								<p class="size" data-v-2367be08="">265</p>
								<p class="name" data-v-2367be08="">Jordan 1 Retro High OG
									Chicago 2022</p>
								<span class="express_mark" data-v-2367be08="">빠른배송</span>
							</div>
							<div class="product_price" data-v-2367be08="">
								<!---->
								<p class="discount_price" data-v-2367be08="">
									<!---->
									<span class="amount" data-v-2367be08="">489,000</span><span
										class="won" data-v-2367be08="">원</span>
								</p>
								<p class="price_desc" data-v-2367be08="">95점 구매가</p>
							</div>
						</div></a>
				</div>
				<div class="stock_list_item" data-v-2367be08="" data-v-b5bc0164="">
					<a href="/products/stock/1951867" class="item_inner"
						data-v-2367be08=""><div class="product_thumb"
							data-v-2367be08="">
							<div class="product" style="background-color: #f2f2f2;"
								data-v-09fbcf09="" data-v-2367be08="">
								<picture class="picture product_img" data-v-878ec45c=""
									data-v-09fbcf09="">
								<source type="image/webp"
									srcset="https://kream-phinf.pstatic.net/MjAyMjEyMDhfMjcy/MDAxNjcwNDY1NjM3MjYw.UnyhxRhWIto4hIIu_GGBE8c5iMP1An1Hcv7G-HbMxxQg._eKCr-V9ORT8kpaxlDgfTQtMI5QMcdDRB6dMXLiE2sYg.PNG/a_82023ceca539427882a6c3c8d1b55b66.png?type=m_webp"
									data-v-878ec45c="">
								<source
									srcset="https://kream-phinf.pstatic.net/MjAyMjEyMDhfMjcy/MDAxNjcwNDY1NjM3MjYw.UnyhxRhWIto4hIIu_GGBE8c5iMP1An1Hcv7G-HbMxxQg._eKCr-V9ORT8kpaxlDgfTQtMI5QMcdDRB6dMXLiE2sYg.PNG/a_82023ceca539427882a6c3c8d1b55b66.png?type=m"
									data-v-878ec45c="">
								<img alt="상품 이미지"
									src="https://kream-phinf.pstatic.net/MjAyMjEyMDhfMjcy/MDAxNjcwNDY1NjM3MjYw.UnyhxRhWIto4hIIu_GGBE8c5iMP1An1Hcv7G-HbMxxQg._eKCr-V9ORT8kpaxlDgfTQtMI5QMcdDRB6dMXLiE2sYg.PNG/a_82023ceca539427882a6c3c8d1b55b66.png?type=m"
									loading="lazy" class="image" data-v-878ec45c=""></picture>
								<!---->
								<!---->
								<em class="stocked_status_mark" data-v-09fbcf09=""> 95점 </em>
								<!---->
							</div>
							<!---->
						</div>
						<div class="product_info" data-v-2367be08="">
							<div class="product_detail" data-v-2367be08="">
								<p class="size" data-v-2367be08="">265</p>
								<p class="name" data-v-2367be08="">Jordan 1 Retro High OG
									Chicago 2022</p>
								<span class="express_mark" data-v-2367be08="">빠른배송</span>
							</div>
							<div class="product_price" data-v-2367be08="">
								<!---->
								<p class="discount_price" data-v-2367be08="">
									<!---->
									<span class="amount" data-v-2367be08="">500,000</span><span
										class="won" data-v-2367be08="">원</span>
								</p>
								<p class="price_desc" data-v-2367be08="">95점 구매가</p>
							</div>
						</div></a>
				</div>
				<div class="stock_list_item" data-v-2367be08="" data-v-b5bc0164="">
					<a href="/products/stock/2000907" class="item_inner"
						data-v-2367be08=""><div class="product_thumb"
							data-v-2367be08="">
							<div class="product" style="background-color: #f2f2f2;"
								data-v-09fbcf09="" data-v-2367be08="">
								<picture class="picture product_img" data-v-878ec45c=""
									data-v-09fbcf09="">
								<source type="image/webp"
									srcset="https://kream-phinf.pstatic.net/MjAyMjEyMjBfNjIg/MDAxNjcxNTIyMzkxOTk5.KHoaNSE6IdAZFUtM_uBuVAXe-zwZ09DfvhzjvVO_XgQg.k70XJVhY2_h8hf4slRbahLR0HNBlm2U3AUvqDuGZ0tkg.PNG/a_a7201d1d7c524a21a28aa24d27184bdd.png?type=m_webp"
									data-v-878ec45c="">
								<source
									srcset="https://kream-phinf.pstatic.net/MjAyMjEyMjBfNjIg/MDAxNjcxNTIyMzkxOTk5.KHoaNSE6IdAZFUtM_uBuVAXe-zwZ09DfvhzjvVO_XgQg.k70XJVhY2_h8hf4slRbahLR0HNBlm2U3AUvqDuGZ0tkg.PNG/a_a7201d1d7c524a21a28aa24d27184bdd.png?type=m"
									data-v-878ec45c="">
								<img alt="상품 이미지"
									src="https://kream-phinf.pstatic.net/MjAyMjEyMjBfNjIg/MDAxNjcxNTIyMzkxOTk5.KHoaNSE6IdAZFUtM_uBuVAXe-zwZ09DfvhzjvVO_XgQg.k70XJVhY2_h8hf4slRbahLR0HNBlm2U3AUvqDuGZ0tkg.PNG/a_a7201d1d7c524a21a28aa24d27184bdd.png?type=m"
									loading="lazy" class="image" data-v-878ec45c=""></picture>
								<!---->
								<!---->
								<em class="stocked_status_mark" data-v-09fbcf09=""> 95점 </em>
								<!---->
							</div>
							<!---->
						</div>
						<div class="product_info" data-v-2367be08="">
							<div class="product_detail" data-v-2367be08="">
								<p class="size" data-v-2367be08="">230</p>
								<p class="name" data-v-2367be08="">Jordan 1 Retro High OG
									Chicago 2022</p>
								<span class="express_mark" data-v-2367be08="">빠른배송</span>
							</div>
							<div class="product_price" data-v-2367be08="">
								<!---->
								<p class="discount_price" data-v-2367be08="">
									<!---->
									<span class="amount" data-v-2367be08="">450,000</span><span
										class="won" data-v-2367be08="">원</span>
								</p>
								<p class="price_desc" data-v-2367be08="">95점 구매가</p>
							</div>
						</div></a>
				</div>
				<div class="stock_list_item" data-v-2367be08="" data-v-b5bc0164="">
					<a href="/products/stock/2017459" class="item_inner"
						data-v-2367be08=""><div class="product_thumb"
							data-v-2367be08="">
							<div class="product" style="background-color: #f2f2f2;"
								data-v-09fbcf09="" data-v-2367be08="">
								<picture class="picture product_img" data-v-878ec45c=""
									data-v-09fbcf09="">
								<source type="image/webp"
									srcset="https://kream-phinf.pstatic.net/MjAyMjEyMTVfMTY5/MDAxNjcxMTEyOTUzODA1.ae8-WWKYv7HIdMCY9LpLP8Fd8S09fh3cZyI0hJ3PPbAg.WgojVzP3jcqxdTq2wmzvMPGLnZZzT8njQTyyHWdN3isg.PNG/a_56f740dd136249f6b527977be34a288f.png?type=m_webp"
									data-v-878ec45c="">
								<source
									srcset="https://kream-phinf.pstatic.net/MjAyMjEyMTVfMTY5/MDAxNjcxMTEyOTUzODA1.ae8-WWKYv7HIdMCY9LpLP8Fd8S09fh3cZyI0hJ3PPbAg.WgojVzP3jcqxdTq2wmzvMPGLnZZzT8njQTyyHWdN3isg.PNG/a_56f740dd136249f6b527977be34a288f.png?type=m"
									data-v-878ec45c="">
								<img alt="상품 이미지"
									src="https://kream-phinf.pstatic.net/MjAyMjEyMTVfMTY5/MDAxNjcxMTEyOTUzODA1.ae8-WWKYv7HIdMCY9LpLP8Fd8S09fh3cZyI0hJ3PPbAg.WgojVzP3jcqxdTq2wmzvMPGLnZZzT8njQTyyHWdN3isg.PNG/a_56f740dd136249f6b527977be34a288f.png?type=m"
									loading="lazy" class="image" data-v-878ec45c=""></picture>
								<!---->
								<!---->
								<em class="stocked_status_mark" data-v-09fbcf09=""> 95점 </em>
								<!---->
							</div>
							<!---->
						</div>
						<div class="product_info" data-v-2367be08="">
							<div class="product_detail" data-v-2367be08="">
								<p class="size" data-v-2367be08="">280</p>
								<p class="name" data-v-2367be08="">Jordan 1 Retro High OG
									Chicago 2022</p>
								<span class="express_mark" data-v-2367be08="">빠른배송</span>
							</div>
							<div class="product_price" data-v-2367be08="">
								<p class="origin_price" data-v-2367be08="">507,000</p>
								<p class="discount_price" data-v-2367be08="">
									<em class="discount_per" data-v-2367be08="">2%</em><span
										class="amount" data-v-2367be08="">500,000</span><span
										class="won" data-v-2367be08="">원</span>
								</p>
								<p class="price_desc" data-v-2367be08="">95점 구매가</p>
							</div>
						</div></a>
				</div>
				<div class="stock_list_item" data-v-2367be08="" data-v-b5bc0164="">
					<a href="/products/stock/2027745" class="item_inner"
						data-v-2367be08=""><div class="product_thumb"
							data-v-2367be08="">
							<div class="product" style="background-color: #f2f2f2;"
								data-v-09fbcf09="" data-v-2367be08="">
								<picture class="picture product_img" data-v-878ec45c=""
									data-v-09fbcf09="">
								<source type="image/webp"
									srcset="https://kream-phinf.pstatic.net/MjAyMjEyMjFfMTUx/MDAxNjcxNjE5MjkwMjAx.1yE01BKaTSnVErARlMU3eWJxdIQqqiZvM5VbqF-wKlMg.y3id-kPD0FppSgjABtplXDxGwXaZ8hgUbAZB0nsoYwQg.PNG/a_e4fa75dbdf744a458b7aeb49faa5e3a6.png?type=m_webp"
									data-v-878ec45c="">
								<source
									srcset="https://kream-phinf.pstatic.net/MjAyMjEyMjFfMTUx/MDAxNjcxNjE5MjkwMjAx.1yE01BKaTSnVErARlMU3eWJxdIQqqiZvM5VbqF-wKlMg.y3id-kPD0FppSgjABtplXDxGwXaZ8hgUbAZB0nsoYwQg.PNG/a_e4fa75dbdf744a458b7aeb49faa5e3a6.png?type=m"
									data-v-878ec45c="">
								<img alt="상품 이미지"
									src="https://kream-phinf.pstatic.net/MjAyMjEyMjFfMTUx/MDAxNjcxNjE5MjkwMjAx.1yE01BKaTSnVErARlMU3eWJxdIQqqiZvM5VbqF-wKlMg.y3id-kPD0FppSgjABtplXDxGwXaZ8hgUbAZB0nsoYwQg.PNG/a_e4fa75dbdf744a458b7aeb49faa5e3a6.png?type=m"
									loading="lazy" class="image" data-v-878ec45c=""></picture>
								<!---->
								<!---->
								<em class="stocked_status_mark" data-v-09fbcf09=""> 95점 </em>
								<!---->
							</div>
							<!---->
						</div>
						<div class="product_info" data-v-2367be08="">
							<div class="product_detail" data-v-2367be08="">
								<p class="size" data-v-2367be08="">230</p>
								<p class="name" data-v-2367be08="">Jordan 1 Retro High OG
									Chicago 2022</p>
								<span class="express_mark" data-v-2367be08="">빠른배송</span>
							</div>
							<div class="product_price" data-v-2367be08="">
								<!---->
								<p class="discount_price" data-v-2367be08="">
									<!---->
									<span class="amount" data-v-2367be08="">448,000</span><span
										class="won" data-v-2367be08="">원</span>
								</p>
								<p class="price_desc" data-v-2367be08="">95점 구매가</p>
							</div>
						</div></a>
				</div>
				<div class="stock_list_item" data-v-2367be08="" data-v-b5bc0164="">
					<a href="/products/stock/2033241" class="item_inner"
						data-v-2367be08=""><div class="product_thumb"
							data-v-2367be08="">
							<div class="product" style="background-color: #f2f2f2;"
								data-v-09fbcf09="" data-v-2367be08="">
								<picture class="picture product_img" data-v-878ec45c=""
									data-v-09fbcf09="">
								<source type="image/webp"
									srcset="https://kream-phinf.pstatic.net/MjAyMjEyMjJfMTMz/MDAxNjcxNjg2OTkxMTYz.NJCS0zq5kghnX3bP1NO1RQckh8y2r52qynq6ixbyPv0g.-SovkGe8jwf8lK1IeIApykAMCgzJhBYf2Yo1blmSbRUg.PNG/a_46f8a5a581bb408cb0b92106ea620d5f.png?type=m_webp"
									data-v-878ec45c="">
								<source
									srcset="https://kream-phinf.pstatic.net/MjAyMjEyMjJfMTMz/MDAxNjcxNjg2OTkxMTYz.NJCS0zq5kghnX3bP1NO1RQckh8y2r52qynq6ixbyPv0g.-SovkGe8jwf8lK1IeIApykAMCgzJhBYf2Yo1blmSbRUg.PNG/a_46f8a5a581bb408cb0b92106ea620d5f.png?type=m"
									data-v-878ec45c="">
								<img alt="상품 이미지"
									src="https://kream-phinf.pstatic.net/MjAyMjEyMjJfMTMz/MDAxNjcxNjg2OTkxMTYz.NJCS0zq5kghnX3bP1NO1RQckh8y2r52qynq6ixbyPv0g.-SovkGe8jwf8lK1IeIApykAMCgzJhBYf2Yo1blmSbRUg.PNG/a_46f8a5a581bb408cb0b92106ea620d5f.png?type=m"
									loading="lazy" class="image" data-v-878ec45c=""></picture>
								<!---->
								<!---->
								<em class="stocked_status_mark" data-v-09fbcf09=""> 95점 </em>
								<!---->
							</div>
							<!---->
						</div>
						<div class="product_info" data-v-2367be08="">
							<div class="product_detail" data-v-2367be08="">
								<p class="size" data-v-2367be08="">240(US 6)</p>
								<p class="name" data-v-2367be08="">Jordan 1 Retro High OG
									Chicago 2022</p>
								<span class="express_mark" data-v-2367be08="">빠른배송</span>
							</div>
							<div class="product_price" data-v-2367be08="">
								<!---->
								<p class="discount_price" data-v-2367be08="">
									<!---->
									<span class="amount" data-v-2367be08="">549,000</span><span
										class="won" data-v-2367be08="">원</span>
								</p>
								<p class="price_desc" data-v-2367be08="">95점 구매가</p>
							</div>
						</div></a>
				</div>
				<div class="stock_list_item" data-v-2367be08="" data-v-b5bc0164="">
					<a href="/products/stock/2056191" class="item_inner"
						data-v-2367be08=""><div class="product_thumb"
							data-v-2367be08="">
							<div class="product" style="background-color: #f2f2f2;"
								data-v-09fbcf09="" data-v-2367be08="">
								<picture class="picture product_img" data-v-878ec45c=""
									data-v-09fbcf09="">
								<source type="image/webp"
									srcset="https://kream-phinf.pstatic.net/MjAyMjEyMjBfMzEg/MDAxNjcxNTE2ODU3MjMy.sL1nw2-wONObqm-a43ENWNfSevNtXankNOEdvFiS93wg.PeN6eQ5D-CyJRhwzz1h3Q2M1uijw6zj7-t7uVRTZM6Eg.PNG/a_25c2a765ae8947dbaea58d74a43bb2a3.png?type=m_webp"
									data-v-878ec45c="">
								<source
									srcset="https://kream-phinf.pstatic.net/MjAyMjEyMjBfMzEg/MDAxNjcxNTE2ODU3MjMy.sL1nw2-wONObqm-a43ENWNfSevNtXankNOEdvFiS93wg.PeN6eQ5D-CyJRhwzz1h3Q2M1uijw6zj7-t7uVRTZM6Eg.PNG/a_25c2a765ae8947dbaea58d74a43bb2a3.png?type=m"
									data-v-878ec45c="">
								<img alt="상품 이미지"
									src="https://kream-phinf.pstatic.net/MjAyMjEyMjBfMzEg/MDAxNjcxNTE2ODU3MjMy.sL1nw2-wONObqm-a43ENWNfSevNtXankNOEdvFiS93wg.PeN6eQ5D-CyJRhwzz1h3Q2M1uijw6zj7-t7uVRTZM6Eg.PNG/a_25c2a765ae8947dbaea58d74a43bb2a3.png?type=m"
									loading="lazy" class="image" data-v-878ec45c=""></picture>
								<!---->
								<!---->
								<em class="stocked_status_mark" data-v-09fbcf09=""> 95점 </em>
								<!---->
							</div>
							<!---->
						</div>
						<div class="product_info" data-v-2367be08="">
							<div class="product_detail" data-v-2367be08="">
								<p class="size" data-v-2367be08="">255</p>
								<p class="name" data-v-2367be08="">Jordan 1 Retro High OG
									Chicago 2022</p>
								<span class="express_mark" data-v-2367be08="">빠른배송</span>
							</div>
							<div class="product_price" data-v-2367be08="">
								<!---->
								<p class="discount_price" data-v-2367be08="">
									<!---->
									<span class="amount" data-v-2367be08="">550,000</span><span
										class="won" data-v-2367be08="">원</span>
								</p>
								<p class="price_desc" data-v-2367be08="">95점 구매가</p>
							</div>
						</div></a>
				</div>
				<div class="stock_list_item" data-v-2367be08="" data-v-b5bc0164="">
					<a href="/products/stock/2078989" class="item_inner"
						data-v-2367be08=""><div class="product_thumb"
							data-v-2367be08="">
							<div class="product" style="background-color: #f2f2f2;"
								data-v-09fbcf09="" data-v-2367be08="">
								<picture class="picture product_img" data-v-878ec45c=""
									data-v-09fbcf09="">
								<source type="image/webp"
									srcset="https://kream-phinf.pstatic.net/MjAyMjEyMzBfNTAg/MDAxNjcyMzY0NDM2OTcy.ggWqXpm0fXWSXa3ZtFbDb04YoQ-jyYjjTVocAIBG_fMg.KK4BpSd8gNrW5Qs82s4G4c8ri3agn9U4dR3-pS1Zr_8g.PNG/a_4e5d1dcfe3a74fbfa81b03ff56eb071f.png?type=m_webp"
									data-v-878ec45c="">
								<source
									srcset="https://kream-phinf.pstatic.net/MjAyMjEyMzBfNTAg/MDAxNjcyMzY0NDM2OTcy.ggWqXpm0fXWSXa3ZtFbDb04YoQ-jyYjjTVocAIBG_fMg.KK4BpSd8gNrW5Qs82s4G4c8ri3agn9U4dR3-pS1Zr_8g.PNG/a_4e5d1dcfe3a74fbfa81b03ff56eb071f.png?type=m"
									data-v-878ec45c="">
								<img alt="상품 이미지"
									src="https://kream-phinf.pstatic.net/MjAyMjEyMzBfNTAg/MDAxNjcyMzY0NDM2OTcy.ggWqXpm0fXWSXa3ZtFbDb04YoQ-jyYjjTVocAIBG_fMg.KK4BpSd8gNrW5Qs82s4G4c8ri3agn9U4dR3-pS1Zr_8g.PNG/a_4e5d1dcfe3a74fbfa81b03ff56eb071f.png?type=m"
									loading="lazy" class="image" data-v-878ec45c=""></picture>
								<!---->
								<!---->
								<em class="stocked_status_mark" data-v-09fbcf09=""> 95점 </em>
								<!---->
							</div>
							<!---->
						</div>
						<div class="product_info" data-v-2367be08="">
							<div class="product_detail" data-v-2367be08="">
								<p class="size" data-v-2367be08="">225</p>
								<p class="name" data-v-2367be08="">Jordan 1 Retro High OG
									Chicago 2022</p>
								<span class="express_mark" data-v-2367be08="">빠른배송</span>
							</div>
							<div class="product_price" data-v-2367be08="">
								<p class="origin_price" data-v-2367be08="">430,000</p>
								<p class="discount_price" data-v-2367be08="">
									<em class="discount_per" data-v-2367be08="">3%</em><span
										class="amount" data-v-2367be08="">420,000</span><span
										class="won" data-v-2367be08="">원</span>
								</p>
								<p class="price_desc" data-v-2367be08="">95점 구매가</p>
							</div>
						</div></a>
				</div>
			</div>
			<!---->
		</div>
		<div class="feed_area" data-v-02e77beb="" data-v-01e212dd="">
			<h2 class="feed_title" data-v-02e77beb="">
			</h2>
			<!-- 긍부정에 대한 리뷰 -->
			<div class="product-detail-tab tab-wrap2 anchor-wrap">
				<ul class="tabs">
					<li class="on">
						<a href="#tab01">
							<span>긍정리뷰</span>
						</a>
					</li>
					<li class="">
						<a href="#tab02">
							<span id="tabReviewCnt">비판리뷰</span>
						</a>
					</li>
				
				</ul>
				<div class="tabcontent">
				<!-- 긍정리뷰 정보 -->
				<section id="tab01"
					class="anchor-section product-detail-review">
					<h3 class="sec-title">긍정리뷰</h3>
					<div class="review-total">
						<div class="member-total-point">
							<h4 class="tit">사용자 총 평점</h4>
							<p class="point size-l">
								<span class="ico" style="width: 98%;">별점</span> <span
									class="num">4.9</span>
							</p>
						</div>

						<div class="chart-wrap" id="chartSlide" data-slide-length="4">
							<div class="slide-container swiper-container-horizontal">
								<div class="swiper-wrapper"
									style="transition-duration: 0ms; transform: translate3d(-592px, 0px, 0px);">
									<div class="swiper-slide swiper-slide-duplicate"
										data-swiper-slide-index="2" style="width: 296px;">
										<div class="chart">
											<p class="tit">신축성</p>
											<div class="piechart-wrap">
												<span class="piechart over" style="transform: rotate(0deg);">
													<span class="rotate" style="transform: rotate(216deg);"><span>좋음</span></span>
													<span class="percent"><strong class="num">60</strong>%</span>
												</span> <span class="piechart" style="transform: rotate(216deg);">
													<span class="rotate" style="transform: rotate(108deg);"><span>약간
															있음</span></span> <span class="percent"><strong class="num">30</strong>%</span>
												</span> <span class="piechart" style="transform: rotate(324deg);">
													<span class="rotate" style="transform: rotate(36deg);"><span>없음</span></span>
													<span class="percent"><strong class="num">10</strong>%</span>
												</span>
											</div>
										</div>
										<ul class="sub">
											<li>좋음</li>
											<li>약간 있음</li>
											<li>없음</li>
										</ul>
									</div>
									<div
										class="swiper-slide swiper-slide-duplicate swiper-slide-prev"
										data-swiper-slide-index="3" style="width: 296px;">
										<div class="chart">
											<p class="tit">비침</p>
											<div class="piechart-wrap">
												<span class="piechart" style="transform: rotate(0deg);">
													<span class="rotate" style="transform: rotate(108deg);"><span>있음</span></span>
													<span class="percent"><strong class="num">30</strong>%</span>
												</span> <span class="piechart" style="transform: rotate(108deg);">
													<span class="rotate" style="transform: rotate(0deg);"><span>약간
															있음</span></span> <span class="percent"><strong class="num">0</strong>%</span>
												</span> <span class="piechart over"
													style="transform: rotate(108deg);"> <span
													class="rotate" style="transform: rotate(252deg);"><span>없음</span></span>
													<span class="percent"><strong class="num">70</strong>%</span>
												</span>
											</div>
										</div>
										<ul class="sub">
											<li>있음</li>
											<li>약간 있음</li>
											<li>없음</li>
										</ul>
									</div>
									<div class="swiper-slide swiper-slide-active"
										data-swiper-slide-index="0" style="width: 296px;">
										<div class="chart">
											<p class="tit">핏감</p>
											<div class="piechart-wrap">
												<span class="piechart over" style="transform: rotate(0deg);">
													<span class="rotate" style="transform: rotate(216deg);"><span>슬림</span></span>
													<span class="percent"><strong class="num">60</strong>%</span>
												</span> <span class="piechart" style="transform: rotate(216deg);">
													<span class="rotate" style="transform: rotate(144deg);"><span>레귤러</span></span>
													<span class="percent"><strong class="num">40</strong>%</span>
												</span> <span class="piechart" style="transform: rotate(360deg);">
													<span class="rotate" style="transform: rotate(0deg);"><span>오버사이즈</span></span>
													<span class="percent"><strong class="num">0</strong>%</span>
												</span>
											</div>
										</div>
										<ul class="sub">
											<li>슬림</li>
											<li>레귤러</li>
											<li>오버사이즈</li>
										</ul>
									</div>
									<div class="swiper-slide swiper-slide-next"
										data-swiper-slide-index="1" style="width: 296px;">
										<div class="chart">
											<p class="tit">두께감</p>
											<div class="piechart-wrap">
												<span class="piechart over" style="transform: rotate(0deg);">
													<span class="rotate" style="transform: rotate(216deg);"><span>얇음</span></span>
													<span class="percent"><strong class="num">60</strong>%</span>
												</span> <span class="piechart" style="transform: rotate(216deg);">
													<span class="rotate" style="transform: rotate(144deg);"><span>보통</span></span>
													<span class="percent"><strong class="num">40</strong>%</span>
												</span> <span class="piechart" style="transform: rotate(360deg);">
													<span class="rotate" style="transform: rotate(0deg);"><span>도톰함</span></span>
													<span class="percent"><strong class="num">0</strong>%</span>
												</span>
											</div>
										</div>
										<ul class="sub">
											<li>얇음</li>
											<li>보통</li>
											<li>도톰함</li>
										</ul>
									</div>
									<div class="swiper-slide" data-swiper-slide-index="2"
										style="width: 296px;">
										<div class="chart">
											<p class="tit">신축성</p>
											<div class="piechart-wrap">
												<span class="piechart over" style="transform: rotate(0deg);">
													<span class="rotate" style="transform: rotate(216deg);"><span>좋음</span></span>
													<span class="percent"><strong class="num">60</strong>%</span>
												</span> <span class="piechart" style="transform: rotate(216deg);">
													<span class="rotate" style="transform: rotate(108deg);"><span>약간
															있음</span></span> <span class="percent"><strong class="num">30</strong>%</span>
												</span> <span class="piechart" style="transform: rotate(324deg);">
													<span class="rotate" style="transform: rotate(36deg);"><span>없음</span></span>
													<span class="percent"><strong class="num">10</strong>%</span>
												</span>
											</div>
										</div>
										<ul class="sub">
											<li>좋음</li>
											<li>약간 있음</li>
											<li>없음</li>
										</ul>
									</div>
									<div class="swiper-slide swiper-slide-duplicate-prev"
										data-swiper-slide-index="3" style="width: 296px;">
										<div class="chart">
											<p class="tit">비침</p>
											<div class="piechart-wrap">
												<span class="piechart" style="transform: rotate(0deg);">
													<span class="rotate" style="transform: rotate(108deg);"><span>있음</span></span>
													<span class="percent"><strong class="num">30</strong>%</span>
												</span> <span class="piechart" style="transform: rotate(108deg);">
													<span class="rotate" style="transform: rotate(0deg);"><span>약간
															있음</span></span> <span class="percent"><strong class="num">0</strong>%</span>
												</span> <span class="piechart over"
													style="transform: rotate(108deg);"> <span
													class="rotate" style="transform: rotate(252deg);"><span>없음</span></span>
													<span class="percent"><strong class="num">70</strong>%</span>
												</span>
											</div>
										</div>
										<ul class="sub">
											<li>있음</li>
											<li>약간 있음</li>
											<li>없음</li>
										</ul>
									</div>
									<div
										class="swiper-slide swiper-slide-duplicate swiper-slide-duplicate-active"
										data-swiper-slide-index="0" style="width: 296px;">
										<div class="chart">
											<p class="tit">핏감</p>
											<div class="piechart-wrap">
												<span class="piechart over" style="transform: rotate(0deg);">
													<span class="rotate" style="transform: rotate(216deg);"><span>슬림</span></span>
													<span class="percent"><strong class="num">60</strong>%</span>
												</span> <span class="piechart" style="transform: rotate(216deg);">
													<span class="rotate" style="transform: rotate(144deg);"><span>레귤러</span></span>
													<span class="percent"><strong class="num">40</strong>%</span>
												</span> <span class="piechart" style="transform: rotate(360deg);">
													<span class="rotate" style="transform: rotate(0deg);"><span>오버사이즈</span></span>
													<span class="percent"><strong class="num">0</strong>%</span>
												</span>
											</div>
										</div>
										<ul class="sub">
											<li>슬림</li>
											<li>레귤러</li>
											<li>오버사이즈</li>
										</ul>
									</div>
									<div
										class="swiper-slide swiper-slide-duplicate swiper-slide-duplicate-next"
										data-swiper-slide-index="1" style="width: 296px;">
										<div class="chart">
											<p class="tit">두께감</p>
											<div class="piechart-wrap">
												<span class="piechart over" style="transform: rotate(0deg);">
													<span class="rotate" style="transform: rotate(216deg);"><span>얇음</span></span>
													<span class="percent"><strong class="num">60</strong>%</span>
												</span> <span class="piechart" style="transform: rotate(216deg);">
													<span class="rotate" style="transform: rotate(144deg);"><span>보통</span></span>
													<span class="percent"><strong class="num">40</strong>%</span>
												</span> <span class="piechart" style="transform: rotate(360deg);">
													<span class="rotate" style="transform: rotate(0deg);"><span>도톰함</span></span>
													<span class="percent"><strong class="num">0</strong>%</span>
												</span>
											</div>
										</div>
										<ul class="sub">
											<li>얇음</li>
											<li>보통</li>
											<li>도톰함</li>
										</ul>
									</div>
								</div>
								<div
									class="slide-pagination swiper-pagination-clickable swiper-pagination-bullets">
									<button type="button"
										class="swiper-pagination-bullet swiper-pagination-bullet-active"
										tabindex="0" role="button" aria-label="Go to slide 1">1</button>
									<button type="button" class="swiper-pagination-bullet"
										tabindex="0" role="button" aria-label="Go to slide 2">2</button>
									<button type="button" class="swiper-pagination-bullet"
										tabindex="0" role="button" aria-label="Go to slide 3">3</button>
									<button type="button" class="swiper-pagination-bullet"
										tabindex="0" role="button" aria-label="Go to slide 4">4</button>
								</div>
								<div class="slide-nav type3">
									<button type="button" class="slide-nav-prev" tabindex="0"
										role="button" aria-label="Previous slide">이전</button>
									<button type="button" class="slide-nav-next" tabindex="0"
										role="button" aria-label="Next slide">다음</button>
								</div>
								<span class="swiper-notification" aria-live="assertive"
									aria-atomic="true"></span>
							</div>
						</div>
					</div>



					<div class="product-detail-review-list">
						<div class="head">
							<p class="txt">상품 구매 후 리뷰 작성시 H.Plus를 드립니다. (포토리뷰 1,000포인트,
								텍스트리뷰 300포인트 증정)</p>
							<div id="prdReviewFilter" class="opt">
								<div class="select">
									<button type="button" class="sel-btn"
										onclick="select.trigger();">최신순</button>
									<div id="reviewSortFilter" class="sel-list">
										<ul>
											<li><label><input type="radio" name="rvList"
													value="new"> <span>최신순</span></label></li>
											<li><label><input type="radio" name="rvList"
													value="like"> <span>공감순</span></label></li>
										</ul>
									</div>
								</div>

								<div class="select">
									<button type="button" class="sel-btn"
										onclick="select.trigger();">사이즈</button>
									<div class="sel-list">
										<ul>
											<li><label> <input type="radio" name="optValCd1"
													value="XS"> <span>XS</span>
											</label></li>
											<li><label> <input type="radio" name="optValCd1"
													value="S"> <span>S</span>
											</label></li>
											<li><label> <input type="radio" name="optValCd1"
													value="M"> <span>M</span>
											</label></li>
											<li><label> <input type="radio" name="optValCd1"
													value="L"> <span>L</span>
											</label></li>
										</ul>
									</div>
								</div>
								<button type="button" class="btn-type1-sm"
									onclick="getReviewList('1','F','F',null);">
									<span>필터적용</span>
								</button>
							</div>

							<div class="opt">
								<button type="button" id="btnTogglePhotoReview"
									class="btn-type1-sm" onclick="getPhotoReviewList(this);">
									<span>포토리뷰</span>
								</button>
								<button type="button" class="btn-type4-sm"
									onclick="location.href='/public/member/login';">
									<span>리뷰작성</span>
								</button>
							</div>
						</div>

						<div id="reviewNodata" class="nodata" style="display: none;">
							지금 첫 리뷰를 작성해주세요.<br> 포토리뷰 1,000포인트, 텍스트 리뷰 300포인트를 증정합니다.
							(상품구매시)
						</div>

						<div id="allReviewList" class="board-list board-review ui-fold"
							style="">
							<input type="hidden" name="allReviewTotalRow" value="10">
							<input type="hidden" name="allReviewTotalScore" value="4.9">
							<input type="hidden" id="allReviewTotalScorePercent" value="98">
							<input type="hidden" id="godNo" value=""> <input
								type="hidden" id="godEvlTurn" value="">

							<ul class="list-content">
								<c:forEach var="positivePost" items="${positivePostList}">
									<li>
										<div class="list-row fold-header">
											<div class="cell-title">
												<ul class="etc-info">
													<li><span class="point size-m"><span class="ico"
															style="width: 100%">별점 5점</span></span></li>
													<li>
														<button type="button" class="btn-like2"
															onclick="addGodEvlLikeCount(this,addLikeList);"
															godevlturn="10" reviewgodno="GM0121122308150">
															<span class="like-count" likecnt="0"> - </span>
														</button>
													</li>
													<li><span class="date">2022.12.02</span></li>
												</ul>
												<p class="title-review">기본니트</p>
												<button type="button" class="btn-fold">열기</button>
											</div>
										</div>
	
										<div class="fold-cont">
											<div class="review-group">
												<ul class="review-prd-info">
													<li>
														<div class="prd-name">lam****&nbsp;</div>
													</li>
													<li>
														<div class="prd-option">
	
															&nbsp;160cm ,보통체형 &nbsp;/ &nbsp; 구매옵션 : S<em
																class="prd-option-color"> <span
																class="pdColor-/colorchips/GM0121122308150_COLORCHIP.jpg">BLUE</span>
															</em>
														</div>
													</li>
												</ul>
	
												<div class="txt-box">브이넥이 조금 깊은감은 있지만 니트재질이 너무 부드럽고
													좋더라구요 사이즈는 정사이즈로 주문하시면 될듯합니다 크게 나온옷은 아닙니다.</div>
												<p class="wear-feeling">
													<span> 핏감 : 슬림 </span> <span> 두께감 : 얇음 </span> <span>
														신축성 : 좋음 </span> <span> 비침 : 있음 </span>
												</p>
												<div class="review-report">
													<button type="button" class="btn-report"
														onclick="alert('로그인 후 참여 가능합니다.');location.href='/public/member/login'">
														<span>신고하기</span>
													</button>
												</div>
											</div>
										</div>
									</li>
								</c:forEach>
								
							</ul>

						</div>

						<div id="photoReviewList" class="photo-list"
							style="display: none;"></div>
					</div>

				</section>
				<!-- 부정리뷰 정보 -->
				<section id="tab02"
					class="anchor-section product-detail-review">
					<h3 class="sec-title">비판리뷰</h3>
					<div class="review-total">
						<div class="member-total-point">
							<h4 class="tit">사용자 총 평점</h4>
							<p class="point size-l">
								<span class="ico" style="width: 98%;">별점</span> <span
									class="num">4.9</span>
							</p>
						</div>

						<div class="chart-wrap" id="chartSlide" data-slide-length="4">
							<div class="slide-container swiper-container-horizontal">
								<div class="swiper-wrapper"
									style="transition-duration: 0ms; transform: translate3d(-592px, 0px, 0px);">
									<div class="swiper-slide swiper-slide-duplicate"
										data-swiper-slide-index="2" style="width: 296px;">
										<div class="chart">
											<p class="tit">신축성</p>
											<div class="piechart-wrap">
												<span class="piechart over" style="transform: rotate(0deg);">
													<span class="rotate" style="transform: rotate(216deg);"><span>좋음</span></span>
													<span class="percent"><strong class="num">60</strong>%</span>
												</span> <span class="piechart" style="transform: rotate(216deg);">
													<span class="rotate" style="transform: rotate(108deg);"><span>약간
															있음</span></span> <span class="percent"><strong class="num">30</strong>%</span>
												</span> <span class="piechart" style="transform: rotate(324deg);">
													<span class="rotate" style="transform: rotate(36deg);"><span>없음</span></span>
													<span class="percent"><strong class="num">10</strong>%</span>
												</span>
											</div>
										</div>
										<ul class="sub">
											<li>좋음</li>
											<li>약간 있음</li>
											<li>없음</li>
										</ul>
									</div>
									<div
										class="swiper-slide swiper-slide-duplicate swiper-slide-prev"
										data-swiper-slide-index="3" style="width: 296px;">
										<div class="chart">
											<p class="tit">비침</p>
											<div class="piechart-wrap">
												<span class="piechart" style="transform: rotate(0deg);">
													<span class="rotate" style="transform: rotate(108deg);"><span>있음</span></span>
													<span class="percent"><strong class="num">30</strong>%</span>
												</span> <span class="piechart" style="transform: rotate(108deg);">
													<span class="rotate" style="transform: rotate(0deg);"><span>약간
															있음</span></span> <span class="percent"><strong class="num">0</strong>%</span>
												</span> <span class="piechart over"
													style="transform: rotate(108deg);"> <span
													class="rotate" style="transform: rotate(252deg);"><span>없음</span></span>
													<span class="percent"><strong class="num">70</strong>%</span>
												</span>
											</div>
										</div>
										<ul class="sub">
											<li>있음</li>
											<li>약간 있음</li>
											<li>없음</li>
										</ul>
									</div>
									<div class="swiper-slide swiper-slide-active"
										data-swiper-slide-index="0" style="width: 296px;">
										<div class="chart">
											<p class="tit">핏감</p>
											<div class="piechart-wrap">
												<span class="piechart over" style="transform: rotate(0deg);">
													<span class="rotate" style="transform: rotate(216deg);"><span>슬림</span></span>
													<span class="percent"><strong class="num">60</strong>%</span>
												</span> <span class="piechart" style="transform: rotate(216deg);">
													<span class="rotate" style="transform: rotate(144deg);"><span>레귤러</span></span>
													<span class="percent"><strong class="num">40</strong>%</span>
												</span> <span class="piechart" style="transform: rotate(360deg);">
													<span class="rotate" style="transform: rotate(0deg);"><span>오버사이즈</span></span>
													<span class="percent"><strong class="num">0</strong>%</span>
												</span>
											</div>
										</div>
										<ul class="sub">
											<li>슬림</li>
											<li>레귤러</li>
											<li>오버사이즈</li>
										</ul>
									</div>
									<div class="swiper-slide swiper-slide-next"
										data-swiper-slide-index="1" style="width: 296px;">
										<div class="chart">
											<p class="tit">두께감</p>
											<div class="piechart-wrap">
												<span class="piechart over" style="transform: rotate(0deg);">
													<span class="rotate" style="transform: rotate(216deg);"><span>얇음</span></span>
													<span class="percent"><strong class="num">60</strong>%</span>
												</span> <span class="piechart" style="transform: rotate(216deg);">
													<span class="rotate" style="transform: rotate(144deg);"><span>보통</span></span>
													<span class="percent"><strong class="num">40</strong>%</span>
												</span> <span class="piechart" style="transform: rotate(360deg);">
													<span class="rotate" style="transform: rotate(0deg);"><span>도톰함</span></span>
													<span class="percent"><strong class="num">0</strong>%</span>
												</span>
											</div>
										</div>
										<ul class="sub">
											<li>얇음</li>
											<li>보통</li>
											<li>도톰함</li>
										</ul>
									</div>
									<div class="swiper-slide" data-swiper-slide-index="2"
										style="width: 296px;">
										<div class="chart">
											<p class="tit">신축성</p>
											<div class="piechart-wrap">
												<span class="piechart over" style="transform: rotate(0deg);">
													<span class="rotate" style="transform: rotate(216deg);"><span>좋음</span></span>
													<span class="percent"><strong class="num">60</strong>%</span>
												</span> <span class="piechart" style="transform: rotate(216deg);">
													<span class="rotate" style="transform: rotate(108deg);"><span>약간
															있음</span></span> <span class="percent"><strong class="num">30</strong>%</span>
												</span> <span class="piechart" style="transform: rotate(324deg);">
													<span class="rotate" style="transform: rotate(36deg);"><span>없음</span></span>
													<span class="percent"><strong class="num">10</strong>%</span>
												</span>
											</div>
										</div>
										<ul class="sub">
											<li>좋음</li>
											<li>약간 있음</li>
											<li>없음</li>
										</ul>
									</div>
									<div class="swiper-slide swiper-slide-duplicate-prev"
										data-swiper-slide-index="3" style="width: 296px;">
										<div class="chart">
											<p class="tit">비침</p>
											<div class="piechart-wrap">
												<span class="piechart" style="transform: rotate(0deg);">
													<span class="rotate" style="transform: rotate(108deg);"><span>있음</span></span>
													<span class="percent"><strong class="num">30</strong>%</span>
												</span> <span class="piechart" style="transform: rotate(108deg);">
													<span class="rotate" style="transform: rotate(0deg);"><span>약간
															있음</span></span> <span class="percent"><strong class="num">0</strong>%</span>
												</span> <span class="piechart over"
													style="transform: rotate(108deg);"> <span
													class="rotate" style="transform: rotate(252deg);"><span>없음</span></span>
													<span class="percent"><strong class="num">70</strong>%</span>
												</span>
											</div>
										</div>
										<ul class="sub">
											<li>있음</li>
											<li>약간 있음</li>
											<li>없음</li>
										</ul>
									</div>
									<div
										class="swiper-slide swiper-slide-duplicate swiper-slide-duplicate-active"
										data-swiper-slide-index="0" style="width: 296px;">
										<div class="chart">
											<p class="tit">핏감</p>
											<div class="piechart-wrap">
												<span class="piechart over" style="transform: rotate(0deg);">
													<span class="rotate" style="transform: rotate(216deg);"><span>슬림</span></span>
													<span class="percent"><strong class="num">60</strong>%</span>
												</span> <span class="piechart" style="transform: rotate(216deg);">
													<span class="rotate" style="transform: rotate(144deg);"><span>레귤러</span></span>
													<span class="percent"><strong class="num">40</strong>%</span>
												</span> <span class="piechart" style="transform: rotate(360deg);">
													<span class="rotate" style="transform: rotate(0deg);"><span>오버사이즈</span></span>
													<span class="percent"><strong class="num">0</strong>%</span>
												</span>
											</div>
										</div>
										<ul class="sub">
											<li>슬림</li>
											<li>레귤러</li>
											<li>오버사이즈</li>
										</ul>
									</div>
									<div
										class="swiper-slide swiper-slide-duplicate swiper-slide-duplicate-next"
										data-swiper-slide-index="1" style="width: 296px;">
										<div class="chart">
											<p class="tit">두께감</p>
											<div class="piechart-wrap">
												<span class="piechart over" style="transform: rotate(0deg);">
													<span class="rotate" style="transform: rotate(216deg);"><span>얇음</span></span>
													<span class="percent"><strong class="num">60</strong>%</span>
												</span> <span class="piechart" style="transform: rotate(216deg);">
													<span class="rotate" style="transform: rotate(144deg);"><span>보통</span></span>
													<span class="percent"><strong class="num">40</strong>%</span>
												</span> <span class="piechart" style="transform: rotate(360deg);">
													<span class="rotate" style="transform: rotate(0deg);"><span>도톰함</span></span>
													<span class="percent"><strong class="num">0</strong>%</span>
												</span>
											</div>
										</div>
										<ul class="sub">
											<li>얇음</li>
											<li>보통</li>
											<li>도톰함</li>
										</ul>
									</div>
								</div>
								<div
									class="slide-pagination swiper-pagination-clickable swiper-pagination-bullets">
									<button type="button"
										class="swiper-pagination-bullet swiper-pagination-bullet-active"
										tabindex="0" role="button" aria-label="Go to slide 1">1</button>
									<button type="button" class="swiper-pagination-bullet"
										tabindex="0" role="button" aria-label="Go to slide 2">2</button>
									<button type="button" class="swiper-pagination-bullet"
										tabindex="0" role="button" aria-label="Go to slide 3">3</button>
									<button type="button" class="swiper-pagination-bullet"
										tabindex="0" role="button" aria-label="Go to slide 4">4</button>
								</div>
								<div class="slide-nav type3">
									<button type="button" class="slide-nav-prev" tabindex="0"
										role="button" aria-label="Previous slide">이전</button>
									<button type="button" class="slide-nav-next" tabindex="0"
										role="button" aria-label="Next slide">다음</button>
								</div>
								<span class="swiper-notification" aria-live="assertive"
									aria-atomic="true"></span>
							</div>
						</div>
					</div>



					<div class="product-detail-review-list">
						<div class="head">
							<p class="txt">상품 구매 후 리뷰 작성시 H.Plus를 드립니다. (포토리뷰 1,000포인트,
								텍스트리뷰 300포인트 증정)</p>
							<div id="prdReviewFilter" class="opt">
								<div class="select">
									<button type="button" class="sel-btn"
										onclick="select.trigger();">최신순</button>
									<div id="reviewSortFilter" class="sel-list">
										<ul>
											<li><label><input type="radio" name="rvList"
													value="new"> <span>최신순</span></label></li>
											<li><label><input type="radio" name="rvList"
													value="like"> <span>공감순</span></label></li>
										</ul>
									</div>
								</div>

								<div class="select">
									<button type="button" class="sel-btn"
										onclick="select.trigger();">사이즈</button>
									<div class="sel-list">
										<ul>
											<li><label> <input type="radio" name="optValCd1"
													value="XS"> <span>XS</span>
											</label></li>
											<li><label> <input type="radio" name="optValCd1"
													value="S"> <span>S</span>
											</label></li>
											<li><label> <input type="radio" name="optValCd1"
													value="M"> <span>M</span>
											</label></li>
											<li><label> <input type="radio" name="optValCd1"
													value="L"> <span>L</span>
											</label></li>
										</ul>
									</div>
								</div>
								<button type="button" class="btn-type1-sm"
									onclick="getReviewList('1','F','F',null);">
									<span>필터적용</span>
								</button>
							</div>

							<div class="opt">
								<button type="button" id="btnTogglePhotoReview"
									class="btn-type1-sm" onclick="getPhotoReviewList(this);">
									<span>포토리뷰</span>
								</button>
								<button type="button" class="btn-type4-sm"
									onclick="location.href='/public/member/login';">
									<span>리뷰작성</span>
								</button>
							</div>
						</div>

						<div id="reviewNodata" class="nodata" style="display: none;">
							지금 첫 리뷰를 작성해주세요.<br> 포토리뷰 1,000포인트, 텍스트 리뷰 300포인트를 증정합니다.
							(상품구매시)
						</div>

						<div id="allReviewList" class="board-list board-review ui-fold"
							style="">
							<input type="hidden" name="allReviewTotalRow" value="10">
							<input type="hidden" name="allReviewTotalScore" value="4.9">
							<input type="hidden" id="allReviewTotalScorePercent" value="98">
							<input type="hidden" id="godNo" value=""> <input
								type="hidden" id="godEvlTurn" value="">

							<ul class="list-content">
								<c:forEach var="negativePost" items="${negativePostList}">
									<li>
										<div class="list-row fold-header">
											<div class="cell-title">
												<ul class="etc-info">
													<li><span class="point size-m"><span class="ico"
															style="width: 100%">별점 5점</span></span></li>
													<li>
														<button type="button" class="btn-like2"
															onclick="addGodEvlLikeCount(this,addLikeList);"
															godevlturn="10" reviewgodno="GM0121122308150">
															<span class="like-count" likecnt="0"> - </span>
														</button>
													</li>
													<li><span class="date">2022.12.02</span></li>
												</ul>
												<p class="title-review">기본니트</p>
												<button type="button" class="btn-fold">열기</button>
											</div>
										</div>
	
										<div class="fold-cont">
											<div class="review-group">
												<ul class="review-prd-info">
													<li>
														<div class="prd-name">lam****&nbsp;</div>
													</li>
													<li>
														<div class="prd-option">
	
															&nbsp;160cm ,보통체형 &nbsp;/ &nbsp; 구매옵션 : S<em
																class="prd-option-color"> <span
																class="pdColor-/colorchips/GM0121122308150_COLORCHIP.jpg">BLUE</span>
															</em>
														</div>
													</li>
												</ul>
	
												<div class="txt-box">브이넥이 조금 깊은감은 있지만 니트재질이 너무 부드럽고
													좋더라구요 사이즈는 정사이즈로 주문하시면 될듯합니다 크게 나온옷은 아닙니다.</div>
												<p class="wear-feeling">
													<span> 핏감 : 슬림 </span> <span> 두께감 : 얇음 </span> <span>
														신축성 : 좋음 </span> <span> 비침 : 있음 </span>
												</p>
												<div class="review-report">
													<button type="button" class="btn-report"
														onclick="alert('로그인 후 참여 가능합니다.');location.href='/public/member/login'">
														<span>신고하기</span>
													</button>
												</div>
											</div>
										</div>
									</li>
								</c:forEach>
							</ul>

						</div>

						<div id="photoReviewList" class="photo-list"
							style="display: none;"></div>
					</div>

				</section>
			</div>
				

			
			</div>
		</div>

		<!---->
	</div>
	<div data-v-01e212dd="">
		<div data-v-e5d8b6f4="" data-v-01e212dd="" class="banner_bottom lg">
			<a data-v-e5d8b6f4="" href="#" class="banner_box"><img
				data-v-e5d8b6f4="" src="/_nuxt/img/home_banner_bottom1.79549cb.png"
				loading="lazy" width="350" height="200" alt="SERVICE GUIDE"
				class="bg">
				<div data-v-e5d8b6f4="" class="banner_info">
					<strong data-v-e5d8b6f4="" class="info_subtitle">service
						guide</strong>
					<p data-v-e5d8b6f4="" class="info_title">
						KREAM은 처음이지? <br>서비스 소개를 확인해보세요.
					</p>
					<span data-v-e5d8b6f4="" class="info_txt">서비스 안내</span>
				</div></a><a data-v-e5d8b6f4="" href="#" class="banner_box"><img
				data-v-e5d8b6f4="" src="/_nuxt/img/home_banner_bottom2.0077547.png"
				loading="lazy" width="350" height="200" alt="DOWNLOAD THE APP"
				class="bg">
				<div data-v-e5d8b6f4="" class="banner_info">
					<strong data-v-e5d8b6f4="" class="info_subtitle">download
						the app</strong>
					<p data-v-e5d8b6f4="" class="info_title">
						KREAM 앱을 설치하여 <br>한정판 스니커즈를 FLEX 하세요!
					</p>
					<span data-v-e5d8b6f4="" class="info_txt">앱 설치하기</span>
				</div></a>
			<!---->
		</div>
	</div>
	<!---->
	<!---->
	<!---->
	<!---->
	<!---->
	<!---->
</div>


<!-- </div> -->
<%@ include file="/WEB-INF/views/common/footer.jsp"%>