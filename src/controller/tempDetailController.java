package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.QuanAnTamDAO;
import model.QuanAnTam;


@WebServlet("/tempDetail.html")
public class tempDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public tempDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		QuanAnTamDAO qdao = new QuanAnTamDAO();
		Integer id = Integer.parseInt(req.getParameter("id"));
		QuanAnTam temp = qdao.findTempById(id);
		req.setAttribute("temp", temp);
		req.getRequestDispatcher("/site/tempdetail.jsp").forward(req, resp);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
