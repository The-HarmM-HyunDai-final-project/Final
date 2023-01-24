package com.theharmm.service;

import java.util.Date;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.theharmm.domain.MemberVO;
import com.theharmm.domain.ShowLiveAuctionFinalPersonDTO;
import com.theharmm.domain.ShowLiveBiddingDTO;
import com.theharmm.domain.ShowLiveChannelDTO;
import com.theharmm.domain.ShowLiveChatDTO;

import lombok.extern.log4j.Log4j;

@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({
	"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml",
	"file:src/main/webapp/WEB-INF/spring/root-context.xml",
	"file:src/main/webapp/WEB-INF/spring/security-context.xml"
	})
@Log4j
public class ShowLiveServiceTests {

	@Autowired
	private ShowLiveService service;
	
	//쇼라이브 채널 만들기
	@Test
	public void createChannel() throws Exception{
		ShowLiveChannelDTO channel = new ShowLiveChannelDTO();
		channel.setShowlive_name("아놔 테스트용3333");
		channel.setShow_host("asd");
		channel.setProduct_name("33333");
		channel.setLive_status(1);
		channel.setShowlive_start_date(new java.util.Date());
		channel.setShowlive_start_price(400000);
		channel.setRestricted_grade("BRONZE");
		channel.setAws_stream_key("sk_us-east-1_FAn9dMuE8GCD_bAOiV4sBNsCku1w9AcBcUEJtcSEXse");
		channel.setAws_endpoint("5fe30a074ce5.global-contribute.live-video.net");
		channel.setAws_channel_url("https://5fe30a074ce5.us-east-1.playback.live-video.net/api/video/v1/us-east-1.677688003720.channel.odqnd2yBH4LN.m3u8");
		
		log.warn("여기까지는 잘되나" + channel.toString());
		log.warn("만들어진 채널의 No : " + service.createChannel(channel));
	}
	//채팅내용 넣기 테스트
	//@Test
	public void insertChat() throws Exception{
		Date date = new java.util.Date();
		
		ShowLiveChatDTO chatdto = new ShowLiveChatDTO();
		chatdto.setShowlive_no(2);
		chatdto.setChat_user_id("asd");
		chatdto.setChat_content("이것은 테스트3!");
		chatdto.setChat_date(date);
		
		service.insertChat(chatdto);
	
	}
	//경매 내역 넣기
	//@Test
	public void insertAuction() throws Exception{
		ShowLiveBiddingDTO bid = new ShowLiveBiddingDTO();
		bid.setShowlive_no(2);
		bid.setSuggest_date(new java.util.Date());
		bid.setUser_name("asd");
		bid.setSuggest_price(10000000);
		
		service.insertAuction(bid);
		
	}
	//라이브중인 목록 가져오기
	//@Test
	public void getChannels() throws Exception{
		List<ShowLiveChannelDTO> channels = service.getLiveChannels();
		
		log.warn("================ 생방중인 채널 목록들" + channels.toString());
	}
}
