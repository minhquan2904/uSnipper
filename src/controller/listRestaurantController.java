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
			ArrayList<Restaurant> list = rdao.getListAllRts();
			req.setAttribute("list", list);
			ArrayList<Restaurant> listTD = rdao.getListRtsTD();
			req.setAttribute("listTD", listTD);
			ArrayList<Restaurant> listQ9 = rdao.getListRtsQ9();
			req.setAttribute("listQ9", listQ9);
			
			req.getRequestDispatcher("/site/list-rts.jsp").forward(req, resp);
			session.removeAttribute("success");
		}
		else
		{
			resp.sendRedirect("profile.html");
		}
		
	}

	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html;charset=UTF-8"); 
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		HttpSession session = req.getSession();
		RestaurantDAO dao = new RestaurantDAO();
		Integer id = Integer.parseInt(req.getParameter("id")) ;
		String tenQuanAn = req.getParameter("tenQuanAn");
		Integer soNha = Integer.parseInt(req.getParameter("soNha"));
		String tenDuong = req.getParameter("tenDuong");
		String tenPhuong = req.getParameter("tenPhuong");
		String moTa = req.getParameter("moTa");
		String monNoiTieng = req.getParameter("monNoiTieng");
		
		dao.updateInfo(id, tenQuanAn, soNha, tenDuong, tenPhuong, moTa, monNoiTieng);
		session.setAttribute("success", "success");
		resp.sendRedirect("listRestaurant.html");
		
	}

}
