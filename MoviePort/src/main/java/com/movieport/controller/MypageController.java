package com.movieport.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.movieport.model.MemberVO;
import com.movieport.model.ReviewVO;
import com.movieport.service.MypageService;

@Controller
@RequestMapping(value = "/mypage")
public class MypageController {
	private static final Logger log = LoggerFactory.getLogger(MypageController.class);

	@Autowired
	MypageService mypageService;

	@Autowired
	private BCryptPasswordEncoder pwEncoder;

	// 마이페이지 메인으로 이동 및 회원정보 출력
	@GetMapping("/mypageMain")
	public String memberInfoGET(HttpSession session, Model model, MemberVO member) throws Exception {
		log.info("마이페이지 메인 진입");

		member = (MemberVO) session.getAttribute("member");
		log.info("id : " + member.getId());

		model.addAttribute("info", mypageService.memberInfo(member.getId()));
		return "/mypage/mypageMain";
	}

	// 회원정보 수정하기
	@PostMapping("/myInfoUpdate")
	public String myInfoUpdatePOST(MemberVO member, Model model, HttpSession session) throws Exception {
		log.info("회원정보 수정 동작");

		String nickname = member.getNickname();
		String phone = member.getPhone();
		String email = member.getEmail();

		log.info("입력한 닉네임 : " + nickname);
		log.info("입력한 휴대폰번호 : " + phone);
		log.info("입력한 이메일 : " + email);

		int result = mypageService.memberUpdate(member);
		log.info("result : " + result);

		if (result != 1) { // 회원정보 업데이트 실패시
			log.info("수정 실패");
			model.addAttribute("msg", "회원정보 수정에 실패하였습니다.\\n올바른 정보를 입력해 주세요.");
			model.addAttribute("info", mypageService.memberInfo(member.getId()));
			return "/mypage/mypageMain";
		}

		log.info("수정 성공");
		session.invalidate();
		model.addAttribute("msg", "회원정보 수정이 완료되었습니다.\\n다시 로그인 후 서비스를 이용해 주세요.");
		return "/main";
	}

	// 비밀번호 변경 페이지로 이동
	@GetMapping("/pwdUpdate")
	public String pwdUpdateGET(HttpSession session, Model model, MemberVO member) throws Exception {
		log.info("비밀번호 변경 페이지 진입");

		member = (MemberVO) session.getAttribute("member");
		log.info("id : " + member.getId());

		model.addAttribute("info", mypageService.memberInfo(member.getId()));
		return "/mypage/pwdUpdate";
	}

	// 비밀번호 변경하기
	@PostMapping("/pwdUpdate")
	public String pwdUpdatePOST(MemberVO member, Model model, HttpSession session) throws Exception {
		log.info("비밀번호 수정 동작");

		String pwd = member.getPwd();
		log.info("입력한 새 비밀번호 : " + pwd);

		// 기존 비밀번호 -> 새 비밀번호로 변경
		String rawPwd = ""; // 인코딩 전 비밀번호
		String encodePwd = ""; // 인코딩 후 비밀번호

		rawPwd = member.getPwd(); // 입력한 새 비밀번호 데이터 얻기
		log.info("인코딩 전 새로운 비밀번호 : " + rawPwd);
		encodePwd = pwEncoder.encode(rawPwd); // 입력한 새 비밀번호 인코딩
		member.setPwd(encodePwd); // 인코딩된 새로운 비밀번호 member 객체에 다시 저장
		log.info("인코딩 후 새로운 비밀번호 : " + member.getPwd());

		int result = mypageService.pwdUpdate(member);
		log.info("result : " + result);

		if (result != 1) { // 비밀번호 변경 실패시
			log.info("비밀번호 변경 실패");
			model.addAttribute("msg", "비밀번호 변경에 실패하였습니다.");
			model.addAttribute("info", mypageService.memberInfo(member.getId()));
			return "/mypage/pwdUpdate";
		}

		log.info("수정 성공");
		session.invalidate();
		model.addAttribute("msg", "비밀번호 변경이 완료되었습니다.\\n다시 로그인 후 서비스를 이용해 주세요.");
		return "/main";
	}

	// 회원탈퇴 페이지로 이동
	@GetMapping("/resign")
	public String resignGET(HttpSession session, Model model, MemberVO member) throws Exception {
		log.info("회원탈퇴 페이지 진입");

		member = (MemberVO) session.getAttribute("member");
		log.info("id : " + member.getId());

		model.addAttribute("info", mypageService.memberInfo(member.getId()));
		return "/mypage/resign";
	}

	// 회원탈퇴
	@PostMapping("/deleteMember")
	public String deleteMemberPOST(HttpSession session, MemberVO member, Model model) throws Exception {
		log.info("회원탈퇴 동작");

		// 세션에 있는 member를 가져와 member 변수에 넣어준다.
		MemberVO mvo = (MemberVO) session.getAttribute("member");
		// 세션에 있는 이메일
		String sessionEmail = mvo.getEmail();
		log.info("실제 DB 이메일 : " + sessionEmail);
		// member로 들어오는 이메일
		String memberEmail = member.getEmail();
		log.info("입력한 이메일 : " + memberEmail);

		if (sessionEmail.equals(memberEmail)) { // 실제 DB 이메일과 입력한 이메일이 매칭에 성공한 경우 -> 회원탈퇴 성공
			log.info("회원탈퇴 성공");
			mypageService.deleteMember(member);
			session.invalidate();
			model.addAttribute("msg", "회원탈퇴가 완료되었습니다.\\n더욱 발전하는 MoviePort가 되겠습니다.");
			return "/main";
		} else {
			log.info("회원탈퇴 실패");
			model.addAttribute("msg", "회원탈퇴 실패\\n이메일을 확인해주세요.");

			member = (MemberVO) session.getAttribute("member");
			log.info("id : " + member.getId());

			model.addAttribute("info", mypageService.memberInfo(member.getId()));
			return "/mypage/resign";
		}
	}

	// 나의 리뷰 목록 페이지로 이동 및 출력
	@GetMapping("/reviews")
	public void myReviewsGET(HttpSession session, Model model, MemberVO member) throws Exception {
		log.info("나의 리뷰 목록 페이지 진입");

		member = (MemberVO) session.getAttribute("member");
		log.info("id : " + member.getId());

		model.addAttribute("reviews", mypageService.getMyReviewList(member.getId()));
	}

	// 나의 리뷰 상세 페이지로 이동
	@GetMapping("/reviewsDetail")
	public void myReviewsDetailGET(Model model, int reviewid) throws Exception {
		log.info("나의 리뷰 상세 페이지 진입");

		model.addAttribute("detail", mypageService.getMyReviewListDetail(reviewid));
		log.info("reviewid : " + mypageService.getMyReviewListDetail(reviewid));
	}

	// 리뷰 수정
	@PostMapping("/updateReview")
	public String updateReviewPOST(ReviewVO review, RedirectAttributes rttr) throws Exception {
		log.info("리뷰 수정 동작");

		Double rate = review.getRate();
		String comments = review.getComments();

		log.info("입력한 평점 : " + rate);
		log.info("입력한 내용 : " + comments);

		int result = mypageService.updateReview(review);
		log.info("result : " + result);

		if (result != 1) { // 리뷰 업데이트 실패시
			log.info("수정 실패");
			rttr.addFlashAttribute("msg", "리뷰 수정에 실패하였습니다.");
			return "redirect:/mypage/reviews";
		}

		log.info("수정 성공");
		rttr.addFlashAttribute("msg", "리뷰가 수정되었습니다.");
		return "redirect:/mypage/reviews";
	}

	// 리뷰 삭제
	@PostMapping("/deleteReview")
	public String deleteReviewPOST(ReviewVO review, RedirectAttributes rttr) throws Exception {
		log.info("리뷰 삭제 동작");

		int reviewid = review.getReviewid();
		log.info("삭제할 reviewid : " + reviewid);

		mypageService.deleteReview(review);
		rttr.addFlashAttribute("msg", "리뷰가 삭제되었습니다.");
		log.info("삭제 성공");

		return "redirect:/mypage/reviews";
	}
}
