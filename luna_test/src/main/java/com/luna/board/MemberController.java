package com.luna.board;

import java.sql.Timestamp;
import java.util.List;
import java.util.Locale;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.luna.board.PCategoryController.AdminController;
import com.luna.board.dtos.MemberDTO;
import com.luna.board.dtos.PBoardDTO;
import com.luna.board.service.IMemberService;

@Controller
public class MemberController {
	
	@Autowired
	private IMemberService MemberService;
	
	 @Autowired
	 private JavaMailSender mailSender;
	
	 private static final Logger logger = LoggerFactory.getLogger(PboardController.class);

	@RequestMapping(value = "/member.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String member(Locale locale, Model model) {
		List<MemberDTO> list = MemberService.getAllList();
		model.addAttribute("list", list);
		return "memberlist";
	}
	
	@RequestMapping(value = "/insertmemberform.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String insertmember(Locale locale, Model model) {
		return "memberinsertform";
	}
	
	@RequestMapping(value = "/insertmember.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String insert(Locale locale, Model model, MemberDTO dto,String birthtest) {
		System.out.println("birthtest : "+birthtest);
		Timestamp ts= Timestamp.valueOf(birthtest+" 00:00:00");
		dto.setBirth(ts);
		boolean isS = MemberService.insertMember(dto);
		if(isS) {
			return "redirect:member.do";
		}else {
			model.addAttribute("msg","회원가입실패");
			return "error";
		}
	}
	
	@RequestMapping(value = "/updatememberForm.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String updatemember(Locale locale, Model model,String id) {
		MemberDTO dto = MemberService.getMember(id);
		System.out.println("date"+dto.getBirth());
		model.addAttribute("dto", dto);
		return "memberupdateform";
	}
	
	@RequestMapping(value = "/updatemember.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String update(Locale locale, Model model, MemberDTO dto, String birthtest) {
		Timestamp ts= Timestamp.valueOf(birthtest+" 00:00:00");
		dto.setBirth(ts);
		boolean isS = MemberService.updateMember(dto);
		if(isS) {
			return "redirect:member.do";
		}else {
			model.addAttribute("msg","회원정보수정실패");
			return "error";
		}

	}
	
	@RequestMapping(value = "/muldelmember.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String muldel(Locale locale, Model model, String[] chk) {
		boolean isS = MemberService.muldelMember(chk);
		if(isS) {
			return "redirect:member.do";
		}else {
			model.addAttribute("msg","회원정보삭제실패");
			return "error";
		}

	}
	
	@ResponseBody
	@RequestMapping(value="/idChk.do", method = {RequestMethod.GET,RequestMethod.POST})
	public int idChk(MemberDTO dto,ServletRequest request) throws Exception {
		String id = request.getParameter("id");
		dto.setId(id);
		int result = MemberService.idChk(dto);
		return result;
	}
	
	
	
	@RequestMapping(value = "/loginForm.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String loginForm(Locale locale, Model model) {
		return "userlogin";

	}
	
	@RequestMapping(value = "/login.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String login(Locale locale, Model model,MemberDTO dto,HttpServletRequest request) {
		String msg= "";
		boolean isS = false;
		HttpSession session = request.getSession();
		dto=MemberService.login(dto);
		if(dto.getId()!=null) {
			isS=true;
		}
		if(isS) {
			session.setAttribute("id", dto.getId());
			session.setAttribute("admin",dto.getAdmin());
			if(dto.getAdmin().equals("관리자")) {
				System.out.println("admin : "+dto.getAdmin());
				return "adminMain";
			}else {
				return "myPage";
			}
			
		}else {
			msg="아이디나 비밀번호가 틀렸습니다.";
		}
		model.addAttribute("msg",msg);
		return "index";
	}

	 
    /* 이메일 인증 */
    @RequestMapping(value="/mailCheck", method=RequestMethod.GET)
    @ResponseBody
    public String mailCheckGET(String email) throws Exception{
        
        /* 뷰(View)로부터 넘어온 데이터 확인 */
        logger.info("이메일 데이터 전송 확인");
        logger.info("인증번호 : " + email);
                
        /* 인증번호(난수) 생성 */
        Random random = new Random();
        int checkNum = random.nextInt(888888) + 111111;
        logger.info("인증번호 " + checkNum);
        
        /* 이메일 보내기 */
        String setFrom = "qkrwndks89@gmail.com";
        String toMail = email;
        String title = "회원가입 인증 이메일 입니다.";
        String content = 
                "홈페이지를 방문해주셔서 감사합니다." +
                "<br><br>" + 
                "인증 번호는 " + checkNum + "입니다." + 
                "<br>" + 
                "해당 인증번호를 인증번호 확인란에 기입하여 주세요.";

        try {
            
            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
            helper.setFrom(setFrom);
            helper.setTo(toMail);
            helper.setSubject(title);
            helper.setText(content,true);
            mailSender.send(message);
            
        }catch(Exception e) {
            e.printStackTrace();
        }
        String num = Integer.toString(checkNum);
		return num;
    }


}

