<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String buy = (String)request.getAttribute("buy");
	String errorMsg = (String)request.getAttribute("errorMsg");
%>
<!-- 임시_230928_yr -->
<!-- 수정_231005_yr-->

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인</title>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

    <link rel="stylesheet" href="resources/css/member/memberLogin.css">


</head>
<body>
	<!-- header부분 (상단 메인 메뉴바) -->
	<%@ include file="/views/common/header.jspf" %>

    <form action="yrlogin.me" method="post">
    	<input type="hidden" name="buy" value="<%= buy %>">

      <h1 id="title"><b>로그인</b></h1>
      <div class="container">
          <h4>
          <b>
          	 반갑습니다. <br>
           	 오늘도 맛있는 식사하세요.
          </b>
          </h4>
          <!-- <label for="uname"><b>아이디</b></label> -->
          <input type="text" placeholder="아이디" name="memberId" maxlength="20" required>
      
          <!-- <label for="psw"><b>비밀번호</b></label> -->
          <input type="password" placeholder="비밀번호" name="memberPwd" maxlength="20" required>
      
          <button type="submit" id="login">로그인</button>

	        <div class="login-searchmenu">
	          <!-- <button type="button" class="cancel-btn">Cancel</button> -->
	          <div class="psw"><a href="<%= contextPath %>/yrenrollForm.me">회원가입</a></div>
	          <div class="psw"><a href="<%= contextPath %>/yrsearchMemberIdForm.me">아이디 찾기</a></div>
	          <div class="psw"><a href="<%= contextPath %>/yrsearchMemberPwdForm.me">비밀번호 찾기</a></div>
	        </div>
        </div>
        
      </form>
     
    <!-- footer 푸터영역 -->
	<%@ include file="/views/common/footer.jspf" %>


  <script>

    var msg = '<%= errorMsg %>';
    if(msg != 'null'){
      Swal.fire({
        icon: 'error',
        title: '로그인 실패',
        text: '아이디와 비밀번호를 다시 확인해 주세요.'
      })
      <% request.removeAttribute("errorMsg"); %>
    }
    </script>

  </body>
</html>