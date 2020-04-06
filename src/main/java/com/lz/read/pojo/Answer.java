package com.lz.read.pojo;

import javax.persistence.*;
import lombok.Data;

@Data
@Table(name = "answer")
public class Answer {
    /**
     * 回答编号
     */
    @Id
    @Column(name = "id")
    @GeneratedValue(generator = "JDBC")
    private Integer id;

    /**
     * 读者编号
     */
    @Column(name = "ans_readerid")
    private Integer ansReaderid;

    /**
     * 选项编号
     */
    @Column(name = "ans_selectid")
    private Integer ansSelectid;
}