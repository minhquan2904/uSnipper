package controller;


import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

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
		
		
		boolean ajax = "XMLHttpRequest".equals(req.getHeader("X-Requested-With"));
		if(ajax)
		{
			String com = req.getParameter("command");
			HttpSession session = req.getSession();
			String username = req.getParameter("username");
			String password = req.getParameter("password");
			
			String json = "";
			switch(com){
				case  "login":			
					if (!UserDAO.loginAuth(username, password)){
						// tra ve thong bao dang nhap that bai
						json = "{\"result\": \"fail\",\"type\":\"login\"}";
						
					}
					else {
						User user = null;
						UserDAO dao = new UserDAO();
						user = dao.Login(username, password);
						if (user != null){
							
							Integer status = user.getTrangThai();
							if(status == 0)
							{
								Date block = user.getNgayBlock();
								Date cur = new Date();
								System.out.println(cur);
								if(cur.before(block))  // kiểm tra ngày hiện tại so với ngày bị khóa
								{
									json = "{\"result\": \"success\",\"type\":\"login\",\"status\":\""+status+"\",\"dateBlock\":\""+block+"\"}";
								}
								else //tai khoan da het bi khoa
								{
									if(dao.unblockUser(username))
									{
										status = 1;
										session.setAttribute("user", user);	
										session.setAttribute("username", user.getUserName());
										session.setAttribute("tenNguoiDung", user.getTenNguoiDung());
										session.setAttribute("Quyen", user.getQuyen());
										json = "{\"result\": \"success\",\"type\":\"login\",\"status\":\""+status+"\"}";
									}
									else
									{
										System.out.println("cannot unblock");
									}
									
								}
								
								
								
							}
							else
							{
								session.setAttribute("user", user);	
								session.setAttribute("username", user.getUserName());
								session.setAttribute("tenNguoiDung", user.getTenNguoiDung());
								session.setAttribute("Quyen", user.getQuyen());
								
								//resp.sendRedirect("admin/profile.html");
								json = "{\"result\": \"success\",\"type\":\"login\",\"role\":\""+user.getQuyen()+"\",\"status\":\""+status+"\"}";
							}
							
								
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
						
						if (!UserDAO.hasUser(username)) {
							user.setUserName(username);
							user.setPass(password);
							user.setTenNguoiDung(fullname);
							user.setQuyen(1);
							dao.insertUser(user);			
							session.setAttribute("user", user);
							json = "{\"result\": \"success\",\"type\":\"signup\"}";					
						}
						else{
							json = "{\"result\": \"fail\",\"type\":\"signup\",\"error\":\"hasUser\"}";	
						}			
					}
					else
					{
						json = "{\"result\": \"fail\",\"type\":\"signup\",\"error\":\"confirmfail\"}";
					}
					break;
				}
			}
			
			resp.getWriter().write(json);
		}	
	}

}