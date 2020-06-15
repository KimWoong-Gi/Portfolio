package com.woong.biz.comment;

import java.util.Date;

import lombok.Data;

@Data
public class CommentVO {
	private int cseq;
	private int bseq;
	private int mseq;
	private int aseq;
	private String nickname;
	private String content;
	private Date regdate;
}
