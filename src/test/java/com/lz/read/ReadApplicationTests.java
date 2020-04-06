package com.lz.read;

import com.lz.read.common.ReadBootApplication;
import com.lz.read.pojo.Administrator;
import com.lz.read.service.AdministratorService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import javax.annotation.Resource;

@RunWith(SpringRunner.class)
@SpringBootTest(classes = {ReadApplication.class})
public class ReadApplicationTests {

    @Autowired
    AdministratorService administratorService;
    @Test
    public void contextLoads() {
        Administrator zs = administratorService.selectAdminByNameAndPwd("zs", "123456");
        System.out.println(zs);
    }

}
