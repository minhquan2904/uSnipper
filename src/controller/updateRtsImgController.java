package controller;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Paths;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import DAO.RestaurantDAO;


@WebServlet("/updateRtsImg.html")
@MultipartConfig
public class updateRtsImgController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public updateRtsImgController() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
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
		Integer idQuanAn = Integer.parseInt(req.getParameter("inputRtsId"));
		String oldFile = req.getParameter("file");
		
		RestaurantDAO rdao = new RestaurantDAO();
		rdao.updateImg(idQuanAn, fileName);
		if(oldFile!= "noimagefound.jpg")
		{
			String fileAddress = req.getServletContext().getRealPath("/images")
					+ File.separator + oldFile;
			
			RestaurantDAO.delete(new File(fileAddress));
		}
		
		resp.sendRedirect("listRestaurant.html");
	}

}
