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
import DAO.RestaurantDAO;
import DAO.TypeDAO;
import model.Comment;
import model.Restaurant;
import model.Type;
import model.User;

@WebServlet("/viewrts.html")
public class viewrtsController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public viewrtsController() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Integer id = Integer.parseInt( req.getParameter("id"));
		HttpSession session = req.getSession();
		
		RestaurantDAO rdao = new RestaurantDAO();
		rdao.updateView(id);
		
		Integer total = rdao.getTotalcommentById(id);
		TypeDAO tdao = new TypeDAO();
		
		Restaurant rts = rdao.getInfoById(id);
		Integer tid = 1;
		Type t = tdao.getTypeNameById(tid);
		String type = t.getTenLoai();
		
		CommentDAO cdao = new CommentDAO();
		ArrayList<Comment> list=new ArrayList<>();
		list = cdao.loadCommentByRtsId(id);
		
		req.setAttribute("rts", rts);
		session.setAttribute("id", id);
		req.setAttribute("type", type);
		req.setAttribute("total", total);
		req.setAttribute("list", list);
		
		req.getRequestDispatcher("/site/viewrts.jsp").forward(req, resp);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
	
	}

}
