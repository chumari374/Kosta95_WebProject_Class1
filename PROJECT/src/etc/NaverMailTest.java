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

//硫붿씪諛쒖넚 �겢�옒�뒪
public class NaverMailTest {
    public void sendmail(AccountsDTO account) throws MessagingException{
        // 硫붿씪 愿��젴 �젙蹂�
    	
        String host = "smtp.naver.com"; //�샇�뒪�듃 �젙蹂�
        final String username = "public_kosta"; //蹂대궪�븘�씠�뵒
        final String password = "kosta1004"; //蹂대궪�븘�씠�뵒�쓽 �븫�샇
        int port=465; //吏��젙�맂 �룷�듃踰덊샇
         
        // 硫붿씪 �궡�슜
        String recipient = account.getEmail();
        String subject = account.getEmpno()+"님의 비밀번호 입니다."; //�젣紐�
        String body = account.getEmpno()+"님의 비밀번호는  "+account.getPwd()
        		+" 입니다 ";//�궡�슜
        
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
        mimeMessage.setFrom(new InternetAddress("public_kosta@naver.com"));//蹂대궦�궗�엺�꽕�젙(�쐞�쓽 蹂대궪�븘�씠�뵒�� 媛숆쾶)
        mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(recipient));
        mimeMessage.setSubject(subject);
        mimeMessage.setText(body);
        Transport.send(mimeMessage); //諛쒖넚
    }
}