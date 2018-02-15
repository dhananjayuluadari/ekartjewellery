package com.srishtibiz.common;

import java.util.Date;
import java.util.Properties;
import javax.activation.DataHandler;
import javax.mail.*;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.mail.util.ByteArrayDataSource;

public class SendingEmail2 {
    
     public static String from= "hr.support@srishtibiz.com";
     public static String pass = "hrsupport@123";
    public static void Email(
            String fromMailId,
            String password,
            String subject,
            String toMailId,
            String Status,
            String employeeName,
            String ClaimId,
            String html) {

        //Get the session object
        // Assuming you are sending email through relay.jangosmtp.net
        Properties properties = System.getProperties();

        properties.put("mail.smtp.starttls.enable", "true");

        properties.put("mail.smtp.host", "smtp.gmail.com");

        properties.put("mail.smtp.user", from); // User name
        properties.put("mail.smtp.password", pass); // password

        properties.put("mail.smtp.port", "587");
        properties.put("mail.smtp.auth", "true");

        Session session =
                Session.getDefaultInstance(
                        properties,
                        new javax.mail.Authenticator() {
                            protected PasswordAuthentication getPasswordAuthentication() {
                                return new PasswordAuthentication(
                                        from,
                                        pass); // Specify the Username and the PassWord
                            }
                        });

        try {
            // Create a default MimeMessage object.
            Message message = new MimeMessage(session);
            System.out.println("dhana try code" + toMailId);
            // Set From: header field of the header.
            message.setFrom(new InternetAddress(from));

            // Set To: header field of the header.

            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toMailId));

            message.setSubject(subject);

            message.setSentDate(new Date());
            message.setContent(html, "text/html");

            // Send message
            Transport.send(message);

        } catch (Exception e) {

            System.out.println("dhana error code" + toMailId);
            e.printStackTrace();
        }
    }

    public static void Email(
            String fromMailId,
            String password,
            String subject,
            String toMailId,
            String Status,
            String employeeName,
            String ClaimId,
            String html,
            String[] attachFiles) {

        //Get the session object
        // Assuming you are sending email through relay.jangosmtp.net
        Properties properties = System.getProperties();

        properties.put("mail.smtp.starttls.enable", "true");

        properties.put("mail.smtp.host", "smtp.gmail.com");

        properties.put("mail.smtp.user", from); // User name
        properties.put("mail.smtp.password", pass); // password

        properties.put("mail.smtp.port", "587");
        properties.put("mail.smtp.auth", "true");

        Session session =
                Session.getDefaultInstance(
                        properties,
                        new javax.mail.Authenticator() {
                            protected PasswordAuthentication getPasswordAuthentication() {
                                return new PasswordAuthentication(
                                        from,
                                        pass); // Specify the Username and the PassWord
                            }
                        });

        try {
            // Create a default MimeMessage object.
            Message message = new MimeMessage(session);

            // Set From: header field of the header.
            message.setFrom(new InternetAddress(from));

            // Set To: header field of the header.
            InternetAddress[] toAddresses = {new InternetAddress(toMailId)};
            message.setRecipients(Message.RecipientType.TO, toAddresses);

            message.setSubject(subject);

            message.setSentDate(new Date());

            MimeBodyPart messageBodyPart = new MimeBodyPart();
            messageBodyPart.setContent(html, "text/html");

            // creates multi-part
            Multipart multipart = new MimeMultipart();
            multipart.addBodyPart(messageBodyPart);

            // adds attachments
            if (attachFiles != null && attachFiles.length > 0) {
                for (String filePath : attachFiles) {
                    MimeBodyPart attachPart = new MimeBodyPart();

                    try {
                        attachPart.attachFile(filePath);
                    } catch (Exception ex) {
                        ex.printStackTrace();
                    }

                    multipart.addBodyPart(attachPart);
                }
            }

            // sets the multi-part as e-mail's content
            message.setContent(multipart);

            // Send message
            Transport.send(message);

        } catch (Exception e) {
            e.printStackTrace();
            //throw new RuntimeException(e);
        }
    }

    public static void Email(
            String fromMailId,
            String password,
            String subject,
            String toMailId,
            String Status,
            String employeeName,
            String ClaimId,
            String html,
            String fileName,
            byte[] bytes) {

        System.out.println("111111111111111" + from);
        System.out.println("Dhana mail code 22222222222222 " + toMailId);
        //Get the session object
        // Assuming you are sending email through relay.jangosmtp.net
        Properties properties = System.getProperties();

        properties.put("mail.smtp.starttls.enable", "true");
        properties.put("mail.smtp.host", "smtp.gmail.com");
        properties.put("mail.smtp.user", from); // User name
        properties.put("mail.smtp.password", pass); // password

        properties.put("mail.smtp.port", "587");
        properties.put("mail.smtp.auth", "true");

        Session session =
                Session.getDefaultInstance(
                        properties,
                        new javax.mail.Authenticator() {
                            protected PasswordAuthentication getPasswordAuthentication() {
                                return new PasswordAuthentication(
                                        from,
                                        pass); // Specify the Username and the PassWord
                            }
                        });

        try {
            // Create a default MimeMessage object.

            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(from));
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(toMailId));
            message.setSubject(subject);
            BodyPart messageBodyPart1 =
                    new MimeBodyPart(); // creating MimeBodyPart object and set your message text

            messageBodyPart1.setContent(html, "text/html");

            MimeBodyPart messageBodyPart2 =
                    new MimeBodyPart(); // creating new MimeBodyPart object and setting DataHandler to this object

            ByteArrayDataSource source = new ByteArrayDataSource(bytes, "application/octet-stream");

            messageBodyPart2.setDataHandler(new DataHandler(source));
            messageBodyPart2.setFileName(fileName);
            System.out.println("Dhana mail code 33333333333333 " + from);
            Multipart multipart =
                    new MimeMultipart(); //creating multipart object and adding MimBodyPart to this object
            multipart.addBodyPart(messageBodyPart1);
            multipart.addBodyPart(messageBodyPart2);
            System.out.println("Dhana mail code 4444444444 " + pass);
            message.setContent(multipart); //setting multipart object to message object
            Transport.send(message); // sending message
            System.out.println("Message has been sent");

            System.out.println("mail sent to me" + toMailId);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void Email(
            String fromMailId,
            String password,
            String subject,
            String toMailId,
            String Status,
            String employeeName,
            String ClaimId,
            String html,
            DataObject dataObject) {

        Properties properties = System.getProperties();

        properties.put("mail.smtp.starttls.enable", "true");

        properties.put("mail.smtp.host", "smtp.gmail.com");

        properties.put("mail.smtp.user", from); // User name
        properties.put("mail.smtp.password", pass); // password

        properties.put("mail.smtp.port", "587");
        properties.put("mail.smtp.auth", "true");

        Session session =
                Session.getDefaultInstance(
                        properties,
                        new javax.mail.Authenticator() {
                            protected PasswordAuthentication getPasswordAuthentication() {
                                return new PasswordAuthentication(
                                        from,
                                        pass); // Specify the Username and the PassWord
                            }
                        });

        try {
            // Create a default MimeMessage object.
            Message message = new MimeMessage(session);

            // Set From: header field of the header.
            message.setFrom(new InternetAddress(from));

            // Set To: header field of the header.

            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toMailId));

            message.setSubject(subject);

            message.setSentDate(new Date());
            message.setContent(html, "text/html");

            // Send message
            Transport.send(message);
            System.out.println("44444444444tomial" + toMailId);

        } catch (Exception e) {
            e.printStackTrace();
            // throw new RuntimeException(e);

        }
    }

    public static void Email(
            String fromMailId,
            String password,
            String subject,
            String toMail[],
            String ccMail[],
            String html) {

        //Get the session object
        // Assuming you are sending email through relay.jangosmtp.net
        Properties properties = System.getProperties();

        properties.put("mail.smtp.starttls.enable", "true");

        properties.put("mail.smtp.host", "smtp.gmail.com");

        properties.put("mail.smtp.user", from); // User name
        properties.put("mail.smtp.password", pass); // password

        properties.put("mail.smtp.port", "587");
        properties.put("mail.smtp.auth", "true");

        Session session =
                Session.getDefaultInstance(
                        properties,
                        new javax.mail.Authenticator() {
                            protected PasswordAuthentication getPasswordAuthentication() {
                                return new PasswordAuthentication(
                                        from,
                                        pass); // Specify the Username and the PassWord
                            }
                        });

        try {
            // Create a default MimeMessage object.
            Message message = new MimeMessage(session);

            // Set From: header field of the header.
            message.setFrom(new InternetAddress(from));

            // Set To: header field of the header.

            InternetAddress[] mailAddress_TO = new InternetAddress[toMail.length];
            for (int i = 0; i < toMail.length; i++) {
                mailAddress_TO[i] = new InternetAddress(toMail[i]);
                System.out.println("to mail" + toMail[i]);
            }
            message.addRecipients(Message.RecipientType.TO, mailAddress_TO);

            InternetAddress[] mailAddress_CC = new InternetAddress[ccMail.length];
            for (int i = 0; i < ccMail.length; i++) {
                mailAddress_CC[i] = new InternetAddress(ccMail[i]);
                System.out.println("ccMailsssss" + ccMail[i]);
            }
            message.addRecipients(Message.RecipientType.CC, mailAddress_CC);

            message.setSubject(subject);

            message.setSentDate(new Date());
            message.setContent(html, "text/html");

            // Send message
            Transport.send(message);
            System.out.println("To mails cc mails sent sucessfully");

        } catch (Exception e) {

            e.printStackTrace();
        }
    }
}
