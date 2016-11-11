package com.sist.library.mail;

import java.util.Properties;

/*import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;*/

import com.sist.library.dao.MailVO;

public class MailManager{
	
	public void sendMail(MailVO vo,String type) /*throws AddressException, MessagingException*/{
		
		 String host = "smtp.naver.com";
	     final String username = "bellroyalpha";
	     final String password = "anwjr89@!";
	     int port=465;
	      
	     // 메일 내용
	     String recipient = vo.getEmail();
	     String subject = "";
	     String body="";
	     if(type.equals("rent")){
	    	 subject=vo.getId()+"님이 신청한 도서가 대출되었습니다.";
	    	 body = "안녕하세요 "+vo.getId()+"님  \n"
	        		+ "저희 SIST Library를 이용해 주셔서 감사합니다. "+"\n"
	        		+"도서코드 : "+vo.getBook_code()+"\n"	
	        		+"도서명 : "+vo.getBook_name()+"\n"
	        		+"대여일 : "+vo.getRent_date()+"\n"
	        		+"반납일 : "+vo.getReturn_date()+"\n"
	        		+"대여기간을 꼭 지켜주세요."+"\n"
	        		+"항상 좋은일만 가득하시길 바랍니다.";
	     }else if(type.equals("reserve")){
	    	 subject=vo.getId()+"님이 신청한 도서가 예약되었습니다.";
	    	 body = "안녕하세요 "+vo.getId()+"님 \n"
	        		+"저희 SIST Library를 이용해 주셔서 감사합니다. "+"\n"
	        		+"도서코드 : "+vo.getBook_code()+"\n"
	        		+"도서명 : "+vo.getBook_name()+"\n"	        			
	        		+"예약일 : "+vo.getReserve_date()+"\n"
	        		+"위 정보로 예약되었습니다."+"\n"
	        		+"항상 좋은일만 가득하시길 바랍니다.";
	     }
	      
	     Properties props = System.getProperties();
	     
	     props.put("mail.smtp.host", host);
	     props.put("mail.smtp.port", port);
	     props.put("mail.smtp.auth", "true");
	     props.put("mail.smtp.ssl.enable", "true");
	     props.put("mail.smtp.ssl.trust", host);
	       
	   /*  Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
	         String un=username;
	         String pw=password;
	         protected PasswordAuthentication getPasswordAuthentication() {
	             return new PasswordAuthentication(un, pw);
	         }
	     });
	     session.setDebug(true); //for debug
	       
	     Message mimeMessage = new MimeMessage(session);
	     mimeMessage.setFrom(new InternetAddress("bellroyalpha@naver.com"));
	     mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(recipient));
	     mimeMessage.setSubject(subject);
	     mimeMessage.setText(body);
	     Transport.send(mimeMessage);*/
	}
}
