package com.wxt.news.entity;

import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

import javax.persistence.*;
import java.util.Date;

/**
 * Created by teemoer@cntv.cn on 2016/7/3 0003.
 */
@Entity
@Table(name = "messages")
@DynamicInsert(true)
@DynamicUpdate(true)
public class Messages extends IdEntity {

	private User user;

	private String message;
	private String author;
	private Date postTime;

	// Constructors

	/** default constructor */
	public Messages() {
	}




	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "user_id")
	public User getUser() {
		return this.user;
	}

	public void setUser(User user) {
		this.user = user;
	}



	@Column(name = "message")
	public String getMessage() {
		return this.message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	@Column(name = "author")
	public String getAuthor() {
		return this.author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	@Column(name = "post_time")
	public Date getPostTime() {
		return this.postTime;
	}

	public void setPostTime(Date postTime) {
		this.postTime = postTime;
	}

}