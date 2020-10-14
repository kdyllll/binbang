<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
@font-face {
   font-family: 'IBMPlexSansKR-Light';
   src:
      url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-07@1.0/IBMPlexSansKR-Light.woff')
      format('woff');
   font-weight: normal;
   font-style: normal;
}

body {
   font-family: 'IBMPlexSansKR-Light';
   padding: 0px;
   margin: 0px;
}

.jb-box {
   width: 100%;
   height: 100%;
   overflow: hidden;
   margin: 0px auto;
   position: relative;
}

video {
   width: 100%;
}

.jb-text {
   position: absolute;
   top: 50%;
   width: 100%;
}

.jb-text a {
display:block;
   margin-top: -70px;
   text-align: center;
   font-size: 20px;
   color: #ffffff;
   text-decoration:none;
}

</style>

</head>
<body>
   <div class="jb-box">
      <video muted autoplay loop>
         <source
            src="<%=request.getContextPath()%>/video/Abandoned - 49338.mp4"
            type="video/mp4">
      </video>
      <div class="jb-text">
         <a href="<%=request.getContextPath()%>/mainMove">메인으로이동</a>
      </div>
   </div>

</body>
</html>