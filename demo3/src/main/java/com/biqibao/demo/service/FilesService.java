package com.biqibao.demo.service;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.biqibao.demo.entity.Files;
import com.biqibao.demo.mapper.FileMapper;
import org.springframework.stereotype.Service;

@Service
public class FilesService extends ServiceImpl<FileMapper, Files> {
}
