<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 블로그</title>
<%@ include file="/views/common/header.jspf" %>
 <link href="https://fonts.googleapis.com/css2?family=Bebas+Neue&family=Black+Ops+One&family=Noto+Sans+KR&family=Parisienne&display=swap" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <style>

        #sideMenu{
            border: 1px solid black;
            width: 150px;
            background-color: rgb(237, 251, 89);
            margin-top: 70px;
            
        }
        #listMenu{
            list-style: none;
            margin-top: 15px;
        }
        #listMenu > a{
            text-decoration: none;
            font-family: 'Noto Sans KR', sans-serif;
            text-align: center;
            font-weight: 700;
            color: black;
        }
        #listMenu:hover{
            background-color: rgb(224, 191, 5);
        }
        #sideTop{
            border: 1px solid black;
            width: 150px;
            height: 555px;
            background-color: rgb(237, 251, 89);
        }
        #sideTop p{
            float: left;
            font-size: 3px;
        }
        #memberPic{
            border: 1px solid black;
            width: 85px;
            height: 85px;
            margin-top: 30px;
            margin-left: 30px;
        }
        #md{
            border: 1px solid black;
            width: 40px;
            height: 20px;
            margin-top: 8px;
            margin-left: 22px;
        }
        #nickName{
            border: 1px solid black;
            width: 40px;
            height: 20px;
            margin-top: 100px;
            margin-left: 22px;
        }
        #center{
            border: 1px solid black;
            width: 500px;
            height: 800px;
            float: right;
            width: 1045px;
            margin: auto;
        }
        #center{
            display: flex;
            justify-content: center;
             display: flex;
            justify-content: center;
        }
        #my-recipe{
            border: 1px solid black;
            width: 1000px;
            height: 200px;
            margin-top: 30px;
        }
    </style>
</head>
<body>
    
        <div id="sideTop">
            <p>방문자 수: </p><p>내 리워드: </p>
            <div id="memberPic">
                <div id="nickName">
                    <p>닉네임</p>
                </div>
                <div id="md">
                    <p>내 등급</p>
                </div>
            </div>
            <div id="sideMenu">
                <ul>
                    <li id="listMenu"><a href="<%= contextPath %>/yrmemberUpdateConfirmForm.me">회원정보 변경</a></li>
                    <li id="listMenu"><a href="">리워드</a></li>
                    <li id="listMenu"><a href="">쿠폰</a></li>
                    <li id="listMenu"><a href="">선물함</a></li>
                    <li id="listMenu"><a href="">레시피북</a></li>
                    <li id="listMenu"><a href="">구독셰프</a></li>
                    <li id="listMenu"><a href="">게시물관리</a></li>
                    <li id="listMenu"><a href="">쇼핑정보</a></li>
                    <li id="listMenu"><a href="">쪽지</a></li>
                </ul>
            </div>
        </div>
       
        
    
<%@ include file="/views/common/footer.jspf" %>
</body>
</html>



















