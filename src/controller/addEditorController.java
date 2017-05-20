package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.UserDAO;
import model.User;


@WebServlet("/admin/add-editor.html")
public class addEditorController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public addEditorController() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		UserDAO udao = new UserDAO();
		ArrayList<User> listActive = udao.getListActiveEditorAdmin();
	
		if(!listActive.isEmpty())
		{
			req.setAttribute("listActive", listActive);
		}
		
		req.getRequestDispatcher("/site/add-editor.jsp").forward(req, resp);
	}

	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		boolean ajax = "XMLHttpRequest".equals(req.getHeader("X-Requested-With"));
		if(ajax)
		{
			UserDAO udao = new UserDAO();
			String userName = req.getParameter("username");
			String pass = req.getParameter("password");
			Integer role = Integer.parseInt(req.getParameter("role"));
			String json = "";
			if(UserDAO.hasUser(userName))
			{
				json = "{\"result\": \"fail\",\"type\":\"hasUser\"}";
			}
			else
			{
				User user = new User();
				user.setUserName(userName);
				user.setPass(pass);
				user.setQuyen(role);
				user.setTenNguoiDung("default");
				
				if(udao.insertUser(user))
				{
					json = "{\"result\": \"success\"}";
				}
				else
				{
					json = "{\"result\": \"fail\",\"type\":\"exeption\"}";
				}
			}
			resp.getWriter().write(json);
		}
	}

}
