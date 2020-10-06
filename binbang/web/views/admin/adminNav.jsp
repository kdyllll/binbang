<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="sidebar">
  <ul id="menuAll">
    <li id="memberAll" class="clickList"><a href="<%=request.getContextPath() %>/admin/moveMemberList">회원 현황</a></li>
    <li id="reserveAll" >예약 현황</li>
    <li id="hostAll">호스트 관리
      <ul id="subAll">
        <li id="hostList">호스트 목록</li>
        <li id="acceptList"><a href="<%=request.getContextPath() %>/admin/moveHostAcceptList">호스트 승인</a></li>
        <li id="blackList">호스트 신고</li>
      </ul>
    </li>
  </ul>
  </div>
 <script>
 

	$("#hostAll").click(e=>{
		$("#subAll").slideToggle();
	});

    

</script>