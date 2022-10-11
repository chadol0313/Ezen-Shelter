
// div 숨김처리한거 보이게 하는거랑 사라지는거    
$(function (){
		var jb = $( 'input#msg' ).val();
        $('#log').click(function(){
            $('#loginForm').fadeIn(500,function(){});
        });       
        $('.closeLog').click(function(){
            $("#loginForm, #terms ,#help_wrap").fadeOut(500,function(){});
        });
        $('#join').click(function(){
        	$('#terms').fadeIn(500,function(){});
        	$('#loginForm').fadeOut(500,function(){});
        });
        $('#help_icon').click(function(){
			$('#help_wrap').fadeIn(500,function(){});
		});
		if(jb!=""){
			$('#loginForm').fadeIn(0,function(){});
		}
    });  


// 약관 동의 체크
    function go_next(){
	if(document.terms.okon[1].checked==true){
		alert("회원 약관에 동의하셔야 회원으로 가입이 가능합니다.");
	}else{
		location.href="joinForm";
		}
	}
	
	
	
//마이페이지 찜 취소
function listdelete(num) {
     if(confirm("정말 삭제 하시겠습니까?")){
      location.href="listdelete&num="+num;      
   };
}	