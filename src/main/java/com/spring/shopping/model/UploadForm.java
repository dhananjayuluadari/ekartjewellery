package com.spring.shopping.model;


import org.springframework.web.multipart.MultipartFile;

public class UploadForm {

    MultipartFile[] files;

    public MultipartFile[] getFiles() {
        return files;
    }

    public void setFiles(MultipartFile[] files) {
        this.files = files;
    }

}
