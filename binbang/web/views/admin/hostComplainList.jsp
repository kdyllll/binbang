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
            <form action="">
              <select class="researchCategory" name="complainCategory">
                <option value="" selected disabled hidden>선택</option>  
                <option value="신고된 호스트">신고된 호스트</option>  
                <option value="신고 날짜">신고 날짜</option>   
              </select>
              <div class="search">
                <input type="text" class="searchinput">
                <button class="inputButton"></button>
                <!-- <button class="removeAll">처리완료 목록 삭제</button> -->
              </div>
            </form>
            
            <div class="tb_wrap">
              <div class="tableDiv" >
                <table class="tableAll">
                  <tr class="fixed_top">
                    <th class="cell1">신고자</th>
                    <th colspan="2" class="cell5">신고사유</th>
                    <th class="cell2">신고된 호스트</th>
                    <th class="cell2">신고날짜</th>
                    <th class="cell4">신고처리상황</th>
                  </tr>
                  <tr>
                    <td class="cell1">김다예</td>
                    <td class="cell2 complainCategory">허위정보, 청결, 안전위협</td>
                    <td class="cell3 complainReason">침대가 2개라고 하셨는데 하나는 침대가 아니라 소파더라구요</td>
                    <td class="cell2">인하준</td>
                    <td class="cell2">2020-09-09</td>
                    <td class="complainCurrent cell4">
                      <div class="complainChoice">
                        <input type="checkbox" name="complain" value="신고" id="complain">신고
                        <input type="checkbox" name="complain" value="취소" id="cancel">취소
                        <!--  <input type="checkbox" name="complain" value="권한박탈" id="out">권한박탈-->
                      </div>
                    </td>
                  </tr>
                </table>
              </div>
            </div>
            <!-- 팝업 -->
            <div class="enrollbg">
              <div id="popup">
               
                <div class="popupHead"><p class="popupTitle">신고 내역</p></div>
                <div class="popupBtn">x</div>
              
                <div class="popupContent">
                    
                    <p class="complainTitle">신고한 회원 아이디 :</p> 
                    <p class="complainTitle">호스트 아이디 : </p>
                    <p class="complainTitle">신고 날짜 : </p>
                    <p class="complainTitle eachComplainReason">신고 사유 : </p>
                    <p class="eachComplainCategory">허위 정보</p>
                    <div class="reasonBox">
                        침대가 2개라고 하셨는데 하나는 침대가 아니라 소파더라구요..
                        그 외에도 오션뷰라고 하셨는데 창문 틈 사이로 희미하게 바다가 보인다든지
                        화장실도 하나는 문을 막아놓으시는 등 허위정보들이 여러 개 있었습니다..
                        호스트에게 직접 문의를 해도 답변이 없었던 부분이 제일 화가 났습니다ㅠㅠ 
                    </div>
                
              </div>
        
              </div>
            </div>

          </div>
      </section>
      
       </body>
</html>


<script>
	$(function(){
		let memberName=$("#search-member_name");
		let hostNo=$("#search-host_no");
		let hostBlack=$("#search-host_black");
		
		$("#searchType").change(e => {
			memberName.css("display","none");
			hostNo.css("display","none");
			hostBlack.css("display","none");
			let v=$(e.target).val(); 
			$("#search-"+v).css("display","inline-block");
		});
		$("#searchType").change(); 
		
	});
	
	//말줄임표
	$(".complainReason").each(function(){
	    var length=7;
	    $(".complainReason").each(function(){
	        if($(".complainReason").text().length>=length){
	        $(".complainReason").text($(".complainReason").text().substr(0,length)+"...");
	        }
	    });
	});
	$(".complainCategory").each(function(){
	    var length=7;
	    $(".complainCategory").each(function(){
	        if($(".complainCategory").text().length>=length){
	        $(".complainCategory").text($(".complainCategory").text().substr(0,length)+"...");
	        }
	    });
	});
	
	//팝업
	$(document).ready(function () {
	    $(".complainReason").on("click", function () {
	      $(".enrollbg").addClass("active");
	    });
	    $(".popupBtn").on("click", function (e) {
	      $(e.target).parent().parent().removeClass("active");
	    });
	  });
	

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
</script>