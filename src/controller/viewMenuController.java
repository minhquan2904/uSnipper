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
import DAO.DishInfoDAO;
import DAO.RestaurantDAO;
import DAO.TypeDAO;
import model.Comment;
import model.DishInfo;
import model.Restaurant;
import model.Type;

/**
 * Servlet implementation class viewMenuController
 */
@WebServlet("/viewmenu.html")
public class viewMenuController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public viewMenuController() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		Integer id = (Integer) session.getAttribute("id");
		RestaurantDAO rdao = new RestaurantDAO();
		
		
		Integer total = rdao.getTotalcommentById(id);
		TypeDAO tdao = new TypeDAO();
		
		Restaurant rts = rdao.getInfoById(id);
		Integer tid = rts.getIdLoaiQuanAn();
		Type t = tdao.getTypeNameById(tid);
		String type = t.getTenLoai();
		
		DishInfoDAO dao = new DishInfoDAO();
		ArrayList<DishInfo> list = dao.getImgByRtsId(id);
		
		req.setAttribute("rts", rts);
		req.setAttribute("type", type);
		req.setAttribute("total", total);
		req.setAttribute("list", list);
		
		req.getRequestDispatcher("/site/view-rts-menu.jsp").forward(req, resp);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
