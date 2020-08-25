package com.mir.app.simplefile;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.env.Environment;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.text.Normalizer;
import java.util.List;

@RestController
@Slf4j
public class ApiController {

    @Value(value = "${file.upload.path}")
    private String defaultFileUploadPath;

    @Autowired
    private Environment environment;

    @PostMapping("/api/file/upload")
    @ResponseStatus(HttpStatus.CREATED)
    public void upload(@RequestPart List<MultipartFile> files, @RequestParam(value = "group", required = false) String group) throws Exception {
        String fileUploadPath = defaultFileUploadPath;
        if(group != null & !"".equals(group)) {
            fileUploadPath += "/" + group;
        }

        File directory = new File(fileUploadPath);
        if (!directory.exists()) {
            directory.mkdir();
        }

        for (MultipartFile file : files) {
            String originalFileName = Normalizer.normalize(file.getOriginalFilename(), Normalizer.Form.NFC);
            File dest = new File(fileUploadPath + "/" + originalFileName);
            file.transferTo(dest);
        }
    }

    @GetMapping("/api/property")
    public ResponseEntity getProperty(@RequestParam String key){
        if (key != null && !"".equals(key)){
            return ResponseEntity.ok(environment.getProperty(key));
        } else {
            return ResponseEntity.badRequest().build();
        }
    }
}
