package com.kh.semi.board.recipe.model.dao;

import static com.kh.semi.common.JDBCTemplate.close;
import static com.kh.semi.common.JDBCTemplate.doTransAction;
import static com.kh.semi.common.JDBCTemplate.getConnection;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Properties;

import com.kh.semi.board.recipe.model.vo.CookSteps;
import com.kh.semi.board.recipe.model.vo.Ingredient;
import com.kh.semi.board.recipe.model.vo.Recipe;
import com.kh.semi.board.recipe.model.vo.RecipeCategory;
import com.kh.semi.board.recipe.model.vo.RecipePic;
import com.kh.semi.board.recipe.model.vo.RecipeTag;
import com.kh.semi.board.recipe.model.vo.Reply;
import com.kh.semi.common.model.vo.PageInfo;

public class RecipeDao {
	
	private Properties prop = new Properties();
	
	public RecipeDao() {
		String filePath = RecipeDao.class.getResource("/sql/board/recipe-mapper.xml").getPath();
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	/* ************************************************************************** */
	
	
	
	/* ************************** SELECT 종류 ************************** */	
	
	/**
	 * 레시피 번호로 해당 레시피의 레시피테이블(TB_RECIPE) 모든 정보와 작성자 닉네임, 카테고리 번호와 이름을 조회하는 기능
	 * @param conn
	 * @param recipeNo
	 * @return
	 */
	public Recipe selectRecipeSingle(Connection conn, int recipeNo) {
		Recipe recipe = null;
		String sql = prop.getProperty("selectRecipeSingle");
		
		try(PreparedStatement pstmt = conn.prepareStatement(sql)) {
			pstmt.setInt(1, recipeNo);

			try(ResultSet rset = pstmt.executeQuery()) {
				if(rset.next()) {
					recipe = new Recipe();
					recipe.setRecipeNo(rset.getInt("RECIPE_NO"));
					recipe.setRecipeTitle(rset.getString("RECIPE_TITLE"));
					recipe.setRecipeDate(rset.getString("RECIPE_DATE"));
					recipe.setRecipeModified(rset.getString("RECIPE_MODIFIED"));
					recipe.setRecipeStatus(rset.getString("RECIPE_STATUS"));
					recipe.setRecipeCount(rset.getInt("RECIPE_COUNT"));
					recipe.setRecipeWriterNo(rset.getInt("RECIPE_WRITER_NO"));
					recipe.setRecipeCategoryNo(rset.getInt("RECIPE_CATEGORY_NO"));
					recipe.setRecipeCategoryName(rset.getString("RECIPE_CATEGORY_NAME"));
					recipe.setMemNickName(rset.getString("MEM_NICKNAME"));
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return recipe;
	}
	
	
	/**
	 * 레시피 번호로 해당 레시피의 사진테이블(TB_RECIPE_PIC) 모든 정보를 조회하는 기능
	 * @param conn
	 * @param recipeNo
	 * @return
	 */
	public ArrayList<RecipePic> selectRecipePicSingle(Connection conn, int recipeNo) {
		ArrayList<RecipePic> recipePicList = new ArrayList();
		String sql = prop.getProperty("selectRecipePicSingle");
		
		try(PreparedStatement pstmt = conn.prepareStatement(sql)) {
			pstmt.setInt(1, recipeNo);
			
			try(ResultSet rset = pstmt.executeQuery()) {
				while(rset.next()) {
					RecipePic recipePic = new RecipePic();
					recipePic.setRecipePicNo(rset.getInt("RECIPE_PIC_NO"));
					recipePic.setRecipePicNameOrigin(rset.getString("RECIPE_PIC_NAME_ORIGIN"));
					recipePic.setRecipePicNameUpload(rset.getString("RECIPE_PIC_NAME_UPLOAD"));
					recipePic.setRecipePicPath(rset.getString("RECIPE_PIC_PATH"));
					recipePic.setRecipePicDate(rset.getString("RECIPE_PIC_DATE"));
					recipePic.setRecipePicLev(rset.getInt("RECIPE_PIC_LEV"));
					recipePic.setRecipePicStatus(rset.getString("RECIPE_PIC_STATUS"));
					recipePic.setRefRno(rset.getInt("REF_RNO"));
					recipePicList.add(recipePic);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return recipePicList;
	}
	
	
	/**
	 * 레시피 번호로 해당 레시피의 재료테이블(TB_INGREDIENT) 모든 정보를 조회하는 기능
	 * @param conn
	 * @param recipeNo
	 * @return
	 */
	public ArrayList<Ingredient> selectIngredientSingle(Connection conn, int recipeNo) {
		ArrayList<Ingredient> ingredientList = new ArrayList();
		String sql = prop.getProperty("selectIngredientSingle");
		
		try(PreparedStatement pstmt = conn.prepareStatement(sql)) {
			pstmt.setInt(1, recipeNo);
			
			try(ResultSet rset = pstmt.executeQuery()) {
				while(rset.next()) {
					Ingredient ingredient = new Ingredient();
					ingredient.setIngredientNo(rset.getInt("INGREDIENT_NO"));
					ingredient.setIngredient(rset.getString("INGREDIENT"));
					ingredient.setIngredientAmount(rset.getString("INGREDIENT_AMOUNT"));
					ingredient.setRecipeNo(rset.getInt("RECIPE_NO"));
					ingredientList.add(ingredient);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return ingredientList;
	}
	
	
	/**
	 * 레시피 번호로 해당 레시피의 요리 과정 테이블(TB_COOK_STEPS) 모든 정보를 조회하는 기능
	 * @param conn
	 * @param recipeNo
	 * @return
	 */
	public ArrayList<CookSteps> selectCookStepsSingle(Connection conn, int recipeNo) {
		ArrayList<CookSteps> cookStepsList = new ArrayList();
		String sql = prop.getProperty("selectCookStepsSingle");
		try(PreparedStatement pstmt = conn.prepareStatement(sql)) {
			pstmt.setInt(1, recipeNo);
			
			try(ResultSet rset = pstmt.executeQuery()) {
				while(rset.next()) {
					CookSteps cooksteps = new CookSteps();
					cooksteps.setCookStepsNo(rset.getInt("COOK_STEPS_NO"));
					cooksteps.setCookStepsTitle(rset.getString("COOK_STEPS_TITLE"));
					cooksteps.setCookStepsContent(rset.getString("COOK_STEPS_CONTENT"));
					cooksteps.setCookStepsLev(rset.getInt("COOK_STEPS_LEV"));
					cooksteps.setRecipeNo(rset.getInt("RECIPE_NO"));
					cookStepsList.add(cooksteps);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cookStepsList;
	}
	
	
	/**
	 * 레시피 번호로 해당 레시피의 해시태그 테이블(TB_RECIPE_TAG) 모든 정보와 해시태그 이름, 날짜를 조회하는 기능
	 * @param conn
	 * @param recipeNo
	 * @return
	 */
	public ArrayList<RecipeTag> selectRecipeTagSingle(Connection conn, int recipeNo) {
		ArrayList<RecipeTag> recipeTagList = new ArrayList();
		String sql = prop.getProperty("selectRecipeTagSingle");
		
		try(PreparedStatement pstmt = conn.prepareStatement(sql)) {
			pstmt.setInt(1, recipeNo);
			
			try(ResultSet rset = pstmt.executeQuery()) {
				while(rset.next()) {
					RecipeTag recipeTag = new RecipeTag();
					recipeTag.setTagNo(rset.getInt("TAG_NO"));
					recipeTag.setTagRecipeNo(rset.getInt("TAG_RECIPE_NO"));
					recipeTag.setTagName(rset.getString("TAG_NAME"));
					recipeTag.setTagDate(rset.getString("TAG_DATE"));
					recipeTagList.add(recipeTag);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return recipeTagList;
	}
	
	
	/**
	 * 특정 번호 레시피(PK)에 달린 댓글 리스트를 조회하는 기능<br>
	 */
	public ArrayList<Reply> selectReplyListSingle(Connection conn, int recipeNo) {
		ArrayList<Reply> replyList = new ArrayList();
		String sql = prop.getProperty("selectReplyListSingle");
		
		try(PreparedStatement pstmt = conn.prepareStatement(sql)) {
			pstmt.setInt(1, recipeNo);
			
			try(ResultSet rset = pstmt.executeQuery()) {
				while(rset.next()) {
					Reply reply = new Reply();
					reply.setReplyNo(rset.getInt("REPLY_NO"));
					reply.setReplyContent(rset.getString("REPLY_CONTENT"));
					reply.setReplyDate(rset.getString("REPLY_DATE"));
					reply.setReplyModified(rset.getString("REPLY_MODIFIED"));
					reply.setReplyWriterNo(rset.getInt("REPLY_WRITER_NO"));
					reply.setRecipeNo(rset.getInt("RECIPE_NO"));
					reply.setMemNickname(rset.getString("MEM_NICKNAME"));
					replyList.add(reply);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return replyList;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	/**
	 * 레시피 카테고리 목록을 조회해 반환
	 * @param conn : Connection객체
	 * @return : 레시피 카테고리 목록이 담긴 ArrayList배열
	 */
	public ArrayList<RecipeCategory> selectRecipeCategoryList(Connection conn) {
		
		ArrayList<RecipeCategory> cList = new ArrayList();
		String sql = prop.getProperty("selectRecipeCategoryList");
		
		try(PreparedStatement pstmt = conn.prepareStatement(sql);
				ResultSet rset = pstmt.executeQuery()) {
			while(rset.next()) {
				RecipeCategory rc = new RecipeCategory();
				rc.setRecipeCategoryNo(rset.getInt("RECIPE_CATEGORY_NO"));
				rc.setRecipeCategoryName(rset.getString("RECIPE_CATEGORY_NAME"));
				cList.add(rc);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cList;
	}
	
	
	/**
	 * 레시피 개수 조회
	 * @param conn : Connection객체
	 * @return : 글과 작성자의 STATUS가 유효한 레시피글의 총 개수
	 */
	public int selectRecipeListCount(Connection conn) {
		
		int listCount = 0;
		String sql = prop.getProperty("selectRecipeListCount");
		
		try(PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rset = pstmt.executeQuery()) {
				if(rset.next()) {
					listCount = rset.getInt("COUNT(*)");
				}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return listCount;
	}
	
	
	/**
	 * 레시피 메인 보기 기능, 페이지네이션 처리 된 레시피목록을 최신순(레시피 PK번호순)으로 조회한 후<br>
	 * 목록과 PageInfo객체를 RecipeMainView로 포워딩함
	 * @param conn : Connection객체
	 * @param pi : 페이지네이션 처리를 위한 정보가 담긴 PageInfo객체<br>
	 * @return
	 */
	public ArrayList<Recipe> selectRecipeList(Connection conn, PageInfo pi) {
		
		ArrayList<Recipe> recipeList = new ArrayList();
		String sql = prop.getProperty("selectRecipeList");
		
		try(PreparedStatement pstmt = conn.prepareStatement(sql);) {
			
			pstmt.setInt(1, pi.getStartRow());
			pstmt.setInt(2, pi.getEndRow());
			
			try(ResultSet rset = pstmt.executeQuery()) {
				while(rset.next()) {
					Recipe recipe = new Recipe();
					recipe.setRecipeNo(rset.getInt("RECIPE_NO"));
					recipe.setRecipeTitle(rset.getString("RECIPE_TITLE"));
					recipe.setRecipeCount(rset.getInt("RECIPE_COUNT"));
					recipe.setTitleImg(rset.getString("TITLEIMG"));
					recipe.setMemNickName(rset.getString("MEM_NICKNAME"));
					recipe.setHtCount(rset.getInt("HT_COUNT"));
					recipeList.add(recipe);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return recipeList;
	}
	
	
	
	
	
	/* ************************** UPDATE 종류 ************************** */
	
	/**
	 * 요청된 번호의 리플 상태를 N으로 바꾸는 기능
	 * @param conn
	 * @param recipeNo
	 * @return
	 */
	public int deleteReqReplySingle(Connection conn, Reply reply) {
		int result = 0;
		String sql = prop.getProperty("deleteReqReplySingle");
		
		try(PreparedStatement pstmt = conn.prepareStatement(sql)) {
			pstmt.setInt(1, reply.getReplyNo());
			pstmt.setInt(2, reply.getRecipeNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	
	/* ************************** INSERT종류 ************************** */
	/**
	 * 레시피 제목, 작성자 이름, 레시피 카테고리 정보를 받아 레시피를 INSERT하는 기능<br>
	 * PK종류는 모두 시퀀스로 생성/참조되며 나머지 정보들에는 아래와 같이 테이블의 Default값이 들어감<br>
	 * RECIPE_DATE(SYSDATE), REICPE_MODIFIED(SYSDATE), RECIPE_STATUS('Y'), RECIPE_COUNT(0)
	 * @param conn : Connection객체
	 * @param recipe : Recipe객체<br>
	 * recipeTitle, recipeWriterNo, recipeCategoryNo필드들이 초기화 된 상태
	 * @return :
	 * INSERT구문 수행이 성공한 행의 개수
	 */
	public int insertRecipe(Connection conn, Recipe recipe) {
		int result = 0;
		String sql = prop.getProperty("insertRecipe");
		try(PreparedStatement pstmt = conn.prepareStatement(sql)) {
			pstmt.setString(1, recipe.getRecipeTitle());
			pstmt.setInt(2, recipe.getRecipeWriterNo());
			pstmt.setInt(3, recipe.getRecipeCategoryNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	
	/**
	 * 레시피 사진 원본명, 수정본명, 경로, 레벨(순서넘버링) 정보가 담긴 ArrayList를 받아<br>
	 * ArrayList에 값이 존재하는 동안 반복하며 레시피 사진을 INSERT하는 기능<br>
	 * PK종류는 모두 시퀀스로 생성/참조되며 나머지 정보들에는 아래와 같이 테이블의 Default값이 들어감<br>
	 * RECIPE_PIC_DATE(SYSDATE), RECIPE_PIC_STATUS('Y')
	 * @param conn : Connection객체
	 * @param recipePicList : RecipePic리터럴의 ArrayList<br>
	 * 내부 각 객체의 recipePicNameOrigin, recipePicNameUpload, recipePicPath, recipePicLev필드들이 초기화된 상태
	 * @return :
	 * INSERT구문 수행이 성공한 행의 개수
	 */
	public int insertRecipePic(Connection conn, ArrayList<RecipePic> recipePicList) {
		// 1로 초기화 후 executeUpdate결과를 곱함 => 하나라도 실패 시 0반환
		int result = 1;
		String sql = prop.getProperty("insertRecipePic");
		
		for(RecipePic recipePic : recipePicList) {
			try(PreparedStatement pstmt = conn.prepareStatement(sql)) {
				pstmt.setString(1, recipePic.getRecipePicNameOrigin());
				pstmt.setString(2, recipePic.getRecipePicNameUpload());
				pstmt.setString(3, recipePic.getRecipePicPath());
				pstmt.setInt(4, recipePic.getRecipePicLev());
				
				result *= pstmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return result;
	}

	
	/**
	 * 레시피 재료, 재료량 정보가 담긴 ArrayList를 받아<br>
	 * ArrayList에 값이 존재하는 동안 반복하며 레시피 사진을 INSERT하는 기능<br>
	 * PK종류는 모두 시퀀스로 생성/참조됨<br>
	 * @param conn : Connection객체
	 * @param ingredientList : Ingredient리터럴의 ArrayList<br>
	 * 내부 각 객체의 ingredient, ingredientAmount 필드들이 초기화된 상태
	 * @return :
	 * INSERT구문 수행이 성공한 행의 개수
	 */
	public int insertIngredient(Connection conn, ArrayList<Ingredient> ingredientList) {
		// 1로 초기화 후 executeUpdate결과를 곱함 => 하나라도 실패 시 0반환
		int result = 1;
		String sql = prop.getProperty("insertIngredient");
		
		for(Ingredient ingredient : ingredientList) {
			try(PreparedStatement pstmt = conn.prepareStatement(sql)) {
				pstmt.setString(1, ingredient.getIngredient());
				pstmt.setString(2, ingredient.getIngredientAmount());
				
				result *= pstmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return result;
	}
	 
	 
	/**
	 * 요리 과정 타이틀, 과정 내용, 레벨(순서 넘버링) 정보가 담긴 ArrayList를 받아<br>
	 * ArrayList에 값이 존재하는 동안 반복하며 레시피 사진을 INSERT하는 기능<br>
	 * PK종류는 모두 시퀀스로 생성/참조되며 나머지 정보들에는 아래와 같이 테이블의 Default값이 들어감<br>
	 * COOK_STEPS_LEV(1)
	 * @param conn : Connection객체
	 * @param cookStepsList : CookSteps리터럴의 ArrayList<br>
	 * 내부 각 객체의 필드들이 초기화된 상태
	 * @return :
	 * INSERT구문 수행이 성공한 행의 개수
	 */
	public int insertCookSteps(Connection conn, ArrayList<CookSteps> cookStepsList) {
		// 1로 초기화 후 executeUpdate결과를 곱함 => 하나라도 실패 시 0반환
		int result = 1;
		String sql = prop.getProperty("insertCookSteps");
		
		for(CookSteps cookSteps : cookStepsList) {
			try(PreparedStatement pstmt = conn.prepareStatement(sql)) {
				pstmt.setString(1, cookSteps.getCookStepsTitle());
				pstmt.setString(2, cookSteps.getCookStepsContent());
				pstmt.setInt(3, cookSteps.getCookStepsLev());
				
				result *= pstmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return result;
	}
	
	
	/**
	 * 레시피 태그 번호 정보가 담긴 ArrayList를 받아<br>
	 * ArrayList에 값이 존재하는 동안 반복하며 레시피 사진을 INSERT하는 기능<br>
	 * PK종류는 모두 시퀀스로 생성/참조됨<br>
	 * @param conn : Connection객체
	 * @param tagNoList : Integer리터럴의 ArrayList<br>
	 * 내부 각 객체의 필드들이 초기화된 상태
	 * @return :
	 * INSERT구문 수행이 성공한 행의 개수
	 */
	public int insertRecipeTag(Connection conn, ArrayList<Integer> tagNoList) {
		// 1로 초기화 후 executeUpdate결과를 곱함 => 하나라도 실패 시 0반환
		int result = 1;
		String sql = prop.getProperty("insertRecipeTag");
		
		for(int tagNo : tagNoList) {
			try(PreparedStatement pstmt = conn.prepareStatement(sql)) {
				pstmt.setInt(1, tagNo);
				
				result *= pstmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return result;
	}
	
	
	/**
	 * 특정 번호 레시피(PK)에 댓글을 입력하는 기능
	 * @param reply : replyContent, memNo, recipeNo필드가 초기화된 Reply객체
	 */
	public int insertReply(Connection conn, Reply reply) {
		int result = 0;
		String sql = prop.getProperty("insertReply");
		
		try(PreparedStatement pstmt = conn.prepareStatement(sql)) {
			pstmt.setString(1, reply.getReplyContent());
			pstmt.setInt(2, reply.getReplyWriterNo());
			pstmt.setInt(3, reply.getRecipeNo());
			
			result = pstmt.executeUpdate();		
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	/*
	public ArrayList<UnRecipe> selectUnRecipeForModal(Connection conn, int memNo) {
		
		ArrayList<UnRecipe> uList = new ArrayList();
		String sql = prop.getProperty("selectUnRecipeForModal");
		
		try(PreparedStatement pstmt = conn.prepareStatement(sql)) {
			
			pstmt.setInt(1, memNo);
			
			try(ResultSet rset = pstmt.executeQuery()) {
				while(rset.next()) {
					UnRecipe ur = new UnRecipe();
					ur.setUnRecipeNo(rset.getInt("UN_RECIPE_NO"));
					ur.setUnRecipeTitle(rset.getString("UN_RECIPE_TITLE"));
					uList.add(ur);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return uList;
	}
	*/
	
	
	
	
	
	
	
	
	
}//class.end