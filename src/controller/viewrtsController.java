package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.RestaurantDAO;
import DAO.TypeDAO;
import model.Restaurant;
import model.Type;


@WebServlet("/viewrts.html")
public class viewrtsController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public viewrtsController() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Integer id = Integer.parseInt( req.getParameter("id"));
		HttpSession session = req.getSession();
		
		RestaurantDAO rdao = new RestaurantDAO();
		TypeDAO tdao = new TypeDAO();
		Restaurant rts = rdao.getInfoById(id);
		Integer tid = rts.getIdLoaiQuanAn();
		Type t = tdao.getTypeNameById(tid);
		String type = t.getTenLoai();
		req.setAttribute("rts", rts);
		req.setAttribute("type", type);
		req.getRequestDispatcher("/site/viewrts.jsp").forward(req, resp);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
	
	}

}
