package com.wxt.news.entity;

import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import java.sql.Timestamp;

/**
 * Created by teemoer@cntv.cn on 2016/7/3 0003.
 */
@Entity
@Table(name = "news")
@DynamicInsert(true)
@DynamicUpdate(true)
public class News extends IdEntity {

	// Fields

	private String title;
	private String author;
	private String content;
	private String keyWords;
	private Timestamp submitDate;
	private String picture;
	private String video;


	// Constructors

	/** default constructor */
	public News() {
	}





	@Column(name = "title", nullable = false, length = 100)
	public String getTitle() {
		return this.title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	@Column(name = "author", nullable = false, length = 80)
	public String getAuthor() {
		return this.author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	@Column(name = "content", nullable = false, length = 65535)
	public String getContent() {
		return this.content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	@Column(name = "key_words", nullable = false, length = 100)
	public String getKeyWords() {
		return this.keyWords;
	}

	public void setKeyWords(String keyWords) {
		this.keyWords = keyWords;
	}

	@Column(name = "submit_date", nullable = false, length = 19)
	public Timestamp getSubmitDate() {
		return this.submitDate;
	}

	public void setSubmitDate(Timestamp submitDate) {
		this.submitDate = submitDate;
	}

	@Column(name = "picture", length = 100)
	public String getPicture() {
		return this.picture;
	}

	public void setPicture(String picture) {
		this.picture = picture;
	}

	@Column(name = "video", length = 100)
	public String getVideo() {
		return this.video;
	}

	public void setVideo(String video) {
		this.video = video;
	}


}