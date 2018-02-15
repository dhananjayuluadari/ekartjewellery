package com.spring.shopping.util;

import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Paths;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.Part;

import org.springframework.web.multipart.MultipartFile;

import com.amazonaws.auth.AWSCredentials;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.services.s3.model.ObjectMetadata;


public class AmazonFileUploadUtility {
	
	
	public static String fileUpload(HttpServletRequest request) throws IOException, ServletException{
		System.out.println("chekicng"+request.getParameter("categoryName")+"subCategoryName"+request.getParameter("subCategoryName"));
		Part p = request.getPart("files");
		String fileName = Paths.get(p.getSubmittedFileName()).getFileName().toString(); // MSIE fix.
		InputStream inputStream = p.getInputStream();
		
		AWSCredentials credentials = new BasicAWSCredentials("AKIAJJVK5N2UCTU3XQWQ","5GRF6Z7EoueeALOKqarbOzp2J/CGRUR+e+a/ZMEG");
		String bucketName="srishtibiz";
		AWSUploadUtility s3client = new AWSUploadUtility();
		ObjectMetadata metadata=new ObjectMetadata();
		metadata.setContentLength(Long.valueOf(inputStream.available()));
		s3client.uploadfile(credentials, bucketName, fileName, inputStream, metadata);
		
		return fileName;
		
	}
	
	
	public static String fileUpload(MultipartFile sfile,Long productId) throws IOException {
		// TODO Auto-generated method stub
	
		String fileName = sfile.getOriginalFilename(); // MSIE fix.
		 int index = fileName.lastIndexOf('.');
         String lastString = (fileName.substring(index + 1));
          fileName=productId+"."+lastString;
		System.out.println(" fileName chekcn  "+fileName);
		InputStream inputStream = sfile.getInputStream();
		
		AWSCredentials credentials = new BasicAWSCredentials("AKIAJJVK5N2UCTU3XQWQ","5GRF6Z7EoueeALOKqarbOzp2J/CGRUR+e+a/ZMEG");
		String bucketName="srishtibiz";
		AWSUploadUtility s3client = new AWSUploadUtility();
		ObjectMetadata metadata=new ObjectMetadata();
		metadata.setContentLength(Long.valueOf(inputStream.available()));
		s3client.uploadfile(credentials, bucketName, fileName, inputStream, metadata);
		
		return fileName;
	}

}
