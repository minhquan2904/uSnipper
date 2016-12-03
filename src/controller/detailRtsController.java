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
import DAO.DishDAO;
import DAO.DishInfoDAO;
import DAO.RestaurantDAO;
import model.Comment;
import model.DishInfo;
import model.Restaurant;


@WebServlet("/detailRts.html")
public class detailRtsController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public detailRtsController() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Integer id =Integer.parseInt(req.getParameter("id")) ;
		
		DishInfoDAO dao = new DishInfoDAO();
		ArrayList<DishInfo> list = dao.getImgByRtsId(id);
		RestaurantDAO rdao = new RestaurantDAO();
		String rtsname = rdao.getInfoById(id).getTenQuanAn();
		req.setAttribute("rtsname", rtsname);
		req.setAttribute("list", list);
		req.setAttribute("rtsid", id);
		
		HttpSession session = req.getSession();
		req.getRequestDispatcher("/site/rtsdetail.jsp").forward(req, resp);
		session.removeAttribute("udscs");
		session.removeAttribute("hasDish");
		session.removeAttribute("oldscs");
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html;charset=UTF-8"); 
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		Integer rtsid = Integer.parseInt(req.getParameter("rtsid"));
		Integer dishid = Integer.parseInt(req.getParameter("dishid"));
		Integer money = Integer.parseInt(req.getParameter("money"));
		
		DishInfoDAO dao = new DishInfoDAO();
		
		boolean ajax = "XMLHttpRequest".equals(req.getHeader("X-Requested-With"));
		if(ajax)
		{
			dao.updateInfo(rtsid, dishid, money);
			String json="";
			
			json = "{\"result\": \"success\"}";
			
			resp.getWriter().write(json);
		}
		
	}

}
