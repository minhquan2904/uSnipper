package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.CommentDAO;
import model.Comment;


@WebServlet("/list-comment.html")
public class listCommentController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public listCommentController() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		Integer id = Integer.parseInt( req.getParameter("id"));
		HttpSession session = req.getSession();
		
		Integer role = (Integer) session.getAttribute("Quyen") ;
		if(role == 3)
		{
			CommentDAO cdao = new CommentDAO();
			ArrayList<Comment> listOK=new ArrayList<>();
			listOK = cdao.loadCommentByRtsId(id);
			ArrayList<Comment> listWait=new ArrayList<>();
			listWait = cdao.loadWaitCommentByRtsId(id);
			if(!listOK.isEmpty())
			{
				req.setAttribute("listOK", listOK);
			}
			
			if(!listWait.isEmpty())
			{
				req.setAttribute("listWait", listWait);
			}
			
			req.getRequestDispatcher("/site/list-comment.jsp").forward(req, resp);
		}
		else
		{
			resp.sendRedirect("profile.html");
		}
		
	}


	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		boolean ajax = "XMLHttpRequest".equals(req.getHeader("X-Requested-With"));
		if(ajax)
		{
			Integer id = Integer.parseInt(req.getParameter("id"));
			Integer status = Integer.parseInt(req.getParameter("status"));
			
			CommentDAO cdao = new CommentDAO();
			cdao.updateStatus(id, status);
			
			String json="";
			json = "{\"result\": \"success\",\"id\": \""+id+"\"}";
			resp.getWriter().write(json);
		}
	}

}
