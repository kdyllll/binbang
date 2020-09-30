package com.binbang.common.filter;

import java.nio.charset.Charset;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

public class EncryptorWrapper extends HttpServletRequestWrapper{

	public EncryptorWrapper(HttpServletRequest request) {
		super(request);
		// TODO Auto-generated constructor stub
	}

	@Override
	 public String getParameter(String name) {

		String result = "";
	      String ori = super.getParameter(name);
	      if(name.equals("password")||name.equals("new_password")) {

	    	  System.out.println("암호화 전 : " +ori);
	          result = getSha512(ori);
	          System.out.println("암호화 후 : " +result);

		}else {
			result=ori;
		}
		return result;
	}
	
	 private String getSha512(String password) {
		
		String encrypt="";
		MessageDigest md=null;
		try {
			
			md=MessageDigest.getInstance("SHA-512");
			
		}catch(NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		
		byte[] bytes=password.getBytes(Charset.forName("UTF-8"));
		
		md.update(bytes);
		
		encrypt=Base64.getEncoder().encodeToString(md.digest());
		return encrypt;
		
	}

}
