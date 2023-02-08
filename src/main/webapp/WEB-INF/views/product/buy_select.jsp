<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>KREAM | 한정판 거래의 FLEX</title>
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
<script async="" src="https://websdk.appsflyer.com?st=pba&amp;"></script>
<script async="" src="https://websdk.appsflyer.com?st=pba&amp;"></script>
<script type="text/javascript" async=""
   src="https://www.google-analytics.com/analytics.js"></script>
<script type="text/javascript" async=""
   src="https://www.googletagmanager.com/gtag/js?id=UA-153398119-1&amp;l=dataLayer&amp;cx=c"></script>
<script async="" src="https://websdk.appsflyer.com?st=pba&amp;"></script>
<script
   src="https://connect.facebook.net/signals/config/740347893514718?v=2.9.91&amp;r=stable"
   async=""></script>
<script async="" src="https://connect.facebook.net/en_US/fbevents.js"></script>
<script data-n-head="ssr" type="application/ld+json">{"@context":"http://schema.org","@type":"Organization","name":"KREAM","url":"https://kream.co.kr/","logo":"https://kream.co.kr/images/logo.png","sameAs":["https://apps.apple.com/app/id1490580239","https://play.google.com/store/apps/details?id=com.fstudio.kream","https://www.instagram.com/kream.co.kr/","https://www.youtube.com/channel/UCHbInfTxnIbWlUFin7drigw"]}</script>
<link rel="preload" href="${pageContext.request.contextPath}/resources/css/4a42468.css" as="style">
<link rel="preload" href="${pageContext.request.contextPath}/resources/css/734fa9a.css" as="style">
<link rel="preload" href="${pageContext.request.contextPath}/resources/css/325de86.css" as="style">
<link rel="preload" href="${pageContext.request.contextPath}/resources/css/a52fa45.css" as="style">
<link rel="preload" href="${pageContext.request.contextPath}/resources/css/acdef89.css" as="style">
<link rel="preload" href="${pageContext.request.contextPath}/resources/css/48656c7.css" as="style">
<link rel="preload" href="${pageContext.request.contextPath}/resources/css/ae12c7f.css" as="style">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/4a42468.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/734fa9a.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/325de86.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/a52fa45.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/acdef89.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/48656c7.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/ae12c7f.css">
<style type="text/css"> /*# sourceMappingURL=contenteditable.vue.map */
</style>
<script type="text/javascript" async=""
   src="https://wcs.naver.net/wcslog.js" id="naver-ads" data-loaded="true"></script>
<script
   src="https://www.googletagmanager.com/gtag/js?l=dataLayer&amp;id=G-SRFKTMTR0R"
   async=""></script>
 

<link rel="preload" as="style" href="${pageContext.request.contextPath}/resources/css/24dfaf3.css">

<link rel="preload" as="style" href="${pageContext.request.contextPath}/resources/css/b69f662.css">

<link rel="preload" as="style" href="${pageContext.request.contextPath}/resources/css/f0dbc2f.css">
<link rel="preload" as="style" href="${pageContext.request.contextPath}/resources/css/dd5752f.css">
<link rel="preload" as="style" href="${pageContext.request.contextPath}/resources/css/1f75df9.css">

<link rel="preload" as="style" href="${pageContext.request.contextPath}/resources/css/7b32aa1.css">
<script>
$(function(){
	let selectBtn = $(".select_item");
	let size 
	
	selectBtn
			.on(
					"click",
					function(e) {
						
						console.log("사이즈 클릭!!!!!");
						//console.log(e.currentTarget);	
						const list = e.currentTarget;
				        console.log(list);
				        $(this).addClass("active").attr("aria-selected", "true").siblings().removeClass("active").attr("aria-selected","false");
						size = list.getElementsByClassName("size")[0].innerHTML;
						size = size.trim();
						selectBuySize.setAttribute("value",size);
						
						console.log(size);
					});

})
</script>
<meta data-n-head="ssr" data-hid="description" name="description"
   content="한정판 거래의 FLEX, KICKS RULE EVERYTHING AROUND ME">
<meta data-n-head="ssr" data-hid="og:title" name="og:title"
   property="og:title" content="KREAM | 한정판 거래의 FLEX">
<meta data-n-head="ssr" data-hid="og:description" name="og:description"
   property="og:description" content="한정판을 거래하는 가장 확실한 방법">
<meta data-n-head="ssr" data-hid="og:image" name="og:image"
   property="og:image"
   content="https://kream.co.kr/images/index_og_kream.png">
</head>
<body>
   <div id="__nuxt">
      <!---->
      <div id="__layout">
         <div data-v-34b11929="" tabindex="0" class="wrap lg win_os">
            <div data-v-34b11929="">
               <!---->
            
            </div>
            <!---->
            
            <div data-v-b6b7a1e8="" data-v-34b11929="" class="container buy lg">
               <div data-v-b6b7a1e8="" class="content_area">
                  <div data-v-b6b7a1e8="" class="buy_before">
                     <div data-v-b6b7a1e8="" class="buy_before_check">
                        <div data-v-33a8744d="" data-v-b6b7a1e8="" class="product_info">
                           <div data-v-33a8744d="" class="product_thumb">
                              <div data-v-09fbcf09="" data-v-33a8744d="" class="product"
                                 style="background-color: rgb(244, 244, 244);">
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
                           </div>
                           <div data-v-33a8744d="" class="product_detail">
                              <p data-v-33a8744d="" class="code">${productDetailDTO.model_number}</p>
                              <p data-v-33a8744d="" class="name">${productDetailDTO.pname_e}</p>
                              <p data-v-33a8744d="" class="translated_name">${productDetailDTO.pname_k}</p>
                              <!---->
                              <!---->
                           </div>
                        </div>
                        <div data-v-b6b7a1e8="" class="buy_before_select">
                           <div data-v-28805923="" data-v-b6b7a1e8=""
                              class="select_area lg">
                              <!---->
                              <ul data-v-28805923="" class="select_list">
									<c:forEach var="productSize" items="${productSaleSizeList}">
										<li data-v-28805923="" class="select_item">
											<button data-v-28805923="" role="button" aria-selected="false" class="select_link buy">
                                       		<div data-v-28805923="" class="link_inner">
                                          		<span data-v-28805923="" class="size">
                                            	   ${productSize.model_size}
                                          		</span>
                                          		<span data-v-28805923="" class="price">
	                                          		<c:if test="${productSize.price eq 0}">
	    												<c:out value="구매입찰" />
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
                           <!--즉시구매, 구매입찰 버튼 -->
                           <form id ="selectBuySizeAction" method ="get" action="/buy/${productDetailDTO.pid}">
           			          
                             <input type="hidden" id="selectBuySize" name="size"/>
						     <div data-v-28c27354="" data-v-b6b7a1e8="" class="order_btn_area">
							  <a data-v-c631041c="" data-v-28c27354="" href="#" onclick ="document.getElementById('selectBuySizeAction').submit()"
									class="btn_order order_buy buy clickable"><div data-v-c631041c="" class="box">
												<!---->
									<div data-v-c631041c="" class="order_case_info">
										<span data-v-c631041c="" class="order_price"><strong style="color: #101010;">구매하기</strong></span>
									</div>
								</div></a>
							</div>
						   </form>
						</div>
                     </div>
                  </div>
               </div>
               <!---->
               <!---->
            </div>
            <div data-v-34b11929="">
            <%@ include file="/WEB-INF/views/common/footer.jsp"%>
            </div>
            
            <!---->
            <div data-v-34b11929="">
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
         </div>
      </div>
   </div>
   
   <script src="/_nuxt/4fbacaa.js" defer=""></script>
   <script src="/_nuxt/1c84866.js" defer=""></script>
   <script src="/_nuxt/f33c07a.js" defer=""></script>
   <script src="/_nuxt/1b4c860.js" defer=""></script>
   <script src="/_nuxt/0baa4c5.js" defer=""></script>
   <script src="/_nuxt/4296a15.js" defer=""></script>
   <script src="/_nuxt/b64a9b6.js" defer=""></script>
   <script src="/_nuxt/ed97882.js" defer=""></script>
   <script src="/_nuxt/b78c628.js" defer=""></script>
   <script src="/_nuxt/c348f6a.js" defer=""></script>
   <script src="/_nuxt/e6f69f8.js" defer=""></script>
   <script src="/_nuxt/b777585.js" defer=""></script>


   <link href="${pageContext.request.contextPath}/resources/css/325de86.css" rel="stylesheet" type="text/css">
   <link href="${pageContext.request.contextPath}/resources/css/ae12c7f.css" rel="stylesheet" type="text/css">
   <link href="${pageContext.request.contextPath}/resources/css/48656c7.css" rel="stylesheet" type="text/css">
   <link href="${pageContext.request.contextPath}/resources/css/a52fa45.css" rel="stylesheet" type="text/css">
   <link href="${pageContext.request.contextPath}/resources/css/acdef89.css" rel="stylesheet" type="text/css">
   <link href="${pageContext.request.contextPath}/resources/css/734fa9a.css" rel="stylesheet" type="text/css">
   <link href="${pageContext.request.contextPath}/resources/css/24dfaf3.css" rel="stylesheet" type="text/css">
   <link href="${pageContext.request.contextPath}/resources/css/b69f662.css" rel="stylesheet" type="text/css">
   <link href="${pageContext.request.contextPath}/resources/css/f0dbc2f.css" rel="stylesheet" type="text/css">
   <link href="${pageContext.request.contextPath}/resources/css/dd5752f.css" rel="stylesheet" type="text/css">
   <link href="${pageContext.request.contextPath}/resources/css/1f75df9.css" rel="stylesheet" type="text/css">
   <link href="${pageContext.request.contextPath}/resources/css/7b32aa1.css" rel="stylesheet" type="text/css">
</body>
</html>