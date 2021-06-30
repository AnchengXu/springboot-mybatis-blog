package top.anchengxu.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/")
public class IndexController {

    @GetMapping(value = "/")
    public String upload(){
        return "upload";
    }

    @GetMapping(value = "/bulks")
    public String uploadBulks(){
        return "upload_bulks";
    }
}
