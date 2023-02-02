<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>The harmM BackOffice</title>
<link
	href="${pageContext.request.contextPath}/resources/css/admin/styles.css"
	rel="stylesheet" />
<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js"
	crossorigin="anonymous"></script>

<!-- <script src="https://code.jquery.com/jquery-3.5.1.js"></script> -->
</head>
<body class="bg-dark">
	<div id="layoutAuthentication">
		<div id="layoutAuthentication_content">
			<main>
			<div class="container">
				<div class="row justify-content-center">
					<div class="col-lg-7">
						<div class="card shadow-lg border-0 rounded-lg mt-5">
							<div class="card-header">
								<h3 class="text-center font-weight-light my-4">라이브쇼 개설하기</h3>
							</div>
							<div class="card-body">
								<form action="/admin/showliveEnroll" method="post" id="enrollForm">
									<div class="row mb-3">
										<div class="col-md-6">
											<div class="form-floating mb-3 mb-md-0">
												<input class="form-control" id="inputOne" type="text" name="showlive_name"
													placeholder="" /> <label for="inputOne">쇼라이브 제목</label>
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-floating">
												<div class="btn-group">
												  <button type="button" class="btn btn-dark btn-lg dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
												    제한 등급
												  </button>
												  <div class="dropdown-menu">
												    <a class="dropdown-item" href="javascript:void(0);">BRONZE</a>
												    <a class="dropdown-item" href="javascript:void(0);">SILVER</a>
												    <a class="dropdown-item" href="javascript:void(0);">GOLD</a>
												    <a class="dropdown-item" href="javascript:void(0);">PLATINUM</a>
												    <a class="dropdown-item" href="javascript:void(0);">DIAMOND</a>
												  </div>
												  <input class="form-control" type="hidden" id="restrict_grade" type="text" name="restricted_grade" />
												</div>
											</div>
										</div>
									</div>
									<div class="row mb-3">
										<div class="col-md-6">
											<div class="form-floating mb-3 mb-md-0">
												<input class="form-control" id="inputThree" type="text" name="product_name"
													placeholder="" /> <label for="inputThree">상품명</label>
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-floating">
												<input class="form-control" id="inputFour" type="number" name="showlive_start_price"
													placeholder="" /> <label for="inputFour">상품 시작 가격</label>
											</div>
										</div>
									</div>
									<div class="form-floating mb-3">
 										<input name="uploadFile" class="form-control" type="file" id="formFileMultiple" multiple 
 										style="padding-bottom: 20px; padding-top: 20px; padding-left: 30px; padding-right: 30px;">
									</div>
									<div class="form-floating mb-3">
										<input class="form-control" id="inputFive" type="password" name="aws_stream_key"
											placeholder="" /> <label for="inputFive">Stream Key</label>
									</div>
									<div class="form-floating mb-3">
										<input class="form-control" id="inputSix" type="password" name="aws_endpoint"
											placeholder="" /> <label for="inputSix">End Point</label>
									</div>
									<div class="form-floating mb-3">
										<input class="form-control" id="inputSeven" type="password" name="aws_channel_url"
											placeholder="" /> <label for="inputSeven">URL</label>
									</div>
										<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
										<input class="images" type="hidden" name="prouct_img1" value="" />
										<input class="images" type="hidden" name="prouct_img2" value="" />
										<input class="images" type="hidden" name="prouct_img3" value="" />
									<div class="mt-4 mb-0">
										<div class="d-grid">
											<a class="btn btn-dark btn-block" href="" name="enrollBtn" id="enrollBtn">라이브쇼
												시작하기</a> 
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
			</main>
		</div>
	</div>
	<!-- 제이쿼리 cdn -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	<%-- <script src="${pageContext.request.contextPath}/resources/js/admin/scripts.js"></script> --%>
	
	<script>
	let enrollForm = $("#enrollForm");
	$(".dropdown-menu a ").click(function(){
		  $(".btn-lg:first-child").html($(this).text()+' <span class="caret"></span>');
		});
	//등급 선택
	$(".dropdown-item").on("click", function(){
		$("#restrict_grade").val($(this).text());
		//console.log($("#restrict_grade").val());
	});
		
			// 파일 사이즈 검사
			var maxSize = 5242880; //한 이미지당 5MB를 넘을 수 없음
			function checkExtension(fileSize) {
				if (fileSize >= maxSize) {
					alert("파일 사이즈 초과");
					return false;
				}//end if
				return true;
			}
			function upLoadImg(){
			   let fileInput = $('input[name="uploadFile"]');
			   let fileList = fileInput[0].files;
			   let fileObj = fileList[0];
			   
			   let csrfHeaderName ="${_csrf.headerName}";
			   let csrfTokenValue="${_csrf.token}";
			   //크기 체크 있으면 좋은데...
			   
			   var formData = new FormData();
			   
			   //파일 formdata에 추가
				for (var i = 0; i < fileList.length; i++) {
					// 크기 체크
					if (!checkExtension(fileList[i].size)) {
						return false;
					}
					formData.append("uploadFile", fileList[i])
				}//end for
				
				$.ajax({
					url : "/admin/uploadAjaxAction",
					processData : false,
					contentType : false,
					data : formData,
					type : "post",
					dataType : 'json',
					beforeSend : function(xhr) {
						xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
					},
					success : function(result) {
						//alert("Upload");
						//fileObject = result;
						var idx = 0;
						$.each(result, function(index, item){
							if(idx < 3){
								const order = index+1;
								$('input[name="prouct_img' + order + '"]').val(item);
								console.log($('input[name="prouct_img' + order + '"]').val());
							}
							idx++;
						});
						
					}//end suce..			
				});//end ajax	
			}
			
			/* 이미지 업로드 */
			$("input[type='file']").on("change", function(e) {
				upLoadImg();
			});
	    

		/* 개설하기 버튼 */
		$("#enrollBtn").on("click",function(e){
			
			e.preventDefault();
			
			enrollForm.submit();
			
		});
		
	</script>
</body>
</html>