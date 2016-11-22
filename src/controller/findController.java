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


@WebServlet("/find.html")
public class findController extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public findController() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String test = (String) req.getAttribute("test");
		System.out.println(test);
		
		
		
	}

	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html;charset=UTF-8"); 
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		HttpSession session = req.getSession();
		Integer type = Integer.parseInt(req.getParameter("mySelect"));
		if(type == 0)
		{
			String address = (String) req.getParameter("myInput");
			String []split = address.split(",");
			Integer soNha = Integer.parseInt(split[0]);
			String tenDuong = split[1];
			tenDuong = tenDuong.trim();
			String tenPhuong = split[2];
			tenPhuong = tenPhuong.trim();
			String tenQuan = split[3];
			tenQuan = tenQuan.trim();
			RestaurantDAO rdao = new  RestaurantDAO();
			
			ArrayList<Restaurant> list = rdao.findRTSByAddress(soNha, tenDuong, tenPhuong, tenQuan);
			
			if(list != null){
				session.removeAttribute("errorM");
				req.setAttribute("listRts", list);
				
				
			}
			if(list.isEmpty())
			{
				session.setAttribute("errorM", "11111");
			
			}
			
			req.getRequestDispatcher("/site/find.jsp").forward(req, resp);
		}
		else
		{
			RestaurantDAO rdao = new  RestaurantDAO();
			
			if(type == 2)
			{
				String tenQuanAn = req.getParameter("myInput");
				ArrayList<Restaurant> list = rdao.findRTSName(tenQuanAn);
				if(list != null){
					session.removeAttribute("errorM");
					req.setAttribute("listRts", list);
					
					
				}
				if(list.isEmpty())
				{
					session.setAttribute("errorM", "11111");
					
				}
				
			}
			if(type == 1)
			{
				String monNoiTieng = req.getParameter("myInput");
				
				ArrayList<Restaurant> list = rdao.findRTSFamous(monNoiTieng);
				if(list != null)
				{
					session.removeAttribute("errorM");
					req.setAttribute("listRts", list);
					
				}
				if(list.isEmpty())
				{
					session.setAttribute("errorM", "11111");
					
				}
				
			}
			
			req.getRequestDispatcher("/site/find.jsp").forward(req, resp);
		}
		
	}

}
