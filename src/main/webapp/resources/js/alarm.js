   //전역변수 선언-모든 홈페이지에서 사용 할 수 있게 index에 저장
   var socket = null;

   $(document).ready(function (){
	   
	   connectWs();
   });

   function connectWs(){
   	
   	//sock = new SockJS('/replyEcho');
   	sock = new SockJS('http://localhost:8080/echo');
   	socket = sock;

   	sock.onopen = function() {
           console.log('info: connection opened.');
     };

     // 클라이언트 쪽에서 수신된 메세지를 받고 실행되는 부분
    sock.onmessage = function(evt) {
	 	var data = evt.data;
	   	//console.log("ReceivMessage : " + data + "\n");
	   	//var receiverEmail = urlParams.get("email");
		//console.log("receiverEmail " + receiverEmail);
		var list = data.split("!");
	   	// 이건 알림시 알림 숫자 올리기
/*	   	$.ajax({
			url : '/alarm/countAlarm',
			dataType: 'text',
			data : {
				"receiverEmail" : receiverEmail
			},
			success : function(data) {
				if(data == '0'){
				}else{
					//$('#alarmCnt').addClass('bell-badge-danger bell-badge')
					$('#alarmCnt').text(data);
				}
			},
			error : function(err){
				alert('err');
			}
	   	});*/
	   	
			$.ajax({		
					url: "/alarm/countAlarm",
					
				}).done(function (data) {
					console.log("countAlarm " + data);
					//$('#alarmCnt').addClass('bell-badge-danger bell-badge')
					$('#alarmCnt').text(data);
				});	

	   	// 모달 알림
	   	/*var toastTop = app.toast.create({
            text: "알림 : " + data + "\n",
            position: 'top',
            closeButton: true,
          });
          toastTop.open(); */
	   	
	   	alert(list[0] + list[1]);
	   	
	   	let toast = "";
	   		   	toast = `
	   								<div class="toast" role="alert" aria-live="assertive"  style="display : block; font-size: 1.5rem; background-color: rosybrown;"
	   									aria-atomic="true" data-alarmid = "`+list[1]+`" id = "alarmid`+list[1]+`">
	   									<div class="toast-header">
	   										<strong
	   											class="me-auto">ALARM</strong> 
	   										<button type="button" class="btn-close" data-bs-dismiss="toast" 
	   											aria-label="Close" data-alarmid = "`+list[1]+`"></button>
	   									</div>
	   									<div class="toast-body">`+ list[0] + `</div>
	   								</div>	   		
	   		   	`
	   		   	$("#toastContainer").append(toast); 
    };

    sock.onclose = function() {
      	console.log('connect close');
      	/* setTimeout(function(){conntectWs();} , 1000); */
    };

    sock.onerror = function (err) {console.log('Errors : ' , err);};
    
  /*  test************************************************ */

    function setFollowerList (email) {
		$.ajax({		
			url: "/social/followList",
			data: {
					"email" : email
				}
		}).done(function (data) {
			console.log("followList " + data);
			let follewerList = "";
			let followingList = "";
			
			if (data.followingList.length == 0) {
				console.log("리스트 0개");
				followingList = 
			    	
			    						`	<div data-v-6c53047a="" class="empty_box">
														<svg data-v-6c53047a="" xmlns="http://www.w3.org/2000/svg" class="empty_icon icon sprite-icons">
			                                    <use data-v-6c53047a="" href="/_nuxt/3182c3b1ca2f77da7bc3e1acf109306c.svg#i-social-user-big" xlink:href="/_nuxt/3182c3b1ca2f77da7bc3e1acf109306c.svg#i-social-user-big"></use></svg>
														<strong data-v-6c53047a="" class="empty_title">팔로워</strong>
														<p data-v-6c53047a="" class="empty_txt">`+email+`님이 팔로잉하는
															사용자가 없습니다.</p>

											</div> `   		
			    		
			} else {
				console.log("리스트 불러오기");

				
				// 팔로잉 리스트
				for (let i = 0; i < data.followingList.length; i++) { 
					let following = data.followingList.at(i);
					
					let tmp = "";
					tmp +=	`
						<li data-v-754300ce="" class="user_item">
							<div data-v-754300ce="" class="user_box">
								<a data-v-754300ce="" href="#" class="user_link">
									<div data-v-754300ce="" class="img_box">
										<img data-v-754300ce=""
											src="https://kream-phinf.pstatic.net/MjAyMDExMDZfMjAz/MDAxNjA0NjQ5OTM1NDk5.edZ7v2ODWVS7_M8PXg8B0PNU5UlsTWup2XHwuKkEEXsg.lNHXDE66TKM0yl1nIOO70PWNUtK4TcdgD1lImetPB48g.JPEG/p_8d36c20aaeb94c6681619dcd775f5286.jpeg?type=sl"
											alt="KREAM 프로필 이미지" class="profile_img">
									</div>
									<div data-v-754300ce="" class="info_box">
										<span data-v-754300ce="" class="user_name is_official"><span data-v-754300ce=""
												class="user_name_text">`+following.user+`</span></span><span data-v-754300ce=""
											class="user_subname">KREAM 챌린지</span>
									</div>
								</a>
								<div data-v-754300ce="" class="user_box_follow">` ;
							if (following.follow == '팔로잉') {
								tmp += `
										<button data-v-575aff82="" data-v-625671d1="" data-v-754300ce="" type="button"
										class="btn solid small btn_follow small">팔로잉</button>`;
								
							} else {
								tmp += `
									<button data-v-575aff82="" data-v-625671d1="" data-v-754300ce="" type="button"
									class="btn solid small btn_follow small">팔로우</button>	`;			
							}

					tmp += `			</div>
								</div>
							</li>`
						followingList += tmp;	
				}		    						
			}
			
			// 팔로워 리스트
			if (data.followerList.length == 0) {
				console.log("리스트 0개");
			    follewerList = 
			    	
			    						`	<div data-v-6c53047a="" class="empty_box">
														<svg data-v-6c53047a="" xmlns="http://www.w3.org/2000/svg" class="empty_icon icon sprite-icons">
			                                    <use data-v-6c53047a="" href="/_nuxt/3182c3b1ca2f77da7bc3e1acf109306c.svg#i-social-user-big" xlink:href="/_nuxt/3182c3b1ca2f77da7bc3e1acf109306c.svg#i-social-user-big"></use></svg>
														<strong data-v-6c53047a="" class="empty_title">팔로워</strong>
														<p data-v-6c53047a="" class="empty_txt">`+email+`님을 팔로우하는
															사용자가 없습니다.</p>

											</div> `   		
			    		
			} else {
				console.log("리스트 불러오기");

				for (let i = 0; i < data.followerList.length; i++) { 
					let follower = data.followerList.at(i);
					
					let tmp = "";
					tmp +=	`
						<li data-v-754300ce="" class="user_item">
							<div data-v-754300ce="" class="user_box">
								<a data-v-754300ce="" href="#" class="user_link">
									<div data-v-754300ce="" class="img_box">
										<img data-v-754300ce=""
											src="https://kream-phinf.pstatic.net/MjAyMDExMDZfMjAz/MDAxNjA0NjQ5OTM1NDk5.edZ7v2ODWVS7_M8PXg8B0PNU5UlsTWup2XHwuKkEEXsg.lNHXDE66TKM0yl1nIOO70PWNUtK4TcdgD1lImetPB48g.JPEG/p_8d36c20aaeb94c6681619dcd775f5286.jpeg?type=sl"
											alt="KREAM 프로필 이미지" class="profile_img">
									</div>
									<div data-v-754300ce="" class="info_box">
										<span data-v-754300ce="" class="user_name is_official"><span data-v-754300ce=""
												class="user_name_text">`+follower.user+`</span></span><span data-v-754300ce=""
											class="user_subname">KREAM 챌린지</span>
									</div>
								</a>
								<div data-v-754300ce="" class="user_box_follow">` ;
							if (follower.follow == '팔로잉') {
								tmp += `
										<button data-v-575aff82="" data-v-625671d1="" data-v-754300ce="" type="button"
										class="btn solid small btn_follow small">팔로잉</button>`;
								
							} else {
								tmp += `
									<button data-v-575aff82="" data-v-625671d1="" data-v-754300ce="" type="button"
									class="btn solid small btn_follow small">팔로우</button>	`;			
							}

					tmp += `			</div>
								</div>
							</li>`
						followerList += tmp;	
				}		    						
			}
			
			$("#follower_container").html(followerList); 
			$("#following_container").html(followingList);  
		});	
    } 
		

   }