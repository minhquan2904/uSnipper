package controller;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Paths;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import DAO.DishInfoDAO;
import DAO.RestaurantDAO;
import model.DishInfo;

/**
 * Servlet implementation class updateFileController
 */
@WebServlet("/updateFile.html")
@MultipartConfig
public class updateFileController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public updateFileController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html;charset=UTF-8"); 
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		
		String fileName ="";
		try {
			ByteArrayOutputStream buffer = new ByteArrayOutputStream();
			Part filePart = req.getPart("upfile"); 
			
			 fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString(); 
			    InputStream fileContent = filePart.getInputStream();
			  
				byte[] block = new byte[10*1024];
				while(true){
					int n = fileContent.read(block);
					if(n <= 0) break; // hết dữ liệu
					buffer.write(block, 0, n);
				}
				fileContent.close();
				
				buffer.writeTo(new FileOutputStream(req.getServletContext().getRealPath("/images")
		        										+ File.separator + fileName));
				//gán giá trị  hiện tại
				
		} catch (Exception e) {
			 fileName = "noimagefound.jpg";
		}
		DishInfoDAO dao = new DishInfoDAO();
		Integer idQuanAn = Integer.parseInt(req.getParameter("inputRtsId"));
		Integer idMonAn = Integer.parseInt(req.getParameter("inputDishId"));
		
		dao.updateImg(idQuanAn, idMonAn, fileName);
		String oldFile = req.getParameter("file");
		if(oldFile!= "noimagefound.jpg")
		{
			String fileAddress = req.getServletContext().getRealPath("/images")
					+ File.separator + oldFile;
			
			RestaurantDAO.delete(new File(fileAddress));
		}
		
		resp.sendRedirect("detailRts.html?id="+idQuanAn);
		HttpSession session = req.getSession();
		session.setAttribute("udscs", "1");
		
		
	}

}
