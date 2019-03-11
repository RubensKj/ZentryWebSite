package com.zentry.tools;

import  java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Component
public class FileSaver {

    @Autowired
    private HttpServletRequest request;

    public String write(String baseFolder, MultipartFile file) {
        try {
            String realPath = "C:/Users/ruben/Pictures";
            String path = realPath + "/" + file.getOriginalFilename();
            file.transferTo(new File(path));
            return baseFolder + "/" + file.getOriginalFilename();
        } catch (IllegalStateException | IOException e) {
            throw new RuntimeException(e);
        }
    }

    public File convert(MultipartFile file) throws IOException {
        File convFile = new File(file.getOriginalFilename());
        convFile.createNewFile();
        FileOutputStream fos = new FileOutputStream(convFile);
        fos.write(file.getBytes());
        fos.close();
        return convFile;
    }
}