<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<script src="${pageContext.request.contextPath}/resources/js/selltab.js" defer=""></script>
<script src="${pageContext.request.contextPath}/resources/js/buy_btn_tab.js" defer=""></script>

<link
	href="${pageContext.request.contextPath}/resources/css/5e180f7.css"
	rel="stylesheet" type="text/css">
<link
	href="${pageContext.request.contextPath}/resources/css/dd5752f.css"
	rel="stylesheet" type="text/css">

<link
	href="${pageContext.request.contextPath}/resources/css/1794b81.css"
	rel="stylesheet" type="text/css">

<div data-v-b36cb8c4="" data-v-34b11929=""
	class="container sell lg step-1">
	<!---->
	<div data-v-b36cb8c4="" class="content">
		<div data-v-877ed62a="" data-v-b36cb8c4="" class="buy_immediate">
			<div data-v-2b95d831="" data-v-877ed62a="" class="product_info_area">
				<div data-v-2b95d831="" class="product_info">
					<div data-v-09fbcf09="" data-v-2b95d831="" class="product"
						style="background-color: rgb(235, 240, 245);">
						<picture data-v-878ec45c="" data-v-09fbcf09=""
							class="picture product_img">
						
						<img data-v-878ec45c="" referrerpolicy="no-referrer" alt="상품 이미지"
							src="${productDetailDTO.img1}"
							loading="lazy" class="image"></picture>
						<!---->
						<!---->
						<!---->
						<!---->
					</div>
					<div data-v-2b95d831="" class="product_detail">
						<strong data-v-2b95d831="" class="model_number"> <!---->${productDetailDTO.model_number}
						</strong>
						<p data-v-2b95d831="" class="model_title">${productDetailDTO.pname_e}</p>
						<p data-v-2b95d831="" class="model_ko">${productDetailDTO.pname_k}</p>
						<div data-v-2b95d831="" class="model_desc">
							<p data-v-2b95d831="" class="size_txt">${productBuySizeDTO.model_size}</p>
							<!---->
						</div>
					</div>
				</div>
			</div>
			<div data-v-158ed304="" data-v-877ed62a=""
				class="price_descision_box">
				<ul data-v-638c1354="" data-v-158ed304="" class="price_list">
				   <li data-v-638c1354="" class="list_item"><p
											data-v-638c1354="" class="title">즉시 구매가</p>
										
										<c:if test="${productSaleSizeDTO.price eq 0}">
										<span data-v-638c1354="" class="price"> 
											-
											</span>
										</c:if>
										<c:if test="${productSaleSizeDTO.price ne 0}">
										<span data-v-638c1354="" class="price"> 
											<fmt:formatNumber type="number" maxFractionDigits="3" value="${productSaleSizeDTO.price}" />
	    												</span><span
										data-v-638c1354="" class="unit">원</span>
										</c:if></li>
					<li data-v-638c1354="" class="list_item"><p data-v-638c1354=""
							class="title">즉시 판매가</p> 
							<c:if test="${productBuySizeDTO.price eq 0}">
										<span data-v-638c1354="" class="price"> 
											-
											</span>
										</c:if>
										<c:if test="${productBuySizeDTO.price ne 0}">
								<span data-v-638c1354="" class="price"> 
											<fmt:formatNumber type="number" maxFractionDigits="3" value="${productBuySizeDTO.price}" />
	    												</span><span
										data-v-638c1354="" class="unit">원</span>
										</c:if></li>
				</ul>
				<div data-v-158ed304="" class="instant_group">
					<div data-v-b6b2883e="" data-v-158ed304="" class="tab_area buy_tab">
						<ul data-v-b6b2883e="" role="tablist" class="tab_list">
							<li id = "sellBid" data-v-b6b2883e="" role="tab" aria-selected="true"
								aria-controls="panel1" class="item on"><a data-v-b6b2883e=""
								href="#" class="item_link">판매 입찰</a></li>
							<li id = "sellNow" data-v-b6b2883e="" role="tab" aria-selected="false"
								aria-controls="panel2" class="item" <c:if test='${productBuySizeDTO.price eq 0}'>disabled </c:if>><a
								data-v-b6b2883e="" href="#" class="item_link">즉시 판매</a></li>
						</ul>
						<!---->
						<!---->
					</div>
					<!-- 판매입찰 누르면 나오는 관련내용들 -->
					<div id = "testbid">
					<form id="bidSaleAction" method="get" action="/sell/order/${productDetailDTO.pid}">
						<input type="hidden" name="size" value="${productBuySizeDTO.model_size}"/>
						<input type="hidden" name="type" value="판매입찰"/>
						<input type="hidden" id="dDay" name="dDay" value = "1"/>
						<div data-v-15aa5096="" data-v-158ed304=""
							class="price_now active_input">
							<dl data-v-15aa5096="" class="price_now_box">
								<dt data-v-15aa5096="" class="price_now_title">판매 희망가</dt>
								<dd data-v-15aa5096="" class="price">
									<input data-v-15aa5096="" type="text" id="bidSalePrice" name="price"
										pattern="([0-9]+.{0,1}[0-9]*,{0,1})*[0-9]" required="required"
										placeholder="희망가 입력" autocomplete="off" class="input_amount"><span
										data-v-15aa5096="" class="unit">원</span>
								</dd>
							</dl>
							<div data-v-15aa5096="" class="price_warning"
								style="display: none;">
								<!---->
							</div>
						</div>

						<div data-v-158ed304="" class="price_bind">
							<dl data-v-3a2a7b6b="" data-v-158ed304="" class="price_addition">
								<dt data-v-3a2a7b6b="" class="price_title">
									<span data-v-3a2a7b6b="">검수비</span>
									<!---->
								</dt>
								<dd data-v-3a2a7b6b="" class="price_text">-</dd>
							</dl>
							<dl data-v-3a2a7b6b="" data-v-158ed304="" class="price_addition">
								<dt data-v-3a2a7b6b="" class="price_title">
									<span data-v-3a2a7b6b="">수수료</span>
									<button data-v-3a2a7b6b="" class="btn_title">
										<svg data-v-3a2a7b6b="" xmlns="http://www.w3.org/2000/svg"
											class="icon sprite-icons info-circle-white">
											<use data-v-3a2a7b6b=""
												href="/_nuxt/3182c3b1ca2f77da7bc3e1acf109306c.svg#i-info-circle-white"
												xlink:href="/_nuxt/3182c3b1ca2f77da7bc3e1acf109306c.svg#i-info-circle-white"></use></svg>
									</button>
								</dt>
								<dd data-v-3a2a7b6b="" class="price_text"><span id ="bidSaleFee">-</span>원</dd>
							</dl>
							<dl data-v-3a2a7b6b="" data-v-158ed304="" class="price_addition">
								<dt data-v-3a2a7b6b="" class="price_title">
									<span data-v-3a2a7b6b="">배송비</span>
									<!---->
								</dt>
								<dd data-v-3a2a7b6b="" class="price_text">선불 ・ 판매자 부담</dd>
							</dl>
						</div>
						
						
						<div data-v-6bc9d8c2="" data-v-877ed62a=""
							class="deadline_info_area">
							<div data-v-6bc9d8c2="" class="section_title">
								<h3 data-v-6bc9d8c2="" class="title_txt">입찰 마감기한</h3>
							</div>
							<div data-v-6bc9d8c2="" class="section_content">
								<div data-v-6bc9d8c2="" class="bid_deadline">
									
									<div data-v-6bc9d8c2="" class="deadline_tab">
										<a data-v-575aff82="" data-v-6bc9d8c2="" href="#" onclick="agree_click(this);"
											class="btn outlinegrey medium"> 1일 </a>
										<a data-v-575aff82="" data-v-6bc9d8c2="" href="#" onclick="agree_click(this);"
										    class="btn outlinegrey medium">
											3일 </a>
										<a data-v-575aff82="" data-v-6bc9d8c2="" href="#" onclick="agree_click(this);"
											class="btn outlinegrey medium"> 7일 </a>
										<a data-v-575aff82="" data-v-6bc9d8c2="" href="#" onclick="agree_click(this);"
											class="btn outlinegrey medium is_active"> 30일 </a>
										<a data-v-575aff82="" data-v-6bc9d8c2="" href="#" onclick="agree_click(this);"
											class="btn outlinegrey medium"> 60일 </a>
									</div>
								</div>
							</div>
						</div>

						<div data-v-14995178="" data-v-877ed62a=""
							class="buy_total_confirm">
							<div data-v-679d7250="" data-v-14995178="" class="price_total">
								<dl data-v-679d7250="" class="price_box">
									<dt data-v-679d7250="" class="price_title">정산금액</dt>
									<dd data-v-679d7250="" class="price">
										<span data-v-679d7250="" class="amount"><span id="bidSaleTotalPrice">-</span></span><span
											data-v-679d7250="" class="unit">원</span>
									</dd>
								</dl>
								<span data-v-679d7250="" class="price_warning"
									style="display: none;"><em data-v-679d7250="">주의! </em></span>
							</div>
							<div data-v-14995178="" class="btn_confirm">
								<a data-v-575aff82="" data-v-14995178="" href="#" id="bidSaleActionClick"
									class="btn full solid false"> 판매 입찰 계속 </a>
							</div>
						</div>


					</form>
					</div>
					
					
					<!--즉시 판매 탭 누르면 관련 내용이 나옴  -->
				<div id = "testsell" style="display: none;">
					<div data-v-15aa5096="" data-v-158ed304="" class="price_now">
						<dl data-v-15aa5096="" class="price_now_box">
							<dt data-v-15aa5096="" class="price_now_title">즉시 판매가</dt>
							<dd data-v-15aa5096="" class="price">
								<span data-v-15aa5096="" class="amount" id="nowSalePrice"><fmt:formatNumber type="number" maxFractionDigits="3" value="${productBuySizeDTO.price}" /></span><span
									data-v-15aa5096="" class="unit">원</span>
							</dd>
						</dl>
						<div data-v-15aa5096="" class="price_warning"
							style="display: none;">
							<!---->
						</div>
					</div>
					<div data-v-158ed304="" class="price_bind">
						<dl data-v-3a2a7b6b="" data-v-158ed304="" class="price_addition">
							<dt data-v-3a2a7b6b="" class="price_title">
								<span data-v-3a2a7b6b="">검수비</span>
								<!---->
							</dt>
							<dd data-v-3a2a7b6b="" class="price_text">무료</dd>
						</dl>
						<dl data-v-3a2a7b6b="" data-v-158ed304="" class="price_addition">
							<dt data-v-3a2a7b6b="" class="price_title">
								<span data-v-3a2a7b6b="">수수료</span>
								<button data-v-3a2a7b6b="" class="btn_title">
									<svg data-v-3a2a7b6b="" xmlns="http://www.w3.org/2000/svg"
										class="icon sprite-icons info-circle-white">
										<use data-v-3a2a7b6b=""
											href="/_nuxt/3182c3b1ca2f77da7bc3e1acf109306c.svg#i-info-circle-white"
											xlink:href="/_nuxt/3182c3b1ca2f77da7bc3e1acf109306c.svg#i-info-circle-white"></use></svg>
								</button>
							</dt>
							<dd data-v-3a2a7b6b="" class="price_text">-<span id="nowSaleFee">900</span>원</dd>
						</dl>
						<dl data-v-3a2a7b6b="" data-v-158ed304="" class="price_addition">
							<dt data-v-3a2a7b6b="" class="price_title">
								<span data-v-3a2a7b6b="">배송비</span>
								<!---->
							</dt>
							<dd data-v-3a2a7b6b="" class="price_text">선불 ・ 판매자 부담</dd>
						</dl>
					</div>
				
					<div data-v-14995178="" data-v-877ed62a=""
						class="buy_total_confirm" is-instant="true">
						<div data-v-679d7250="" data-v-14995178="" class="price_total">
							<dl data-v-679d7250="" class="price_box">
								<dt data-v-679d7250="" class="price_title">정산금액</dt>
								<dd data-v-679d7250="" class="price">
									<span data-v-679d7250="" class="amount"><span id="nowSaleTotalPrice">151,200</span></span><span
										data-v-679d7250="" class="unit">원</span>
								</dd>
							</dl>
							<span data-v-679d7250="" class="price_warning"
								style="display: none;"><em data-v-679d7250="">주의! </em></span>
						</div>
					<form id ="orderSellNowAction" method="get" action="/sell/order/${productDetailDTO.pid}">	
						<input type="hidden" name="size" value="${productBuySizeDTO.model_size}"/>
					    <input type="hidden" name="type" value="즉시판매"/>
						<input type="hidden" name="price" value="${productBuySizeDTO.price}"/>
						<div data-v-14995178="" class="btn_confirm">
							<a data-v-575aff82="" data-v-14995178="" href="#" onclick="document.getElementById('orderSellNowAction').submit()"
								class="btn full solid false"> 즉시 판매 계속 </a>
						</div>
					</form>
					</div>
				</div><!-- 끝 -->
			</div>
			<!---->
			
			<!-------------------------------------->
			
		</div>
		<!---->
		<!---->
	</div>
	<!---->
	<!---->
</div>


<%@ include file="/WEB-INF/views/common/footer.jsp"%>