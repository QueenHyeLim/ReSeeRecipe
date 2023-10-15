<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList,
			     java.util.HashMap,
			     com.kh.semi.board.recipe.model.vo.RecipeCategory,
			     com.kh.semi.board.un_recipe.model.vo.UnRecipe" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>레시피 글 작성 양식</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>

<!-- 부트스트랩 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous"></head>


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
	/******************여기부터아직스타일정리X***********************/
	/* 4. 임시저장 입력폼 모달창 세팅 */
	/*
	#unrecipe-modal, #unrecipe-unavailable-modal{
		position: fixed;
		top: 3%;
		left: 30%;
	}
	
	#unrecipe-unavailable-modal .modal-header,
	#unrecipe-modal .modal-header {
		height: 100px;
	}
	#unrecipe-unavailable-modal .modal-header t4,
	#unrecipe-modal .modal-header t4 {
		font-size: 28px;
	}
	
	#unrecipe-unavailable-modal .modal-body,
	#unrecipe-modal .modal-body {
		height: 130px;
		padding: 10px;
	}
	
	#unrecipe-unavailable-modal .modal-body h5,
	#unrecipe-modal .modal-body h5 {
		margin: 10px;
		font-size: 20px;
	}
		
	#unrecipe-unavailable-modal .modal-body p,
	#unrecipe-modal .modal-body p {
		margin: 0px;
		margin-left: 20px;
		margin-bottom: 10px;
		font-size: 15px;
	}
	
	
	#unrecipe-unavailable-modal .modal-content {
		height: 600px;
	}
	#unrecipe-unavailable-modal .modal-footer,
	#unrecipe-modal .modal-footer {
		height: 100px;
		padding: 10px;
	}
	*/


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
		height: 40%;
	}

	#cook-steps-chef > p {
		margin: 0px;
		margin-top: 12px;
		font-size: 20px;
		font-weight: 1000;
		color: rgb(132, 137, 143);
	}

	/* 해시태그 */
	#cook-steps-hashtag {
		height: 60%;
	}

	#cook-steps-hashtag > button {
		width: 90%;
		height: 70%;
		border-radius: 50px;
		border-color: rgb(255, 145, 77);
		margin-top : 12px;
	
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
		width: 55%;
	}

	div[id ^= 'ingredientAmountDiv'] {
		width: 20%;
	}

	div[id ^= measureAreaDiv] {
		width: 15%;
	}

	div[id ^= modifyBtnDiv] {
		width: 10%;
	}

	#cookStepsIngredientContent input, select {
		width: 100%;
		height: 100% !important;
		padding: 0px !important;
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
		color: rgb(89, 164, 255);
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
		padding: 20px 20px 0px 20px;
	}

	#cookingInstructionContainer .inst-title-lev {
		width: 10%;
		height: 100%;
		display: inline-block;
		box-sizing: border-box;
		text-align: center;
		margin: 0px;
		padding-top: 15px;
		padding-right: 20px;
	}

	#cookingInstructionContainer .inst-title-text {
		width: 90%;
		height: 100%;
		box-sizing: border-box;
		padding: 0px;
		float: right;
	}

	/* 요리과정 설명 */
	#cookingInstructionContainer .cook-steps-inst-content {
		width: 100%;
		height: 80%;
		padding: 20px;
	}

	#cookingInstructionContainer .cook-steps-inst-content textarea {
		width: 100%;
		height: 100%;
	}

	#cookingInstructionContainer .cook-steps-inst-content textarea::placeholder {
		text-align: center;
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

			<!---------------------- 입력양식 상단 바 영역 ---------------------->
			<div id="recipe-enroll-top-bar-wrap">
				<!-- 카테고리 선택 영역 -->
				<div id="recipe-enroll-bar-img">
					<i class='fas fa-align-left'></i>
				</div>
				<div id="recipe-enroll-bar-menu">
					<div id="recipe-enroll-bar-inner">
						<select name="recipeCategoryNo">
								<option	value="1">한식</option>
								<option value="2">양식</option>
								<option value="3">중식</option>
								<option value="4">일식</option>
								<option value="5">아시안</option>
								<option value="6">야식</option>
								<option value="7">디저트</option>
								<option value="8">음료</option>
						</select>
					</div>
					<div id="enroll-bar-inner-blank1"></div>
				</div>

				<!-- 임시저장 아이콘 (클릭 시 모달 호출) -->
				<div id="unrecipe-modal-request-div">
					<button type="button" onclick="unrecipeModalRequest(this);"
						class='fas fa-folder' data-toggle="modal" data-target="#">
						<!--임시저장글개수-->
					</button>
				</div>

				<!-- 1. 임시작성 기본 모달 (if else는 script에서 처리) -->
				<!--  글 3개 미만 0, 1, 2개 상태 : 해시태그, 이미지유실 경고 후 임시저장글 작성 -->
				<div class="modal" id="unrecipe-modal">
					<div class="modal-dialog modal-lg">
						<div class="modal-content">

							<div class="modal-header">
								<h4 class="modal-title">임시저장글로 저장합니다.</h4>
								<button type="button" class="close" data-dismiss="modal">&times;</button>
							</div>

							<div class="modal-body">
								<h5>주의! 해시태그와 사진은 저장되지 않습니다.</h5>
								<p>그래도 임시저장글로 저장을 원하시면 저장하기 버튼을 누르세요.</p>
							</div>

							<div class="modal-footer">
								<button type="button" id="unrecipe-enrolling-btn"
									class="btn btn-primary">저장하기</button>
								<button type="button" class="btn btn-danger"
									data-dismiss="modal">취소</button>
							</div>
						</div>
					</div>
				</div>
				<!-- 2. 임시작성 글 3개 이상 시 모달 -->
				<!-- 글 3개 이상 3, 4 . . . 상태 : 모달로 제목 목록띄우면서 '이 글을 지우고 작성' 여부 선택하도록
				 							 -> 선택한 글 지우고 이거 쓰려는게 맞는지, 해시태그와 사진은 저장안된다는 것 더블체크
				  					 		 -> 선택한 임시저장글번호 지우고 + 현재 임시저장글 작성 -->
				<div class="modal" id="unrecipe-unavailable-modal">
					<div class="modal-dialog modal-lg">
						<div class="modal-content">

							<div class="modal-header">
								<h4 class="modal-title">임시저장은 3개까지만 가능합니다!</h4>
								<button type="button" class="close" data-dismiss="modal">&times;</button>
							</div>

							<div class="modal-body">
								<h5>기존 임시저장글을 지운 후 이 글을 저장합니다.</h5>
								<p>아래 목록에서 지울 대상을 선택하세요.</p>
								<p>주의! 해시태그와 사진은 저장되지 않습니다.</p>
									<input type="radio" class="testList" name="unRecipeDelNo1" id="unRecipeDelNo1" value="1" checked><label for="unRecipeDelNo1">레시피제목1</label>
									<input type="radio" class="testList" name="unRecipeDelNo2" id="unRecipeDelNo2" value="2"><label for="unRecipeDelNo2">레시피제목2</label>
									<input type="radio" class="testList" name="unRecipeDelNo3" id="unRecipeDelNo3" value="3"><label for="unRecipeDelNo3">레시피제목3</label>
							</div>
	
							<div class="modal-content"></div>
							<div class="modal-footer">
								<button type="button" id="unrecipe-del-enrolling-btn" class="btn btn-primary">글작성</button>
								<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
							</div>
						</div>
					</div>
				</div>
			</div><!-- 입력양식 상단 바 영역 끝 -->
			<!------------------------------------------ Script (모달) ------------------------------------------>
			<script>
				// 임시저장 아이콘 클릭 시 모달창 설정
				function unrecipeModalRequest(e) {
					console.log(document.getElementsByClassName('.testList'));
					//if(document.getElementsByClassName('.testList').length < 3 ) {
		
						//e.dataset.target = '#unrecipe-modal';
					//} else {
						//e.dataset.target = '#unrecipe-unavailable-modal';
					//}
					alert("d");
				};
			</script>
			<!------------------------------------------ Script ------------------------------------------>

			
		
			<!---------------------- 레시피 글 작성 내용 영역 ---------------------->
			<div id="recipe-enroll-context-wrap">
				
				<!-- 레시피 썸네일 + 제목 + 재료 입력 테이블 -->
				<div id="cook-steps-basic-info">
					<div class="cook-steps-input-content">
						<div id="content-writer-hashtag">
							<div id="cook-steps-chef" class="cook-steps-inner">
								<p><%= loginMember %></p>
							</div>
							<div id="cook-steps-hashtag" class="cook-steps-inner">
								<button type="button" name="tagNo" class="btn btn-info">해시태그입력</button>
							</div>
						</div>
						<div id="content-thumbnail-image">
							<img src="https://simg.wooribank.com/img/section/bz/buss_product_noimgb.gif">
						</div>
					</div>
					<div class="cook-steps-input-content">
						<div id="cook-steps-title" class="cook-steps-inner">
							<div id="title-text-area-div">
								<textarea name="recipeTitle" cols="10" rows="2" placeholder="레시피 제목을 입력하세요" required></textarea>
							</div>
							<div id="title-bytes-span">
								<span>0</span>
								<span>/60 bytes</span>
							</div>
						</div>
						<!-- 입력받는 영역 -->
						<div id="cook-steps-ingredient-title" class="cook-steps-inner">
							<!-- 기본 재료 입력받는 양식 -->
							<div id="ingredient-title-div1" class="inputs-in-order">
								<div id="write-ingredient-input">
									<input type="text" id="ingredientIn" name="ingredient" class="form-control" placeholder="재료입력" maxlength="15" required>
								</div>
								<div id="amount-ingredient-input">
									<input type="text" id="ingredientAmountIn" name="ingredientAmount" class="form-control" placeholder="재료량" maxlength="4" required>
								</div>
								<div id="measurement-ingredient-selection">
									<select id="ingredientMeasureNoIn" name="ingredientMeasureNo" class="custom-select" required>
										<option value="g">g</option>
										<option value="kg">kg</option>
										<option value="lb">lb</option>
										<option value="작은술(t)">작은술(t)</option>
										<option value="큰술(T)">큰술(T)</option>
										<option value="ml">ml</option>
										<option value="L">L</option>
										<option value="컵">컵</option>
										<option value="알">알</option>
										<option value="개">개</option>
										<option value="장">장</option>
									</select>
								</div>
							</div>
							<div id="ingredient-title-div2">
								<button type="button" id="ingredient-title-btn" onclick="addIngredientDisplay();" class="fa fa-plus-square"></button>
							</div>
						</div>
						<div id="cookStepsIngredientContent" class="cook-steps-inner">
							<div id="ingredientContentLeft">
								<!--
								생성된 요소 띄워줄 영역 자바 스크립트로 입력된 재료 요소 추가
								-->
							</div>

							<div id="ingredientContentRight">
								<!--
									생성된 요소 띄워줄 영역 자바 스크립트로 입력된 재료 요소 추가
								-->
							</div>
						</div>
						
					</div>
				</div>
				<!------------------------------------------ Script (바이트 카운트 / 재료입력 디스플레이) ------------------------------------------>
				<script>

					// 타이틀 글자수 바이트 수 세기
					$(function(){
						$('#cook-steps-title textarea').keyup(function(e){
							var textAreaBytes = 0;
							var textArea = $(this).val();
							var numberingSpan = $('#cook-steps-title').find('span').eq(0);
			
							var patternKor = /[ㄱ-ㅎㅏ-ㅣ가-힣]/m;
							var patternBlank = /[\s]/m;
							var patternOne = /[\w~!@#%^&*()_+-=\\$\`\[\]\{\}]/m;
							
							if(textArea.length != 0){
								for(let i = 0; i < textArea.length; i++){
									console.log('d');
									if(textAreaBytes <= 60) {
										textAreaBytesBefore = textAreaBytes;
										if(patternKor.test(textArea.charAt(i))) {
											textAreaBytes += 3;
										}
										else if(patternBlank.test(textArea.charAt(i)) || patternOne.test(textArea.charAt(i))) {
											if(e.key == 'Enter') {
												textAreaBytes += 2;
											}
											else {
												textArea.replace(patternBlank, ' '); // 엔터 외에는 모두 한칸 스페이스로 변경
												textAreaBytes++;
											}
										}
										else {
											textAreaBytes += 3;
										}
										numberingSpan.text(textAreaBytes);
									}
									if(60 < textAreaBytes) { // if처리
										$(this).val(textArea.substring(0, i));
										numberingSpan.text(textAreaBytesBefore);
										alert('더 이상 입력할 수 없습니다!');
										return false;
									}
								}
							}
							else {
								numberingSpan.text(0);
							}
						});
					});
					

					// 재료 입력 디스플레이 생성
					function addIngredientDisplay(){
						
						// 입력된 재료 값 받기
						var ingredientIn = document.getElementById('ingredientIn');
						var ingredientAmountIn = document.getElementById('ingredientAmountIn');
						var ingredientMeasureNoIn = document.getElementById('ingredientMeasureNoIn');

					
						if(ingredientIn.value == '' || ingredientAmountIn.value == '') {
							alert('재료 입력란을 모두 입력하세요');
						} else {
							// 현재 만들어진 ingredientContainer 개수 카운트 (없을때 0부터 시작)
							var count = document.getElementsByClassName('ingredientContainer').length;
							
							if(count <= 30) {
	
								// 생성된 요소 띄워줄 영역
								var anIngredientContent;
								var ingredientContentLeft = document.getElementById('ingredientContentLeft');
								var ingredientContentRight = document.getElementById('ingredientContentRight');
								
								// Container 생성 + 세팅 + append하기
								if(count < 15) {
									anIngredientContent = ingredientContentLeft;
								} else {
									anIngredientContent = ingredientContentRight;
								}
								var ingredientContainer = document.createElement('div');
								ingredientContainer.id = 'ingredientContainer' + count;
								ingredientContainer.classList.add('ingredientContainer');
								anIngredientContent.appendChild(ingredientContainer);
								
								// Container 내부 3파트 전부 세팅
								// 재료칸
								var ingredientAreaDiv = document.createElement('div');
								ingredientAreaDiv.id = 'ingredientAreaDiv' + count;
								ingredientContainer.appendChild(ingredientAreaDiv);
								
								var ingredient = document.createElement('input');
								ingredient.id = 'ingredient' + count;
								ingredient.name = 'ingredient' + count; // 네임
								ingredient.classList = 'form-control';
								ingredient.placeholder = '재료입력';
								ingredient.maxLength = '15';
								ingredient.value = ingredientIn.value;
								ingredientIn.value = null;
								ingredientAreaDiv.appendChild(ingredient);
								
								// 재료량 (숫자)
								var ingredientAmountDiv = document.createElement('div');
								ingredientAmountDiv.id = 'ingredientAmountDiv' + count;
								ingredientContainer.appendChild(ingredientAmountDiv);
								
								var ingredientAmount = document.createElement('input');
								ingredientAmount.id = 'ingredientAmount' + count;
								ingredientAmount.classList = 'form-control';
								ingredientAmount.placeholder = '재료량';
								ingredientAmount.maxLength = '15';
								ingredientAmount.value = ingredientAmountIn.value;
								ingredientAmountIn.value = null;
								ingredientAmountDiv.appendChild(ingredientAmount);
								
								// + 계량단위
								var measureAreaDiv = document.createElement('div');
								measureAreaDiv.id = 'measureAreaDiv' + count;
								ingredientContainer.appendChild(measureAreaDiv);
								
								var ingredientMeasure = document.createElement('select');
								ingredientMeasure.id = 'ingredientMeasure' + count;
								ingredientMeasure.name = 'ingredientMeasure' + count;
								ingredientMeasure.classList = 'custom-select ingredientMeasure';
								ingredientMeasureNoIn
								measureAreaDiv.appendChild(ingredientMeasure);
								
								const optionArr = {
									g : 'g',
									kg : 'kg',
									lb : 'lb',
									pinch : '약간',
									t : '작은술(t)',
									T : '큰술(T)',
									ml : 'ml',
									L : 'L',
									cup : '컵',
									clove : '알',
									ea : '개',
									slice : '장'
								};
								
								// 옵션 생성
								for(optVal in optionArr) {
									var option = document.createElement('option');
									option.value = optionArr[optVal];
									option.innerText = optionArr[optVal];
									ingredientMeasure.appendChild(option);
								};
								
								// 첫요소 required
								if(count == 0) {
									ingredient.required = true;
									ingredientAmount.requred = true;
									ingredientMeasure.required = true;
								}
	
								// 수정 / 삭제버튼 추가
								var modifyBtnDiv = document.createElement('div');
								modifyBtnDiv.id = 'modifyBtnDiv' + count;
								ingredientContainer.appendChild(modifyBtnDiv);
								
								var modifyBtn = document.createElement('button');
								modifyBtn.id = 'modifyBtn' + count;
								modifyBtn.type = 'button';
								modifyBtn.classList = 'fas fa-dice-d6 modify-btn';
								modifyBtnDiv.appendChild(modifyBtn);
							}
						}
					};

					// 생성된 요소들 required걸기
					$('#cookStepsIngredientContent').on('click', '')
					
				</script>
				<!------------------------------------------ Script ------------------------------------------>
				
				


				
				<!-- 레시피 과정 입력 틀 (과정사진 + 과정제목 + 과정내용) -->
				<div id="cookingInstructionContainer">
					<!--
						아래의 제이쿼리 이벤트로 입력 틀 생성
					-->
						<div id="cookStepsInstInnerEnd">
							<button id="instAddBtn" type="button">Add</button>
						</div>
				</div>

				<script>
					$(function(){
						// 첫 재료입력 인풋 / 텍스트아리아 required추가
						$('input[name=cookStepsTitle1]').attr('required', true);
						$('textarea[name=cookStepsContent1]').attr('required', true);
						
						// 버튼 클릭 시 요리과정 받는 창 생성해줌
						// instAddBtn에 클릭이벤트가 일어날 때 마다 앞쪽에 양식 추가 + 전역변수 클릭 카운팅 6개까지 생성
						var $instAddBtnCount = 0;
						$('#instAddBtn').click(function(){
							
							let $insAddStr = '<div id="cookStepsInstInner' + ($instAddBtnCount + 1) + '">'
								+ '<div class="cook-steps-inst-title">'
								+ '<input type="hidden" name="cookStepsLev' + ($instAddBtnCount + 1) + '" value="' + ($instAddBtnCount + 1) + '"><p class="inst-title-lev">' + ($instAddBtnCount + 1) + '</p>'
								+ '<input type="text" name="cookStepsTitle' + ($instAddBtnCount + 1) + '" placeholder="요리과정 제목" class="inst-title-text">'
								+ '</div>'
								+ '<div class="cook-steps-inst-content">'
								+ '<textarea name="cookStepsContent' + ($instAddBtnCount + 1) + '" placeholder="요리과정 설명" cols="30" rows="10" maxlength="500" style="resize: none;"></textarea>'
								+ '</div>'
								+ '</div>';
							let $instAddBtnDetach = $('#cookStepsInstInnerEnd').detach();
							
							$('#cookingInstructionContainer').append($insAddStr, $instAddBtnDetach); // insAddStr과 잘라낸 버튼 Append 후 count++
							$instAddBtnCount++;

							if($instAddBtnCount == 6) { // 카운트 6이면 이벤트, 버튼 제거
								$(this).off('click');
								$('#cookStepsInstInnerEnd').remove();
							}
						});
						
					});
				</script>


				<!-- 레시피 작성 요청 / 초기화 버튼 (script로 요청) -->
				<div id="cook-steps-buttons" align="center">
					<div>
						<button type="button" id="recipe-enrolling-btn" class="btn btn-primary">글작성</button>
					</div>
					<div>
						<button type="reset" id="recipe-resetting-btn" onclick="return confirmReset();" class="btn btn-warning">초기화</button>
					</div>
				</div>
				<script>
					// 초기화, 작성 요청 종류 script

					 // 초기화 요청 confirm
					function confirmReset() {
						return confirm("입력한 정보를 초기화하시겠습니까?");
					};
					
					$(function(){
			
						// 레시피 글 작성요청 form태그 속성 설정 및 submit
						$('#recipe-enrolling-btn').click(function(){
							$('#recipe-enrolling-form').attr('action', '<%= contextPath %>/insertRecipe.re').submit();
						});
						
						// 임시저장글 3개미만 모달창 작성요청 form태그 속성 설정 및 submit
						$('#unrecipe-enrolling-btn').click(function(){
							$('#recipe-enrolling-form').attr('action', '<%= contextPath %>/unRecipeInsert.un').submit();
						});
						
						// 임시저장글 3개이상 모달창 글삭제/작성요청 form태그 속성 설정 및 submit
						$('#unrecipe-del-enrolling-btn').click(function(){
							$('#recipe-enrolling-form').attr('action', '<%= contextPath %>/unRecipeInsertInstead.un').submit();
						})
					});
				</script>



			</div>
			<!---------------------- 레시피 글 작성 내용 영역 끝 ---------------------->
	
		</form>
		<!---------------------- 글 작성 전체 form 끝 ---------------------->
	</div>
	<!---------------------- 전체 wrap 끝 ---------------------->




	
</body>
</html>