package com.lz.read.service.impl;

import cn.hutool.core.util.ObjectUtil;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.lz.read.common.RestResult;
import com.lz.read.dao.RecommendMapper;
import com.lz.read.dao.UpdateRecommendMsgMapper;
import com.lz.read.pojo.Recommend;
import com.lz.read.pojo.UpdateRecommendMsg;
import com.lz.read.pojo.vo.ReviewedVO;
import com.lz.read.service.RecommendService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import tk.mybatis.mapper.entity.Example;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * @author :     lz
 * @date :       2020/4/1 23:55
 * description:
 **/

@Service
@Transactional(rollbackFor = Exception.class)
public class RecommendServiceImpl implements RecommendService {

    @Resource
    private RecommendMapper recommendMapper;

    @Resource
    private UpdateRecommendMsgMapper updateRecommendMsgMapper;


    @Override
    public RestResult getRecommendBook(Byte status, Integer expertId, int pageNum, int pageSize) {
        if (ObjectUtil.isNotEmpty(status)) {
            PageHelper.startPage(pageNum, pageSize);
            List<ReviewedVO> reviewed = recommendMapper.getReviewed(expertId);
            PageInfo pageInfo = new PageInfo(reviewed);
            return RestResult.success(pageInfo);
        }
        return RestResult.failureOfParam();
    }

    @Override
    public RestResult updateRecommend(Recommend recommend) {
        UpdateRecommendMsg updateRecommendMsg = new UpdateRecommendMsg();

        if (ObjectUtil.isNotEmpty(recommend)) {
            int i = recommendMapper.updateByPrimaryKeySelective(recommend);
            if (i > 0) {
                 updateRecommendMsg = updateRecommendMsgMapper.selSomethingInsertToUpdateRecommendMsg(recommend);
                Byte reResult = recommend.getReResult();
                updateRecommendMsg.setResult(recommend.getReResult() == 1);
                updateRecommendMsg.setIsRead(false);
                updateRecommendMsgMapper.insert(updateRecommendMsg);
                return RestResult.success();
            } else {
                return RestResult.failure("更新推荐书籍失败");
            }
        }
        return RestResult.failureOfParam();
    }

    @Override
    public Recommend selRecommendById(Integer id) {
        return recommendMapper.selectByPrimaryKey(id);
    }

    @Override
    public RestResult del(Integer id) {
        recommendMapper.deleteByPrimaryKey(id);
        return RestResult.success();
    }

    @Override
    public RestResult getReviewedBooks(Integer expertId) {
        List<ReviewedVO> noPassBooks = new ArrayList<>();
        List<ReviewedVO> passBooks = new ArrayList<>();
        List<ReviewedVO> reviewedBooks = recommendMapper.getReviewedBooks(expertId);
        noPassBooks = reviewedBooks.stream().filter(book ->
                book.getReResult() == 0
        ).collect(Collectors.toList());
        passBooks = reviewedBooks.stream().filter(book ->
                book.getReResult() == 1
        ).collect(Collectors.toList());
        Map<String,List> data = new HashMap<>();
        data.put("noPassBooks",noPassBooks);
        data.put("passBooks",passBooks);
        return RestResult.success(data);
    }
}
