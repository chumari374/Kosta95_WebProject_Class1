package etc;

 
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import DTO.AccountsDTO;

//메일발송 클래스
public class NaverMailTest {
    public void sendmail(AccountsDTO account) throws MessagingException{
        // 메일 관련 정보
    	
        String host = "smtp.naver.com"; //호스트 정보
        final String username = "public_kosta"; //보낼아이디
        final String password = "kosta1004"; //보낼아이디의 암호
        int port=465; //지정된 포트번호
         
        // 메일 내용
        String recipient = account.getEmail();
        String subject = account.getEmpno()+"님 비밀번호입니다."; //제목
        String body = account.getEmpno()+"님의 비밀번호는 "+account.getPwd()
        		+" 입니다";//내용
        
        Properties props = System.getProperties();
         
         
        props.put("mail.smtp.host", host);
        props.put("mail.smtp.port", port);
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.ssl.enable", "true");
        props.put("mail.smtp.ssl.trust", host);
          
        Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
            String un=username;
            String pw=password;
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(un, pw);
            }
        });
        session.setDebug(true); //for debug
          
        Message mimeMessage = new MimeMessage(session);
        mimeMessage.setFrom(new InternetAddress("public_kosta@naver.com"));//보낸사람설정(위의 보낼아이디와 같게)
        mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(recipient));
        mimeMessage.setSubject(subject);
        mimeMessage.setText(body);
        Transport.send(mimeMessage); //발송
    }
}