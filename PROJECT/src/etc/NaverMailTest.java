package etc;

 
import java.util.List;
import java.util.Properties;
 



import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import DTO.AccountsDTO;

 
public class NaverMailTest {
    public void sendmail(AccountsDTO account) throws MessagingException{
        // ���� ���� ����
    	
        String host = "smtp.naver.com";
        final String username = "public_kosta";
        final String password = "kosta1004";
        int port=465;
         
        // ���� ����
        String recipient = account.getEmail();
        String subject = account.getEmpno()+"�� ��й�ȣ�Դϴ�.";
        String body = account.getEmpno()+"���� ��й�ȣ�� "+account.getPwd()
        		+" �Դϴ�";
         
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
        mimeMessage.setFrom(new InternetAddress("public_kosta@naver.com"));
        mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(recipient));
        mimeMessage.setSubject(subject);
        mimeMessage.setText(body);
        Transport.send(mimeMessage);
    }
}