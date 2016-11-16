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
import DAO.RestaurantDAO;
import model.Dish;


@WebServlet("/addDishToRts.html")
public class addDishToRtsController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public addDishToRtsController() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		DishDAO dao = new DishDAO();
		ArrayList<Dish> list = dao.getListDish();
		String rname = (String) session.getAttribute("rname");
		RestaurantDAO rdao = new RestaurantDAO();
		Integer id =  rdao.getIdByName(rname);
		req.setAttribute("list", list);
		req.getRequestDispatcher("/site/add-dish-torst.jsp").forward(req, resp);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
