package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.CommentDAO;
import DAO.UserDAO;


@WebServlet("/comment.html")
public class commentController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public commentController() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		boolean ajax = "XMLHttpRequest".equals(req.getHeader("X-Requested-With"));
		if(ajax)
		{
			String userName = req.getParameter("usn");
			Integer rtsid= Integer.parseInt(req.getParameter("rtsid"));
			String noiDung = req.getParameter("content");
			
			UserDAO udao = new UserDAO();
			Integer idNguoiDung;
			try {
				idNguoiDung = udao.findUserByUsn(userName).getId();
				CommentDAO cdao = new CommentDAO();
				cdao.insertComment(rtsid, idNguoiDung, noiDung);
				String json = "";
				json = "{\"result\": \"success\"}";
				resp.getWriter().write(json);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		
	}

}
