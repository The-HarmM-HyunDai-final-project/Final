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
</head>
<body class="bg-primary">
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
												  <button type="button" class="btn btn-primary btn-lg dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
												    제한 등급
												  </button>
												  <div class="dropdown-menu">
												    <a class="dropdown-item" href="javascript:void(0);">Bronze</a>
												    <a class="dropdown-item" href="javascript:void(0);">Silver</a>
												    <a class="dropdown-item" href="javascript:void(0);">Gold</a>
												    <a class="dropdown-item" href="javascript:void(0);">Platinum</a>
												    <a class="dropdown-item" href="javascript:void(0);">Diamond</a>
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
									<div class="mt-4 mb-0">
										<div class="d-grid">
											<a class="btn btn-primary btn-block" href="" name="enrollBtn" id="enrollBtn">라이브쇼
												시작하기</a><input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> 
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
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	<script src="${pageContext.request.contextPath}/resources/js/admin/scripts.js"></script>
	<script>
		let enrollForm = $("#enrollForm");
		$(".dropdown-menu a ").click(function(){

			  $(".btn-lg:first-child").html($(this).text()+' <span class="caret"></span>');
			});

		$(".dropdown-item").on("click", function(){
			$("#restrict_grade").val($(this).text());
			//console.log($("#restrict_grade").val());
		});
		
		/* 개설하기 버튼 */
		$("#enrollBtn").on("click",function(e){
			
			e.preventDefault();
			
			enrollForm.submit();
			
		});
	
	</script>
</body>
</html>