<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="/resources/css/member/login.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"
   integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
   crossorigin="anonymous"></script>
</head>
<body>

   <div class="wrapper">

      <div class="wrap">
         <form id="login_form" method="post">
            <div class="logo_wrap">
               <span>Book Mall</span>
            </div>
            <div class="login_wrap">
               <div class="id_wrap">
                  <div class="id_input_box">
                     <input class="id_input" name="id">
                  </div>
               </div>
               <div class="pw_wrap">
                  <div class="pw_input_box">
                     <input type="password" class="pw_iput" name="pwd">
                  </div>
               </div>

               <c:if test="${result == 0 }">
                  <div class="login_warn">사용자 ID 또는 비밀번호를 잘못 입력하셨습니다.</div>
               </c:if>
               
               <div id="search_wrap">
                <a href="/member/findIdCheck">아이디 찾기</a>
				<a href="/member/findPwdCheck">비밀번호 찾기</a>
               </div>
			
               <div class="login_button_wrap">
               	
                  <input type="button" class="login_button" value="로그인">
               
				</div>
			
			
				<div class="kakao_button_1">
					<a class="p-2" href="https://kauth.kakao.com/oauth/authorize?client_id=3875a342f69d43d326a4d04f51644790&redirect_uri=http://localhost:8080/member/kakaoLogin&response_type=code">
					<!-- REST_API키 및 REDIRECT_URi는 본인걸로 수정하세요 -->
					<!-- 저는 redirect_uri을 http://localhost:8080/member/kakaoLogin로 했습니다. -->
					<!-- 본인걸로 수정 시 띄어쓰기 절대 하지 마세요. 오류납니다. -->
					
						<img src="/resources/img/kakao2.png">
					</a>
				</div>	
					
               </div>
                 </form>
            </div>
       
      </div>



   <script>
      /* 로그인 버튼 클릭 메서드 */
      $(".login_button").click(function() {
         //alert("로그인 버튼 작동");
         /* 로그인 메서드 서버 요청 */
         $("#login_form").attr("action", "/member/login.do");
         $("#login_form").submit();

      });
   </script>

</body>
</html>