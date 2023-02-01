package com.theharmm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.theharmm.domain.BuySaleToday;
import com.theharmm.domain.CountToday;
import com.theharmm.domain.MemberVO;
import com.theharmm.domain.ProductDTO;
import com.theharmm.domain.RegisterToday;
import com.theharmm.domain.ShowLiveChannelDTO;
import com.theharmm.domain.TopProduct;
import com.theharmm.mapper.AdminMapper;
import com.theharmm.mapper.ShowLiveMapper;
import com.theharmm.service.AdminService;
import com.theharmm.showlive.ShowLiveChannelStore;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;


@Service
@AllArgsConstructor
@Log4j
public class AdminServiceImpl implements AdminService {
	@Autowired
	private AdminMapper mapper;
	
	@Autowired
	private ShowLiveMapper showLivemapper;
	
	@Autowired
	private ShowLiveChannelStore showliveChannelStore;
	
	@Override
	public List<CountToday> countToday() {
		return mapper.countToday();
	}

	@Override
	public List<RegisterToday> registerToday() {
		return mapper.registerToday();
	}
	
	@Override
	public List<BuySaleToday> buyToday() {
		return mapper.buyToday();
	}
	
	@Override
	public List<BuySaleToday> saleToday() {
		return mapper.saleToday();
	}
	
	@Override
	public List<ProductDTO> getProductList() {
		return mapper.getProductList();
	}
	
	@Override
	public List<MemberVO> getMemberList() {
		return mapper.getMemberList();
	}
	
	@Override
	public List<TopProduct> getTop5BuyList() {
		return mapper.getTop5BuyList();
	}
	
	@Override
	public List<TopProduct> getTop5SaleList() {
		return mapper.getTop5SaleList();
	}

	@Override
	public void createChannel(ShowLiveChannelDTO channel) {
		//DB에 방을 저장하면 AI된 방 번호가 생성이 반환됨
		int roomNo = showLivemapper.createChannel(channel);
		channel.setShowlive_no(roomNo);
		log.warn(channel.toString());
		//그 방번호로 ShowLiveChannelStore에도 방을 만들어주기
		showliveChannelStore.createNewChannel(channel);

	}



}
