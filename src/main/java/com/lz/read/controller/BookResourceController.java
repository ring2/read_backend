package com.lz.read.controller;

import com.lz.read.common.RestResult;
import com.lz.read.pojo.Bookresource;
import com.lz.read.service.BookresourceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * @author :     lz
 * @date :       2020/4/2 08:50
 * description:  图书资源相关接口
 **/
@RestController
@RequestMapping("/bookResource")
public class BookResourceController {

    @Autowired
    BookresourceService bookresourceService;

    @GetMapping("/list_source/{isCharge}")
    public RestResult getBookResource(@PathVariable Byte isCharge) {
        return bookresourceService.listBookResource(isCharge);
    }

    @PutMapping
    public RestResult update(Bookresource bookresource) {
        return bookresourceService.updateBookResource(bookresource);
    }

    @DeleteMapping
    public RestResult del(Integer id) {
        return bookresourceService.delBookResource(id);
    }

    @PostMapping()
    public RestResult cre(Bookresource bookresource) {
        return bookresourceService.addBookResource(bookresource);
    }
}
