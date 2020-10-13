<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.binbang.member.model.vo.Complaint"%>
<%@page import="java.util.List"%>
<%@ include file="/views/common/commonLink.jsp"%>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/admin/manager.css" />
<%
	List<Complaint> list=(List)request.getAttribute("list"); 
	String type=request.getParameter("searchType");
	String key=request.getParameter("searchKeyword");
%>

  </head>
  <body>
  
    <div class="wrap">
	<%@ include file="/views/common/adminHeader.jsp"%>
      <section class="section">
        <%@ include file="/views/admin/adminNav.jsp"%>
        
        <div id="blackListContents" class="searchCommon">
            <p class="pageTitle">호스트 신고 관리</p>
           
            <select class="searchCategory"  id="searchType">
		      <option value="" selected disabled hidden>선택</option>
		      <option value="email" <%=type!=null&&type.equals("email")?"selected":"" %>>신고 아이디</option>
		      <option value="house_no" <%=type!=null&&type.equals("house_no")?"selected":"" %>>숙소 번호</option>
		      <option value="member_name" <%=type!=null&&type.equals("member_name")?"selected":"" %>>호스트 이름</option>
   			</select>
   		
			<div class="search" id="search-email">
	    		<form action="<%=request.getContextPath()%>/admin/searchHostComplainList">
	    			<input type="hidden" name="searchType" value="email">
	    			<input type="text"  class="searchinput" name="searchKeyword" size="25"
	    				value="<%=key!=null&&type!=null&&type.equals("email")?key:""%>">
	    			<button class="inputButton"></button>
	    		</form>
	    	</div>
			
	    	<div class="search" id="search-house_no">
	    		<form action="<%=request.getContextPath()%>/admin/searchHostComplainList">
	    			<input type="hidden" name="searchType" value="house_no">
	    			<input type="text"  class="searchinput" name="searchKeyword" size="25"
	    				value="<%=key!=null&&type!=null&&type.equals("house_no")?key:""%>">
	    			<button class="inputButton"></button>
	    		</form>
	    	</div>
	    	
	    	<div class="search" id="search-member_name">
	    		<form action="<%=request.getContextPath()%>/admin/searchHostComplainList">
	    			<input type="hidden" name="searchType" value="bl.member_name">
	    			<input type="text"  class="searchinput" name="searchKeyword" size="25"
	    				value="<%=key!=null&&type!=null&&type.equals("bl.member_name")?key:""%>">
	    			<button class="inputButton"></button>
	    		</form>
	    	</div>
    	
             
            
            <div class="tb_wrap">
              <div class="tableDiv" >
                <table class="tableAll">
                  <tr class="fixed_top">
                    <th class="cell2">신고 아이디</th>
                    <th colspan="2" class="cell4">신고사유</th>
                    <th class="cell1">호스트 이름</th>
                    <th class="cell1">숙소 번호</th>
                    <th class="cell2">신고날짜</th>
                    <th class="cell2">신고처리상황</th>
                  </tr>
                  
                  <%for(Complaint com : list) {%>
                  
                  
                  <tr>
                    <td class="cell2"><%=com.getMemberEmail() %></td>
                    <td class="cell1"><%=com.getComplaintCategory() %></td>
                    <td class="cell2 complaintDetail">
                    	<a href="" onclick="window.open('<%=request.getContextPath() %>/admin/hostComplainPopup?complaintNo=<%=com.getComplaintNo() %>','','width=500px,height=450px')">
                    	<%=com.getComplaintDetail().length() > 9 ? com.getComplaintDetail().substring(0,8) +"..." : com.getComplaintDetail() %>
                    	</a>
                    </td>
                    <td class="cell1"><%=com.getHostName() %></td>
                    <td class="cell1"><%=com.getHouseNo() %></td>
                    <td class="cell2"><%=com.getComplaintDate() %></td>
                    <td class="complainCurrent cell2">
                      <div class="complainChoice">
                    
                        <input type="button" name="accept" class="accept" value="승인">
                        <input type="button" name="cancle" class="cancle" value="거절">
                        <input type="button" name="out" class="out" value="권한박탈" >
                       
                      </div>
                    </td>
                  </tr>
                  
                  </form>
                  <%} %>
                </table>
              </div>
            </div>
            
         
      </section>
      
       </body>
</html>


<script>
	
	//검색
	$(function(){
		let memberName=$("#search-member_name");
		let hostNo=$("#search-host_no");
		let email=$("#search-email");
		
		$("#searchType").change(e => {
			memberName.css("display","none");
			hostNo.css("display","none");
			email.css("display","none");
			let v=$(e.target).val(); 
			$("#search-"+v).css("display","inline-block");
		});
		$("#searchType").change(); 
		
	});
		
	//팝업 ajax
	<%-- $(".complaintDetail").click(e=>{
		
		$.ajax({
			url:"<%=request.getContextPath()%>/admin/hostComplaintListPopup",
			data:{"complaintNo":$(".complaintNo").val()},
			success:data=>{
				console.log(data);
				$(".popupContentWrap").children().remove();
				let div2=$("<div class='popupContent'>");
				let p=$("<p class='complainTitle'>신고한 회원 아이디 : ").html(data.memberEmail);
				let p2=$("<p class='complainTitle'>호스트 이름 : ").html(data.hostName);
				let p3=$("<p class='complainTitle'>신고 날짜 : ").html(data.complaintDate);
				let p4=$("<p class='complainTitle'>숙소 번호 : ").html(data.houseNo);
				let p5=$("<p class='complainTitle eachComplainReason'>신고 사유 : ").html(data.complaintCategory);
				/* console.log(data.memberEmail);
				console.log(data.hostName);
				console.log(p3);
				console.log(p4);
				console.log(p5); */
			 	let div=$("<div class='reasonBox'>").html(data.complaintDetail); 
				div2.append(p);
				div2.append(p2);
				div2.append(p3);
				div2.append(p4);
				div2.append(p5);
				div2.append(div);
				$(".popupContentWrap").html(div2); 
			}
		});
	}); --%>
	
	
<%-- 	//팝업
	  $(document).ready(function () {
	    $(".complaintDetail").on("click", function () {
	      $(".enrollbg").addClass("active");
	      $.ajax({
				url:"<%=request.getContextPath()%>/admin/hostComplaintListPopup",
				data:{"complaintNo":$(".complaintNo").val()},
				success:data=>{
					console.log(data);
					$(".popupContentWrap").children().remove();
					let div2=$("<div class='popupContent'>");
					let p=$("<p class='complainTitle'>신고한 회원 아이디 : ").html(data.memberEmail);
					let p2=$("<p class='complainTitle'>호스트 이름 : ").html(data.hostName);
					let p3=$("<p class='complainTitle'>신고 날짜 : ").html(data.complaintDate);
					let p4=$("<p class='complainTitle'>숙소 번호 : ").html(data.houseNo);
					let p5=$("<p class='complainTitle eachComplainReason'>신고 사유 : ").html(data.complaintCategory);
					/* console.log(data.memberEmail);
					console.log(data.hostName);
					console.log(p3);
					console.log(p4);
					console.log(p5); */
				 	let div=$("<div class='reasonBox'>").html(data.complaintDetail); 
					div2.append(p);
					div2.append(p2);
					div2.append(p3);
					div2.append(p4);
					div2.append(p5);
					div2.append(div);
					$(".popupContentWrap").html(div2);
				}
				});
					
	    });
	    $(".popupBtn").on("click", function (e) {
	      $(e.target).parent().parent().removeClass("active");
	    });
	  });  --%>
 
	$("#complain, #cancel, #out").on({
	    "click":function(e){
	        let id = $(e.target).prop("id");
	        if( id == "complain") {
	            $(".complainChoice").remove().children();
	            $(".complainCurrent").append($("<span>").text("신고완료"));
	        } else if (id == "cancel" ) {
	            $(".complainChoice").remove().children();
	            $(".complainCurrent").append($("<span>").text("취소완료"));
	        } 
	       /*  else if (id == "out") {
	            $(".complainChoice").remove().children();
	            $(".complainCurrent").append($("<span>").text("권한박탈완료"));
	        } */
	    }
	});
	
	//신고 승인
	$(".accept").click(e=>{
		$.ajax({
			url:"<%=request.getContextPath()%>/admin/moveHostComplainAccept",
			data:{"hostNo":$(".hostNo").val(),"complaintNo":$(".complaintNo").val()},
			dataType:"json",
			succecc:data => {
				alert(data);
			}
			
		});
	});

</script>