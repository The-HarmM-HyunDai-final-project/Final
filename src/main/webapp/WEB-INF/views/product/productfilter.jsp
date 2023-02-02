<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<script src="${pageContext.request.contextPath}/resources/js/product_detail_tab.js" defer=""></script>
<script src="${pageContext.request.contextPath}/resources/js/reviewstab.js" defer=""></script>
<c:forEach items="${keywordPostList}" var="keywordPost">
<li>
										<div class="list-row fold-header">
											<div class="cell-title">
												<div class="review-group">
												<ul class="review-prd-info">
													<li>
														<span class="point size-m"><span class="ico" style="width:${keywordPost.sentiment_percent}%">별점 5점</span></span>
													</li>
													
													<li>
														<div class="prd-name">${keywordPost.member_email }&nbsp;</div>
													</li>
													<!-- <li>
														<div class="prd-option">
															구매옵션 : S
														</div>
													</li> -->
													<li><span class="date">${keywordPost.register_date }</span></li>
													
												</ul>
	
												<div class="txt-box"> ${keywordPost.contents }</div>
												
												
											</div>
												<button type="button" class="btn-fold">열기</button>
											</div>
										</div>
	
										<div class="fold-cont">
											<div class="review-group">
													<ul class="files">
														<li class="img-file">
															<button type="button" onclick="layerViewImg();"
																style="background-image: url(${pageContext.request.contextPath}/${keywordPost.upload_path}/${keywordPost.uuid}_${keywordPost.file_name}); transform: rotate(0deg);">
																<img referrerpolicy="no-referrer"
																	src="${pageContext.request.contextPath}/${keywordPost.upload_path}/${keywordPost.uuid}_${keywordPost.file_name}"
																	alt="2023-01-18-16-29-33-366"
																	style="transform: rotate(0deg);">
															</button>
														</li>
													</ul>
												</div>
										</div>
									</li>
</c:forEach>