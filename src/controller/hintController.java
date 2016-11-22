package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.sun.xml.internal.ws.policy.privateutil.PolicyUtils.Text;
import model.QuanAnTam;
import DAO.QuanAnTamDAO;

/**
 * Servlet implementation class hintController
 */
@WebServlet("/hint-rts.html")
public class hintController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public hintController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		if ((session.getAttribute("username") == null)){
			resp.sendRedirect("signin.html");
		}
		else
			if((Integer) session.getAttribute("Quyen") !=1  ){
				resp.sendRedirect("home.html");
			}
			else
				req.getRequestDispatcher("site/hint-rts.jsp").forward(req, resp);
		//req.getRequestDispatcher("/site/hint-rts.jsp").forward(req, resp);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		// TODO Auto-generated method stub
		//resp.setContentType("text/html;charset=UTF-8"); 
		//req.setCharacterEncoding("UTF-8");
		//resp.setCharacterEncoding("UTF-8");	
		HttpSession session = req.getSession();
		String com = req.getParameter("command");
		//if(com =="hint"){
			String TenQuan = req.getParameter("name-rts");
			String DiaChi = req.getParameter("diachi");
			String MonAn = req.getParameter("monan");
			String MoTa=req.getParameter("mota");
			QuanAnTam quan = new QuanAnTam();
			QuanAnTamDAO quanDAo = new QuanAnTamDAO();
			quan.setTenQuanAn(TenQuan);
			quan.setDiaChi(DiaChi);
			quan.setMonAn(MonAn);
			quan.setMoTa(MoTa);
			 if(quanDAo.insertQuanAnTam(quan))
					resp.sendRedirect("home.html");
			 else{
				 resp.sendRedirect("nearby.html");
			 }
		//}
				
		//doGet(req, resp);
	}

}
