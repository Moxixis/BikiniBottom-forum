package com.biqibao.demo.mapper;

import com.biqibao.demo.entity.Type;
import com.biqibao.demo.entity.Article;
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
 * @since 2022-12-24
 */
public interface TypeMapper extends BaseMapper<Type> {
        @Select("select a.*  from article a left join type t on t.id = a.typeid where t.name = #{name}")
         List<Article> findALLInforOfArticleByTypeName(@Param("name")  String name);

         @Select("select a.*  from article a left join type t on t.id = a.typeid where t.id = #{id} limit 3")
         List<Article> findALLInforOfArticleByTypeNameLimit(@Param("id")  Integer id);
}
