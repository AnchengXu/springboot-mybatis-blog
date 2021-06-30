package top.anchengxu.controller;

import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import top.anchengxu.model.Article;
import top.anchengxu.service.ArticleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import java.io.*;
import java.util.List;

@Controller
@RequestMapping(value = "/article")
public class ArticleController {

    @Autowired
    private ArticleService articleService;

    @GetMapping(value = "/all")
    public List<Article> findAllArticle(){
        List<Article> list = articleService.findAllArticle();
        for(Article article : list){
            System.out.println(article.getId() + ";" + article.getContent() + ";" + article.getTitle());
        }
        return list;
    }

    @PostMapping(value = "/upload")
    public List<Article> upload(@RequestParam("file") MultipartFile file,ModelAndView modelAndView) throws IOException {
        String result = articleService.uploadFile(file);
        List<Article> list = articleService.findAllArticle();
        if(!result.equals("success")){
            System.out.println(result);
            return null;
        }
        return list;
    }

    @PostMapping(value = "/uploads")
    public String uploadBulks(@RequestParam("file") MultipartFile[] files) throws IOException {
        String result = articleService.uploadFileBulks(files);
        if(!result.equals("success")){
            System.out.println(result);
            return "upload_failed";
        }
        return "upload_success";
    }
}
