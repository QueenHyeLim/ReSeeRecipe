package com.kh.semi.board.recipe.model.vo;

public class Recipe {
	
	/*
	RECIPE_NO	NUMBER
	RECIPE_TITLE	VARCHAR2(60 BYTE)
	RECIPE_DATE	DATE
	RECIPE_MODIFIED	DATE
	RECIPE_STATUS	VARCHAR2(1 BYTE)
	RECIPE_COUNT	NUMBER
	RECIPE_WRITER_NO	NUMBER
	RECIPE_CATEGORY_NO	NUMBER
	*/
	
	private int recipeNo;
	private String recipeTitle;
	private String recipeDate;
	private String recipeModified;
	private String recipeStatus;
	private int recipeCount;
	private int recipeWriterNo;
	private int recipeCategoryNo;
	private String titleImg;
	
	public Recipe() {
		super();
	}

	public Recipe(int recipeNo, String recipeTitle, String recipeDate, String recipeModified, String recipeStatus,
			int recipeCount, int recipeWriterNo, int recipeCategoryNo, String titleImg) {
		super();
		this.recipeNo = recipeNo;
		this.recipeTitle = recipeTitle;
		this.recipeDate = recipeDate;
		this.recipeModified = recipeModified;
		this.recipeStatus = recipeStatus;
		this.recipeCount = recipeCount;
		this.recipeWriterNo = recipeWriterNo;
		this.recipeCategoryNo = recipeCategoryNo;
		this.titleImg = titleImg;
	}

	
	public int getRecipeNo() {
		return recipeNo;
	}

	public void setRecipeNo(int recipeNo) {
		this.recipeNo = recipeNo;
	}

	public String getRecipeTitle() {
		return recipeTitle;
	}

	public void setRecipeTitle(String recipeTitle) {
		this.recipeTitle = recipeTitle;
	}

	public String getRecipeDate() {
		return recipeDate;
	}

	public void setRecipeDate(String recipeDate) {
		this.recipeDate = recipeDate;
	}

	public String getRecipeModified() {
		return recipeModified;
	}

	public void setRecipeModified(String recipeModified) {
		this.recipeModified = recipeModified;
	}

	public String getRecipeStatus() {
		return recipeStatus;
	}

	public void setRecipeStatus(String recipeStatus) {
		this.recipeStatus = recipeStatus;
	}

	public int getRecipeCount() {
		return recipeCount;
	}

	public void setRecipeCount(int recipeCount) {
		this.recipeCount = recipeCount;
	}

	public int getRecipeWriterNo() {
		return recipeWriterNo;
	}

	public void setRecipeWriterNo(int recipeWriterNo) {
		this.recipeWriterNo = recipeWriterNo;
	}

	public int getRecipeCategoryNo() {
		return recipeCategoryNo;
	}

	public void setRecipeCategoryNo(int recipeCategoryNo) {
		this.recipeCategoryNo = recipeCategoryNo;
	}

	public String getTitleImg() {
		return titleImg;
	}

	public void setTitleImg(String titleImg) {
		this.titleImg = titleImg;
	}

	
	@Override
	public String toString() {
		return "Recipe [recipeNo=" + recipeNo + ", recipeTitle=" + recipeTitle + ", recipeDate=" + recipeDate
				+ ", recipeModified=" + recipeModified + ", recipeStatus=" + recipeStatus + ", recipeCount="
				+ recipeCount + ", recipeWriterNo=" + recipeWriterNo + ", recipeCategoryNo=" + recipeCategoryNo
				+ ", titleImg=" + titleImg + "]";
	}
	

}//class.end
