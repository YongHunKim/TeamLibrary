package com.sist.library.controller;

import java.io.File;
import java.util.*;

import javax.annotation.Resource;


import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.sist.library.dao.BookVO;
import com.sist.library.dao.NoticeDAO;
import com.sist.library.dao.NoticeVO;
import com.sist.library.service.NoticeService;
import com.sist.library.service.LoginService;

@Controller
public class NoticeController {
	Logger log = Logger.getLogger(this.getClass());

}
