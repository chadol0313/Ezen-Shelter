package com.ezen.p2.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.ezen.p2.dto.HeartDto;
import com.ezen.p2.dto.MemberVO;
import com.ezen.p2.dto.MyPageVO;

@Mapper
public interface IMemberDao {

	public MemberVO getMember(String id);

	public void insertMember(MemberVO membervo);

	public void deleteMember(String id);

	public void updateMember(MemberVO membervo);

	public int getadoptCount(String id);

	public int getheartCount(String id);
	
	public List<MyPageVO> getadoptList(@Param("startNum")int startNum, @Param("endNum")int endNum, @Param("id")String id);
	
	public List<MyPageVO> getheartList(@Param("startNum")int startNum, @Param("endNum")int endNum, @Param("id")String id);

	//public void removeHeart(HeartDto hdto);

	public MyPageVO getDetail(int num);

	public void updateState(@Param("p_num")int p_num, @Param("state")String state);

	public void removeHeart(int num);





}
