
package com.theharmm.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.socket.WebSocketSession;

import com.theharmm.domain.BrandChatMessageDTO;
import com.theharmm.domain.BrandChatRoomDTO;
import com.theharmm.domain.MemberVO;
import com.theharmm.domain.ProductDTO;
import com.theharmm.security.domain.CustomUser;
import com.theharmm.service.BrandChatService;
import com.theharmm.service.MemberInfoService;
import com.theharmm.service.ProductDetailService;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;
/*신미림 작성*/
@Log4j
@Controller
@RequestMapping("/extra")
@RequiredArgsConstructor
public class ExtraChatController {
	
		
	@Autowired
	MemberInfoService memberInfoService;
	
	@Autowired
	BrandChatService brandChatService;
	
	@Autowired
	ProductDetailService productDetailService;
	
	
	 @GetMapping("/admin/chat/list")
	   public String selectAdminChatList(Model model) {
		   
			try {
				
				CustomUser user = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
				log.info("[ChatSys]현재 로그인한 유저 정보 불러오기...");
				
				MemberVO member = user.getMember();
				
				if(member.getMember_email().equals("admin")) {
					 log.info("[ChatSys]현재 로그인한 유저 정보 "+ member.getMember_email());
					 
					 
					 return "/adminChatList";
				}
				else {
					return "/notice";
				}				
			}catch(ClassCastException e) {
				return "redirect:/member/loginpage";
			}
			catch (Exception e) {
			
				log.info(e.getMessage());
				e.printStackTrace();
				return "redirect:/";
			}
			
			
			
	}
	 
	 @GetMapping("/brand/chat")
	   public String selectBrandChatList(Model model) {
		   
			try {
				CustomUser user = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
				
				log.info("[ChatSys]현재 로그인한 유저 정보 불러오기...");
				
				MemberVO member = user.getMember();
				
				Map<String,Object> map = new HashMap<>();
			
				List<BrandChatRoomDTO> brandChatRoomList  = brandChatService.getChatRoomList(map);
				log.info("[ChatSys]현재 채팅방 리스트 정보 불러오기...");
				
				
				//상품 리스트 띄우기 
				List<ProductDTO> ProductBrandList = productDetailService.selectProductList();
				model.addAttribute("productBrandList", ProductBrandList);
				
				model.addAttribute("brandChatRoomList",brandChatRoomList);
				
				return "/brandChat";
								
			}catch(ClassCastException e) {
				return "redirect:/member/loginpage";
			}
			catch (Exception e) {
			
				log.info(e.getMessage());
				e.printStackTrace();
				return "redirect:/";
			}
			
			
	}
	 
	 @GetMapping("/brand/{room_no}")
	/* @ResponseBody */
	   public String selectChatRoom(@PathVariable int room_no, Model model) {
			
			try {
				
				log.info("room_no-----"+room_no);
			
			  CustomUser user = (CustomUser)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			  log.info("[ChatSys]현재 로그인한 유저 정보 불러오기...");
			  
			  MemberVO member = user.getMember(); 
			  
			  log.info("[ChatSys]현재 로그인한 유저 정보 "+member.getMember_email());
			  
			  List<BrandChatMessageDTO> chatHistory = null; BrandChatRoomDTO roomInfo = null;
			  
			  log.info("[ChatSys]채팅 히스토리 불러오기...");
			  
			  Map<String,Object> map = new HashMap<>(); map.put("room_no",room_no);
			  chatHistory = brandChatService.selectChatHistory(map);
			  
			  
			  log.info("[ChatSys]채팅 히스토리 불러오기...완료 "+ chatHistory.size());
			  
			  log.info("[ChatSys]채팅방 불러오기..."); 
			  roomInfo = brandChatService.getChatRoom(room_no); 
			  log.info("[ChatSys]채팅방 불러오기...완료 "+roomInfo.getRoom_no());
			  
			  
			  model.addAttribute("brandChatRoomDTO",roomInfo);
			  model.addAttribute("brandChatMessageList",chatHistory);
			  model.addAttribute("memberInfo",member);
			  log.info(member);
		        
		         return "brandChatContents";
				
			} catch (Exception e) {
				log.info(e.getMessage());
			}
			return "redirect:/member/loginpage";
			
		}
	 
	 

	
	

}

