package com.dooly.bucket.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.dooly.bucket.domain.BucketVO;
import com.dooly.bucket.repository.BucketDao;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class BucketService {
	
//	@Autowired
//	SqlSession sqlSession;	
	
//	@Autowired
//	public void getMapper() {
//		bDao = sqlSession.getMapper(BucketDao.class);
//	}
	
	private final BucketDao bDao;


	public List<BucketVO> selectAll() {
		
		return bDao.selectAll();
	}


	public int insert(BucketVO buckVO) {
			
		int ret = bDao.insert(buckVO);
		return ret;
	}


	public int update(BucketVO buckVO) {
		int ret = bDao.update(buckVO);
		return ret;
		
	}


	public BucketVO findBySeq(long b_seq) {
		 
		return bDao.findBySeq(b_seq);
	}


	public int delete(long b_seq) {
		
		 
		return  bDao.delete(b_seq);
	}
	
	
	
	
}
