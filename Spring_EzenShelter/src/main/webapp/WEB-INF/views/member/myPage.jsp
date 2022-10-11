<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/headerfooter/header.jsp" %>
<%@ include file="../include/sub01/myPageSub.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>

<article>
<form method="post" name ="myfrm">
	<div id="mypagelistwrap">
		<table>
			<caption>입양 현황</caption>
			<colgroup>
				<col width="20%">
				<col width="*">
				<col width="20%">
				<col width="20%">
			</colgroup>
			<tr style="height: 40px">
				<th>이미지</th>
				<th>동물이름</th>
				<th>신청일자</th>
				<th>처리상태</th>
			</tr>
			<c:forEach items="${adoptList }" var="adopt">
				
					<tr style="height: 100">
						<td ><img src="/images/adopt/${adopt.p_image }" width="100" height="100">
						<td >${adopt.p_name }<br><br><a href="petDetail?p_num=${adopt.p_num}">[자세히보기]</a></td>
						<td ><fmt:formatDate value="${adopt.consulting }" type="date"  pattern="yyyy-MM-dd"/></td>
						<td >
							<c:if test="${adopt.state eq 'c' }">
								신청중<br><br><a href="#" onclick="listcancel(${adopt.num})">[취소]</a>
							</c:if>
							
							<c:if test="${adopt.state eq 'y'}">
								입양 완료
							</c:if>
								
						</td>
					</tr>
			</c:forEach>	
		</table>
		<div style="text-align:center; margin: 0 atuo; margin-top: 40px;">
			<c:url var="action" value="mypage"/>
		
			<c:if test="${paging.prev }">
				<a href="${action}?page=${paging.beginPage-1}&page2=${paging2.page}">[이전]</a>&nbsp;		
			</c:if>
			
			<c:forEach begin="${paging.beginPage}" end="${paging.endPage}" var="index">
				<c:choose>
					<c:when test="${paging.page==index}">
						<span style="color:red">${index}&nbsp;</span>
					</c:when>
					<c:otherwise>
						<a href="${action}?page=${index}&page2=${paging2.page}">${index}&nbsp;</a>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			
			<c:if test="${paging.next}">
				<a href="${action}?page=${paging.endPage+1}&page2=${paging2.page}">[다음]</a>&nbsp;		
			</c:if>
		</div>
		<br>
		<br>
		<br>
	
		<table>
			<caption>관심동물🐾</caption>
			<colgroup>
				<col width="30%">
				<col width="*">
				<col width="20%">
			</colgroup>
			<tr style="height: 40px">
				<th>이미지</th>
				<th>동물이름</th>
				<th>찜콩</th>
			</tr>
			<c:forEach items="${heartList }" var="heart">
					<tr style="height: 100">
						<td style="height: 100"><img src="/images/adopt/${heart.p_image}" width="100" height="100">
						<td style="height: 100">${heart.p_name }<br><br><a href="petDetail?p_num=${heart.p_num}">[자세히보기]</a></td>
						<td style="height: 100"><a href="#" onclick="listcancel(${heart.num})">[취소]</a>
					</tr>
			</c:forEach>		
		</table>
		
		<div style="text-align:center; margin: 0 atuo; margin-top: 40px;">
			<c:url var="action" value="mypage"/>
		
			<c:if test="${paging2.prev }">
				<a href="${action}?page2=${paging2.beginPage-1}&page=${paging.page}">[이전]</a>&nbsp;		
			</c:if>
			
			<c:forEach begin="${paging2.beginPage}" end="${paging2.endPage}" var="index">
				<c:choose>
					<c:when test="${paging2.page==index}">
						<span style="color:red">${index}&nbsp;</span>
					</c:when>
					<c:otherwise>
						<a href="${action}?page2=${index}&page=${paging.page}">${index}&nbsp;</a>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			
			<c:if test="${paging2.next}">
				<a href="${action}?page2=${paging2.endPage+1}&page=${paging.page}">[다음]</a>&nbsp;		
			</c:if>
		</div>
	</div>
	</form>
</article>




<script type="text/javascript">
//마이페이지 찜 취소
function listcancel(num) {
     if(confirm("정말 삭제 하시겠습니까?")){
      location.href="listcancel?num="+num;      
   };
}

</script>




<%@ include file="../include/headerfooter/footer.jsp" %>
