package com.lz.read.controller;

import com.lz.read.common.RestResult;
import com.lz.read.pojo.Book;
import com.lz.read.pojo.Booktype;
import com.lz.read.service.BookService;
import com.lz.read.service.BooktypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * @author :     lz
 * @date :       2020/4/2 08:50
 * description:   图书相关接口
 **/
@RestController
@RequestMapping("/book")
public class BookController {

    @Autowired
    BookService bookService;

    @Autowired
    BooktypeService booktypeService;

    @GetMapping("/list_no_type")
    public RestResult getNoTypeBook(int pageNum, int pageSize) {
        return bookService.getNoTypeBookList(pageNum, pageSize);
    }

    @PostMapping("/book_type")
    public RestResult addBookType(@RequestBody Booktype booktype) {
        return booktypeService.addBookType(booktype);
    }

    @GetMapping("/book_type/{pageNum}/{pageSize}")
    public RestResult getAllBookType(@PathVariable int pageNum, @PathVariable int pageSize) {
        return booktypeService.selAllBookType(pageNum, pageSize);
    }

    @GetMapping("/book_type")
    public RestResult getAllBookType1() {
        return booktypeService.selAllBookType1();
    }

    @DeleteMapping("/book_type/{id}")
    public RestResult delBookType(@PathVariable int id) {
        return booktypeService.delBookType(id);
    }

    @PutMapping("/book_type")
    public RestResult updateBookType(@RequestBody Booktype booktype) {
        return booktypeService.updateBookType(booktype);
    }

    @GetMapping("/list/{bookname}/{pageNum}/{pageSize}")
    public RestResult getBookList(@PathVariable String bookname, @PathVariable int pageNum, @PathVariable int pageSize) {
        return bookService.selBookList(bookname, pageNum, pageSize);
    }

    @PutMapping
    public RestResult update(@RequestBody Book book) {
        return bookService.updateBook(book);
    }

    @DeleteMapping("/{id}")
    public RestResult del(@PathVariable Integer id) {
        return bookService.deleteBook(id);
    }

    @PutMapping("/book_shelves/{id}/{type}")
    public RestResult cre(@PathVariable Integer id, @PathVariable Integer type) {
        return bookService.bookShelves(id, type);
    }

    @GetMapping("/book_type/{typeId}/{pageNum}/{pageSize}")
    public RestResult getBooksByType(@PathVariable Integer typeId, @PathVariable int pageNum, @PathVariable int pageSize) {
        return bookService.getBooksByType(typeId, pageNum, pageSize);
    }
}
