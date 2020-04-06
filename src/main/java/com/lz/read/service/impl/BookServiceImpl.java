package com.lz.read.service.impl;

import cn.hutool.core.util.ObjectUtil;
import cn.hutool.core.util.StrUtil;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.lz.read.common.RestResult;
import com.lz.read.pojo.Book;
import com.lz.read.pojo.Recommend;
import com.lz.read.pojo.vo.BookVo;
import com.lz.read.service.RecommendService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

import com.lz.read.dao.BookMapper;
import com.lz.read.service.BookService;
import org.springframework.transaction.annotation.Transactional;
import tk.mybatis.mapper.entity.Example;

import java.util.List;

/**
 * @author :     lz
 * @date :       2020/4/1 23:55
 * description:
 **/

@Service
@Transactional(rollbackFor = Exception.class)
public class BookServiceImpl implements BookService {

    @Resource
    private BookMapper bookMapper;

    @Autowired
    private RecommendService recommendService;

    @Override
    public RestResult updateBook(Book book) {
        if (ObjectUtil.isNotEmpty(book)) {
            int i = bookMapper.updateByPrimaryKeySelective(book);
            if (i > 0)
                return RestResult.success();
            else
                return RestResult.failure("更新书籍信息失败");
        }
        return RestResult.failureOfParam();
    }

    @Override
    public RestResult selBookList(String bookname, int pageNum, int pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        PageInfo pageInfo = null;
        bookname = bookname.trim();
        if (StrUtil.isNotEmpty(bookname)) {
            List<BookVo> books = bookMapper.selBookWithBookType(bookname);
            pageInfo = new PageInfo(books);
            return RestResult.success(pageInfo);
        }
        List<BookVo> books = bookMapper.selBookWithBookType(bookname);
        pageInfo = new PageInfo(books);
        return RestResult.success(pageInfo);
    }

    @Override
    public RestResult deleteBook(Integer bookId) {
        if (ObjectUtil.isNotEmpty(bookId)) {
            int i = bookMapper.deleteByPrimaryKey(bookId);
            if (i > 0)
                return RestResult.success();
            else
                return RestResult.failure("删除书籍失败");
        }
        return RestResult.failureOfParam();
    }

    @Override
    public RestResult bookShelves(Integer recommendId, Integer type) {
        // type == 0 上架  type == 1 下架
        Recommend recommend = recommendService.selRecommendById(recommendId);
        if (ObjectUtil.isNotEmpty(recommend)) {
            Book book = new Book();
            book.setId(recommend.getReBookid());
            if (type.equals(0))
                book.setBookShelves(1);
            else
                book.setBookShelves(0);
            int i = bookMapper.updateByPrimaryKeySelective(book);
            if (i > 0)
                return RestResult.success();
            else
                return RestResult.failure("推荐书籍上架失败");
        }
        return RestResult.failureOfParam();
    }

    @Override
    public RestResult getNoTypeBookList(int pageNum, int pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        Example example = new Example(Book.class);
        example.createCriteria().andIsNull("bookTypeId");
        PageInfo pageInfo = new PageInfo(bookMapper.selectByExample(example));
        return RestResult.success(pageInfo);
    }

    @Override
    public RestResult getBooksByType(Integer bookTypeId, int pageNum, int pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        Example example = new Example(Book.class);
        example.createCriteria().andEqualTo("bookTypeId", bookTypeId);
        PageInfo pageInfo = new PageInfo(bookMapper.selectByExample(example));
        return RestResult.success(pageInfo);
    }
}
