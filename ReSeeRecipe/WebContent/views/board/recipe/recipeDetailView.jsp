<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList,
			     java.util.HashMap,
			     com.kh.semi.board.recipe.model.vo.RecipeCategory,
			     com.kh.semi.board.recipe.model.vo.UnRecipe" %>
<%
	

	//ArrayList<UnRecipe> unReList = (ArrayList)(request.getAttribute("unReList"));
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>레시피 디테일뷰</title>

</head>


<style>
	/**********************************************************
		wrap div + wrap내부 div 세팅
	**********************************************************/
	div {
		box-sizing: border-box;
	}

	/* 전체 div wrap */
	#recipe-enroll-form-wrap {
		width: 1200px;
		box-sizing: border-box;
		margin: auto;
	}
	/*******************************************/
	/* > 글쓰기 양식 form태그wrap */
	#recipe-enrolling-form { 
		width: 100%;
		box-sizing: border-box;
		position: relative;
	}

	/*******************************************/
	/* > > 상단바wrap div 세팅 */
	#recipe-enroll-top-bar-wrap {
		width: 100%;
		height: 80px;
		margin: auto;
		box-sizing: border-box;
		/*지울부분*/
		background-color: aqua;
	}

	/* > >... 상단바 내부 div요소 default 세팅 */
	#recipe-enroll-top-bar-wrap div {
		height: 100%;
		float: left;
	}

	/* > > 입력폼wrap div 세팅 */
	#recipe-enroll-context-wrap {
		width: 100%;
		height: 2150px;
	}

	/* > >... 입력폼 내부 상단 div (썸네일 + 제목 + 재료입력) */
	#cook-steps-basic-info {
		width: 100%;
		height: 35%;
	}

	/* > >... 입력폼 내부 중단 div (과정사진 + 제목 + 내용) */
	#cookingInstructionContainer {
		width: 100%;
		height: 60%;
	}

	/* > >... 입력폼 내부 하단 div (submit + reset 버튼) */
	#cook-steps-buttons {
		width: 100%;
		height: 5%;
	}


	/**********************************************************
		상단바 영역 (#recipe-enroll-top-bar-wrap 내부)
	**********************************************************/
	/* 1. 아이콘 이미지 세팅 */
	#recipe-enroll-bar-img {
		width: 10%;
		padding: 18px 0px 0px 30px;
	}

	#recipe-enroll-bar-img > i {
		font-size: 45px;
		color: rgb(255, 145, 77);
	}

	/* 2. 카테고리 메뉴 세팅 */
	#recipe-enroll-bar-menu {
		width: 75%;
	}

	/* select요소 */
	#recipe-enroll-bar-inner {
		width: 45%;
		position: relative;
	}
	
	#recipe-enroll-bar-menu select {
		width: 90%;
		height: 60%;
		text-align: center;
		position: absolute;
		top: 16px;
	}

	#enroll-bar-inner-blank1 {
		width: 55%;
	}

	/* 3. 임시저장 버튼 세팅 */
	#unrecipe-modal-request-div {
		width:15%;
	}

	#unrecipe-modal-request-div > button {
		width: 100%;
		height: 100%;
		font-size: 55px;
		text-align: center;
		color: rgb(255, 145, 77);
		appearance: none;
		border: none;
        background-color: transparent;
	
	}


	/**********************************************************
		입력양식 내용 영역 (#recipe-enroll-context-wrap내부)
	**********************************************************/
	/* 1. 입력폼 내부 상단 div (썸네일 + 제목 + 재료입력) */
	/* 여백 영역 */
	#enroll-form-blank1 {
		width: 100%;
		height: 2%;
	}

	/* 좌우 큰 div */
	#cook-steps-basic-info .cook-steps-input-content {
		width: 50%;
		height: 100%;
		float: left;
		text-align: center;
	}
	
	#cook-steps-basic-info .cook-steps-inner {
		width: 100%;
	}

	/* --- 좌측 --- */
	/* 썸네일 div */
	#content-thumbnail-image {
		width: 100%;
		height: 79%;
		background-color: rgb(255, 222, 89);
	}

	/* 썸네일 이미지 */
	#content-thumbnail-image img {
		width: 570px;
		height: 570px;
		padding-top: 20px;
	}

	/* 셰프이름 + 해시태그 div */
	#content-writer-hashtag {
		width: 100%;
		height: 21%;
	}

	/* 셰프이름 */
	#cook-steps-chef {
		height: 60%;
	}

	#cook-steps-chef > p {
		margin: 0px;
		margin-top: 12px;
		font-size: 20px;
		font-weight: 1000;
		color: rgb(132, 137, 143);
	}

	/* 해시태그 */
	#detailTagDiv1 {
		width: 100%;
		height: 40%;
	}
	
	#detailTagDiv2 {
		width: 90%;
		height: 100%;
		border-radius: 50px;
		border-color: rgb(255, 145, 77);
		background-color: #17a2b8;
	}
	
	.detailTagList {
		display: inline-block;
		margin: auto;
		font-size: 17px;
		margin-top: 15px;
	}
	
	#cook-steps-hashtag option {
		font-size: 25px;
	}
	
	#cook-steps-hashtag option:disabled {
		display: none;
	}
	
	/* --- 우측 --- */
	/* 제목 입력칸 (textarea) */
	#cook-steps-title {
		height: 21%;
	}

	#title-text-area-div {
		width: 100%;
		height: 100%;
	}

	#cook-steps-title > div > textarea {
		width: 420px;
		height: 105px;
		resize: none;
		text-align: center;
		border-radius: 10px;
		padding : 10px 100px 10px 50px;
		margin: auto;
		position: absolute;
		top: 100px;
		right: 90px;
	}

	#cook-steps-title > div > textarea::placeholder {
		padding-top: 30px;
		text-align: center;
	}

	#cook-steps-title > #title-bytes-span {
		display: inline-block;
		font-size: 2px;
		z-index: 1;
		position: absolute;
		top: 172px;
		right: 100px;
	}


	/* 재료 타이틀 (재료 입력 및 추가하는 부분) */
	#cook-steps-ingredient-title {
		height: 9%;
	}

	#cook-steps-ingredient-title div {
		height: 100%;
		float: left;
	}

	#ingredient-title-div1 {
		width: 90%;
	}
	
	#write-ingredient-input {
		width: 62%;
		height: 100%;
	}
	
	#amount-ingredient-input {
		width: 18%;
		height: 100%;
	}
	
	#measurement-ingredient-selection {
		width: 20%;
		height: 100%;
	}
	
	#ingredient-title-div1 input {
		font-size: 2px;
		text-align: center;
		padding: 2px;
	}

	#ingredient-title-div1 select {
		text-align: center;
		padding: 0px;
		padding-left: 30px;
	}
	
	#ingredient-title-div1 input, #ingredient-title-div1 select {
		width: 100%;
		height: 100%;
	}

	#ingredient-title-div2 {
		width: 10%;
		padding-top: 7px;
		padding-right: 10px;
	}

	#ingredient-title-btn {
		font-size: 40px;
		padding: 0px;
		margin-top: 2px;
		appearance: none;
		border: none;
		background-color: transparent;
		color: rgb(89, 164, 255);
		float: right;
	}
	
	#ingredient-title-btn:hover {
		color: rgb(59, 134, 225);
	}

	/* 재료 콘텐트 (입력요소 생성해서 띄우는 부분) */
	#cookStepsIngredientContent {
		height: 70%;
	}

	#ingredientContentLeft, #ingredientContentRight {
		width: 50%;
		height: 100%;
		float: left;
	}


	#cookStepsIngredientContent .ingredientContainer {
		width: 100%;
		height: 34px;
	}

	#cookStepsIngredientContent .ingredientContainer div {
		height: 100%;
		float: left;
	}
	
	div[id ^= 'ingredientAreaDiv'] {
		width: 60%;
	}

	div[id ^= 'ingredientAmountDiv'] {
		width: 20%;
	}

	div[id ^= measureAreaDiv] {
		width: 20%;
	}


	#cookStepsIngredientContent input, select {
		width: 100%;
		height: 100%;
		padding: 0px;
		font-size: 1px;
		text-align: center;
		appearance: none;
	}

	.ingMeasure {
		font-size: 1px;
	}
	
	#cookStepsIngredientContent input::placeholder, select::placeholder {
		text-align: center;
	}

	.modify-btn {
		font-size: 20px;
		padding: 5px 5px 0px 0px;
		appearance: none;
		border: none;
		background-color: transparent;
		color: rgb(227, 113, 113);
		float: right;
	}





	/*2. 입력폼 내부 중단 div (과정사진 + 제목 + 내용) */
	/* 넘버링 + 요리과정 제목 */
	#cookingInstructionContainer > div {
		width: 50%;
		height: 33%;
		margin: auto;
		float: left;
	}

	#cookingInstructionContainer .cook-steps-inst-title {
		width: 100%;
		height: 20%;
		padding: 20px 10px 0px 15px;
	}

	#cookingInstructionContainer .inst-title-lev {
		width: 10%;
		height: 100%;
		display: inline-block;
		box-sizing: border-box;
		text-align: center;
		margin: 0px;
		padding-top: 15px;
		padding-right: 10px;
	}

	#cookingInstructionContainer .inst-title-text {
		width: 75%;
		height: 100%;
		box-sizing: border-box;
		padding: 0px;
		text-align: center;
	}

	#cookingInstructionContainer button[id^='delCookSteps'] {
		font-size: 50px;
		width: 15%;
		height: 100%;
		padding: 0px;
		box-sizing: border-box;
		float: right;
	}

	/* 요리과정 설명 */
	#cookingInstructionContainer .cook-steps-inst-content {
		width: 100%;
		height: 50%;
		padding: 10px;
	}

	#cookingInstructionContainer .cook-steps-inst-content textarea {
		width: 100%;
		height: 100%;
	}

	#cookingInstructionContainer .cook-steps-inst-content textarea::placeholder {
		text-align: center;
	}

	#instAddBtn {
		font-size: 120px;
		padding: 0px;
		margin-top: 147px;
		margin-left: 237px;
		appearance: none;
		border: none;
		background-color: transparent;
		color: rgb(89, 164, 255);
	}


	/* 3. 입력폼 내부 하단 div (submit + reset 버튼) */
	#cook-steps-buttons {

	}

	

		

	/**********지울부분***************************************/
	table td { border: 1px solid black }


</style>

</head>
<body>

	<%@ include file="/views/common/header.jspf" %>
	<%@ include file="/views/board/recipe_frag/recipeCategoryBar.jspf" %>
	<%@ include file="/views/board/recipe_frag/recipeSortBar.jspf" %>

	<script>
		// jsp파일 로딩 시 카테고리 접힘상태로 로딩시켜주는 함수
		$(function(){
			const categoryFoldingText = $('#category-toggle-msg > h3');
			categoryFoldingText.text('카테고리 더보기');
			$('#category-toggle-menu').css('display', 'none');
		});
	</script>
	
	<!-- 같이 넘어가야 할 것
		TB_RECIPE
		: 레시피 제목, 작성자 번호(MEM_NO), 선택한 레시피 카테고리 번호
		위 구문 수행 후 RECIPE NO 받아서
		TB_COOK_STEPS
		: 각 요리과정 제목, 각 요리과정 내용, 블록 순서(넘버링)
		TB_INGREDIENT
		: 요리에 들어가는 재료, 선택한 계량단위 번호
		TB_RECIPE_TAG
		선택한 해시태그 번호
		TB_RECIPE_PIC
		: 미리보기만 해주고 & 파일INPUT으로 알아서
		-->
	<!--<--%= contextPath %>/insertRecipe.re-->

	<div id="recipe-enroll-form-wrap"><!-- 전체 wrap 시작 -->
		
		<!---------------------- 글작성 전체 form / memNo은 session에서 빼서 사용 ----------------------->
		<form action="#" id="recipe-enrolling-form" method="post" enctype="multipart/form-data">
		<!-- <form action="insertRecipe.re" id="recipe-enrolling-form" method="post" enctype="multipart/form-data"> -->
			<!---------------------- 입력양식 상단 바 영역 ---------------------->
			<div id="recipe-enroll-top-bar-wrap">
				<!-- 카테고리 선택 영역 -->
				<div id="recipe-enroll-bar-img">
					<i class='fas fa-align-left'></i>
				</div>
				<div id="recipe-enroll-bar-menu">
					한식
				</div>
				<div>
					조회수
				</div>
				<div>
					하트
				</div>
				<div>
					북마크
				</div>
				<div>
					신고
				</div>
			</div><!-- 입력양식 상단 바 영역 끝 -->

			
		
			<!---------------------- 레시피 글 작성 내용 영역 ---------------------->
			<div id="recipe-enroll-context-wrap">
				
				<!-- 레시피 썸네일 + 제목 + 재료 입력 테이블 -->
				<div id="cook-steps-basic-info">
					<div class="cook-steps-input-content">
						<div id="content-writer-hashtag">
							<div id="cook-steps-chef" class="cook-steps-inner">
								<p><%= loginMember %></p>
							</div>
							<div id="detailTagDiv1">
								<div id="detailTagDiv2" class="cook-steps-inner">
									<% for(int i = 0; i < 5; i++) { %>
										<div class="detailTagList">#해시태그<%= i %></div>
									<% } %>
								</div>
							</div>
						</div>

						<div id="content-thumbnail-image">
							<img src="https://simg.wooribank.com/img/section/bz/buss_product_noimgb.gif">
						</div>
					</div>
					<div class="cook-steps-input-content">
						<div id="cook-steps-title" class="cook-steps-inner">
							<div id="title-text-area-div">
								레시피 제목
							</div>
						</div>

						<!-- 입력받는 영역 -->
						<div id="cook-steps-ingredient-title" class="cook-steps-inner">
							<!-- 기본 재료 입력받는 양식 -->
							<div id="ingredient-title-div1" class="inputs-in-order">
								<h3>재료</h3>
							</div>
							<div id="cookStepsIngredientContent" class="cook-steps-inner">
							    <div id="ingredientContentLeft">
							        <% for (int i = 0; i < 15; i++) { %>
							            <div id="ingredientContainer<%= i %>" class="ingredientContainer">
							                <div id="ingredientAreaDiv<%= i %>">
							                    재료<%= i %>
							                </div>
							                <div id="ingredientAmountDiv<%= i %>">
							                    000
							                </div>
							                <div id="measureAreaDiv<%= i %>">
							                    g
							                </div>
							            </div>
							        <% } %>
							    </div>
							
							    <div id="ingredientContentRight">
							        <% for (int i = 15; i < 30; i++) { %>
							            <div id="ingredientContainer<%= i %>" class="ingredientContainer">
							                <div id="ingredientAreaDiv<%= i %>">
							                    재료<%= i %>
							                </div>
							                <div id="ingredientAmountDiv<%= i %>">
							                    000
							                </div>
							                <div id="measureAreaDiv<%= i %>">
							                    g
							                </div>
							            </div>
							        <% } %>
							    </div>
							</div>
						</div>
					</div>
				</div>

				<!-- 레시피 과정 입력 틀 (과정사진 + 과정제목 + 과정내용) -->
				<div id="cookingInstructionContainer">
					<% for(int i = 0; i < 6; i++) { %>
						<div id="cookStepsInstInner1">
							<div class="cook-steps-inst-pic">
								<img src="" d>
							</div>
						
							<div class="cook-steps-inst-title">
								<p class="inst-title-lev">1</p><!--
								--><p>요리과정제목</p>
								</button>
							</div>
							<div class="cook-steps-inst-content">
								<p>요리과정 내용</p>
							</div>
						</div>
					<% } %>
					<!--
						아래의 제이쿼리 이벤트로 입력 틀 생성
					-->
				</div>

				<!-- 레시피 작성 요청 / 초기화 버튼 (script로 요청) -->
				<div id="cook-steps-buttons" align="center">
					<div>
						<button type="submit" id="recipe-enrolling-btn" class="btn btn-primary" onclick="return confirmSubmit();">글작성</button>
					</div>
					<div>
						<button type="reset" id="recipe-resetting-btn" onclick="return confirmReset();" class="btn btn-warning">초기화</button>
					</div>
				</div>

				<script>
					// 글작성 요청
					function confirmSubmit() {
						return confirm("글을 작성하시겠습니까?");
					};

					// 초기화 요청 confirm
					function confirmReset() {
						return confirm("입력한 정보를 초기화하시겠습니까?");
					};
				</script>

			</div>
			<!---------------------- 레시피 글 작성 내용 영역 끝 ---------------------->
	
		</form>
		<!---------------------- 글 작성 전체 form 끝 ---------------------->
	</div>
	<!---------------------- 전체 wrap 끝 ---------------------->
</body>
</html>