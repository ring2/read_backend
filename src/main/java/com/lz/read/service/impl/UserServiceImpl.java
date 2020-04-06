package com.lz.read.service.impl;

import cn.hutool.core.util.ObjectUtil;
import cn.hutool.core.util.StrUtil;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.lz.read.common.RestResult;
import com.lz.read.config.UserType;
import com.lz.read.pojo.User;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

import com.lz.read.dao.UserMapper;
import com.lz.read.service.UserService;
import org.springframework.transaction.annotation.Transactional;
import tk.mybatis.mapper.entity.Example;

import java.util.List;
import java.util.Map;

/**
 * @author :     lz
 * @date :       2020/4/1 23:55
 * description:
 **/

@Service
@Transactional(rollbackFor = Exception.class)
public class UserServiceImpl implements UserService {

    @Resource
    private UserMapper userMapper;


    @Override
    public RestResult listUser(String username, int pageNum, int pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        username = username.trim();
        Example example = new Example(User.class);
        if (StrUtil.isNotEmpty(username)) {
            example.createCriteria().andLike("username", "%" + username + "%").andEqualTo("del", "0");
        }else {
            example.createCriteria().andEqualTo("del", "0");
        }
        List<User> users = userMapper.selectByExample(example);
        PageInfo pageInfo = new PageInfo(users);
         return RestResult.success(pageInfo);
    }

    @Override
    public RestResult updateUser(User user) {
        if (ObjectUtil.isNotEmpty(user)) {
            int i = userMapper.updateByPrimaryKeySelective(user);
            if (i > 0)
                return RestResult.success();
            else
                return RestResult.failure("更新用户信息失败");
        }
        return RestResult.failureOfParam();
    }

    @Override
    public RestResult delUser(Integer id) {
        User user = userMapper.selectByPrimaryKey(id);
        user.setDel("1");
        if (ObjectUtil.isNotEmpty(id)) {
            int i = userMapper.updateByPrimaryKeySelective(user);
            if (i > 0)
                return RestResult.success();
            else
                return RestResult.failure("删除用户失败");
        }
        return RestResult.failureOfParam();
    }

    @Override
    public RestResult addUser(User user) {
        if (ObjectUtil.isNotEmpty(user)) {
            int i = userMapper.insertSelective(user);
            if (i > 0)
                return RestResult.success();
            else
                return RestResult.failure("添加用户失败");
        }
        return RestResult.failureOfParam();
    }
}
