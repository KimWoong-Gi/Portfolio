package com.woong.biz.movie;

import java.util.Date;

import lombok.Data;

@Data
public class VodVO {
	private int vseq;
	private int mseq;
	private String title;
	private String id;
	private String price;
	private String result;
	private Date buydate;
}
