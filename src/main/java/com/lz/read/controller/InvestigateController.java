package com.lz.read.controller;

import com.lz.read.common.RestResult;
import com.lz.read.pojo.dto.InvestigateDto;
import com.lz.read.pojo.vo.UserAnswerVo;
import com.lz.read.service.InvestigateService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * @author :     lz
 * @date :       2020/4/16 14:50
 * description:  调查问卷
 **/
@RestController
@RequestMapping("/investigate")
public class InvestigateController {

    @Autowired
    InvestigateService investigateService;
    // 发布调查问卷
    @PostMapping
    public RestResult postInvestigate(@RequestBody InvestigateDto investigateDto) {
       return  investigateService.postInvestigate(investigateDto);
    }

    //查询调查问卷的用户回答情况
    @GetMapping("/situation")
    public RestResult<UserAnswerVo> getSituation(){
        return investigateService.getSituation();
    }
}
