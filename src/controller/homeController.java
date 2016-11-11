package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.RestaurantDAO;
import model.Restaurant;


@WebServlet("/home.html")
public class homeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public homeController() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		
		RestaurantDAO rdao = new RestaurantDAO();
		ArrayList<Restaurant> listRts = rdao.getTop4RTS();
		session.setAttribute("listRts", listRts);
		req.getRequestDispatcher("/site/Index.jsp").forward(req, resp);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
