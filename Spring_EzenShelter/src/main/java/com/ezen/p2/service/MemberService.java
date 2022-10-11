package com.ezen.p2.service;



import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.p2.dao.IMemberDao;
import com.ezen.p2.dto.HeartDto;
import com.ezen.p2.dto.MemberVO;
import com.ezen.p2.dto.MyPageVO;
import com.ezen.p2.dto.PetDto;
import com.ezen.p2.util.Paging;

@Service
public class MemberService {

	@Autowired
	IMemberDao mdao;

	public MemberVO getMember(String id) {		
		return mdao.getMember(id);
	}

	public void insertMember(MemberVO membervo) {
		mdao.insertMember(membervo);
		
	}

	public void deleteMember(String id) {
		mdao.deleteMember(id);
		
	}

	public void updateMember(MemberVO membervo) {
		mdao.updateMember(membervo);
		
	}
	
	//입양현황 리스트
	public HashMap<String, Object> getadoptList(int p, String id) {
		HashMap<String, Object> adoptList = new HashMap<String, Object>();
		
		Paging paging = new Paging();
		paging.setPage(p);
		paging.setDisplayRow(3);
		paging.setDisplayPage(3);
		
		int count = mdao.getadoptCount(id);
		paging.setTotalCount(count);

		paging.paging();
		
		List<MyPageVO> list1 = mdao.getadoptList(paging.getStartNum(),paging.getEndNum(),id);
		
		adoptList.put("paging", paging);
		adoptList.put("adoptList" ,  list1 );
		
		return adoptList;
	}

	
	//찜 리스트
	public HashMap<String, Object> getheartList(int p2, String id) {
		HashMap<String, Object> heartList = new HashMap<String, Object>();
		
		Paging paging2 = new Paging();
		paging2.setPage(p2);
		paging2.setDisplayRow(3);
		paging2.setDisplayPage(3);
		
		int count = mdao.getheartCount(id);
		paging2.setTotalCount(count);

		paging2.paging();
		
		List<MyPageVO> list2 = mdao.getheartList(paging2.getStartNum(),paging2.getEndNum(),id);
		
		heartList.put("paging2", paging2);
		heartList.put("heartList" ,  list2 );
		
		return heartList;
	}

//	public void removeHeart(HeartDto hdto) {
//		mdao.removeHeart(hdto);
//	}

	public MyPageVO getDetail(int num) {
		MyPageVO mpvo = new MyPageVO();
		mpvo = mdao.getDetail(num);
		return mpvo;
	}

	public void updateState(int p_num, String state) {
		mdao.updateState(p_num,state);
	}

	public void removeHeart(int num) {
		mdao.removeHeart(num);
		
	}

	


}
