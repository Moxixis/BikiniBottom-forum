package com.biqibao.demo.exception;

import com.biqibao.demo.common.Result;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

@ControllerAdvice
public class GlobalExceptionHandler {
    @ExceptionHandler(ServiceExcepetion.class)
    @ResponseBody
    public Result handle(ServiceExcepetion se){
        return Result.error(se.getCode(),se.getMessage());
    }
}
