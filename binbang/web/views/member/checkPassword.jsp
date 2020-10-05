<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>		    

   <!DOCTYPE html>
	<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <title>Password Check</title>    
  </head>
  <body>
    

  <div id="updatePassword-container">
      <form name="pwck" action="<%=request.getContextPath() %>/member/myPage" method="post" >
         
            	  <div>현재 비밀번호</div>
               	
                  <input type="password" name="password" id="password">                              
                  <input type="submit"  value="확인" onclick="return fn_validate();"/>                                                              
         
      </form>
   </div>      
      


   
    

  </body>
</html>