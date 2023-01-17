<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>

<link
	href="${pageContext.request.contextPath}/resources/css/5e180f7.css"
	rel="stylesheet" type="text/css">

<link
	href="${pageContext.request.contextPath}/resources/css/dd5752f.css"
	rel="stylesheet" type="text/css">
<div data-v-3f89f857="" data-v-34b11929="" class="container sell lg">
	<div data-v-3f89f857="" class="content_area">
		<div data-v-3f89f857="" class="sell_before">
			<div data-v-3f89f857="" class="sell_before_check">
				<div data-v-33a8744d="" data-v-3f89f857="" class="product_info">
					<div data-v-33a8744d="" class="product_thumb">
						<div data-v-09fbcf09="" data-v-33a8744d="" class="product"
							style="background-color: rgb(235, 240, 245);">
							<picture data-v-878ec45c="" data-v-09fbcf09=""
								class="picture product_img">
							<source data-v-878ec45c="" type="image/webp"
								srcset="https://kream-phinf.pstatic.net/MjAyMTA3MjhfMjIg/MDAxNjI3NDQxMDA1NjE5.HOgIYywGZaaBJDqUzx2OnX9HAxoOWPvuWHqUn_LZGcgg.VYIuOfA5_GgjBGRowv6dmQuAOPtUvmAxbGpOyUCOCtYg.PNG/p_9d8ed1a74d2540ab9842e63363607bf4.png?type=m_webp">
							<source data-v-878ec45c=""
								srcset="https://kream-phinf.pstatic.net/MjAyMTA3MjhfMjIg/MDAxNjI3NDQxMDA1NjE5.HOgIYywGZaaBJDqUzx2OnX9HAxoOWPvuWHqUn_LZGcgg.VYIuOfA5_GgjBGRowv6dmQuAOPtUvmAxbGpOyUCOCtYg.PNG/p_9d8ed1a74d2540ab9842e63363607bf4.png?type=m">
							<img data-v-878ec45c="" alt="상품 이미지"
								src="https://kream-phinf.pstatic.net/MjAyMTA3MjhfMjIg/MDAxNjI3NDQxMDA1NjE5.HOgIYywGZaaBJDqUzx2OnX9HAxoOWPvuWHqUn_LZGcgg.VYIuOfA5_GgjBGRowv6dmQuAOPtUvmAxbGpOyUCOCtYg.PNG/p_9d8ed1a74d2540ab9842e63363607bf4.png?type=m"
								loading="lazy" class="image"></picture>
							<!---->
							<!---->
							<!---->
							<!---->
						</div>
					</div>
					<div data-v-33a8744d="" class="product_detail">
						<p data-v-33a8744d="" class="code">${productDetailDTO.model_number}</p>
						<p data-v-33a8744d="" class="name">${productDetailDTO.pname_e}</p>
						<p data-v-33a8744d="" class="translated_name">${productDetailDTO.pname_k}</p>
						<!---->
						<div data-v-6da6dff3="" data-v-33a8744d=""
							class="badge badge_product shipping_express">빠른배송</div>
					</div>
				</div>
				<div data-v-3f89f857="" class="sell_before_select">
					<div data-v-28805923="" data-v-3f89f857="" class="select_area lg">
						<!---->
						<ul data-v-28805923="" class="select_list">
						   <c:forEach var="productSize" items="${productSizeList}">
							<li data-v-28805923="" class="select_item"><button
									data-v-28805923="" role="button" aria-selected="false"
									class="select_link sell">
									<div data-v-28805923="" class="link_inner">
										<span data-v-28805923="" class="size">
										   ${productSize.model_size}
										</span>
										  <span data-v-28805923="" class="price">
	                                          		<c:if test="${productSize.price eq 0}">
	    												<c:out value="판매입찰" />
	    											</c:if>
	    											<c:if test="${productSize.price ne 0}">
	    												<fmt:formatNumber type="number" maxFractionDigits="3" value="${productSize.price}" />
	    											</c:if>
                                          </span>
									</div>
								</button>
								</li>
							</c:forEach>
						</ul>
					</div>
					<div data-v-744cecc2="" data-v-3f89f857="" class="order_btn_area">
						<a data-v-c631041c="" data-v-744cecc2="" href="#"
							class="btn_order order_sell sell clickable"><div
								data-v-c631041c="" class="box">
								<!---->
								<div data-v-c631041c="" class="order_case_info">
									<span data-v-c631041c="" class="order_price">상품 판매</span><span
										data-v-c631041c="" class="order_desc">선불발송</span>
								</div>
							</div></a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!---->
</div>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>