<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList,
			     java.util.HashMap,
			     com.kh.semi.board.recipe.model.vo.*,
			     com.kh.semi.board.board_common.model.vo.*,
			     com.kh.semi.common.model.vo.PageInfo" %>
<%	
	// rMainVwCon 뷰 지정용 키워드
	String rMainVwCon = (String)request.getAttribute("rMainVwCon");
	
	// 조회된 글 정보
	/*
	ArrayList<Recipe> list = (ArrayList)request.getAttribute("list");*/
	
	

	// 페이지처리용 변수
	/*
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();*/
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>레시피 메인</title>
<style>
	#board-outer{
		width: 1000px;
		height: 1000px;
		margin: auto;
		color: white;
	}
	

</style>

</head>
<body>
	<%@ include file="/views/common/header.jspf" %>
	
	<%@ include file="/views/board/recipe_frag/recipeCategoryBar.jsp" %>
	<%@ include file="/views/board/recipe_frag/recipeSortBar.jsp" %>
	
	<% if(loginMember != null && rMainVwCon.equals("enrollForm")) { %>
		<%@ include file="/views/board/recipe_frag/recipeEnrollForm.jsp" %>
	<% } %>
	
	
	<%@ include file="/views/common/footer.jspf" %>
</body>
</html>