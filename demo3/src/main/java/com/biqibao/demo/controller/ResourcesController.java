package com.biqibao.demo.controller;


import cn.hutool.core.date.DateUtil;
import cn.hutool.core.io.FileUtil;
import cn.hutool.core.util.IdUtil;
import cn.hutool.core.util.StrUtil;
import cn.hutool.crypto.SecureUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.biqibao.demo.common.Result;
import com.biqibao.demo.entity.Resources;
import com.biqibao.demo.mapper.FileMapper;
import com.biqibao.demo.mapper.ResourcesMapper;
import com.biqibao.demo.service.FilesService;
import com.biqibao.demo.service.impl.ResourcesServiceImpl;
import com.biqibao.demo.utils.TokenUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.*;

import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.List;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author
 * @since 2022-12-27
 */
@RestController
@RequestMapping("/resources")
public class ResourcesController {
    @Value("${files.upload.path}")
    private String fileUploadPath;
    @Resource
    private FileMapper fileMapper;
    @Resource
    private ResourcesMapper resourcesMapper;
    @Autowired
    private FilesService filesService;
    @Autowired
    private ResourcesServiceImpl resourcesService;

    @PostMapping("/upload")
    public String upload(@RequestParam MultipartFile file,@RequestParam(value="userid")  Integer userid,@RequestParam(value="filename")  String filename,@RequestParam(value="brief")  String  brief) throws IOException {
        String originalFilename = file.getOriginalFilename();
        String type = FileUtil.extName(originalFilename);
        String uuid = IdUtil.fastSimpleUUID();
        long size = file.getSize();
        String fileUUID = uuid + StrUtil.DOT + type;


        File uploadFile = new File(fileUploadPath + fileUUID);
        File parentFile = uploadFile.getParentFile();
        if (!parentFile.exists()) {
            parentFile.mkdirs();
        }


        String url;

        file.transferTo(uploadFile);

        String md5 = SecureUtil.md5(uploadFile);

        Resources dbResources = getFileByMd5(md5);

        if (dbResources != null) {
            url = dbResources.getUrl();
            uploadFile.delete();

        } else {
            url = "http://localhost:9090/file/" + fileUUID;
        }
        //存储数据库
        Resources saveFile = new Resources();
        saveFile.setName(originalFilename);
        saveFile.setType(type);
        saveFile.setUrl(url);
        saveFile.setMd5(md5);
        saveFile.setSize(size / 1024);
        saveFile.setUserid(userid);
        saveFile.setBrief(brief);
        saveFile.setName(filename);
        saveFile.setDownloadnumber(0);
        saveFile.setTime(DateUtil.now());

        resourcesMapper.insert(saveFile);


        return url;
    }
    @GetMapping("/{fileUUID}")
    public void download(@PathVariable String fileUUID,HttpServletResponse response) throws IOException {
        File uploadFile = new File(fileUploadPath+fileUUID);
        ServletOutputStream os = response.getOutputStream();
        response.addHeader("Content-Disposition","attachment;filename="+ URLEncoder.encode(fileUUID,"UTF-8"));
        response.setContentType("application/octet-stream");

        os.write(FileUtil.readBytes(uploadFile));
        os.flush();
        os.close();

    }

    /**
     * 通过文件的md5来查取文件
     * @param md5
     * @return
     */
    //通过md5查询文件
    private Resources getFileByMd5(String md5){
        QueryWrapper<Resources> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("md5",md5);
        List<Resources> fileList =  resourcesMapper.selectList(queryWrapper);
        return fileList.size() ==0?null:fileList.get(0);
    }


    @PostMapping("/update")
    public Result save(@RequestBody Resources files){
        resourcesMapper.updateById(files);
        return  Result.success();
    }


    @GetMapping
    public List<Resources> findAll(){
        return resourcesService.list();//查找所有数据
    }


    @DeleteMapping("/{id}")
    public boolean delete(@PathVariable Integer id){
        return  resourcesService.removeById(id);
    }

    //分页查询  --- mybatisplus
    @GetMapping("/page")
    public IPage<Resources> findPage(@RequestParam Integer pageNum,
                                 @RequestParam Integer pageSize,
                                 @RequestParam(defaultValue = "") String name,//避免搜索为空时的报错
                                 @RequestParam(defaultValue = "") String type){
        IPage<Resources> page = new Page<Resources>(pageNum,pageSize);
        QueryWrapper<Resources> queryWrapper = new QueryWrapper<Resources>();
        if(!"".equals(name)){
            queryWrapper.like("name",name);//框架是直接在中间加了一个and的
        }
        if(!"".equals(type)){
            // queryWrapper.or().like("nickname",nickname);  添加or 但是添加了or的话 会使其它的条件无效 也不是 这样说 就是或者的意思
            queryWrapper.like("type",type);
        }
        System.out.println("SAdsadsasssssss---------------------------------------------------------");
        return resourcesService.page(page,queryWrapper);
    }


    //批量删除
    @PostMapping("/del/batch")
    public boolean deleteBatch(@RequestBody List<Integer> ids){
        return resourcesService.removeByIds(ids);
    }

    //首页推荐资源
    @GetMapping("/newResourcsfHome")
    public Result findNewArticleInHome()
    {
        return Result.success(resourcesService.newResourcesOfhome());
    }
    //更新文章下载次数
    @GetMapping("/upadata/{id}")
    public void updataDownLoad(@PathVariable Integer id )
    {
        resourcesService.upadateDownloadNumber(id);
    }
    //根据下载次数获取推荐资源
        @GetMapping("/getRecommandResouces")
    public Result  getRecommandResouces(){
        return Result.success(resourcesService.getRecommandResours());
        }
//根据用户id查看其上传的资源
    @GetMapping("/ResourcesOfUserPage")
    public IPage<Resources> findUserResourcesPage(@RequestParam Integer pageNum,
                                     @RequestParam Integer pageSize,
                                     @RequestParam(defaultValue = "") String name,//避免搜索为空时的报错
                                     @RequestParam(defaultValue = "") String type,
                                     @RequestParam Integer userid){
        IPage<Resources> page = new Page<Resources>(pageNum,pageSize);
        QueryWrapper<Resources> queryWrapper = new QueryWrapper<Resources>();
        if(!"".equals(name)){
            queryWrapper.like("name",name);//框架是直接在中间加了一个and的
        }
        if(!"".equals(userid)){
            queryWrapper.eq("userid",userid);//框架是直接在中间加了一个and的
        }
        if(!"".equals(type)){
            // queryWrapper.or().like("nickname",nickname);  添加or 但是添加了or的话 会使其它的条件无效 也不是 这样说 就是或者的意思
            queryWrapper.like("type",type);
        }
        return resourcesService.page(page,queryWrapper);

    }

}

