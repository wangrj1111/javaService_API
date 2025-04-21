package top.wang.javaservice.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class javaServiceController {
    @GetMapping("/list")
    //返回一串字符串数组
    public List<String> list(){
        return List.of("java","springboot","vue");
    }
}
