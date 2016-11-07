package controller;

import java.io.IOException;
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
		
		String username = req.getParameter("username");
		String password = req.getParameter("password");
		
		
		if (!UserDAO.loginAuth(username, password)){
			// tra ve thong bao dang nhap that bai
			req.setAttribute("loginResult", false);
			req.getRequestDispatcher("/site/login.jsp").forward(req, resp);
		}
		else {
			User user = null;
			user = UserDAO.getInfo(username);
			if (user != null){
				HttpSession session = req.getSession();
				session.setAttribute("username", user.getuserName());
				session.setAttribute("tenNguoiDung", user.gettenNguoiDung());
				session.setAttribute("Quyen", user.getQuyen());
				resp.sendRedirect("home.html");
				
				
			}
		}		
	}

}
