package com.luna.board;


import java.sql.Timestamp;
import java.util.List;
import java.util.Locale;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.luna.board.dtos.MemberDTO;
import com.luna.board.model.KakaoProfile;
import com.luna.board.model.OAuthToken;
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
	
	@RequestMapping(value = "/deletemember.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String delete(Locale locale, Model model, MemberDTO dto) {
		boolean isS = MemberService.deleteMember(dto);
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
	public String loginForm(Locale locale, Model model,String returnUrl,HttpServletRequest request) {
		if(returnUrl==null) {
			return "userlogin";
		}else if (returnUrl.equals("buyform")) {
			System.out.println("로그인폼  : "+request.getParameter("selOptNum"));
			model.addAttribute("selOptNum",request.getParameter("selOptNum"));
			model.addAttribute("pseq", request.getParameter("pseq"));
			//System.out.println(request.getParameter("pseq"));
			model.addAttribute("selOpt", request.getParameter("selOpt"));
			model.addAttribute("returnUrl",returnUrl);
			//System.out.println("로그인폼에서 : "+request.getParameter("selOpt"));
			return "userlogin";
		}else if(returnUrl.equals("cart")) {
			JSONParser  parser = new JSONParser();
			try {
				Object obj = parser.parse(request.getParameter("selOpt"));
				JSONObject jsonObj = (JSONObject) obj;
				
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			model.addAttribute("pseq", request.getParameter("pseq"));
			System.out.println("로그인  : "+request.getParameter("selOptNum"));
			model.addAttribute("selOpt", request.getParameter("selOpt"));
			model.addAttribute("returnUrl",returnUrl);
			return "userlogin";
		}else {
			return "userlogin";
		}
		
	
	}
	
	@RequestMapping(value = "/login.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String login(Locale locale, Model model,MemberDTO dto,HttpServletRequest request,HttpServletResponse response) {
		String msg= "";
		boolean isS = false;
		HttpSession session = request.getSession();
		dto=MemberService.login(dto);
		if(dto !=null) {
			if(dto.getId()!=null) {
				session.setAttribute("id", dto.getId());
				session.setAttribute("nickname", dto.getNickName());
				session.setAttribute("admin",dto.getAdmin());
				if(dto.getAdmin().equals("관리자")) {
					//System.out.println("admin : "+dto.getAdmin());
					return "adminMain";
				}else {
					if(request.getParameter("returnUrl")!=null) {
						if(request.getParameter("returnUrl").equals("buyform")) {
							System.out.println("로그인  : "+request.getParameter("selOptNum"));
							model.addAttribute("selOptNum",request.getParameter("selOptNum"));
							model.addAttribute("pseq", request.getParameter("pseq"));
							model.addAttribute("selOpt", (String)request.getParameter("selOpt"));
							//System.out.println("여기:"+request.getParameter("selOpt"));
							return "redirect:buyform.do";
						}else if ( request.getParameter("returnUrl").equals("cart")) {
							model.addAttribute("pseq", request.getParameter("pseq"));
							model.addAttribute("selOpt", (String)request.getParameter("selOpt"));
							return "redirect:inCart.do";
						}
					}
					
					return "redirect:index.do";
				}				
			}else {
				msg="아이디나 비밀번호가 틀렸습니다.";
				model.addAttribute("msg",msg);
				return "loginForm";
			}
		}else {
			msg="아이디나 비밀번호가 틀렸습니다.";
			model.addAttribute("msg", "loginfail");
			return "userlogin";
		}
	
	}

	@RequestMapping(value="/logout.do", method= {RequestMethod.GET,RequestMethod.POST})
	public String logout(Locale locale, Model model, MemberDTO dto, HttpServletRequest request) {
		HttpSession session = request.getSession();
		System.out.println("세션 정보삭제 완료");
		session.invalidate();
		return "userlogin"; 
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
        String setFrom = "parkjoo8715@naver.com";
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
    
    @RequestMapping("/callback")
    public String kakaoCallback(String code, HttpServletRequest request) throws Exception { //Data를 리턴해주는 컨트롤러 함수
    	RestTemplate rt = new RestTemplate();
    	
    	// HttpHeader 오브젝트생성
    	HttpHeaders headers = new HttpHeaders();
    	headers.add("Content-type","application/x-www-form-urlencoded; charset=utf-8");
   	    	    	// HttpBody 오브젝트생성
    	MultiValueMap<String, String>params=new LinkedMultiValueMap<>();
    	params.add("grant_type", "authorization_code");
    	params.add("client_id" ,"818ca9a80599f4fc6a4c915c35fbe0fb");
    	params.add("redirect_uri", "http://localhost:8888/board/callback");
    	params.add("code", code);

    	//HttpHeader와 HttpBody를 하나의 오브젝트에 담기
    	HttpEntity<MultiValueMap<String, String>> kakaoTokenRequest=
    			new HttpEntity<>(params,headers);
    	
    	//Http요청하기 - Post방식으로 - 그리고 response 변수의 응답 받음
    	ResponseEntity<String> response = rt.exchange(
    		"https://kauth.kakao.com/oauth/token",
    		HttpMethod.POST,
    		kakaoTokenRequest,
    		String.class    	   			
    	);
    	
    	ObjectMapper objectMapper = new ObjectMapper();
    	OAuthToken oauthToken = null;
    	try {
    		oauthToken = objectMapper.readValue(response.getBody(),OAuthToken.class);
		} catch (JsonMappingException e) {
			e.printStackTrace();
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
    	System.out.println(oauthToken.getAccess_token());
		System.out.println("response:"+response.getBody());
		RestTemplate rt2 = new RestTemplate();
    	
    	// HttpHeader 오브젝트생성
    	HttpHeaders headers2 = new HttpHeaders();
    	headers2.add("Authorization","Bearer "+oauthToken.getAccess_token());
    	headers2.add("Content-type","application/x-www-form-urlencoded;charset=utf-8");
   	    
       	//HttpHeader와 HttpBody를 하나의 오브젝트에 담기
    	HttpEntity<MultiValueMap<String, String>> kakaoProfileRequest2=
    			new HttpEntity<>(headers2);
    	
    	//Http요청하기 - Post방식으로 - 그리고 response 변수의 응답 받음
    	ResponseEntity<String> response2 = rt2.exchange(
    		"https://kapi.kakao.com/v2/user/me",
    		HttpMethod.POST,
    		kakaoProfileRequest2,
    		String.class
    	);
		
		ObjectMapper objectMapper2 = new ObjectMapper();
    	KakaoProfile kakaoProfile = null;
	    	try {
	  		kakaoProfile = objectMapper2.readValue(response2.getBody(),KakaoProfile.class);
			} catch (JsonMappingException e) {
				e.printStackTrace();
			} catch (JsonProcessingException e) {
				e.printStackTrace();
			}
	    	
	    	
				
	     	System.out.println("KEmail:"+kakaoProfile.getKakao_account().getEmail());
	    	System.out.println("KNickName:"+kakaoProfile.getProperties().getNickname());
	    	System.out.println("KGender:"+kakaoProfile.getKakao_account().getGender());

	    	MemberDTO dto = new MemberDTO();
	    	dto.setId(kakaoProfile.getKakao_account().getEmail());
	    	dto.setEmail(kakaoProfile.getKakao_account().getEmail());
	    	dto.setNickName(kakaoProfile.getProperties().getNickname());
	    	dto.setName(kakaoProfile.getProperties().getNickname());
	    	dto.setSex(kakaoProfile.getKakao_account().getGender());
	      	
    		int result = MemberService.idChk(dto);
    		if (result>=1) {
    			HttpSession session = request.getSession();	
    		
    	
    			session.setAttribute("id", dto.getId());
    			session.setAttribute("nickname", dto.getNickName());
    			return "index";
    		}
    		
			boolean isS = MemberService.insertKMember(dto);
			if(isS) {
				HttpSession session = request.getSession();	
	    		
		    	
    			session.setAttribute("id", dto.getId());
    			session.setAttribute("nickname", dto.getNickName());
    			return "index";
    		
			} else {
				return "loginForm";
			}
	    
	    }  

	@RequestMapping(value = "/idSearchForm.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String idSearchform(Locale locale, Model model) {
		return "idSearchForm";

	}
	
	@RequestMapping(value = "/idSearch.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String idSearch(Model model,  MemberDTO dto) {
		MemberDTO member = MemberService.getMemberByNameAndEmail(dto);
		if (member == null) {

			model.addAttribute("check", 1);
		} else {
			model.addAttribute("check", 0);
			model.addAttribute("id", member.getId());
		}
		return "idSearchForm";
	}
	
	@RequestMapping(value = "/pwdSearchForm.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String pwdSearchform(Locale locale, Model model) {
		return "pwdSearchForm";
	}
	
	@RequestMapping(value = "/pwdSearch.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String pwdSearch(Model model, MemberDTO dto) {
		MemberDTO member = MemberService.getMemberByIdAndEmail(dto);
		if (member == null) {
			model.addAttribute("check", 1);
		} else {
			model.addAttribute("check", 0);
			model.addAttribute("pwd", member.getPwd());
			
			 /* 인증번호(난수) 생성 */
	        Random random = new Random();
	        int checkNum = random.nextInt(888888) + 111111;
	        String pwd = checkNum+"";
	        logger.info("임시비밀번호 " + checkNum);
	        
	        /* 이메일 보내기 */
	        String setFrom = "parkjoo8715@naver.com";
	        String toMail = dto.getEmail();
	        String title = "임시비밀번호 입니다.";
	        String content = 
	                "홈페이지를 방문해주셔서 감사합니다." +
	                "<br><br>" + 
	                "임시비밀번호는 " + checkNum + "입니다." + 
	                "<br>";
	        dto.setPwd(pwd);
	        	        
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
		}		
		return "pwdSearchForm";
		
	}
}
	
   
