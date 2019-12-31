package com.buba.hospital_back.bean;

/**
 * @ClassName SecHospitalArticleVo
 * @Description TODO
 * @Created by Administrator on 2019/12/13 15:40
 * @Version 1.0
 **/
public class SecHospitalArticleVo {

    //主键
    private Integer id;
    //文章标题
    private String articleTitle;
    //文章类型
    private String articleType;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getArticleTitle() {
        return articleTitle;
    }

    public void setArticleTitle(String articleTitle) {
        this.articleTitle = articleTitle;
    }

    public String getArticleType() {
        return articleType;
    }

    public void setArticleType(String articleType) {
        this.articleType = articleType;
    }

    @Override
    public String toString() {
        return "SecHospitalArticleVo{" +
                "id=" + id +
                ", articleTitle='" + articleTitle + '\'' +
                ", articleType='" + articleType + '\'' +
                '}';
    }
}
