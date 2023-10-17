package com.kh.semi.category.manager;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.kh.semi.board.recipe.model.service.CategoryService;

/**
 * Servlet implementation class CategortDeleteController
 */
@WebServlet("/jhdelete.ct")
public class CategortDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private CategoryService categoryService;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CategortDeleteController() {
        super();
        categoryService = new CategoryService();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 1) get 인코딩xx
		// 1-1) 형식지정
		// 2) 전달값뽑기 - 배열
//		String[] categoryNoArr = request.getParameterValues("categoryNo");
//		String[] categoryCountArr = request.getParameterValues("categoryCount");
//		System.out.println(categoryNoArr);
//		System.out.println(categoryCountArr);
		String[] categoryNoArr = request.getParameterValues("categoryNo[]");
		String[] categoryCountArr = request.getParameterValues("categoryCount[]");
		
		// null체크
		if(categoryNoArr.length != categoryCountArr.length) {
			return;
		}
		
		JsonArray jArr = new JsonArray();
		
		for(int i = 0; i < categoryNoArr.length; i++) {
			int key = Integer.parseInt(categoryNoArr[i]);
			int val = Integer.parseInt(categoryCountArr[i]);
			int result = categoryService.deleteCategory(key, val);
			
			if(result > 0) {
				jArr.add(key);	// categoryNo으로 tr remove
			}
		}

		// System.out.println(categoryNo);
		// System.out.println(categoryCount);
		
		response.setContentType("application/json; charset=UTF-8");
		new Gson().toJson(jArr, response.getWriter());
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}