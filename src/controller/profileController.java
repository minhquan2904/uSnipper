package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.MessageDAO;
import model.User;


@WebServlet("/profile.html")
public class profileController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public profileController() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		Integer role = (Integer) session.getAttribute("Quyen");
		String url = "";
		if(role == null)
		{
			url="/site/login.jsp";
			req.getRequestDispatcher(url).forward(req, resp);
			return;
		}
		else
		{
			switch(role)
			{
			case 1:
			{
				url="/site/profileView.jsp";
				MessageDAO mdao = new MessageDAO();
				User user = (User) session.getAttribute("user");		
				
				
				Integer id = user.getId();
				if(mdao.hasMs(id))
				{
					session.setAttribute("hasMs", 1);
				}
				break;
			}
				
			case 2:
				url="/site/profileAdmin.jsp";
				break;
			case 3:
				url="/site/profileEditor.jsp";
				break;
			}
			req.getRequestDispatcher(url).forward(req, resp);
			
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
