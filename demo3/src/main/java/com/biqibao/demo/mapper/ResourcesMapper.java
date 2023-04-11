package com.biqibao.demo.mapper;

import com.biqibao.demo.entity.Resources;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import  java.util.List;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author
 * @since 2022-12-27
 */
public interface ResourcesMapper extends BaseMapper<Resources> {

    @Select("SELECT * FROM resources   order by id desc limit 7")
    List<Resources> NerResourcesOfHome();

    @Update("update resources set downloadnumber = downloadnumber + 1 WHERE id = #{id}")
    void updateDownloadNumber(@Param("id") Integer id);

    @Select("select * from resources  order by downloadnumber desc  LIMIT 5")
    List<Resources> selectRecommandResources();
}
