package com.lz.read.controller;

import com.lz.read.common.RestResult;
import com.lz.read.pojo.Booktoken;
import com.lz.read.service.BooktokenService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * @author :     lz
 * @date :       2020/4/2 08:51
 * description:  书卷相关接口
 **/
@RestController
@RequestMapping("/bookToken")
public class BookTokenController {

    @Autowired
    BooktokenService booktokenService;

    @GetMapping("/list")
    public RestResult get(String tokenName, int pageNum, int pageSize) {
        return booktokenService.listBookToken(tokenName, pageNum, pageSize);
    }

    @PutMapping()
    public RestResult update(Booktoken booktoken) {
        return booktokenService.updateBookToken(booktoken);
    }

    @DeleteMapping()
    public RestResult del(Integer id) {
        return booktokenService.delBookToken(id);
    }

    @PostMapping()
    public RestResult cre(Booktoken booktoken) {
        return booktokenService.addBookToken(booktoken);
    }
}
