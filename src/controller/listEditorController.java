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

/**
 * Servlet implementation class listEditorController
 */
@WebServlet("/admin/list-editor.html")
public class listEditorController extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public listEditorController() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		UserDAO udao = new UserDAO();
		ArrayList<User> listActive = udao.getListActiveEditorAdmin();
		ArrayList<User> listBlock = udao.getListBlockEditorAdmin();
		if(!listActive.isEmpty())
		{
			req.setAttribute("listActive", listActive);
		}
		if(!listBlock.isEmpty())
		{
			req.setAttribute("listBlock", listBlock);
		}
		req.getRequestDispatcher("/site/list-editor.jsp").forward(req, resp);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		boolean ajax = "XMLHttpRequest".equals(req.getHeader("X-Requested-With"));
		if(ajax)
		{
			Integer id = Integer.parseInt(req.getParameter("id"));
			
			String type = req.getParameter("type");
			
			UserDAO udao = new UserDAO();
			String json ="";
			
			switch (type) {
			case "block":
			{
				String userName = req.getParameter("userName");
				if(udao.checkBlock(id))
				{
					json = "{\"result\": \"fail\",\"type\":\"hasBlock\"}";
				}
				else
				{
					if(udao.blockUser(id, userName))
					{
						json = "{\"result\": \"success\"}";
						
					}
					else
					{
						json = "{\"result\": \"fail\",\"type\":\"exeption\"}";
						
					}
				}
				break;

			}
			case "blockmem" :
			{
				if(udao.checkBlock(id))
				{
					json = "{\"result\": \"fail\",\"type\":\"hasBlock\"}";
				}
				else
				{
					if(udao.blockMem(id))
					{
						json = "{\"result\": \"success\"}";
					}
					else
					{
						json = "{\"result\": \"fail\",\"type\":\"exeption\"}";
						
					}
				}
				break;
				
			}
			case "unblockmem": 
			{
				if(udao.unblockMem(id))
				{
					json = "{\"result\": \"success\"}";
				}
				else
				{
					json = "{\"result\": \"fail\",\"type\":\"exeption\"}";
					
				}
				break;
			}
			case "deletemem": 
			{
				if(udao.deleteMem(id))
				{
					json = "{\"result\": \"success\"}";
				}
				else
				{
					json = "{\"result\": \"fail\",\"type\":\"exeption\"}";
					
				}
				break;
			}
			case "unblock" :
			{
				String userName = req.getParameter("userName");
				if(udao.unblockUser(userName))
				{
					json = "{\"result\": \"success\"}";
					
				}
				else
				{
					json = "{\"result\": \"fail\",\"type\":\"exeption\"}";
					
				}
				break;
			}
			case "delete":
			{
				String userName = req.getParameter("userName");
				if(udao.deleteUser(id, userName))
				{
					json = "{\"result\": \"success\"}";
					
				}
				else
				{
					json = "{\"result\": \"fail\",\"type\":\"exeption\"}";
					
				}
				break;
			}
			case "changePass" :
			{
				String userName = req.getParameter("userName");
				String newpass = req.getParameter("newpass");
				udao.changePass(id, userName, newpass);
				json = "{\"result\": \"success\"}";
				break;
			}
			default:
				break;
			}
			
			
			resp.getWriter().write(json);
		}
		
		
	}

}
