package com.luna.board;

import java.util.List;
import java.util.Locale;

import org.mybatis.logging.LoggerFactory;
import org.slf4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
@RequestMapping("/admin/*")
public class AdminController {
	
	private static final Logger logger = (Logger) LoggerFactory.getLogger(AdminController.class.getName());
	
	@RequestMapping(value = "/index.do", method = {RequestMethod.GET,RequestMethod.POST})
	public void getIndex() throws Exception {
		logger.info("get index");
	}
	
	// 상품 등록
	@RequestMapping(value = "/test", method = RequestMethod.GET)
	public void getGoodsRegister() throws Exception {
	 logger.info("get goods register");
	}
	
}
