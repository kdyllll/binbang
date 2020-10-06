<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/commonLink.jsp"%>


<%
	String email=request.getParameter("email");	
%>

    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/member/mypage.css" />
   
  </head>
  <body>
    <div class="wrap">


	<!-- 4. 개인정보변경 -->
		<form id="memberModify" method="post">
			<div class="private">
				<div>			
					<p>개인정보변경</p>
					 <input type="hidden" value="<%=email %>" name="email">					 									
					<div class="line6"></div>
				</div>
				
				<table>					
					<tr>
						<td>새로운 비밀번호</td>
						<td><input type="password" placeholder="비밀번호 입력" name="new_pw" id="pw"></td>
							<td><span id="pwCheck"></span></td>
					</tr>
					<tr class="tr2">
						<td>비밀번호 확인</td>
						<td><input type="password" placeholder="비밀번호 확인" id="pwck" onkeyup="pwCheck();"></td>						
						<td><input type="button" onclick="fn_updatePassword();" id="btn3" value="비밀번호변경"/> </td>					
					</tr>			
					<tr>
						<td>현재 닉네임 </td>
						<td><%=m.getNickname()%></td>
					</tr>	
					<tr class="tr2">
						<td>새로운 닉네임</td>
						<td><input type="text" name="nickname" placeholder="닉네임 입력"></td>						
						<td></td>
					</tr>
					<tr>
						<td>현재 전화번호</td>
						<td> <%=m.getPhone()%></td>
					</tr>
					<tr>
						<td>새로운 전화번호</td>
						<td><input type="text" name="phone" placeholder="전화번호 입력"></td>
						<td><input type="button" onclick="fn_updateMember();" id="btn2" value="수정완료"/></td>
					</tr>		
				</table>						
				
				<div class="modifyComplete">				
					<div class="line6"></div>
					<input type="button" onclick="fn_deleteMember();" id="btn1" value="회원탈퇴"/>																					
				</div>				
			</div>
			</form>        
      
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
				$("#memberModify").attr("action","<%=request.getContextPath()%>/member/memberPasswordUpdate").submit();
			}	
			//정보수정(비밀번호 이외)
			function fn_updateMember(){
				 $("#memberModify").attr("action","<%=request.getContextPath()%>/member/memberUpdate").submit();			
			}
			//회원탈퇴
			function fn_deleteMember(){
		         $("#memberModify").attr("action","<%=request.getContextPath()%>/member/memberDelete").submit();
		    }
			
			// 경고창
			$("#btn1").click(e =>{
			alert("정말 탈퇴하시겠습니까?")
			})
			$("#btn2").click(e =>{
			alert("정말 수정하시겠습니까?")
			})
			
			
	</script>

  </body>
</html>