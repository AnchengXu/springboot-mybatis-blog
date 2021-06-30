package top.anchengxu.model;

import java.util.Date;

public class Article {
    private Integer id;
    private String title;
    private String content;
    private String createdate;
    private String lastestdate;
    private String suffix;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getCreatedate() {
        return createdate;
    }

    public void setCreatedate(String createdate) {
        this.createdate = createdate;
    }

    public String getLastestdate() {
        return lastestdate;
    }

    public void setLastestdate(String lastestdate) {
        this.lastestdate = lastestdate;
    }

    public String getSuffix() {
        return suffix;
    }

    public void setSuffix(String suffix) {
        this.suffix = suffix;
    }
}
