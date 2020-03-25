package com.dooly.bucket.controller;

import java.awt.Window;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.dooly.bucket.domain.BucketVO;
import com.dooly.bucket.service.BucketService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class BucketController {
	
	@Autowired
	BucketService bService;
	
	@RequestMapping(value = "/list",method=RequestMethod.GET)
	public String list(Model model) {
		
//		List<BucketVO> bucList = new ArrayList<BucketVO>();
//		BucketVO buc = BucketVO.builder()
//				.b_seq("1")
//				.b_subject("test")
//				.build();
//		bucList.add(buc);
		List<BucketVO> bucList = bService.selectAll();
		model.addAttribute("BUC_LIST", bucList);
		model.addAttribute("CHANGE", "LIST");
		return "home";
	}
	
	@RequestMapping(value = "/insert",method=RequestMethod.GET)
	public String insert(@ModelAttribute("bucketVO") BucketVO buckVO, Model model) {
	
		model.addAttribute("CHANGE", "INSERT");
		return "home";
	}

	@RequestMapping(value = "/insert",method=RequestMethod.POST)
	public String insert(BucketVO bucketVO) {
		
		log.debug("컴펌 확인"+bucketVO.getB_confirm());
		bService.insert(bucketVO);
		//model.addAttribute("CHANGE", "INSERT");
		
		return "redirect:/";
	}
	
	@RequestMapping(value = "/update",method=RequestMethod.GET)
	public String update(@RequestParam("b_seq") String b_seq, Model model) {
		
		long seq = Long.valueOf(b_seq);
		BucketVO bVO = bService.findBySeq(seq);
		model.addAttribute("bucketVO", bVO);
		model.addAttribute("CHANGE", "UPDATE");
		
		return "insert";
	}
	
	
	@RequestMapping(value = "/update",method=RequestMethod.POST)
	public String update(BucketVO bucketVO, Model model) {
		
		log.debug("컴펌 확인"+bucketVO.getB_confirm());		
		bService.update(bucketVO);
		return "redirect:/list";
	}
	
	@RequestMapping(value = "/delete",method=RequestMethod.GET)
	public String delete(@RequestParam("b_seq") String b_seq, Model model) {
		
		long seq = Long.valueOf(b_seq);
		bService.delete(seq);
		
		return "redirect:/list";
	}
	
	
	
	
}
