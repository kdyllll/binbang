<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.binbang.member.model.vo.Reservation" %>
<%@page import="java.util.List"%>
<%@ include file="/views/common/commonLink.jsp"%>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/admin/manager.css" />
<%
	List<Reservation> list=(List)request.getAttribute("list");
	String type=request.getParameter("searchType");
	String key=request.getParameter("searchKeyword");
%>

</head>
<body>

	<div class="wrap">
	<%@ include file="/views/common/adminHeader.jsp"%>
      <section class="section">
        <%@ include file="/views/admin/adminNav.jsp"%>

          <form id="reserveAllContents" class="searchCommon">
            <p class="pageTitle">예약 현황</p>
	            
		<select class="searchCategory"  id="searchType">
		      <option value="" selected disabled hidden>선택</option>
		      <option value="reservation_no" <%=type!=null&&type.equals("reservation_no")?"selected":"" %>>예약 번호</option>
		      <option value="house_no" <%=type!=null&&type.equals("house_no")?"selected":"" %>>숙소 번호</option>
		      <option value="guest_name" <%=type!=null&&type.equals("guest_name")?"selected":"" %>>예약자 이름</option>
		      <option value="house_request" <%=type!=null&&type.equals("house_request")?"selected":"" %>>예약 상태</option>
   		</select>
   		
		<div class="search" id="search-reservation_no">
     		<form action="<%=request.getContextPath()%>/admin/searchReserveList">
    			<input type="hidden" name="searchType" value="reservation_no">
    			<input type="text"  class="searchinput" name="searchKeyword" size="25"
    				value="<%=key!=null&&type!=null&&type.equals("reservation_no")?key:""%>">
    			<button class="inputButton"></button>
    		</form>
    	</div>
    	<div class="search" id="search-house_no">
    		<form action="<%=request.getContextPath()%>/admin/searchReserveList">
    			<input type="hidden" name="searchType" value="house_no">
    			<input type="text"  class="searchinput" name="searchKeyword" size="25"
    				value="<%=key!=null&&type!=null&&type.equals("house_no")?key:""%>">
    			<button class="inputButton"></button>
    		</form>
    	</div>
    	<div class="search" id="search-guest_name">
    		<form action="<%=request.getContextPath()%>/admin/searchReserveList">
    			<input type="hidden" name="searchType" value="guest_name">
    			<input type="text"  class="searchinput" name="searchKeyword" size="25"
    				value="<%=key!=null&&type!=null&&type.equals("guest_name")?key:""%>">
  				<button class="inputButton"></button>  			
    		</form>
    	</div>
    	<div class="search" id="search-house_request">
    		<form action="<%=request.getContextPath()%>/admin/searchReserveList">
    			<input type="hidden" name="searchType" value="house_request">
    			<input type="text"  class="searchinput" name="searchKeyword" size="25"
    				value="<%=key!=null&&type!=null&&type.equals("house_request")?key:""%>">
  				<button class="inputButton"></button>  			
    		</form>
    	</div>
           
            <div class="tb_wrap">
              <div class="tableDiv">
                <table class="tableAll">
                  
                  <tr class="fixed_top">
                  	<th class="cell1" >예약 번호</th>
                    <th class="cell1" >숙소 번호</th>
                    <th class="cell3" >예약자 이름</th>
                    <th class="cell3" >예약 상태</th>
                    <th class="cell1" >예약 요금</th>
                    <th class="cell6" >예약 날짜</th>
                    
                  </tr>
                  <%for(Reservation r : list) {%>
                  <tr>
                    <td class="cell1"><%=r.getReservationNo() %></td>
                    <td class="cell1"><%=r.getHouseNo() %></td>
                    <td class="cell3"><%=r.getGuestName() %></td>
                    <td class="cell3"><%=r.getHouseRequest() %></td>
                    <td class="cell1"><%=r.getPrice() %></td>
                    <td class="cell6"><%=r.getCheckinDate() %>~<%=r.getCheckoutDate() %></td>
                    
                  </tr>
               <%} %>
                </table>
             </div>
            </div>
          </form>
</section>
</div>
</body>
</html>

<script>
	$(function(){
		let reservNo=$("#search-reservation_no");
		let houseNo=$("#search-house_no");
		let name=$("#search-guest_name");
		let request=$("#search-house_request");
		
		$("#searchType").change(e => {
			reservNo.css("display","none");
			houseNo.css("display","none");
			name.css("display","none");
			request.css("display","none");
			let v=$(e.target).val(); 
			$("#search-"+v).css("display","inline-block");
		});
		$("#searchType").change(); 
		
	});
</script>