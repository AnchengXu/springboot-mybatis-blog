package top.anchengxu.service.impl;

import org.springframework.web.multipart.MultipartFile;
import top.anchengxu.dao.ArticleDao;
import top.anchengxu.model.Article;
import top.anchengxu.service.ArticleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

//这里一定要加这个@Service（value = ""）的注解，不然controller的autowired会报错
@Service(value = "articleService")
public class ArticleServiceImpl implements ArticleService {

    @Autowired
    private ArticleDao articleDao;

    @Override
    public List<Article> findAllArticle() {
        List<Article> result = articleDao.findAllArticle();
        return result;
    }

    @Override
    public List<Article> findArticleByTitle(String title) {
        List<Article> list = articleDao.findArticleByTitle(title);
        return list;
    }

    @Override
    public String uploadFile(MultipartFile multipartFile) {
        if (multipartFile.isEmpty()) {
            return "null file";
        }
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String currentTime = simpleDateFormat.format(new Date());
        String title = multipartFile.getOriginalFilename();
        String content = getFileContentString(multipartFile);
        //对小数点做字符串分隔，需要加上反斜杠，不然不生效。分割后的数组，0为title，1为文件后缀
        String fileName[]= title.split("\\.");
        //不管文章标题是否存在，均一起插入，到时需要的时候，按修改时间排序获取即可。
        insertArticle(fileName[0],content,currentTime,currentTime,fileName[1]);
        String filePath = "E:\\download\\";
        File resultFile = new File(filePath + fileName[0] + "." + fileName[1]);
        if(resultFile.exists()){
            resultFile = new File(filePath + fileName[0] + System.currentTimeMillis() + "." + fileName[1]);
        }
        try {
            multipartFile.transferTo(resultFile);
            return "success";
        } catch (IOException e) {
            e.printStackTrace();
        }
        return "error";
    }



    @Override
    public String uploadFileBulks(MultipartFile[] multipartFile) {
        for(MultipartFile file : multipartFile){
            String result = uploadFile(file);
            if(!result.equals("success")){
                System.out.println(result);
                return "upload file bulks fail where title = " + file.getOriginalFilename();
            }
        }
        return "success";
    }

    @Override
    public int insertArticle(String title, String content, String createdate,String lastestDate,String suffix) {
        int result = articleDao.insertArticle(title,content,createdate,lastestDate,suffix);
        return result;
    }

    @Override
    public int updateArticleContentByTitle(String title, String content,Date lastestdate) {
        int result = articleDao.updateArticleContentByTitle(title,content,lastestdate);
        return result;
    }

    /**
     * 判断数据库中是否已经存在该文章
     */
    public boolean isArticleExist(String title){
        List<Article> list = findArticleByTitle(title);
        if(list.size() > 0){
            return true;
        }
        return false;
    }

    /**
     * 从MultipartFile中获取字节流，并转为String类型
     */
    public String getFileContentString(MultipartFile file){
        try {
            InputStream inputStream = file.getInputStream();
            byte bytes[] = new byte[inputStream.available()];
            inputStream.read(bytes);
            return new String(bytes);
        } catch (IOException e) {
            System.out.println("无法从MultipartFile中获取String类型的content");
            e.printStackTrace();
        }
        return "error";
    }
}
