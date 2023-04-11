package com.biqibao.demo.controller;

import cn.hutool.core.io.FileUtil;
import cn.hutool.core.util.IdUtil;
import cn.hutool.core.util.StrUtil;
import cn.hutool.crypto.SecureUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.biqibao.demo.common.Result;
import com.biqibao.demo.entity.Files;
import com.biqibao.demo.mapper.FileMapper;
import com.biqibao.demo.service.FilesService;
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

//文件上传接口   file 前段上传的文件
@RestController
@ResponseBody
@RequestMapping("/file")
public class FileController {
    @Value("${files.upload.path}")
    private String fileUploadPath;
    @Resource
    private FileMapper fileMapper;
    @Autowired
    private FilesService filesService;

    @PostMapping("/upload")
    public String upload(@RequestParam MultipartFile file) throws IOException {


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

        Files dbFiles = getFileByMd5(md5);
        if (dbFiles != null) {
            url = dbFiles.getUrl();
            uploadFile.delete();

        } else {
            url = "http://localhost:9090/file/" + fileUUID;
        }
        //存储数据库
        Files saveFile = new Files();
        saveFile.setName(originalFilename);
        saveFile.setType(type);
        saveFile.setUrl(url);
        saveFile.setMd5(md5);
        saveFile.setSize(size / 1024);
        fileMapper.insert(saveFile);


        return url;
    }

    @GetMapping("/{fileUUID}")
    public void download(@PathVariable String fileUUID, HttpServletResponse response) throws IOException {
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
    private Files getFileByMd5(String md5){
        QueryWrapper<Files> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("md5",md5);
        List<Files> fileList =  fileMapper.selectList(queryWrapper);
        return fileList.size() ==0?null:fileList.get(0);
    }

    //RequestBody表示是从界面传过来的东西  将前台的对象转化为json对象
    //新增或修改
//    public Integer save(@RequestBody User user){
//        return userService.save(user);
//    }
    @PostMapping("/update")
    public Result save(@RequestBody Files files){
        fileMapper.updateById(files);
        return  Result.success();
    }


    @GetMapping
    public List<Files> findAll(){
        return filesService.list();//查找所有数据
    }


    @DeleteMapping("/{id}")
    public boolean delete(@PathVariable Integer id){
        return  filesService.removeById(id);
    }

    //分页查询  --- mybatisplus
    @GetMapping("/page")
    public IPage<Files> findPage(@RequestParam Integer pageNum,
                                @RequestParam Integer pageSize,
                                @RequestParam(defaultValue = "") String name,//避免搜索为空时的报错
                                @RequestParam(defaultValue = "") String type){
        IPage<Files> page = new Page<Files>(pageNum,pageSize);
        QueryWrapper<Files> queryWrapper = new QueryWrapper<Files>();
        if(!"".equals(name)){
            queryWrapper.like("name",name);//框架是直接在中间加了一个and的
        }
        if(!"".equals(type)){
            // queryWrapper.or().like("nickname",nickname);  添加or 但是添加了or的话 会使其它的条件无效 也不是 这样说 就是或者的意思
            queryWrapper.like("type",type);
        }
        return filesService.page(page,queryWrapper);

    }


    //批量删除
    @PostMapping("/del/batch")
    public boolean deleteBatch(@RequestBody List<Integer> ids){
        return filesService.removeByIds(ids);
    }


}

