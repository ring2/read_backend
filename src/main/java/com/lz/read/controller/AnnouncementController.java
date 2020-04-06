package com.lz.read.controller;

import com.lz.read.common.RestResult;
import com.lz.read.pojo.Announcement;
import com.lz.read.service.AnnouncementService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * @author :     lz
 * @date :       2020/4/2 08:50
 * description:  公告相关接口
 **/
@RestController
@RequestMapping("/announce")
public class AnnouncementController {

    @Autowired
    AnnouncementService announcementService;

    @GetMapping("/list/{title}/{pageNum}/{pageSize}")
    public RestResult listAnnouncement(@PathVariable String title, @PathVariable int pageNum, @PathVariable int pageSize) {
        return announcementService.listAnnouncement(title, pageNum, pageSize);
    }

    @PutMapping
    public RestResult update(@RequestBody Announcement announcement) {
        return announcementService.updateAnnouncement(announcement);
    }

    @DeleteMapping("/{id}")
    public RestResult del(@PathVariable Integer id) {
        return announcementService.delAnnouncement(id);
    }

    @PostMapping
    public RestResult cre(@RequestBody Announcement announcement) {
        return announcementService.addAnnouncement(announcement);
    }
}
