package com.kh.semi.dm.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.dm.model.service.DmService;
import com.kh.semi.dm.model.vo.Dm;

/**
 * Servlet implementation class DmInsertController
 */
@WebServlet("/jhupdate.dm")
public class DmUpdateReplyController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private DmService dmService;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DmUpdateReplyController() {
        super();
        dmService = new DmService();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 1) post
		request.setCharacterEncoding("UTF-8");
		
		// 2) 전달값
		String dmReply = request.getParameter("dmReply");
		int dmNo = Integer.parseInt(request.getParameter("dmNo"));
		
		// 3) 데이터 가공
		Dm dm = new Dm();
		dm.setDmReply(dmReply);
		dm.setDmNo(dmNo);
		
		// 4)
		int result = dmService.updateReply(dm);
		
		// 5)
		if(result > 0) {
			request.getSession().setAttribute("successMsg", "쪽지 답변이 완료되었습니다!");
		} else {
			request.getSession().setAttribute("failMsg", "쪽지 답변에 실패했습니다! 다시시도해주세요");
		}
		response.sendRedirect(request.getContextPath() + "/jhselect.dm");
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}