package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.DishDAO;
import model.Dish;


@WebServlet("/add-new-dish.html")
public class addNewDishController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public addNewDishController() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		DishDAO dao = new DishDAO();
		ArrayList<Dish> list = dao.getListDish();
		req.setAttribute("list", list); 
		req.getRequestDispatcher("/site/list-dish.jsp").forward(req, resp);
		
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html;charset=UTF-8"); 
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		HttpSession session = req.getSession();
		session.removeAttribute("hasD");
		session.removeAttribute("scs");
		String tenMonAn = req.getParameter("dname");
		DishDAO dao = new DishDAO();
		if(dao.hasDish(tenMonAn))
		{
			session.setAttribute("hasD", "Đã tồn tại món ăn");
			resp.sendRedirect("add-new-dish.html");
		}
		else{
			
			dao.insertDish(tenMonAn);
			session.setAttribute("scs", "thêm thành công");
			resp.sendRedirect("profile.html");
		}
	}

}
