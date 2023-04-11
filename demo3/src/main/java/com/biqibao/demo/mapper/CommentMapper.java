package com.biqibao.demo.mapper;

import com.biqibao.demo.entity.Comment;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import  java.util.List;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author
 * @since 2022-12-18
 */
public interface CommentMapper extends BaseMapper<Comment> {

    @Select("select c.*,u.avatar_url ,u.nickname from t_comment c left join sys_user u on c.user_id = u.id where c.article_id = #{articleId} order by id desc")
    List<Comment> findCommentDetail(@Param("articleId")  Integer articleId);

}
