package com.biqibao.demo.service.impl;

import com.biqibao.demo.entity.Article;
import com.biqibao.demo.mapper.ArticleMapper;
import com.biqibao.demo.service.IArticleService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import  java.util.List;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author
 * @since 2022-12-14
 */
@Service
public class ArticleServiceImpl extends ServiceImpl<ArticleMapper, Article> implements IArticleService {
    @Autowired
    private ArticleMapper articleMapper;
    public List<Article> findUsersArticle(Integer nickname){
        return  articleMapper.findUsersArticleBynickname(nickname);
    }

    public void updateArticleUserNames(){
        articleMapper.updateArticleUserName();
    }

    public void updateReadCount(Integer id){
        articleMapper.updateReadNumber(id);
    }

    public  List<Article> selectRecommandArticleLimitFive(){
     return articleMapper.selectRecommandArticle();
    }

    public  List<Article> selectCollectedArticle(Integer userid)
    {
        return articleMapper.selectCollectionArticle(userid);
    }
}
