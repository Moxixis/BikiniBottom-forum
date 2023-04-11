package com.biqibao.demo.service.impl;

import com.biqibao.demo.entity.Collection;
import com.biqibao.demo.mapper.CollectionMapper;
import com.biqibao.demo.service.ICollectionService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import  java.util.List;
/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author
 * @since 2022-12-26
 */
@Service
public class CollectionServiceImpl extends ServiceImpl<CollectionMapper, Collection> implements ICollectionService {
    @Resource
    private CollectionMapper collectionMapper;
   public  List<Collection> getCollectInformationByuserid(Integer userid){
     return  collectionMapper.getCollectInformationByUserid(userid);
   }

    public  List<Integer> getArticleIdByuserid(Integer userid){
        return  collectionMapper.getarticleIdonByUserid(userid);
    }

    public void removeByUseridAndArticleId(Integer articleId,Integer userId){
       collectionMapper.removeByUseridAndArticleId(articleId,userId);
    }
}
