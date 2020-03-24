package com.dooly.bucket.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
@Builder

public class BucketVO {
	private long b_seq;
	private String b_subject;
	private String b_content;
	private String b_date;
	private String b_confirm;
}
