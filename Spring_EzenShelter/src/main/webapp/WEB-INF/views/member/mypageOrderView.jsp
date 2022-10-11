<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/headerfooter/header.jsp" %>
<%@ include file="../include/sub01/myPageSub.jsp" %>

<div id="mypagelistwrap">
	<table>
		<caption>상세 주문 내역</caption>
		<colgroup>
			<col width="10%">
			<col width="20%">
			<col width="20%">
			<col width="20%">
			<col width="20%">
		</colgroup>
		<tr style="height: 40px">
			<th>주문 일자</th>
			<th>주문 번호</th>
			<th>상품명</th>
			<th>결제금액</th>
			<th>주문상세</th>
			<th>주문처리</th>
		</tr>
		
	</table>
	
	
	<br>
	<br>
	<br>

	<table>
		<caption>지난 주문 내역</caption>
		<colgroup>
			<col width="30%">
			<col width="*">
			<col width="20%">
		</colgroup>
		<tr style="height: 40px">
			<th>상품이름</th>
			<th>주문일자</th>
			<th>가격</th>
		</tr>		
	</table>
</div>

<%@ include file="../include/headerfooter/footer.jsp" %>