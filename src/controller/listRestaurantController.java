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


@WebServlet("/listRestaurant.html")
public class listRestaurantController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public listRestaurantController() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		
		Integer role = (Integer) session.getAttribute("Quyen");
		if(role == 3)
		{
			RestaurantDAO rdao = new RestaurantDAO();
			ArrayList<Restaurant> listTD = rdao.getListRtsTD();
			req.setAttribute("listTD", listTD);
			ArrayList<Restaurant> listQ9 = rdao.getListRtsQ9();
			req.setAttribute("listQ9", listQ9);
			req.getRequestDispatcher("/site/list-rts.jsp").forward(req, resp);
		}
		else
		{
			resp.sendRedirect("profile.html");
		}
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
