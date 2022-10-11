<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/headerfooter/header.jsp" %>
<%@ include file="../include/sub01/myPageSub.jsp" %>
<style type="text/css">

#qnaPaging{width:300px; font-size:100%;  margin:0 auto; text-align:center;}	

h2{font-weight:bold; font-size:30px}
h3{font-weight:200;}

table#obo_board{
    width: 800px;
    border-collapse: collapse;
    line-height: 24px;
	}
	#obo_board td,#obo_board th {
	    border-top:1px solid black;
	    border-bottom:1px solid black;
	    border-collapse: collapse;
	    text-align: left;
	    padding: 10px;
	}
	#obo_board th {
		background: rgb(221, 221, 221);
	}
	#write_obo_board{
	    text-decoration: none;
	    color: black;
	}
	#write_obo_board:hover{
	    text-decoration: underline;
	 
	}
	.return button{border: 1px solid black;  width: 200px; height: 50px; margin: 20px 350px; border-radius: 50px; font-size: 20px; background: white; transition: .5 ease;}
   .return button a{color: black; transition: .5 ease;}
    .return button:hover{transition: .5 ease; border: 2px solid #061f5c; background: transparent; background-color: #061f5c; color: white; cursor:pointer;}
  .return button a:hover{color: white; transition: .5 ease;}
</style>

<div class="main-area">
<h2> 1:1 문의 게시판 </h2>
<h3> 1:1 문의 게시판입니다. 문의 내용을 상세히 기입해주세요.</h3>


<form name="form" method="post">
<table id="obo_board">
<tr>
	<td colspan="4" style="text-align: right; background-color: #dadadacc;">
			<input type="button" value="글 작성하기" class="submit" onClick="location.href='DC.do?command=QnaWriteForm'">
			
			</td>
		</tr>
	<tr>	
		<th>No.</th>
		<th>Title.</th>
		<th>Write Date.</th>
		<th>Answer.</th>
		</tr>
</table>
</form>

</div>

<div  class="clear"></div><br>



<%@ include file="../include/headerfooter/footer.jsp" %>