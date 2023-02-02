<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<link
	href="${pageContext.request.contextPath}/resources/css/2ee49b5.css"
	rel="stylesheet" type="text/css">
<div class="container login" data-v-464f7370="" data-v-3007c576="">
	<div class="content lg" data-v-464f7370="">
		<div class="login_area" data-v-464f7370="">
			<h2 class="login_title" data-v-464f7370="">
				<span class="blind" data-v-464f7370="">KREAM</span>
			</h2>
			<form id="loginForm" name="loginForm" method="post">
				<div class="has_button input_box" data-v-1c44afeb=""
					data-v-464f7370="">
					<h3 class="input_title" data-v-1c44afeb="" data-v-464f7370="">이메일
						주소</h3>
					<div class="input_item" data-v-1c44afeb="">
						<input type="email" name="username"
							placeholder="예) theharmm@theharmm.co.kr" autocomplete="off"
							class="input_txt" data-v-1c44afeb="">
						<button type="button" class="btn input_delete"
							style="display: none;" data-v-575aff82="" data-v-464f7370=""
							data-v-1c44afeb="">
							<svg xmlns="http://www.w3.org/2000/svg"
								class="ico-delete-circle icon sprite-icons" data-v-464f7370="">
											<use
									href="/controller/resources/3182c3b1ca2f77da7bc3e1acf109306c.svg#i-ico-delete-circle"
									xlink:href="/controller/resources/3182c3b1ca2f77da7bc3e1acf109306c.svg#i-ico-delete-circle"
									data-v-464f7370=""></use></svg>
						</button>
					</div>
					<p class="input_error" data-v-1c44afeb="" data-v-464f7370="">이메일
						주소를 정확히 입력해주세요.</p>
				</div>
				<div class="input_box has_button" data-v-1c44afeb=""
					data-v-464f7370="">
					<h3 class="input_title" data-v-1c44afeb="" data-v-464f7370="">비밀번호</h3>
					<div class="input_item" data-v-1c44afeb="">
						<input type="password" name="password" placeholder=""
							autocomplete="off" class="input_txt" data-v-1c44afeb=""
							onkeypress="if( event.keyCode == 13 ){btn_click();}">
					</div>
					<p class="input_error" data-v-1c44afeb="" data-v-464f7370="">
						영문, 숫자, 특수문자를 조합해서 입력해주세요. (8-16자)</p>
				</div>
				<div class="login_btn_box" data-v-464f7370="">
					<input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}" /> <a href="javascript:void(0);"
						onclick="btn_click();" class="btn full solid" data-v-575aff82=""
						data-v-464f7370=""> 로그인 </a>
				</div>

				<ul class="look_box" data-v-464f7370="">
					<li class="look_list" data-v-464f7370=""><a
						href="/member/join" class="look_link" data-v-464f7370=""> 이메일
							가입 </a></li>
					<li class="look_list" data-v-464f7370=""><a
						href="/login/find_email" class="look_link" data-v-464f7370="">
							이메일 찾기 </a></li>
					<li class="look_list" data-v-464f7370=""><a
						href="/login/find_password" class="look_link" data-v-464f7370="">
							비밀번호 찾기 </a></li>
				</ul>
				<br>
				<div class="social_login" data-v-5e2d3411="">
					 <a href="${ naver_url }"><img width="400" src="${pageContext.request.contextPath}/resources/images/naver-login.png" alt="Naver Login" /></a>
				</div>
			</form>
		</div>
	</div>
	<div class="banner_bottom lg" data-v-e5d8b6f4="" data-v-464f7370="">
		<a href="#" class="banner_box" data-v-e5d8b6f4="" style="background-color: #efe3ed;">
			<div class="banner_info" data-v-e5d8b6f4="">
				<p class="info_title" data-v-e5d8b6f4="">
					The harmM은 처음이지? <br>서비스 소개를 확인해보세요.
				</p>
				<span class="info_txt" data-v-e5d8b6f4="">서비스 안내</span>
			</div></a><a href="#" class="banner_box" data-v-e5d8b6f4="" style="background-color: #48665a;">
			<div class="banner_info" data-v-e5d8b6f4="">
				<p class="info_title" data-v-e5d8b6f4="">
					The harmM 앱을 설치하여 <br>한정판 스니커즈를 FLEX 하세요!
				</p>
				<span class="info_txt" data-v-e5d8b6f4="">앱 설치하기</span>
			</div></a>
		<!---->
	</div>
</div>
<script>
	function btn_click() {
		/* var referer = document.referrer;
		$("#referer").val(referer); */
		console.log("눌리나");
		console.log($("#loginForm").find("input[class='input_txt']"));

		$("#loginForm").attr("action", "/login");
		$("#loginForm").submit();

	};
</script>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>