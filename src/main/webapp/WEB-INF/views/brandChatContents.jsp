<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!-- 제이쿼리 cdn -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>

	<section class="chat_section">
				<h2 class="blind">채팅 컨텐츠</h2>
				<header class="chat_header">
					<h3 class="blind">브랜드 정보 영역</h3>
					<div class="chat_header_top">
						<div class="info_area">
							<h4 class="blind">브랜드 프로필</h4>
							<div class="thumbnail_area">
								<div class="thumbnail_wrap" aria-hidden="true">
									<img
										src="${brandChatRoomDTO.brand_img}"
										alt=""${brandChatRoomDTO.brand_img}">
								</div>
							</div>
							<div class="text_wrap">
								<div class="name_area">
									<a class="store_link N=a:cht.home" title="스마트스토어 이동"
										target="_blank" href="#"><strong
										class="name">${brandChatRoomDTO.brand}</strong></a>
								</div>
								<div class="text_area">
									<button class="btn_text_spread" type="button">
										<span><span class="message">부재중</span> <svg
												class="ico_down1">
												<use
													xlink:href="/nstatic/svg/icons.svg?20230202141000#fn-booking-down1"></use></svg></span>
									</button>
								</div>
							</div>
						</div>
						
					</div>

				</header>
				<section class="chat_area _chatWindow" id="brandChatSection">
					<h3 class="blind">대화 본문 영역</h3>
		<ul class="group_message_balloon" style="visibility: visible;">
						<!-- <li class="date_check"><span> <em><strong>21.
										5. 3.</strong>(월)</em>
						</span></li> -->
			<c:forEach var="brandChatMessage" items="${brandChatMessageList}">
			<c:if test="${brandChatMessage.member_email ne  memberInfo.member_email}">
			<li class="new_message_balloon_area   _message _msgId42    "
				data-id="42" data-temp-id="" data-date="1675854983675"
				data-sender="partner"
				data-thumburl="https://shop-phinf.pstatic.net/20161107_164/talk_1478486964180pged1_JPEG/image.JPEG?type=f164"
				data-partner-manager-name="" data-button-origin="@22186"
				data-content-type="text">
				<div class="thumbnail_profile _thmbnail" aria-label="프로필 사진">
					<a> <img
						src="${brandChatRoomDTO.brand_img}"
						alt="${brandChatMessage.member_email}" width="31"
						onerror="">
						<span class="thumbnail_mask"></span>
					</a>
				</div>
				<div class="chat_message_nickname _nickname">
					<strong> ${brandChatMessage.member_name}</strong>
				</div>
				<div class="message_balloon card_message">
					<p class="_copy_area">
					${brandChatMessage.chat_message}
					</p>
					<div class="txt_confirm _status" aria-label="메시지 작성시간">
						<span class="_time"><fmt:formatDate value="${brandChatMessage.chat_date}" pattern="a hh:mm" /></span>
					</div>
				</div>
			</li>
			</c:if>
			<c:if test="${brandChatMessage.member_email eq  memberInfo.member_email}">
			<li class="new_message_balloon_area   _message _msgId41   _my "
				data-id="41" data-temp-id="" data-date="1675854980728"
				data-sender="user"
				data-thumburl="https://shop-phinf.pstatic.net/20161107_164/talk_1478486964180pged1_JPEG/image.JPEG?type=f164"
				data-partner-manager-name="" data-content-type="text">
				<div class="message_balloon card_message rgt">
					<p class="_copy_area">
					${brandChatMessage.chat_message}
					</p>
					<div class="txt_confirm _status" aria-label="메시지 작성시간">
						<span class="_time"><fmt:formatDate value="${brandChatMessage.chat_date}" pattern="a hh:mm" /></span>
					</div>
				</div>
			</li>
			</c:if>
			</c:forEach>


		</ul>
				</section>
				
				<footer class="chat_write">
					<h3 class="blind">대화창 입력영역</h3>
					<div>
						<div class="chat_write_area">
							<h4 class="blind">메시지 입력 영역</h4>
							<div class="chat_write_wrap" style="width: 100%; display: block">
								<div class="KEP-ChatInputArea">
									<button class="KEP-ChatInputArea__btnMenu" aria-label="메뉴">
										<svg width="24" height="24" viewBox="0 0 24 24" fill="none"
											xmlns="http://www.w3.org/2000/svg">
						                    <path d="M4 5.5H20" stroke="#707070"
												strokewidth="1.25"></path>
						                    <path d="M4 12.5H20" stroke="#707070"
												strokewidth="1.25"></path>
						                    <path d="M4 19.5H20" stroke="#707070"
												strokewidth="1.25"></path>
						                </svg>
									</button>
									<form class="KEP-ChatInputArea__form" id="brandChatForm"
										enctype="multipart/form-data">
										<input type="text" placeholder="대화 내용을 입력해주세요" onkeyup="enterkey()"
											class="KEP-ChatInputArea__input" id="brandInputText"
											name="brandInputText"/>
										<!-- 1:1 문의 대량 테스트를 위해 1000자 제한 임시 제거 -->
										<!-- <input type="text" placeholder="궁금한 점을 입력해주세요" class="KEP-ChatInputArea__input" maxlength="1000"/>-->
										<button class="KEP-ChatInputArea__btnSend" aria-label="전송"
											type="button">
											<svg width="24" height="24" viewBox="0 0 24 24" fill="none"
												xmlns="http://www.w3.org/2000/svg">
						                        <path fill="currentColor"
													fill-rule="evenodd" clip-rule="evenodd"
													d="M4.00073 2C4.1736 2 4.34351 2.04482 4.4939 2.13007L19.9321 10.8818C20.4125 11.1542 20.5813 11.7645 20.3089 12.2449C20.2197 12.4023 20.0894 12.5326 19.9321 12.6218L4.4939 21.3735C4.01344 21.6459 3.40316 21.4772 3.1308 20.9968C3.04555 20.8464 3.00073 20.6765 3.00073 20.5036L3 13.05L11.2188 11.7518L3 10.452L3.00073 3C3.00073 2.44771 3.44845 2 4.00073 2Z">
						                        </path>
						                    </svg>
										</button>
									</form>
								</div>
							</div>

						</div>
					</div>
				</footer>
			</section>
			
<script>
function enterkey() {
	if (window.event.keyCode == 13) {
    	
    	$(".KEP-ChatInputArea__btnSend").trigger('click'); 
    	return;
    }
}

let sock = null;
var formDate = "";
var inputText = "";
var room_no = ${brandChatRoomDTO.room_no};

sock=new SockJS("http://localhost:8080/brand/chat");
console.log(sock);
sock.onmessage = onMessage;
sock.onopen = onOpen;
sock.onclose = onClose;

function onOpen() {
			var now = new Date(); // 현재 시간
			var utcNow = now.getTime() + (now.getTimezoneOffset() * 60 * 1000); // 현재 시간을 utc로 변환한 밀리세컨드값
			var koreaTimeDiff = 9 * 60 * 60 * 1000; // 한국 시간은 UTC보다 9시간 빠름(9시간의 밀리세컨드 표현)
			var koreaNow = new Date(utcNow + koreaTimeDiff);
			
			   const msg = {
				"chat_no" : 0,
				"room_no" : room_no,
				"member_name" : "${memberInfo.member_name}",
				"member_email" : "${memberInfo.member_email}",
				"chat_message" : "ENTER-CHAT",
				"chat_date" : koreaNow
			       
			         }
			      console.log('start socket : ' + msg);
			      let jsonData = JSON.stringify(msg);
			      
			      
			      sock.send(jsonData);
		}
		
		// 메시지 전송
		function sendMessage() {
			
		
		
		var now = new Date(); // 현재 시간
		var utcNow = now.getTime() + (now.getTimezoneOffset() * 60 * 1000); // 현재 시간을 utc로 변환한 밀리세컨드값
		var koreaTimeDiff = 9 * 60 * 60 * 1000; // 한국 시간은 UTC보다 9시간 빠름(9시간의 밀리세컨드 표현)
		var koreaNow = new Date(utcNow + koreaTimeDiff);
		   
		   const msg = {
				"chat_no" : 0,
	         "room_no" : room_no,
	     	 "member_name" : "${memberInfo.member_name}",
	         "member_email" : "${memberInfo.member_email}",
	         "chat_message" : document.getElementById("brandInputText").value,
	         "chat_date" : koreaNow
		   }
		   document.getElementById("brandInputText").value = null;
		   let jsonData = JSON.stringify(msg);
		   console.log(jsonData);
		   sock.send(jsonData);
		}
		
		// 서버로부터 메시지를 받았을 때
		function onMessage(msg) {
		
			
		   console.log(msg);
		   let receive = msg.data.split(",");
		   console.log(receive);
		   const data = {
		   "member_name" : receive[0],
		   "member_email" : receive[1],
		   "chat_message" : receive[2],
		   "chat_no" : receive[3],
		   "chat_date": receive[4]
		   };
		   
		   let msghtml ="";
		   if(data.member_email=="${memberInfo.member_email}"){
			   msghtml += 
				     `
	         <li class="new_message_balloon_area   _message _msgId41   _my "
				data-id="41" data-temp-id="" data-date="1675854980728"
				data-sender="user"
				data-thumburl="https://shop-phinf.pstatic.net/20161107_164/talk_1478486964180pged1_JPEG/image.JPEG?type=f164"
				data-partner-manager-name="" data-content-type="text">
				<div class="message_balloon card_message rgt">
					<p class="_copy_area">
					`+data.chat_message+`
					</p>
					<div class="txt_confirm _status" aria-label="메시지 작성시간">
						<span class="_time">`+data.chat_date+`</span>
					</div>
				</div>
			</li>
				     ` 
		   }
		   else{
			msghtml += 
			   `
	             <li class="new_message_balloon_area   _message _msgId42    "
				data-id="42" data-temp-id="" data-date="1675854983675"
				data-sender="partner"
				data-thumburl="https://shop-phinf.pstatic.net/20161107_164/talk_1478486964180pged1_JPEG/image.JPEG?type=f164"
				data-partner-manager-name="" data-button-origin="@22186"
				data-content-type="text">
				<div class="thumbnail_profile _thmbnail" aria-label="프로필 사진">
					<a> <img
						src=""
						alt="`+data.member_email+`" width="31"
						onerror="">
						<span class="thumbnail_mask"></span>
					</a>
				</div>
				<div class="chat_message_nickname _nickname">
					<strong> `+data.member_name+`</strong>
				</div>
				<div class="message_balloon card_message">
					<p class="_copy_area">
					`+data.chat_message+`
					</p>
					<div class="txt_confirm _status" aria-label="메시지 작성시간">
						<span class="_time">`+data.chat_date+`</span>
					</div>
				</div>
			</li>
	 			`
		   }
		   $(".group_message_balloon").append(msghtml); 
		   
		   document.getElementById("brandChatSection").scrollTop = document.getElementById("brandChatSection").scrollHeight;
	 	    
	 	   
		}
		// 서버와 연결을 끊었을 때
		function onClose(evt) {
			var now = new Date(); // 현재 시간
		var utcNow = now.getTime() + (now.getTimezoneOffset() * 60 * 1000); // 현재 시간을 utc로 변환한 밀리세컨드값
		var koreaTimeDiff = 9 * 60 * 60 * 1000; // 한국 시간은 UTC보다 9시간 빠름(9시간의 밀리세컨드 표현)
		var koreaNow = new Date(utcNow + koreaTimeDiff);
			
		   console.log("연결이 끊겼습니다. 다시 접속하세요.");
		   chatMode = "bot";
		   const msg = {
				   "chat_no" : 0,
			       "room_no" : room_no,
			       "member_name" : "${memberInfo.member_name}",
			       "member_email" : "${memberInfo.member_email}",
			       "chat_date" : koreaNow,
			       "chat_message" : "CLOSE-CHAT"
			         }
			      console.log('end socket : ' + msg);
			      let jsonData = JSON.stringify(msg);
			      
			      
			      sock.send(jsonData);
		}

$('.KEP-ChatInputArea__btnSend').on('click', function (event) {
	if(document.getElementById("brandInputText").value==null || document.getElementById("brandInputText").value==""){
		alert("채팅을	입력해주세요.");
		return;
	}
	sendMessage();
});


</script>
	<script nomodule=""
		src="https://ssl.pstatic.net/static.talk/web/talktalk/20230202141000/_next/static/chunks/polyfills-786015371a40a38775d5.js"></script>
	<!-- <script
		src="https://ssl.pstatic.net/static.talk/web/talktalk/20230202141000/_next/static/chunks/main-43428315fca3e4be209a.js"
		async=""></script> -->
	<script
		src="https://ssl.pstatic.net/static.talk/web/talktalk/20230202141000/_next/static/chunks/webpack-e067438c4cf4ef2ef178.js"
		async=""></script>
	<script
		src="https://ssl.pstatic.net/static.talk/web/talktalk/20230202141000/_next/static/chunks/framework.85bcb32b89f55e54d19f.js"
		async=""></script>
	<script
		src="https://ssl.pstatic.net/static.talk/web/talktalk/20230202141000/_next/static/chunks/75fc9c18.8a848544f09410541d3e.js"
		async=""></script>
	<script
		src="https://ssl.pstatic.net/static.talk/web/talktalk/20230202141000/_next/static/chunks/3be0007d.f0bb8633420cb94c085d.js"
		async=""></script>
	<script
		src="https://ssl.pstatic.net/static.talk/web/talktalk/20230202141000/_next/static/chunks/commons.53a2432158b27c8f9e96.js"
		async=""></script>
	<script
		src="https://ssl.pstatic.net/static.talk/web/talktalk/20230202141000/_next/static/chunks/1cebc85ac6c518a6a51b56c6ed4c275c572eb734.490e5696f77622e89a7c.js"
		async=""></script>
	<script
		src="https://ssl.pstatic.net/static.talk/web/talktalk/20230202141000/_next/static/chunks/46f0a878ab97daf673ba172a026458dee5eeb16b.6470d3606e3835154f11.js"
		async=""></script>
	<script
		src="https://ssl.pstatic.net/static.talk/web/talktalk/20230202141000/_next/static/chunks/5fa38fd93784b481e7874b72f53d0a48ac9eb2f4.1f20f7752972c4a83e3a.js"
		async=""></script>
	<script
		src="https://ssl.pstatic.net/static.talk/web/talktalk/20230202141000/_next/static/chunks/b7623d25e085806e0fc444d1ee4bc9fe29f33571.025febce6075f83cc945.js"
		async=""></script>
	<script
		src="https://ssl.pstatic.net/static.talk/web/talktalk/20230202141000/_next/static/chunks/fe5ef75c4f896b218abe95a856bb571ba3c24cfc.63ed14748eb4780cbdf8.js"
		async=""></script>
	<script
		src="https://ssl.pstatic.net/static.talk/web/talktalk/20230202141000/_next/static/chunks/5ebdae995ec7db572e90acbff7bfb873230621fd.70d9512b7cb9fbe56272.js"
		async=""></script>
	<script
		src="https://ssl.pstatic.net/static.talk/web/talktalk/20230202141000/_next/static/chunks/e00a7f0a9fba8471bdfbc31c9a2a7f1c07cb4b8e.cbe871cdad708ae7447f.js"
		async=""></script>
	<script
		src="https://ssl.pstatic.net/static.talk/web/talktalk/20230202141000/_next/static/chunks/pages/_app-57e2fad73440a200d8f4.js"
		async=""></script>
	<script
		src="https://ssl.pstatic.net/static.talk/web/talktalk/20230202141000/_next/static/chunks/a79515f9.369538b73b9464cd3264.js"
		async=""></script>
	<script
		src="https://ssl.pstatic.net/static.talk/web/talktalk/20230202141000/_next/static/chunks/ea88be26.5e9424d3ca5b72607ed9.js"
		async=""></script>
	<script
		src="https://ssl.pstatic.net/static.talk/web/talktalk/20230202141000/_next/static/chunks/fc744e11ae1354bd5a9cc82d3603690b7ff68211.a8f43daa16ea1366f26e.js"
		async=""></script>
	<script
		src="https://ssl.pstatic.net/static.talk/web/talktalk/20230202141000/_next/static/chunks/74c879ad1d2daaf90e990cec11059d2d8f6eaa34.a47b02ffbd55ed97be85.js"
		async=""></script>
	<script
		src="https://ssl.pstatic.net/static.talk/web/talktalk/20230202141000/_next/static/chunks/01274aaea0535a9651e01e07adb392cbb5117696.923ebe4337af7ca78b75.js"
		async=""></script>
	<script
		src="https://ssl.pstatic.net/static.talk/web/talktalk/20230202141000/_next/static/chunks/e10043f1ec3d1b0de8e808b3fa558e2c0bcc21d3.1eec2f030824ef6da4fd.js"
		async=""></script>
	<script
		src="https://ssl.pstatic.net/static.talk/web/talktalk/20230202141000/_next/static/chunks/5149ab7f99c4c91f6667bd7e6a55db5aa5fb14f6.2d274e66be24d3f9836e.js"
		async=""></script>
	<script
		src="https://ssl.pstatic.net/static.talk/web/talktalk/20230202141000/_next/static/chunks/499658678674e6ec637bc8a2acdf7123286e8eb0.c4e5665eb657efd06df5.js"
		async=""></script>
	<script
		src="https://ssl.pstatic.net/static.talk/web/talktalk/20230202141000/_next/static/chunks/099d419a57369b975adaf131bac9e9274ad2d5fd.c76c7c7ad3c3d97577e1.js"
		async=""></script>
	<script
		src="https://ssl.pstatic.net/static.talk/web/talktalk/20230202141000/_next/static/chunks/d7256dc7f5ea565201ab0a8d0553fe962e26f0ef.99411d073c90ad82611c.js"
		async=""></script>
	<script
		src="https://ssl.pstatic.net/static.talk/web/talktalk/20230202141000/_next/static/chunks/e4708c6acdefc03a3f53de3c7234ad7948ae189a.4885ad78195783a2ad54.js"
		async=""></script>
	<script
		src="https://ssl.pstatic.net/static.talk/web/talktalk/20230202141000/_next/static/chunks/4dd02254a311138146c2ed4d5355c195bdee9796.f87ce00bf33682a39d93.js"
		async=""></script>
	<script
		src="https://ssl.pstatic.net/static.talk/web/talktalk/20230202141000/_next/static/chunks/0924c660d1b4a12dc336bf202cf5250888a6e187.fdf76ecdf3f57d45371f.js"
		async=""></script>
	<script
		src="https://ssl.pstatic.net/static.talk/web/talktalk/20230202141000/_next/static/chunks/679739bc98381b0bf10c372cf8527c90ea0eb974.dc353dfb9f0a5fe58719.js"
		async=""></script>
	<script
		src="https://ssl.pstatic.net/static.talk/web/talktalk/20230202141000/_next/static/chunks/pages/%5BserviceCode%5D/%5BpartnerId%5D-c125e367b0411143fad7.js"
		async=""></script>
	<script
		src="https://ssl.pstatic.net/static.talk/web/talktalk/20230202141000/_next/static/pCYlYRqOWr_5_zDEsjviH/_buildManifest.js"
		async=""></script>
	<script
		src="https://ssl.pstatic.net/static.talk/web/talktalk/20230202141000/_next/static/pCYlYRqOWr_5_zDEsjviH/_ssgManifest.js"
		async=""></script>
	<script type="text/javascript" charset="utf-8"
		src="https://ssl.pstatic.net/static.gn/templates/gnb_utf8.nhn"></script>
	<script
		src="https://ssl.pstatic.net/static.talk/web/talktalk/20230202141000/_next/static/chunks/pages/index-97a3c733a7f94b38b7c2.js"></script>
	
</html>