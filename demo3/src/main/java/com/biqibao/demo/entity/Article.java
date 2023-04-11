package com.biqibao.demo.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

/**
 * <p>
 * 
 * </p>
 *
 * @author
 * @since 2022-12-14
 */
@Data
@TableName("article")
public class Article {


      @TableId(value = "id", type = IdType.AUTO)
    private Integer id;
    private String name;
    private String content;
    private String user;
    private String time;
    private  String summary;
    private  String userid;
    private  Integer typeid;
    private Integer readnumber;
    @TableField(exist = false)//表明数据库中不存在
    private String type;

}
