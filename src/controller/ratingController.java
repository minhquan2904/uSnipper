package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.RatingDAO;

/**
 * Servlet implementation class ratingController
 */
@WebServlet("/rating.html")
public class ratingController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ratingController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		String userName = req.getParameter("usn");
		Integer id =Integer.parseInt(req.getParameter("id")) ;
		Integer cur = Integer.parseInt(req.getParameter("cur"));
		boolean ajax = "XMLHttpRequest".equals(req.getHeader("X-Requested-With"));
    	if (ajax){
    		System.out.println("PoST AJAAX");
    		resp.setContentType("application/json");
    		String json = "";
    		RatingDAO rdao = new RatingDAO();
    		if(!rdao.hasRate(userName, id))
    		{
    			json = "{\"result\": \"success\"}";
    			rdao.insertRate(userName, id, cur);
    			rdao.updateRate(id);
    		}
    		else
    		{
    			json = "{\"result\": \"fail\"}";
    		}
    		
    		resp.getWriter().write(json);
    	}
		
		
	}

}
