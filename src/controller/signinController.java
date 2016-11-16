package controller;


import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.User;
import DAO.UserDAO;;

@WebServlet("/signin.html")
public class signinController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public signinController() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		if (session.getAttribute("username") != null){
			resp.sendRedirect("home.html");
		}
		else
			req.getRequestDispatcher("site/login.jsp").forward(req, resp);
	}


	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html;charset=UTF-8"); 
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");	
		String url="";
		String com = req.getParameter("command");
		HttpSession session = req.getSession();
		String username = req.getParameter("username");
		String password = req.getParameter("password");
		
		switch(com){
			case  "login":			
				if (!UserDAO.loginAuth(username, password)){
					// tra ve thong bao dang nhap that bai
					req.setAttribute("loginResult", false);
					req.getRequestDispatcher("/site/login.jsp").forward(req, resp);
				}
				else {
					User user = null;
					UserDAO dao = new UserDAO();
					user = dao.Login(username, password);
					if (user != null){
						
						session.setAttribute("user", user);	
						session.setAttribute("username", user.getUserName());
						session.setAttribute("tenNguoiDung", user.getTenNguoiDung());
						session.setAttribute("Quyen", user.getQuyen());
						resp.sendRedirect("home.html");		
						//url = "/site/index.jsp";
					}
				}	
				break;
			
			case "register":
			{
				//String username = req.getParameter("username");
				String fullname = req.getParameter("fullname");
				String confirm = req.getParameter("confirm");
				if (confirm.equals(password)) {
					User user = new User();
					UserDAO dao = new UserDAO();
					PrintWriter out = resp.getWriter();
					if (!dao.hasUser(username)) {
						user.setUserName(username);
						user.setPass(password);
						user.setTenNguoiDung(fullname);
						user.setQuyen(1);
						dao.insertUser(user);			
						session.setAttribute("user", user);
						resp.sendRedirect("home.html");						
					}
					else{
						resp.sendRedirect("signin.html");
						//url = "/site/login.jsp";
					}			
				}
				break;
			}
		}		
	}

}