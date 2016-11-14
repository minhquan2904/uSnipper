package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.DishInfoDAO;
import DAO.RestaurantDAO;
import DAO.TypeDAO;
import model.DishInfo;
import model.Restaurant;
import model.Type;


@WebServlet("/viewMap.html")
public class viewMapController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public viewMapController() {
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
		
		
		
		req.setAttribute("rts", rts);
		req.setAttribute("type", type);
		req.setAttribute("total", total);
		
		
		req.getRequestDispatcher("/site/viewrtsmap.jsp").forward(req, resp);

	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
