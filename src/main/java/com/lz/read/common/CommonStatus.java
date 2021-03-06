package com.lz.read.common;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

/**
 * @author :  lz
 * @date :   2020/4/2 12:58
 **/
@Getter
@NoArgsConstructor
@AllArgsConstructor
public enum CommonStatus {
    SUCCESS("操作成功", 200),
    FAILURE("操作失败",400),
    REPEAT_NAME("用户名重复",401),
    FAILED_AUTHORITY("权限不足",300),
    FAILED_NOT_LOGIN("暂未登录",402),
    FAILED_BAD_PARAM("参数无效",403),
    FAILED_PASSWORD("密码错误",303),
    FAILED_FOUND_NAME("未查询到此用户",304),
    FAILED_CAPTCHA("验证码错误",405);

    private String message;
    private Integer statusCode;

}
