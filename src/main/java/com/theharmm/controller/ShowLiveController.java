
package com.theharmm.controller;

import java.text.DecimalFormat;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.theharmm.domain.ShowLiveChannelDTO;
import com.theharmm.security.domain.CustomUser;
import com.theharmm.service.ShowLiveService;
import com.theharmm.showlive.ShowLiveChannel;
import com.theharmm.showlive.ShowLiveChannelStore;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/showlive/*")
@Log4j
public class ShowLiveController {

	@Autowired
	private ShowLiveService showLiveService;
	
	@GetMapping(value="/showlivelist", produces = "application/json; charset=UTF-8")
	public String getShowLiveList(Model model, HttpSession session) {
		JSONObject jsonObject = new JSONObject();
		JSONArray jsonArray = new JSONArray();
		
		//Map<String, ShowLiveChannelDTO> channelDTOList = new ConcurrentHashMap<String, ShowLiveChannelDTO>();
		//store에서 가져온 channelDTO 목록을 model에 넣고 반환
		List<ShowLiveChannelDTO> channelList = showLiveService.getLiveChannelsFromChannelStore();
//		DecimalFormat df = new DecimalFormat("###,###");
//		for (ShowLiveChannelDTO slcdto : channelList) {
//			JSONObject tmpObject = new JSONObject();
//			
//			JSONObject slObject = new JSONObject();
//			slObject.put("showlive_no", slcdto.getShowlive_no());
//			slObject.put("showlive_name", slcdto.getShowlive_name());
//			slObject.put("showlive_host", slcdto.getShow_host());
//			slObject.put("showlive_start_price", df.format( (slcdto.getShowlive_start_price()) ));
//			//slObject.put();
//			//slObject.put();
//			tmpObject.put("showlive", slObject);
//			jsonArray.put(tmpObject);
//			channelDTOList.put( Integer.toString(slcdto.getShowlive_no()) , slcdto);
//		}
		
		
		//model.addAttribute("channelDTOList", channelDTOList);
//		jsonObject.put("showlives", jsonArray);
//		String json = jsonObject.toString();
		
		model.addAttribute("channelList", channelList);
		log.info("=============SHOWLIVECONTROLLER=================");
		return "showlive/showlivelist";
	}
	
	@RequestMapping(value = "/{roomNo}", method = RequestMethod.GET)
	public String ShowLiveRoomEnter(Model model, @PathVariable("roomNo") String roomNo , HttpSession session) {
		CustomUser user = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
		user.setRoomNo(roomNo);
		//세션에 들어온 방번호 지우기
		session.setAttribute("roomNo", roomNo);
		
		log.info("==================================");
		log.info("@ChatController, GET Chat / Username : " + user.getUsername());
		log.info(roomNo + " 방번호");
		
		ShowLiveChannelDTO channel = showLiveService.getChannelDTOByRoomNo(roomNo);
		if(channel == null) {
			return "showlive/showlivenoroom";
		}
		
		model.addAttribute("userid", user.getUsername());
		model.addAttribute("channelDTO", channel);
		
		return "showlive/showliveroom";
	}
	
	@RequestMapping(value = "/showlivenoroom", method = RequestMethod.GET)
	public String ShowLiveRoomEnterError(HttpSession session) {
		log.warn("생성되지 않은 방을 요청하셧네요 ...");
		return "showlive/showlivenoroom";
	}
	
}
