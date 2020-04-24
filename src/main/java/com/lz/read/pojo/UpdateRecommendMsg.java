package com.lz.read.pojo;

import javax.persistence.*;
import lombok.Data;

@Data
@Table(name = "update_recommend_msg")
public class UpdateRecommendMsg {
    @Id
    @Column(name = "id")
    @GeneratedValue(generator = "JDBC")
    private Integer id;

    /**
     * 书籍id
     */
    @Column(name = "book_id")
    private Integer bookId;

    /**
     * 结果
     */
    @Column(name = "`result`")
    private Boolean result;

    /**
     * 意见
     */
    @Column(name = "opinion")
    private String opinion;

    /**
     * 是否已经阅读过，0：false 1:true
     */
    @Column(name = "is_read")
    private Boolean isRead;
}