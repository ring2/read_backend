package com.lz.read.dao;

import com.lz.read.pojo.Recommend;
import com.lz.read.pojo.vo.RecommendVo;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

public interface RecommendMapper extends Mapper<Recommend> {

    List<RecommendVo> getRankByRecommendNum();
}