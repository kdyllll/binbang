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
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-07@1.0/IBMPlexSansKR-Light.woff') format('woff');
    font-weight: normal;
    font-style: normal;
   }
            
body {
 //font-family: 'IBMPlexSansKR-Light';
 }

* {
   margin: 0;
   padding: 0;
}

body {
   width:100vw;
   height:100vh;
   overflow: hidden;
   position:relative;
}

#videoBg {
   position: absolute;
   top: 0;
   legt: 0;
   z-index: -1000;
   min-width: 100%;
   min-height: 100%;
   width: auto;
   height: auto;
   overflow: hidden;
}

.moveMain {
   position: absolute;
   top:45%;
   z-index:100;
}

.moveMain a {
   display:inline-block;
   width:100vw;
   text-decoration:none;
   color:inherit;
   text-align:center;
}
</style>
</head>
<body>
   <video id="videoBg"
      src="<%=request.getContextPath()%>/video/v7.mp4" autoplay="true"
      loop="loop" muted="muted"></video>

   <div class="moveMain"><a href="<%=request.getContextPath()%>/mainMove">메인으로이동</a></div>
</body>
</html>