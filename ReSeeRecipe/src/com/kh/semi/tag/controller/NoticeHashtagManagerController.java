package com.kh.semi.tag.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.tag.model.service.TagService;
import com.kh.semi.tag.model.vo.Tag;

/**
 * Servlet implementation class NoticeHashtagManagerController
 */
@WebServlet("/hlhashtag.tg")
public class NoticeHashtagManagerController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeHashtagManagerController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// 1) GET방식 -> 인코딩x
		
		// 2) 값 뽑기
		
		// 3) 서비스 호출 해시태그명 SELECT 해오기
		ArrayList<Tag> list = new TagService().selectALlTagname();
		
	
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
