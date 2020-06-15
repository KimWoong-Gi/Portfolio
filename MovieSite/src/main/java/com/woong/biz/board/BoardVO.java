package com.woong.biz.board;

import java.util.Date;

import lombok.Data;

@Data
public class BoardVO {
	private int bseq;
	private String title;
	private String nickname;
	private String content;
	private Date regdate;
	private String category;
	private String image;
}
