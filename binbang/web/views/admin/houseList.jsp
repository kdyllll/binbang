<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.binbang.house.model.vo.House" %>
<%@page import="java.util.List"%>
<%@ include file="/views/common/commonLink.jsp"%>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/admin/manager.css" />
<%
	List<House> list=(List)request.getAttribute("list");
	String type=request.getParameter("searchType");
	String key=request.getParameter("searchKeyword");
%>
</head>
<body>
<div class="wrap">
	<%@ include file="/views/common/adminHeader.jsp"%>
      <section class="section">
       <%@ include file="/views/admin/adminNav.jsp"%>

          <div id="houseAllContents" class="searchCommon">
            <p class="pageTitle">숙소 현황</p>
	            
		<select class="searchCategory"  id="searchType">
		      <option value="" selected disabled hidden>선택</option>
		      <option value="house_no" <%=type!=null&&type.equals("house_no")?"selected":"" %>>숙소 번호</option>
		      <option value="host_no" <%=type!=null&&type.equals("host_no")?"selected":"" %>>호스트 번호</option>
		      <option value="house_type" <%=type!=null&&type.equals("house_type")?"selected":"" %>>숙소 유형</option>
		      <option value="house_location" <%=type!=null&&type.equals("house_location")?"selected":"" %>>숙소 위치</option>
   		</select>
   		
		
    	<div class="search" id="search-house_no">
    		<form action="<%=request.getContextPath()%>/admin/searchHouseList">
    			<input type="hidden" name="searchType" value="house_no">
    			<input type="text"  class="searchinput" name="searchKeyword" size="25" placeholder="숙소 번호"
    				value="<%=key!=null&&type!=null&&type.equals("house_no")?key:""%>">
    			<button class="inputButton"></button>
    		</form>
    	</div>
    	<div class="search" id="search-host_no">
     		<form action="<%=request.getContextPath()%>/admin/searchHouseList">
    			<input type="hidden" name="searchType" value="host_no">
    			<input type="text"  class="searchinput" name="searchKeyword" size="25" placeholder="호스트 번호"
    				value="<%=key!=null&&type!=null&&type.equals("host_no")?key:""%>">
    			<button class="inputButton"></button>
    		</form>
    	</div>
    	<div class="search" id="search-house_type">
    		<form action="<%=request.getContextPath()%>/admin/searchHouseList">
    			<input type="hidden" name="searchType" value="house_type">
    			<input type="text"  class="searchinput" name="searchKeyword" size="25" placeholder="숙소 유형"
    				value="<%=key!=null&&type!=null&&type.equals("house_type")?key:""%>">
  				<button class="inputButton"></button>  			
    		</form>
    	</div>
    	<div class="search" id="search-house_location">
    		<form action="<%=request.getContextPath()%>/admin/searchHouseList">
    			<input type="hidden" name="searchType" value="house_location">
    			<input type="text"  class="searchinput" name="searchKeyword" size="25" placeholder="숙소 위치"
    				value="<%=key!=null&&type!=null&&type.equals("house_location")?key:""%>">
  				<button class="inputButton"></button>  			
    		</form>
    	</div>
           
            <div class="tb_wrap">
              <div class="tableDiv">
                <table class="tableAll">
                  
                  <tr class="fixed_top">
                  	<th class="cell1" >숙소 번호</th>
                    <th class="cell1" >호스트 번호</th>
                    <th class="cell4" >숙소 이름</th>
                    <th class="cell2" >숙소 유형</th>
                    <th class="cell2" >숙소 위치</th>
                    <th class="cell4" >평균 요금</th>
                    
                  </tr>
                  <%for(House h: list) {%>
                  <tr>
                    <td class="cell1"><%=h.getHouseNo() %></td>
                    <td class="cell1"><%=h.getHostNo() %></td>
                    <td class="cell4"><%=h.getHouseName() %></td>
                    <td class="cell2"><%=h.getHouseType() %></td>
                    <td class="cell2"><%=(h.getHouseLocation()).substring(0,2) %></td>
                    <td class="cell4"><%=(h.getPriceDay()+h.getPriceWeekend()+h.getPricePeakDay()+h.getPricePeakWeekend())/4 %></td>
                    
                  </tr>
               <%} %>
                </table>
             </div>
            </div>
          </div>
</section>
</div>
</body>
</html>

<script>
	$(function(){
		let hostNo=$("#search-host_no");
		let houseNo=$("#search-house_no");
		let houseType=$("#search-house_type");
		let location=$("#search-house_location");
		
		$("#searchType").change(e => {
			hostNo.css("display","none");
			houseNo.css("display","none");
			houseType.css("display","none");
			location.css("display","none");
			let v=$(e.target).val(); 
			$("#search-"+v).css("display","inline-block");
		});
		$("#searchType").change(); 
		
	});
</script>