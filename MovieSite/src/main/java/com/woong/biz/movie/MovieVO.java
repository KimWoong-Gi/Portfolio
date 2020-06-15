package com.woong.biz.movie;

import lombok.Data;

@Data
public class MovieVO {
	private int mseq;
	private String title;
	private String director;
	private String release;
	private String runtime;
	private String content;
	private String image;
	private String trailer;
	private String price;
	private String genre;
}
