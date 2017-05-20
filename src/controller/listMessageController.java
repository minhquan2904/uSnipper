package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.MessageDAO;
import model.Message;
import model.User;


@WebServlet("/admin/list-message.html")
public class listMessageController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public listMessageController() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		Integer id =Integer.parseInt(req.getParameter("id"));
		MessageDAO mdao = new MessageDAO();
		ArrayList<Message> list = mdao.getlistMessage(id);
		req.setAttribute("list", list);
		
		req.getRequestDispatcher("/site/list-message.jsp").forward(req, resp);
	}

	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		boolean ajax = "XMLHttpRequest".equals(req.getHeader("X-Requested-With"));
		if(ajax)
		{
			HttpSession session = req.getSession();
			Integer id = Integer.parseInt(req.getParameter("id"));
			MessageDAO mdao = new MessageDAO();
			mdao.seenMs(id);
			User user = (User) session.getAttribute("user");		
			
			
			Integer idViewer = user.getId();
			if(!mdao.hasMs(idViewer))
			{
				session.removeAttribute("hasMs");
			}
			String json = "";
			json = "{\"result\": \"success\"}";
			resp.getWriter().write(json);
		}
	}

}
