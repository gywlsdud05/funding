package com.aia.board2.ex01.entity;

import lombok.Data;

import javax.persistence.*;

@Entity
@Data
@Table(name = "member_table")
public class MemberEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column
    private String username;
    @Column
    private String password;
    @Column
    private String nickname;
    @Column
    private String role;
}
