package net.agency.utils;

import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

public  class LoadFile {

    public static String fileLoading(MultipartFile file) throws IOException {
        String uploadPath="D:/TourAgency/src/main/webapp/resources/uploads";
        File uploadDir=new File(uploadPath);

        //если пути не существует то создадим
        if(!uploadDir.exists()){
            uploadDir.mkdir();
        }
        //создадим уникальное имя файла
        String uuidFile= UUID.randomUUID().toString();
        String resultFileName=uuidFile+"."+file.getOriginalFilename();
        file.transferTo(new File(uploadPath+"/"+resultFileName));
        return resultFileName;
    }
}
