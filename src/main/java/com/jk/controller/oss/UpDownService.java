package com.jk.controller.oss;

import org.springframework.web.multipart.MultipartFile;

public interface UpDownService {
    String updateHead(MultipartFile file, int i);
}
