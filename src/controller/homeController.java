package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



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

		
		RestaurantDAO rdao = new RestaurantDAO();
		ArrayList<Restaurant> listRts = rdao.getTopRTS();
		req.setAttribute("listRts", listRts);
		
		ArrayList<Restaurant> listnew = rdao.getNewRts();
		req.setAttribute("listnew", listnew);
		req.getRequestDispatcher("/site/Index.jsp").forward(req, resp);
		
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
