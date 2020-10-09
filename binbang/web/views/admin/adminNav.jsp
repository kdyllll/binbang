<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<div class="sidebar">
  <ul id="menuAll">
  
  	<li id="member" class="clickList">회원 관리
  		<ul id="memberSubAll">
	    	<li id="memberAll" ><a href="<%=request.getContextPath() %>/admin/newMoveAdminPage">회원 현황</a></li>
	    	<li id="couponAll"><a href="">적립금 관리</a></li>
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
 
 	$("#member").click(e=>{
 		$("#memberSubAll").slideToggle();	
 	});
 	
	$("#hostAll").click(e=>{
		$("#subAll").slideToggle();
	});
	
	//클릭,호버 시 효과 주기
	$("#member,#hostAll,#reserveAll,#houseAll").on({
	    "click":function(e){
	        let id = $(e.target).prop("id");
	        if( id == "member") {
	            $("#reserveAll").removeClass("clickList");
	            $("#hostAll").removeClass("clickList");
	            $("#houseAll").removeClass("clickList");
	            $("#member").addClass("clickList");
	          
	        } else if (id == "reserveAll" ) {
	            $("#member").removeClass("clickList");
	            $("#hostAll").removeClass("clickList");
	            $("#houseAll").removeClass("clickList");
	            $("#reserveAll").addClass("clickList");
	          
	        } else if (id == "hostAll") {
	            $("#reserveAll").removeClass("clickList");
	            $("#member").removeClass("clickList");
	            $("#houseAll").removeClass("clickList");
	            $(e.target).addClass("clickList");
	           
	        } else if (id == "hosueAll") {
	            $("#reserveAll").removeClass("clickList");
	            $("#member").removeClass("clickList");
	            $("#hostAll").removeClass("clickList");
	            $("#houseAll").addClass("clickList");
	        }
	    },
	    "mouseover":function(e){
	        $(e.target).addClass("hoverList");
	    },
	    "mouseleave":function(e){
	        $(e.target).removeClass("hoverList")
	    }
	});

	$("#hostList, #acceptList, #blackList").on({
	    "mouseover":function(e){
	        $(e.target).addClass("subList")
	    },
	    "mouseleave":function(e){
	        $(e.target).removeClass("subList")
	    }
	}); 

</script>