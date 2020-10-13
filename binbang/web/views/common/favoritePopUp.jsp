<%@page import="com.binbang.member.model.vo.Favorite"%>
<%@page import="java.util.List"%>
<%@page import="com.binbang.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>favorite</title>
<script
	src="<%=request.getContextPath()%>/js/common/jquery-3.5.1.min.js"></script>
<%
	String houseNo = (String) request.getAttribute("houseNo");
	List<Favorite> favorite = (List) request.getAttribute("favorite");
%>

</head>
<style>
.favPop {
	padding: 5%;
}
/* header */
.headerLine {
	width: 100%;
	height: 2px;
	background-color: black;
}

/* first content */
.popContent {
	display: flex;
	flex-direction: column;
	align-items: center;
	border: none;
}

.favLine {
	width: 100%;
	height: 1px;
	background-color: gray;
}

.firstContent {
	width: 100%;
}

.makeFolder {
	height: 0;
}

.show {
	height: 50px;
}

#plusBtn {
	margin-left: 50px;
	margin-top: 30px;
	margin-right: 300px;
	width: 300px;
	height: 50px;
	font-size: 15px;
	color: gray;
	background-color: white;
	cursor: pointer;
	border: none;
	outline: none;
}

.folderName {
	margin-right: 180px;
	border: none;
	outline: none;
	text-aligh: center;
}

#folderPlusBtn {
	margin: 10px 0;
	float: right;
	width: 70px;
	height: 30px;
	background-color: black;
	color: white;
	border: none;
	outline: none;
	cursor: pointer;
}
/* second content */
.favoriteForm {
	width: 100%;
}

.folder {
	display: flex;
	justify-content: space-between;
	margin: 20px 0;
}

.heartCommon {
	/* 관심숙소 버튼 */
	width: 23px;
	height: 23px;
	margin-right: 5px;
	cursor: pointer;

}

.heart {

	background-image: url("<%=request.getContextPath()%>/image/common/icon/heart0.png");
	background-size: cover;
}

.fav {

	background-image: url("<%=request.getContextPath()%>/image/common/icon/heart1.png");
	background-size: cover;
}

.folderTitle {
	margin-right: 180px;
	border: none;
	outline: none;
}
/* bottom */
#closeBtn {
	margin: 10px 0;
	float: right;
	width: 70px;
	height: 30px;
	background-color: black;
	color: white;
	border: none;
	outline: none;
	cursor: pointer;
}
</style>
<body>

	<div class="favPop">
		<div class="headerLine"></div>

		<div class="popContent">
			<div class="firstContent">
				<div id="plusBtn">+ 폴더만들기</div>
				<form class="makeFolder" method="post">
					<div class="favLine"></div>
					<input type="text" name="folderName" class="folderName" placeholder="폴더 명을 입력하세요."> 
					<input type="button" value="추가" id="folderPlusBtn" onclick="fn_folderAdd();"> 
				</form>
			</div>
			<div class="favLine"></div>
			<form class="favoriteForm" method="post" action="<%=request.getContextPath()%>/favorite/favConPopUp">
				<%
					for (Favorite f : favorite) {
				%>
				<div class="secondContent">
					<div class="folder">
						<input type="text" class="folderTitle"
							value="<%=f.getFolderName()%>" readonly>
							<input type="hidden" name="houseNo" value="<%=houseNo%>">
						<%if (f.getHouseNo()!=null&&f.getHouseNo().length()!=0 && f.getHouseNo() == houseNo) {%>
							<div class="heartCommon fav"></div>
							
						<%} else {%>
							<div class="heartCommon heart"></div>
												
						<%}%>
						<input type="hidden" class="check 0" value="<%=f.getFolderNo()%>">
					</div>
					<div class="favLine"></div>
				</div>
				<%
					}
				%>
				<input type="hidden" name="addFolderNo" value="">
				<input type="hidden" name="delFolderNo" value="">	
				<input type="button" onclick="fn_check();" value="확인" id="closeBtn">
			</form>

		</div>
		
	</div>

	<script>
	$("#plusBtn").on("click", e => {
		$(".makeFolder").toggleClass("show");
		
	});
	
	function fn_folderAdd(e){
		if($(".folderName").val().trim().length==0){
            alert("폴더 이름을 입력하세요.");   
            return;
         }else{  
         	$(".makeFolder").attr("action", "<%=request.getContextPath()%>/favorite/favFolderPopUpAdd").submit();
         }		
	}
	
	$(".heartCommon").on("click",function(e){
	    $(e.target).toggleClass("heart");
	    $(e.target).toggleClass("fav");
	    console.log($(e.target).next(".check"));
	    $(e.target).next(".check").toggleClass("0");
	    $(e.target).next(".check").toggleClass("1");
	});
	
	function fn_check(){
		//안돌아....
		let onoff=[];
		onoff.push($(".check").attr("class"));
		console.log(onoff);
		if(onoff=="check 1"){
			console.log($(this));
			$(this).attr("name","folderNo");
			console.log($(this));
		}
		
	}
	</script>
</body>
</html>