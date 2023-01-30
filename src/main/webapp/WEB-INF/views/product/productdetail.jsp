<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<jsp:useBean id="now" class="java.util.Date" />
<link
	href="${pageContext.request.contextPath}/resources/css/b69f662.css"
	rel="stylesheet" type="text/css">
<link
	href="${pageContext.request.contextPath}/resources/css/reviews_ui.css"
	rel="stylesheet" type="text/css">
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css"> <!-- 배너추가 --> 
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
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
					<div class="detail_banner_area lg" data-v-07f24dc5=""
						data-v-01e212dd="">
						<div data-v-3d1a4f76="" data-v-07f24dc5="" dir="ltr"
							class="banner_slide detail_slide slick-slider slick-initialized">
							
							<div data-v-3d1a4f76="" class="slick-list">
								<div data-v-e4caeaf8="" data-v-3d1a4f76="" class="slick-track"
									style="width: 2800px; opacity: 1;">
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
								</div>
							</div>
						</div>
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
									<span class="title_txt" data-v-ddee2978="">사이즈</span>
								</div>
								<div class="size" data-v-ddee2978="">
									<a href="#" class="btn_size" data-v-6c6430ce=""
										data-v-ddee2978=""><span class="btn_text"
										data-v-6c6430ce="">모든 사이즈</span></a>
								</div>
							</div>
							<div class="detail_price" data-v-679b6792="" data-v-3900a1a2="">
								<div class="title" data-v-679b6792="">
									<span class="title_txt" data-v-679b6792="">최근 거래가</span>
								</div>
								<div class="price" data-v-679b6792="">
									<div class="amount" data-v-679b6792="">
										<span class="num" data-v-679b6792=""><fmt:formatNumber type="number" maxFractionDigits="3" value="${productDetailDTO.release_price}" /></span><span
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

											data-v-23bbaa82="" class="num"><fmt:formatNumber type="number" maxFractionDigits="3" value="${sellDTO.price}" /></em><span
											data-v-23bbaa82="" class="won">원</span></span><span
											data-v-23bbaa82="" class="desc">즉시 구매가</span>
									</div></a><a data-v-23bbaa82="" href="/sell/select/${productDetailDTO.pid}?size=${size}" class="btn_division sell"><strong
									data-v-23bbaa82="" class="title">판매</strong>
									<div data-v-23bbaa82="" class="price">
										<span data-v-23bbaa82="" class="amount"><em
											data-v-23bbaa82="" class="num"><fmt:formatNumber type="number" maxFractionDigits="3" value="${buyDTO.price}" /></em><span
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
									<dd class="product_info" data-v-b809b0a6=""><fmt:formatNumber type="number" maxFractionDigits="3" value="${productDetailDTO.release_price}" />원</dd>
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
					<div class="wrap_sales" data-v-69832834="" data-v-3900a1a2="">
						<div class="tab_area" data-v-b6b2883e="" data-v-69832834="">
							<ul role="tablist" class="tab_list" data-v-b6b2883e="">
								<li data-v-b6b2883e="" role="tab" aria-selected="false"
									aria-controls="sales_panel1" class="item on"><a
									data-v-b6b2883e="" href="#" class="item_link">1개월</a></li>
								<li data-v-b6b2883e="" role="tab" aria-selected="false"
									aria-controls="sales_panel2" class="item"><a
									data-v-b6b2883e="" href="#" class="item_link">3개월</a></li>
								<li data-v-b6b2883e="" role="tab" aria-selected="false"
									aria-controls="sales_panel3" class="item"><a
									data-v-b6b2883e="" href="#" class="item_link">6개월</a></li>
								<li data-v-b6b2883e="" role="tab" aria-selected="false"
									aria-controls="sales_panel4" class="item"><a
									data-v-b6b2883e="" href="#" class="item_link">1년</a></li>
								<li data-v-b6b2883e="" role="tab" aria-selected="true"
									aria-controls="sales_panel5" class="item"><a
									data-v-b6b2883e="" href="#" class="item_link">전체</a></li>
							</ul>
							<br/><br/>
							<div id="sales_panel1" role="tabpanel" span="1m"
								class="tab_content show" data-v-3c9dd7e9="" data-v-69832834=""
								data-v-b6b2883e="">
								<div class="graph" data-v-04d43b10="" data-v-69832834=""
									data-v-3c9dd7e9="">
									<canvas data-v-04d43b10=""
										id="sales_canvas1" height="0"
										style="display: block; box-sizing: border-box; height:200px;width:530px;"
										width="0"></canvas>
								</div>
							</div>
							<div id="sales_panel2" role="tabpanel" span="3m"
								class="tab_content" data-v-3c9dd7e9="" data-v-69832834=""
								data-v-b6b2883e="">
								<div class="graph" data-v-04d43b10="" data-v-69832834=""
									data-v-3c9dd7e9="">
									<canvas data-v-04d43b10=""
										id="sales_canvas2" height="0"
										style="display: block; box-sizing: border-box; height:200px;width:530px;"
										width="0"></canvas>
								</div>
							</div>
							<div id="sales_panel3" role="tabpanel" span="6m"
								class="tab_content" data-v-3c9dd7e9="" data-v-69832834=""
								data-v-b6b2883e="">
								<div class="graph" data-v-04d43b10="" data-v-69832834=""
									data-v-3c9dd7e9="">
									<canvas data-v-04d43b10=""
										id="sales_canvas3" height="0"
										style="display: block; box-sizing: border-box; height:200px;width:530px;"
										width="0"></canvas>
								</div>
							</div>
							<div id="sales_panel4" role="tabpanel" span="1y"
								class="tab_content" data-v-3c9dd7e9="" data-v-69832834=""
								data-v-b6b2883e="">
								<div class="graph" data-v-04d43b10="" data-v-69832834=""
									data-v-3c9dd7e9="">
									<canvas data-v-04d43b10=""
										id="sales_canvas4" height="0"
										style="display: block; box-sizing: border-box; height:200px;width:530px;"
										width="0"></canvas>
								</div>
							</div>
							<div id="sales_panel5" role="tabpanel" span="all"
								class="tab_content" data-v-3c9dd7e9="" data-v-69832834=""
								data-v-b6b2883e="">
								<div class="graph" data-v-04d43b10="" data-v-69832834=""
									data-v-3c9dd7e9="">
									<canvas data-v-04d43b10=""
										id="sales_canvas5" height="0"
										style="display: block; box-sizing: border-box; height:200px;width:530px;"></canvas>
								</div>
							</div>
						</div>
					</div>

					<div class="detail_wrap" data-v-3900a1a2=""
						style="margin-top: 30px">
						<div class="product_sales_graph" data-v-3900a1a2="">
							<div class="wrap_bids" data-v-4379daa7="" data-v-3900a1a2="">
								<div class="tab_area" data-v-b6b2883e="" data-v-4379daa7="">
									<ul role="tablist" class="tab_list" data-v-b6b2883e="">
										<li data-v-b6b2883e="" role="tab" aria-selected="true"
											aria-controls="panel1" class="item on"><a
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
													<c:forEach var="allSignContract" items="${allSignContractList}"  begin="0" end="4" step="1" >
														<tr data-v-50d58b3a="">
															<td class="table_td" data-v-50d58b3a="">${allSignContract.size_type } <!----></td>
															<td class="table_td align_right" data-v-50d58b3a="">
																<fmt:formatNumber type="number" maxFractionDigits="3" value="${allSignContract.price }" />원 <i class="express_icon" data-v-50d58b3a=""><svg
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
										<a href="#" class="btn outlinegrey full medium" id="moreSignContract"
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
												  <c:forEach var="allSellBid" items="${allSellBidList}" begin="0" end="4" step="1">
													<tr data-v-50d58b3a="">
														<td class="table_td" data-v-50d58b3a="">${allSellBid.size_type}<!----></td>
														<td class="table_td align_right" data-v-50d58b3a="">
															<fmt:formatNumber type="number" maxFractionDigits="3" value="${allSellBid.price}" />원 <!---->
														</td>
														<td class="table_td align_right" data-v-50d58b3a="">
															${allSellBid.amount}<!---->
														</td>
													</tr>
												</c:forEach>
												</tbody>
											</table>
										</div>
										<a href="#" class="btn outlinegrey full medium" id="moreSellBid"
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
												  <c:forEach var="allBuyBid" items="${allBuyBidList}" begin="0" end="4" step="1">
													<tr data-v-50d58b3a="">
														<td class="table_td" data-v-50d58b3a="">${allBuyBid.size_type}<!----></td>
														<td class="table_td align_right" data-v-50d58b3a="">
															<fmt:formatNumber type="number" maxFractionDigits="3" value="${allBuyBid.price}" />원 <!---->
														</td>
														<td class="table_td align_right" data-v-50d58b3a="">
															${allBuyBid.amount} <!---->
														</td>
													</tr>
												  </c:forEach>
												</tbody>
											</table>
										</div>
										<a href="#" class="btn outlinegrey full medium" id="moreBuyBid"
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
					<div data-v-1a009402="" data-v-0a44efea="" data-v-3900a1a2=""
						class="layer_market_price layer lg" style="display:none;">
						<div data-v-1a009402="" class="layer_container">
							<a data-v-0a44efea="" data-v-1a009402="" href="#"
								class="btn_layer_close"><svg data-v-0a44efea=""
									data-v-1a009402="" xmlns="http://www.w3.org/2000/svg"
									class="ico-close icon sprite-icons">
									<use data-v-0a44efea="" data-v-1a009402=""
										href="/_nuxt/3182c3b1ca2f77da7bc3e1acf109306c.svg#i-ico-close"
										xlink:href="/_nuxt/3182c3b1ca2f77da7bc3e1acf109306c.svg#i-ico-close"></use></svg></a>
							<div data-v-1a009402="" class="layer_header">
								<h2 data-v-0a44efea="" data-v-1a009402="" class="title">시세</h2>
							</div>
							<div data-v-1a009402="" class="layer_content">
								<div data-v-0a44efea="" data-v-1a009402="" class="buy_product">
									<div data-v-09fbcf09="" data-v-0a44efea="" class="product"
										data-v-1a009402=""
										style="background-color: rgb(235, 240, 245);">
										<picture data-v-878ec45c="" data-v-09fbcf09=""
											class="picture product_img">
										<img data-v-878ec45c="" alt="상품 이미지" referrerpolicy="no-referrer"
											src="${productDetailDTO.img1}"
											loading="lazy" class="image"></picture>
										<!---->
										<!---->
										<!---->
										<!---->
									</div>
									<div data-v-0a44efea="" data-v-1a009402="" class="buy_info">
										<div data-v-664f0148="" data-v-0a44efea="" class="model_info"
											data-v-1a009402="">
											<strong data-v-664f0148="" class="model_number">
												<!---->
												<span data-v-664f0148="" class="text"></span>
											</strong>
											<p data-v-664f0148="" class="model_title">${productDetailDTO.pname_e}</p>
											<p data-v-664f0148="" class="model_ko">${productDetailDTO.pname_k}</p>
											<div data-v-664f0148="" class="size_select_wrap">
												<button data-v-575aff82="" data-v-664f0148="" type="button"
													class="btn btn_size" slot="button">
													<span data-v-664f0148="" class="size">모든 사이즈</span>
													<svg data-v-664f0148="" xmlns="http://www.w3.org/2000/svg"
														class="ico-arr-dir-down-circle icon sprite-icons">
														<use data-v-664f0148=""
															href="/_nuxt/3182c3b1ca2f77da7bc3e1acf109306c.svg#i-ico-arr-dir-down-circle"
															xlink:href="/_nuxt/3182c3b1ca2f77da7bc3e1acf109306c.svg#i-ico-arr-dir-down-circle"></use></svg>
												</button>
												<div data-v-1a009402="" data-v-d26890d2=""
													data-v-664f0148="" class="layer_size_list layer lg"
													style="display: none;">
													<div data-v-1a009402="" class="layer_container">
														<a data-v-d26890d2="" data-v-1a009402="" href="#"
															class="btn_layer_close"><svg data-v-d26890d2=""
																data-v-1a009402="" xmlns="http://www.w3.org/2000/svg"
																class="ico-close icon sprite-icons">
																<use data-v-d26890d2="" data-v-1a009402=""
																	href="/_nuxt/3182c3b1ca2f77da7bc3e1acf109306c.svg#i-ico-close"
																	xlink:href="/_nuxt/3182c3b1ca2f77da7bc3e1acf109306c.svg#i-ico-close"></use></svg></a>
														<div data-v-1a009402="" class="layer_header">
															<h2 data-v-d26890d2="" data-v-1a009402="" class="title">사이즈
																선택</h2>
														</div>
														<div data-v-1a009402="" class="layer_content">
															<ul data-v-d26890d2="" data-v-1a009402=""
																class="size_list">
																<li data-v-d26890d2="" data-v-1a009402=""
																	class="size_item item_on"><a data-v-d26890d2=""
																	data-v-1a009402="" href="#" class="size_link"> 모든
																		사이즈 <svg data-v-d26890d2="" data-v-1a009402=""
																			xmlns="http://www.w3.org/2000/svg"
																			class="ico-check-s icon sprite-icons">
																			<use data-v-d26890d2="" data-v-1a009402=""
																				href="/_nuxt/3182c3b1ca2f77da7bc3e1acf109306c.svg#i-ico-check-s"
																				xlink:href="/_nuxt/3182c3b1ca2f77da7bc3e1acf109306c.svg#i-ico-check-s"></use></svg>
																</a></li>
															</ul>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<!---->
								<div data-v-0a44efea="" data-v-1a009402="" class="tab_info">
									<div data-v-b6b2883e="" data-v-0a44efea="" class="tab_area"
										data-v-1a009402="">
										<ul data-v-b6b2883e="" role="tablist" class="tab_list">
											<li data-v-b6b2883e="" role="tab" aria-selected="true" id="tab_info_panel1"
												aria-controls="panel1" class="item on"><a
												data-v-b6b2883e="" href="#" class="item_link">체결 거래</a></li>
											<li data-v-b6b2883e="" role="tab" aria-selected="false" id="tab_info_panel2"
												aria-controls="panel2" class="item"><a
												data-v-b6b2883e="" href="#" class="item_link">판매 입찰</a></li>
											<li data-v-b6b2883e="" role="tab" aria-selected="false" id="tab_info_panel3"
												aria-controls="panel3" class="item"><a
												data-v-b6b2883e="" href="#" class="item_link">구매 입찰</a></li>
										</ul>
										<div data-v-3c9dd7e9="" data-v-0a44efea="" id="panel1"
											role="tabpanel" class="tab_content show" span="sales"
											data-v-b6b2883e="">
											<div data-v-af29303e="" data-v-0a44efea=""
												class="price_table" data-v-3c9dd7e9="">
												<div data-v-af29303e="" class="market_price_table" style="">
													<div data-v-af29303e="" class="price_head">
														<div data-v-af29303e="" class="head_box">
															<div data-v-af29303e="" class="head_sort">
																<a data-v-af29303e="" href="#" class="sort_link sort"><span
																	data-v-af29303e="" class="sort_txt">사이즈</span></a>
															</div>
															<div data-v-af29303e="" class="head_sort">
																<a data-v-af29303e="" href="#" class="sort_link sort"><span
																	data-v-af29303e="" class="sort_txt">거래가</span></a>
															</div>
															<div data-v-af29303e=""
																class="head_sort is_active descending">
																<a data-v-af29303e="" href="#" class="sort_link sort"><span
																	data-v-af29303e="" class="sort_txt">거래일</span></a>
															</div>
														</div>
													</div>
													<div data-v-af29303e="" class="price_body">
														<c:forEach var="allSignContract" items="${allSignContractList}">
														<div data-v-af29303e="" class="body_list">
															<div data-v-af29303e="" class="list_txt">
																${allSignContract.size_type }
																<!---->
															</div>
															<div data-v-af29303e="" class="list_txt">
																<fmt:formatNumber type="number" maxFractionDigits="3" value="${allSignContract.price }" />원
																<!---->
															</div>
															<div data-v-af29303e="" class="list_txt is_active">
																${allSignContract.nowdate }
																<!---->
															</div>
														</div>
														</c:forEach>
													</div>
												</div>
												<!---->
											</div>
										</div>
										<div data-v-3c9dd7e9="" data-v-0a44efea="" id="panel2"
											role="tabpanel" class="tab_content" span="asks"
											data-v-b6b2883e="">
											<div data-v-af29303e="" data-v-0a44efea=""
												class="price_table" data-v-3c9dd7e9="">
												<div data-v-af29303e="" class="market_price_table"
													>
													<div data-v-af29303e="" class="price_head">
														<div data-v-af29303e="" class="head_box">
															<div data-v-af29303e="" class="head_sort">
																<a data-v-af29303e="" href="#" class="sort_link sort"><span
																	data-v-af29303e="" class="sort_txt">사이즈</span></a>
															</div>
															<div data-v-af29303e="" class="head_sort">
																<a data-v-af29303e="" href="#" class="sort_link sort"><span
																	data-v-af29303e="" class="sort_txt">판매 희망가</span></a>
															</div>
															<div data-v-af29303e="" class="head_sort">
																<a data-v-af29303e="" href="#" class="sort_link"><span
																	data-v-af29303e="" class="sort_txt">수량</span></a>
															</div>
														</div>
													</div>
													<div data-v-af29303e="" class="price_body">
														<c:forEach var="allSellBid" items="${allSellBidList}">
															<div data-v-af29303e="" class="body_list">
																<div data-v-af29303e="" class="list_txt">
																	${allSellBid.size_type }
																	<!---->
																</div>
																<div data-v-af29303e="" class="list_txt is_active">
																	<fmt:formatNumber type="number" maxFractionDigits="3" value="${allSellBid.price}" />원
																	<!---->
																</div>
																<div data-v-af29303e="" class="list_txt ">
																	${allSellBid.amount }
																	<!---->
																</div>
															</div>
														</c:forEach>
													</div>
												</div>
												<div data-v-e43faba2="" class="empty_content lg"
													data-v-af29303e="" style="display: none;">
													<div data-v-e43faba2="" class="empty_bg">
														<span data-v-e43faba2="" class="blind">빈 데이터 이미지</span>
													</div>
													<p data-v-e43faba2="" class="empty_text">판매 희망가가 아직
														없습니다</p>
												</div>
											</div>
										</div>
										<div data-v-3c9dd7e9="" data-v-0a44efea="" id="panel3"
											role="tabpanel" class="tab_content" span="bids"
											data-v-b6b2883e="">
											<div data-v-af29303e="" data-v-0a44efea=""
												class="price_table" data-v-3c9dd7e9="">
												<div data-v-af29303e="" class="market_price_table">
													<div data-v-af29303e="" class="price_head">
														<div data-v-af29303e="" class="head_box">
															<div data-v-af29303e="" class="head_sort">
																<a data-v-af29303e="" href="#" class="sort_link sort"><span
																	data-v-af29303e="" class="sort_txt">사이즈</span></a>
															</div>
															<div data-v-af29303e="" class="head_sort">
																<a data-v-af29303e="" href="#" class="sort_link sort"><span
																	data-v-af29303e="" class="sort_txt">구매 희망가</span></a>
															</div>
															<div data-v-af29303e="" class="head_sort">
																<a data-v-af29303e="" href="#" class="sort_link"><span
																	data-v-af29303e="" class="sort_txt">수량</span></a>
															</div>
														</div>
													</div>
													<div data-v-af29303e="" class="price_body">
														<c:forEach var="allBuyBid" items="${allBuyBidList}">
														<div data-v-af29303e="" class="body_list">
															<div data-v-af29303e="" class="list_txt">
																${allBuyBid.size_type }
																<!---->
															</div>
															<div data-v-af29303e="" class="list_txt is_active">
																<fmt:formatNumber type="number" maxFractionDigits="3" value="${allBuyBid.price }" />원
																<!---->
															</div>
															<div data-v-af29303e="" class="list_txt ">
																${allBuyBid.amount }
																<!---->
															</div>
														</div>
														</c:forEach>
													</div>
												</div>
												<div data-v-e43faba2="" class="empty_content lg"
													data-v-af29303e="" style="display: none;">
													<div data-v-e43faba2="" class="empty_bg">
														<span data-v-e43faba2="" class="blind">빈 데이터 이미지</span>
													</div>
													<p data-v-e43faba2="" class="empty_text">구매 희망가가 아직
														없습니다</p>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!---->
					<div class="floating_price lg" data-v-07cd4e36=""
						data-v-3900a1a2="">
						<div class="inner_box" data-v-07cd4e36="">
							<div data-v-07cd4e36="" class="product_area">
								<div data-v-07cd4e36="" class="product_thumb"
									style="background-color: rgb(246, 238, 237);">
									<picture data-v-878ec45c="" data-v-07cd4e36=""
										class="picture product_img">
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
					<em>${productDetailDTO.brand} 브랜드 추천</em>
				</h3>			
			</div>
			<div class="other_stock_list" data-v-b5bc0164="">
			   <c:forEach var="productBrand" items="${productBrandList}">
				<div class="stock_list_item" data-v-2367be08="" data-v-b5bc0164="">
					<a href="/products/${productBrand.pid}" class="item_inner"
						data-v-2367be08=""><div class="product_thumb"
							data-v-2367be08="">
							<div class="product" style="background-color: #f2f2f2;"
								data-v-09fbcf09="" data-v-2367be08="">
								<picture class="picture product_img" data-v-878ec45c=""
									data-v-09fbcf09="">
								<img alt="상품 이미지" referrerpolicy="no-referrer"
									src="${productBrand.img1}"
									loading="lazy" class="image" data-v-878ec45c=""></picture>
								<!---->
							</div>
							<!---->
						</div>
						<div class="product_info" data-v-2367be08="">
							<div class="product_detail" data-v-2367be08="">
								<p class="size" data-v-2367be08="">${productBrand.pname_k}</p>
								<p class="name" data-v-2367be08="">${productBrand.pname_e}</p>
							</div>
							<div class="product_price" data-v-2367be08="">
								<p class="origin_price" data-v-2367be08=""><fmt:formatNumber type="number" maxFractionDigits="3" value="${productBrand.release_price }" /></p>
							</div>
						</div></a>
				  </div>
				 </c:forEach>
				
			</div>
			<!---->
		</div>
		<div class="feed_area" data-v-02e77beb="" data-v-01e212dd="">
			
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
							<h4 class="tit">키워드</h4>
							<p class="point size-l">
								<span class="ico" style="width: 98%;">별점</span> <span
									class="num">4.9</span>
							</p>
						</div>
						<!-- <div class="graph" data-v-04d43b10="" data-v-69832834=""
									data-v-3c9dd7e9="">
									<canvas data-v-04d43b10=""
										id="sales_canvas1" height="0"
										style="display: block; box-sizing: border-box; height:200px;width:530px;"
										width="0"></canvas>
						</div> -->

						<!-- <div class="chart-wrap" id="chartSlide" data-slide-length="4">
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
						</div> -->
					</div>



					<div class="product-detail-review-list">
						<div class="head">
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
												<div class="review-group">
												<ul class="review-prd-info">
													<li>
														<div class="prd-name">${positivePost.member_email }&nbsp;</div>
													</li>
													<!-- <li>
														<div class="prd-option">
															구매옵션 : S
														</div>
													</li> -->
													<li><span class="date">${positivePost.register_date }</span></li>
												</ul>
	
												<div class="txt-box"> ${positivePost.contents }</div>
												
												
											</div>
												<button type="button" class="btn-fold">열기</button>
											</div>
										</div>
	
										<div class="fold-cont">
											<div class="review-group">
													<ul class="files">
														<li class="img-file">
															<button type="button" onclick="layerViewImg();"
																style="background-image: url(${pageContext.request.contextPath}/${positivePost.upload_path}/${positivePost.uuid}_${positivePost.file_name}); transform: rotate(0deg);">
																<img referrerpolicy="no-referrer"
																	src="${pageContext.request.contextPath}/${positivePost.upload_path}/${positivePost.uuid}_${positivePost.file_name}"
																	alt="2023-01-18-16-29-33-366"
																	style="transform: rotate(0deg);">
															</button>
														</li>
													</ul>
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
							<h4 class="tit">키워드</h4>
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
							   <button type="button" class="btn-type1-sm"
									onclick="getReviewList('1','F','F',null);">
									<span>키워드1</span>
								</button>
								<button type="button" class="btn-type1-sm"
									onclick="getReviewList('1','F','F',null);">
									<span>키워드2</span>
								</button>
								<button type="button" class="btn-type1-sm"
									onclick="getReviewList('1','F','F',null);">
									<span>키워드3</span>
								</button>
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
												<div class="review-group">
												<ul class="review-prd-info">
													<li>
														<div class="prd-name">${negativePost.member_email }&nbsp;</div>
													</li>
													<!-- <li>
														<div class="prd-option">
															구매옵션 : S
														</div>
													</li> -->
													<li><span class="date">${negativePost.register_date }</span></li>
												</ul>
	
												<div class="txt-box"> ${negativePost.contents }</div>
												
												
											</div>
												<button type="button" class="btn-fold">열기</button>
											</div>
										</div>
	
										<div class="fold-cont">
											<div class="review-group">
													<ul class="files">
														<li class="img-file">
															<button type="button" onclick="layerViewImg();"
																style="background-image: url(${pageContext.request.contextPath}/${negativePost.upload_path}/${negativePost.uuid}_${negativePost.file_name}); transform: rotate(0deg);">
																<img referrerpolicy="no-referrer"
																	src="${pageContext.request.contextPath}/${negativePost.upload_path}/${negativePost.uuid}_${negativePost.file_name}"
																	alt="2023-01-18-16-29-33-366"
																	style="transform: rotate(0deg);">
															</button>
														</li>
													</ul>
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

<script>
var date_list1 = new Array();
var money_list1 = new Array();

var date_list2 = new Array();
var money_list2 = new Array(); 

var date_list3 = new Array();
var money_list3 = new Array(); 

var date_list4 = new Array();
var money_list4 = new Array(); 

var date_list5 = new Array();
var money_list5 = new Array(); 
 
<fmt:parseNumber var="today" value="${now.time / (1000*60*60*24)}" />
 

<c:forEach var="allSignContract" items="${allSignContractList}">
<fmt:parseNumber var="dealday" value="${allSignContract.nowdate.time/ (1000*60*60*24)}"  />
date_list5.push("${allSignContract.nowdate}");
money_list5.push("${allSignContract.price}");
<c:if test="${today - dealday <= 30}">
date_list1.push("${allSignContract.nowdate}");
money_list1.push("${allSignContract.price}");
</c:if>
<c:if test="${today - dealday <= 90}">
date_list2.push("${allSignContract.nowdate}");
money_list2.push("${allSignContract.price}");
</c:if>
<c:if test="${today - dealday <= 180}">
date_list3.push("${allSignContract.nowdate}");
money_list3.push("${allSignContract.price}");
</c:if>
<c:if test="${today - dealday <= 365}">
date_list4.push("${allSignContract.nowdate}");
money_list4.push("${allSignContract.price}");
</c:if>
</c:forEach>





<c:forEach var="i" begin="1" end="5" >
	const labels${i} = date_list${i};

	  const data${i} = {
	    labels: labels${i},
	    datasets: [{
	    	 type: 'line',
	    	    
	    	    borderColor: 'rgb(255, 0, 0)',
	    	    pointHitRadius: 5, // 호버 했을때 영억
	    	    lineTension: 0.1, // 꺾임 정도
	    	    fill: false,
	    	    data: money_list${i},
	    }]
	  };

	  const config${i} = {
	    type: 'line',
	    data: data${i},
	    options: {legend: {
      	display: false
      },
      responsive: true,
      // 플러그인 설정
      plugins: {
        // data labels 플러그인
        datalabels: {
          display: false,
        },
      },
      scales: {
          // Y축
          yAxes: [ 
            {
            ticks: { 
              // 간격 설정
              fontColor: '#aaaaaa',
              fontSize: 11,
            },
            position: 'right',
              gridLines: { 
                // grid line 설정
                display: false, 
                drawBorder: false,
                color: '#3c3d40',
              },
            },
          ],
          // X축
          xAxes: [ 
            {
              // bar 너비 조정
              categoryPercentage: 0.7,
              maxBarThickness: 20,
              ticks: {
                fontColor: '#ffffff',
                fontSize: 0,
              },
              gridLines: {
               display: false,
              },
            },
          ],
        },
	    } 
	  };
	  


const myChart${i} = new Chart(
document.getElementById('sales_canvas${i}'),
config${i}
);
</c:forEach>

</script>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>