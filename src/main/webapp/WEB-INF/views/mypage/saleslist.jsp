<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>

<link
	href="${pageContext.request.contextPath}/resources/css/9218b3f.css"
	rel="stylesheet" type="text/css">

<link
	href="${pageContext.request.contextPath}/resources/css/c3e0280.css"
	rel="stylesheet" type="text/css">

<div data-v-39b2348a="" class="container my lg">
	<%@ include file="/WEB-INF/views/common/nav.jsp"%>
	<div data-v-39b2348a="" class="content_area">
		<div class="my_purchase">
			<div data-v-88eb18f6="" class="content_title">
				<div data-v-88eb18f6="" class="title">
					<h3 data-v-88eb18f6="">판매 내역</h3>
					<!---->
				</div>
				<!---->
			</div>
			<div data-v-0c307fea="" class="purchase_list_tab sell detail_tab">
				<div data-v-0c307fea="" class="tab_item total">
					<a data-v-0c307fea="" href="#" class="tab_link"><dl
							data-v-0c307fea="" class="tab_box">
							<dt data-v-0c307fea="" class="title">전체</dt>
							<dd data-v-0c307fea="" class="count">0</dd>
						</dl></a>
				</div>
				<div data-v-0c307fea="" class="tab_item tab_on">
					<a data-v-0c307fea="" href="#" class="tab_link"><dl
							data-v-0c307fea="" class="tab_box">
							<dt data-v-0c307fea="" class="title">판매 입찰</dt>
							<dd data-v-0c307fea="" class="count">0</dd>
						</dl></a>
				</div>
				<div data-v-0c307fea="" class="tab_item">
					<a data-v-0c307fea="" href="#" class="tab_link"><dl
							data-v-0c307fea="" class="tab_box">
							<dt data-v-0c307fea="" class="title">진행 중</dt>
							<dd data-v-0c307fea="" class="count">0</dd>
							<!---->
						</dl></a>
				</div>
				<div data-v-0c307fea="" class="tab_item">
					<a data-v-0c307fea="" href="#" class="tab_link"><dl
							data-v-0c307fea="" class="tab_box">
							<dt data-v-0c307fea="" class="title">종료</dt>
							<dd data-v-0c307fea="" class="count">0</dd>
						</dl></a>
				</div>
			</div>
			<div class="period_search">
				<div class="period_month">
					<ul class="month_list">
						<li class="month_item"><a href="#" class="month_link">최근
								2개월</a></li>
						<li class="month_item"><a href="#" class="month_link">4개월</a></li>
						<li class="month_item"><a href="#" class="month_link">6개월</a></li>
						<li class="month_item custom"><a href="#" class="month_link">기간조회</a></li>
					</ul>
					<!---->
				</div>
				<div class="period_calendar_wrapper"
					today="Thu Jan 12 2023 15:20:16 GMT+0900 (한국 표준시)">
					<div class="period_calendar">
						<div class="calendar_wrap">
							<span><div class="calendar">
									<input disabled="disabled" class="cal_input"><span
										class="cal_btn"></span>
								</div>
								<div data-v-4cb7b681="" class="vc-popover-content-wrapper">
									<!---->
								</div></span>
						</div>
						<span class="swung_dash">~</span>
						<div class="calendar_wrap">
							<span><div class="calendar">
									<input class="cal_input"><span class="cal_btn"></span>
								</div>
								<div data-v-4cb7b681="" class="vc-popover-content-wrapper">
									<!---->
								</div></span>
						</div>
					</div>
					<div class="period_btn_box">
						<button class="btn_search is_active">조회</button>
					</div>
				</div>
			</div>
			<ul data-v-a54c4c26="" class="search_info">
				<li data-v-a54c4c26="" class="info_item"><p data-v-a54c4c26="">한
						번에 조회 가능한 기간은 최대 6개월입니다.</p></li>
				<li data-v-a54c4c26="" class="info_item"><p data-v-a54c4c26="">기간별
						조회 결과는 입찰일 기준으로 노출됩니다.</p></li>
			</ul>
			<div data-v-0d2f7c95="" class="purchase_list bidding ask">
				<div data-v-0d2f7c95="" class="purchase_head">
					<div data-v-0d2f7c95="" class="head_product">
						<a data-v-0d2f7c95="" href="#" class="btn_filter"> 전체 <svg
								data-v-0d2f7c95="" xmlns="http://www.w3.org/2000/svg"
								class="ico-arr-dir-down-circle icon sprite-icons">
								<use data-v-0d2f7c95=""
									href="/_nuxt/3182c3b1ca2f77da7bc3e1acf109306c.svg#i-ico-arr-dir-down-circle"
									xlink:href="/_nuxt/3182c3b1ca2f77da7bc3e1acf109306c.svg#i-ico-arr-dir-down-circle"></use></svg></a>
					</div>
					<div data-v-0d2f7c95="" class="head_status">
						<div data-v-0d2f7c95="" class="status_box field_price">
							<a data-v-0d2f7c95="" href="#" class="status_link"><span
								data-v-0d2f7c95="" class="status_txt">판매 희망가</span></a>
						</div>
						<div data-v-0d2f7c95="" class="status_box field_date_purchased">
							<a data-v-0d2f7c95="" href="#" class="status_link"><span
								data-v-0d2f7c95="" class="status_txt">구매일</span></a>
						</div>
						<div data-v-0d2f7c95="" class="status_box field_date_paid">
							<a data-v-0d2f7c95="" href="#" class="status_link"><span
								data-v-0d2f7c95="" class="status_txt">정산일</span></a>
						</div>
						<div data-v-0d2f7c95="" class="status_box field_expires_at">
							<a data-v-0d2f7c95="" href="#" class="status_link"><span
								data-v-0d2f7c95="" class="status_txt">만료일</span></a>
						</div>
						<div data-v-0d2f7c95="" class="status_box field_status ascending">
							<a data-v-0d2f7c95="" href="#" class="status_link"><span
								data-v-0d2f7c95="" class="status_txt">상태</span></a>
						</div>
					</div>
				</div>
				<div data-v-e2f6767a="" data-v-0d2f7c95="" class="empty_area">
					<p data-v-e2f6767a="" class="desc">판매 입찰 내역이 없습니다.</p>
					<a data-v-575aff82="" data-v-e2f6767a="" href="#"
						class="btn outlinegrey small"> SHOP 바로가기 </a>
				</div>
				<!---->
				<!---->
				<!---->
				<!---->
			</div>
			<!---->
		</div>
	</div>
</div>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>