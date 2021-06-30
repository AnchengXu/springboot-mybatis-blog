package top.anchengxu.service;

import org.springframework.web.multipart.MultipartFile;
import top.anchengxu.model.Article;

import java.util.Date;
import java.util.List;

public interface ArticleService {
    List<Article> findAllArticle();

    String uploadFile(MultipartFile multipartFile);

    String uploadFileBulks(MultipartFile[] multipartFile);

    int insertArticle(String title, String content, String createdate,String lastestDate,String suffix);

    int updateArticleContentByTitle(String title,String content,Date lastestdate);

    List<Article> findArticleByTitle(String title);
}
