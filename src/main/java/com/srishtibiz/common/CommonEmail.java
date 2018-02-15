package com.srishtibiz.common;

import java.util.concurrent.*;
import javax.servlet.http.HttpServlet;

public class CommonEmail extends HttpServlet {

    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	public ExecutorService emailSender =
            new ThreadPoolExecutor(
                    10, 10, 1, TimeUnit.SECONDS, new LinkedBlockingQueue<Runnable>());

    public void init() {
        emailSender = Executors.newFixedThreadPool(1);
    }

    public void destroy() {
        emailSender.shutdownNow();
    }
}
