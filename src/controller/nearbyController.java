package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.LocationDAO;
import model.Restaurant;


@WebServlet("/nearby.html")
public class nearbyController extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public nearbyController() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		try {
			Double lat = Double.parseDouble(req.getParameter("lat"));
			Double lng = Double.parseDouble(req.getParameter("lng"));
			session.removeAttribute("lat");
			session.removeAttribute("lng");
			session.setAttribute("lat", lat);
			session.setAttribute("lng", lng);
			req.setAttribute("hasLct", "1");
				LocationDAO ldao = new LocationDAO();
				ArrayList<Restaurant> list = ldao.getListNearBy(lat, lng);
				req.setAttribute("list", list);
				
				System.out.println(lat + " " + lng);
				System.out.println(list.size());
				req.getRequestDispatcher("/site/nearby.jsp").forward(req, resp);
			
		} catch (Exception e) {
			session.setAttribute("lat", "0");
			session.setAttribute("lng", "0");
			req.removeAttribute("hasLct");
			req.getRequestDispatcher("/site/nearby.jsp").forward(req, resp);
		}
		
		
		
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	}

}
