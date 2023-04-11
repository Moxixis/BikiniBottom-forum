package com.biqibao.demo.service.impl;

import com.biqibao.demo.entity.Resources;
import com.biqibao.demo.mapper.ResourcesMapper;
import com.biqibao.demo.service.IResourcesService;
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
 * @since 2022-12-27
 */
@Service
public class ResourcesServiceImpl extends ServiceImpl<ResourcesMapper, Resources> implements IResourcesService {
    @Resource
    private ResourcesMapper resourcesMapper;
//    首页最新资源
    public List<Resources> newResourcesOfhome(){
       return resourcesMapper.NerResourcesOfHome();
    }
//    更新下载次数
    public void upadateDownloadNumber(Integer id){
        resourcesMapper.updateDownloadNumber(id);
    }
//    获取推荐文章列表
    public List<Resources> getRecommandResours(){
      return  resourcesMapper.selectRecommandResources();
    }
}
