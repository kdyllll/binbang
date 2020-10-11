<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<div class="sidebar">
  <ul id="menuAll">
  
  	<li id="member" >회원 관리
  		<ul id="memberSubAll">
	    	<li id="memberAll" ><a href="<%=request.getContextPath() %>/admin/newMoveAdminPage">회원 현황</a></li>
	    	<li id="couponAll"><a href="<%=request.getContextPath() %>/admin/pointList">적립금 관리</a></li>
	    </ul>
    </li>
    
     <li id="hostAll">호스트 관리
      <ul id="subAll">
        <li id="hostList"><a href="<%=request.getContextPath() %>/admin/hostList">호스트 목록</li>
        <li id="acceptList"><a href="<%=request.getContextPath() %>/admin/hostAcceptList">호스트 승인</a></li>
        <li id="blackList"><a href="<%=request.getContextPath() %>/admin/hostComplainList">호스트 신고</a></li>
      </ul>
    </li>
    
    <li id="reserveAll"><a href="<%=request.getContextPath()%>/admin/reserveList">예약 현황</a></li>
    <li id="houseAll"><a href="<%=request.getContextPath() %>/admin/houseList">숙소 현황</a></li>
   
  </ul> 
 
</div>
  
<style>
	
	
</style>  

 <script>
 
 
	$("#member").hover(e=>{
 		$("#memberSubAll").slideToggle();	
 	});
 	 
	$("#hostAll").hover(e=>{
		$("#subAll").slideToggle();
	});
	


</script>