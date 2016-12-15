package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.QuanAnTamDAO;
import model.QuanAnTam;

/**
 * Servlet implementation class listTempController
 */
@WebServlet("/list-temp.html")
public class listTempController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public listTempController() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		QuanAnTamDAO qdao = new QuanAnTamDAO();
		ArrayList<QuanAnTam> list = qdao.getlistTemp();
		
		if(!list.isEmpty())
		{
			req.setAttribute("list", list);
		}
		req.getRequestDispatcher("/site/list-temp.jsp").forward(req, resp);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
