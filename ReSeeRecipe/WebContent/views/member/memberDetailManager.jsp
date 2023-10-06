<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kh.semi.member.model.vo.Member" %>
<%
	Member m = (Member)request.getAttribute("m");
	//int memNo = Integer.parseInt(request.getAttribute("memNo"));

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 상세보기</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
 <!-- <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script> -->   
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<style>
    h2{
        text-align: center;
    }

    #memberdetailbtn{
        text-align : center;
    }

</style>    
</head>
<body>
    <br><br>
    <h2>회원 정보 상세보기</h2>
    <br><br>
    <div class="container">
        <div class="from-control">
            <table class="table">
                <tr>
                    <th>회원번호</th>
                    <td><%=m.getMemNo() %></td>
                </tr>
                <tr>
                    <th>회원이름</th>
                    <td><%=m.getMemName() %></td>
                </tr>    
                <tr>
                    <th>회원아이디</th>
                    <td><%=m.getMemId() %></td>
                </tr>        
                <tr>
                    <th>회원닉네임</th>
                    <td><%=m.getMemNickname() %></td>
                </tr>      
                <tr>
                    <th>이메일</th>
                    <td><%=m.getMemEmail() %></td>
                </tr>        
                <tr>
                    <th>가입일자</th>
                    <td><%=m.getEnrollDate() %></td>
                </tr>        
                <tr>
                    <th>회원등급명</th>
                    <td><%=m.getMemGradeName() %></td>
                </tr>        
            </table>
            <br><br>
            <div id="memberdetailbtn">
                <button type="submit" id="memberupdatebtn" class="w3-button w3-round w3-yellow">수정하기</button>
                <button type="button" class="w3-button w3-round w3-yellow">목록으로</button>
            </div>
        </div>
    </div>
</body>

<script>
	// 회원 정보 수정 폼으로 Ajax 처리
	$(function(){
		$('#memberupdatebtn').on("click", updateMemberForm);
	});
	function updateMemberForm(){
		$.ajaxSettings.traditional = true;
		$.ajax({
			url : 'hlupdatemeberForm.ma',
			data : {mno : $('.table').children().eq(1).text()},
			success : function(result){
				console.log(result);
				console.log('회원 정보 수정 성공');
				$('.rs-content').html(result);
			},
			error : function(result){
				console.log('회원 정보 수정 실패');
				$('.rs-content').text('회원 정보 수정이 되지 않습니다');
			}
		})
	}



</script>
</html>