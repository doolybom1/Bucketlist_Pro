package com.dooly.bucket.repository;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Select;

import com.dooly.bucket.domain.BucketVO;

public interface BucketDao {
	
	@Select("SELECT * FROM tbl_bucket")
	public List<BucketVO> selectAll();

	@Select("SELECT * FROM tbl_bucket WHERE b_seq = #{b_seq}")
	public BucketVO findBySeq(long b_seq);
	
	public int insert(BucketVO bucketVO);
	public int update(BucketVO bucketVO);
	
	@Delete("DELETE FROM tbl_bucket WHERE b_seq = #{b_seq}")
	public int delete(long b_seq);
}
	
