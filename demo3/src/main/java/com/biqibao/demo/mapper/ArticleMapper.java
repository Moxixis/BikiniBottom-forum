package com.biqibao.demo.mapper;

import com.biqibao.demo.entity.Article;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import javax.annotation.Resource;
import java.util.List;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author
 * @since 2022-12-14
 */
@Resource
public interface ArticleMapper extends BaseMapper<Article> {


//    @Select("select c.*,u.avatar_url ,u.nickname from t_comment c left join sys_user u on c.user_id = u.id where c.article_id = #{articleId} order by id desc")
//    List<Comment> findCommentDetail(@Param("articleId")  Integer articleId);
    @Select("select a.* from article a left join sys_user u on a.userid = u.id where u.id = #{id}  order by id DESC limit 5 ")
    List<Article> findUsersArticleBynickname(@Param("id") Integer id);


    @Update("UPDATE article a \n" +
            "INNER JOIN sys_user u ON a.userid  = u.id\n" +
            "SET a.user = u.nickname")
     void  updateArticleUserName();

    @Update("update article set readnumber = readnumber + 1 WHERE id = #{id}")
    void updateReadNumber(@Param("id") Integer id);


    @Select("select * from article  order by readnumber desc  LIMIT 5")
    List<Article> selectRecommandArticle();

    @Select("SELECT a.* FROM collection c left join  article a on a.id = c.articleid where a.userid = #{userid}")
    List<Article> selectCollectionArticle(@Param("userid") Integer userid);
}
