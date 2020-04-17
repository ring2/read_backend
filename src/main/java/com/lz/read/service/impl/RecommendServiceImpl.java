package com.lz.read.service.impl;

import cn.hutool.core.util.ObjectUtil;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.lz.read.common.RestResult;
import com.lz.read.dao.RecommendMapper;
import com.lz.read.pojo.Recommend;
import com.lz.read.service.RecommendService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import tk.mybatis.mapper.entity.Example;

import javax.annotation.Resource;
import java.util.List;

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

    @Override
    public RestResult getRecommendBook(Byte status,int pageNum,int pageSize) {
        if (ObjectUtil.isNotEmpty(status)) {
            Example example = new Example(Recommend.class);
            example.createCriteria().andEqualTo("reStatus", status);
            PageHelper.startPage(pageNum,pageSize);
            List<Recommend> recommends = recommendMapper.selectByExample(example);
            PageInfo pageInfo = new PageInfo(recommends);
            return RestResult.success(pageInfo);

        }
        return RestResult.failureOfParam();
    }



    @Override
    public RestResult updateRecommend(Recommend recommend) {
        if (ObjectUtil.isNotEmpty(recommend)) {
            int i = recommendMapper.updateByPrimaryKeySelective(recommend);
            if (i > 0)
                return RestResult.success();
            else
                return RestResult.failure("更新推荐书籍失败");
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
}
