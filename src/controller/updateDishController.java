package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.DishDAO;


@WebServlet("/updateDish.html")
public class updateDishController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public updateDishController() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html;charset=UTF-8"); 
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		DishDAO dao = new DishDAO();
		Integer id = Integer.parseInt(req.getParameter("idD"));
		String tenMonAn = req.getParameter("nameD");
		
		dao.updateDish(id, tenMonAn);
		resp.sendRedirect("add-new-dish.html");
		
	}

}
