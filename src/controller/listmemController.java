package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sun.xml.internal.bind.v2.runtime.Name;

import DAO.UserDAO;
import model.User;


@WebServlet("/list-mem.html")
public class listmemController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public listmemController() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/site/list-mem.jsp").forward(req, resp);
	}

	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html;charset=UTF-8"); 
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		UserDAO udao = new UserDAO();
		String userName = req.getParameter("name");
		if(!userName.isEmpty())
		{
			System.out.println("not null");
			try {
				ArrayList<User> list = udao.findUserByUsnForAdmin(userName);
				if(list == null)
				{
					req.setAttribute("null", "null");
					
				}
				else
				{
					req.setAttribute("list", list);
				}
			} catch (SQLException e) {
				
			}
			
		}
		
		req.getRequestDispatcher("/site/list-mem.jsp").forward(req, resp);
	}

}
