package top.anchengxu.dao;

import org.apache.ibatis.annotations.Param;
import top.anchengxu.model.Article;

import java.util.Date;
import java.util.List;

public interface ArticleDao {
    List<Article> findAllArticle();

    int insertArticle(@Param("title") String title,@Param("content") String content,@Param("createdate") String createdate,@Param("lastestdate") String lastestdate,@Param("suffix") String suffix);

    int updateArticleContentByTitle(@Param("title") String title,@Param("content") String content,@Param("lastestdate") Date lastestdate);

    List<Article> findArticleByTitle(@Param("title") String title);
}
