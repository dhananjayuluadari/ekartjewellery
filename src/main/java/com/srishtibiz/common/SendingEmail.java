package com.srishtibiz.common;

public class SendingEmail extends CommonEmail {

    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public void Email(
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
        emailSender.execute(
                new Runnable() {
                    public void run() {

                        SendingEmail2.Email(
                                fromMailId,
                                password,
                                subject,
                                toMailId,
                                fromMailId,
                                fromMailId,
                                fromMailId,
                                html);
                    }
                });
    }

    public void Email(
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
        emailSender.execute(
                new Runnable() {
                    public void run() {

                        SendingEmail2.Email(
                                fromMailId,
                                password,
                                subject,
                                toMailId,
                                Status,
                                employeeName,
                                ClaimId,
                                html,
                                attachFiles);
                        ;
                    }
                });
    }

    public void Email(
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
        emailSender.execute(
                new Runnable() {
                    public void run() {

                        SendingEmail2.Email(
                                fromMailId,
                                password,
                                subject,
                                toMailId,
                                Status,
                                employeeName,
                                ClaimId,
                                html,
                                fileName,
                                bytes);
                    }
                });
    }

    public void Email(
            String fromMailId,
            String password,
            String subject,
            String toMailId,
            String Status,
            String employeeName,
            String ClaimId,
            String html,
            DataObject dataObject) {

        emailSender.execute(
                new Runnable() {
                    public void run() {

                        SendingEmail2.Email(
                                fromMailId,
                                password,
                                subject,
                                toMailId,
                                Status,
                                employeeName,
                                ClaimId,
                                html,
                                dataObject);
                    }
                });
    }

    public void Email(
            String fromMailId,
            String password,
            String subject,
            String toMail[],
            String ccMail[],
            String html) {

        emailSender.execute(
                new Runnable() {
                    public void run() {

                        SendingEmail2.Email(fromMailId, password, subject, toMail, ccMail, html);
                    }
                });
    }
}
