<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/views/common/commonLink.jsp"%>
 
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/member/myPagePrivate.css" />
</head>

<body>

    <div class="wrap">
<%@ include file="/views/common/header.jsp"%>
     
		<!-- 2. 회원정보변경	 -->
     <section class="section">     		
		<form id="memberModify" method="post">
			<div class="private">
				<input type="hidden" value="<%=m.getEmail()%>" name="email2" readonly>				
					<div><p>개인정보변경</p></div>
					<div class="line6"></div>

				<table>
					<tr>
						<td>새로운 비밀번호</td>
						<td><input type="password" placeholder="비밀번호 입력" name="new_pw" id="pw"></td>
						<td><span id="pwCheck"></span></td>
					</tr>
					<tr class="tr2">
						<td>비밀번호 확인</td>
						<td><input type="password" placeholder="비밀번호 확인" id="pwck" onkeyup="pwCheck();"></td>
						<td><input type="button" onclick="fn_updatePassword();" id="btn3" value="비밀번호변경" /></td>
					</tr>		
					<tr>
						<td>현재 닉네임</td>
						<td><%=m.getNickname()%></td>
					</tr>
					<tr class="tr2">
						<td>새로운 닉네임</td>
						<td><input type="text" placeholder="닉네임 입력" name="nickname2" id="nickname"></td>
						<td></td>
					</tr>
					<tr>
						<td>현재 전화번호</td>
						<td><%=m.getPhone()%></td>
					</tr>
					<tr>
						<td>새로운 전화번호</td>
						<td><input type="text" placeholder="전화번호 입력" id="phone" name="phone2"></td>
						<td><input type="button" onclick="fn_updateMember();" id="btn2" value="수정완료" /></td>
					</tr>
				</table>

				<div class="modifyComplete">
					<div class="line6"></div>
					<input type="button" onclick="fn_deleteMember();" id="btn1" value="회원탈퇴" />
				</div>
			</form>
		</div>
	</section>
	
	
<%@ include file="/views/common/footer.jsp"%>      
    </div>
    <script src="<%=request.getContextPath() %>/js/common/header.js"></script>
    
    	<script>	
			//비밀번호 & 비밀번호확인
		    function pwCheck() {
		        let pw=$("#pw").val().trim();
		        let pwck=$("#pwck").val().trim();
		        if(pw==pwck){
		            $("#pwCheck").css("color","green").html("비밀번호가 동일합니다.");            
		          }else if(pw!=pwck){
		             $("#pwCheck").css("color","red").html("동일한 비밀번호를 입력하세요.");           
		          }		        
		      };	
		 
		  				
				      
			//비밀번호 변경			
			function fn_updatePassword(){
		 		alert("정말 비밀번호를 수정하시겠습니까?")	
		    	let pw = document.getElementById("pw");    	
		        let regPw = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&*()]).*$/
		        	  if (!regPw.test(pw.value)) {
		                  alert("비밀번호 8~15글자 (숫자,문자,특수기호)를 포함해주세요");
		                  return false;
		              }else{	 	          
						$("#memberModify").attr("action","<%=request.getContextPath()%>/mypage/memberPasswordUpdate").submit();		            	  
		              }	        
			}
			
			//정보수정(비밀번호 이외)		
	 		function fn_updateMember(){	
			 alert("정말 회원정보를 수정하시겠습니까?")	
				let phone = document.getElementById("phone");
		       	let nickname = document.getElementById("nickname");
		       	
			 	let regPhone =/^\d{2,3}-\d{3,4}-\d{4}$/;
					 if(!regPhone.test(phone.value)){
						 alert("전화번호 형식으로 입력해주세요 (xxx-xxx-xxx)")
						 return false;
					 }else{						
						$("#memberModify").attr("action","<%=request.getContextPath()%>/mypage/memberUpdate").submit();								 
					 } 					 
			} 
									
			
			//회원탈퇴
			function fn_deleteMember(){		
				 alert("정말 탈퇴하시겠습니까?") 
		         $("#memberModify").attr("action","<%=request.getContextPath()%>/mypage/memberDelete").submit();
		    }					
		</script>
    
    
  </body>
</html>