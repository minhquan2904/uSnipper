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
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import DAO.RestaurantDAO;
import model.Restaurant;


@WebServlet("/admin/addRts.html")
@MultipartConfig
public class addRtsController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public addRtsController() {
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
		if(role == 3)
		{
			req.getRequestDispatcher("/site/addrts-editor.jsp").forward(req, resp);
		}
		
	}

	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html;charset=UTF-8"); 
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		RestaurantDAO rdao = new RestaurantDAO();
		String tenQuanAn = req.getParameter("rname");
		
		if(rdao.hasRts(tenQuanAn) == true)
		{
			req.setAttribute("errorMs", "Đã tồn tại quán ăn!!!!!!!!!");
			req.getRequestDispatcher("/site/addrts-editor.jsp").forward(req, resp);
		}
		else{
			Integer idLoaiQuanAn = Integer.parseInt(req.getParameter("type"));
			
			Integer soNha = Integer.parseInt(req.getParameter("number"));
			
			String tenDuong = req.getParameter("street");
			String tenPhuong = req.getParameter("town");
			String tenQuan = req.getParameter("dist");
			String lat = req.getParameter("lat");
			String lng = req.getParameter("lng");
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
			
				
			RestaurantDAO dao = new RestaurantDAO();
			dao.insertRts(tenQuanAn, idLoaiQuanAn, soNha, tenDuong, tenPhuong, tenQuan, lat, lng, fileName );
			HttpSession session = req.getSession();
			session.setAttribute("rname", tenQuanAn);
			session.setAttribute("adding", "adding"); // dang them quan an
			resp.sendRedirect("addDishToRts.html");
		}
	
	}

}
