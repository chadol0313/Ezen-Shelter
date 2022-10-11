package com.ezen.p2.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ezen.p2.dto.BoardVO;
import com.ezen.p2.dto.ReplyVO;

@Mapper
public interface IBoardDao {

	public void boardGetAllCount(HashMap<String, Object> hm);

	public void boardList(HashMap<String, Object> hm);

	public void insertBoard(BoardVO boardvo);

	public void plusCountOne(int num);

	public BoardVO getBoardOne(int num);

	public void boardGetAllCount1(HashMap<String, Object> cntMap);

	public void boardGetAllCount2(HashMap<String, Object> cntMap);

	public void boardGetAllCount3(HashMap<String, Object> cntMap);

	public void boardList1(HashMap<String, Object> hm);

	public void boardList2(HashMap<String, Object> hm);

	public void boardList3(HashMap<String, Object> hm);

	public List<ReplyVO> getReply(int num);

	public void updateBoard(BoardVO boardvo);

	public void insertReply(ReplyVO replyvo);

	public void delReply(int r_num);

	public void deleteBoard(int num);

	public void updateReply(HashMap<String, Object> result);
		
	
}
