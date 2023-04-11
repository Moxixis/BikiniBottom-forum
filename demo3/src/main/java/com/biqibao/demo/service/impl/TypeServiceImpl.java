package com.biqibao.demo.service.impl;

import com.biqibao.demo.entity.Article;
import com.biqibao.demo.entity.Type;
import com.biqibao.demo.mapper.TypeMapper;
import com.biqibao.demo.service.ITypeService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author
 * @since 2022-12-24
 */
@Service
public class TypeServiceImpl extends ServiceImpl<TypeMapper, Type> implements ITypeService {
    @Resource
    private TypeMapper typeMapper;
    public List<Article> FindALLInfor(String name)
    {
        return typeMapper.findALLInforOfArticleByTypeName(name);
    }

    public List<Article> FindLimitNumberArticle(Integer id)
    {
        return typeMapper.findALLInforOfArticleByTypeNameLimit(id);
    }
}
