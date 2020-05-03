package com.lz.read.dao;

import com.lz.read.pojo.Recommend;
import com.lz.read.pojo.po.RecommendBook;
import com.lz.read.pojo.vo.RecommendVo;
import com.lz.read.pojo.vo.ReviewedVO;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

public interface RecommendMapper extends Mapper<Recommend> {

    List<RecommendVo> getRankByRecommendNum();

    List<ReviewedVO> getReviewed();

    List<ReviewedVO> getReviewedBooks(Integer expertId);

    List<RecommendBook> getBookTypeIds();

    Integer getFinallyResult(List<Integer> expertIds);
}