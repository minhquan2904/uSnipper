package controller;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Paths;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import DAO.DishDAO;
import DAO.DishInfoDAO;
import DAO.RestaurantDAO;
import model.Dish;
import model.DishInfo;


@WebServlet("/addDishToRts.html")
@MultipartConfig

public class addDishToRtsController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public addDishToRtsController() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		DishDAO dao = new DishDAO();
		ArrayList<Dish> list = dao.getListDish();
		String rname = (String) session.getAttribute("rname");
		RestaurantDAO rdao = new RestaurantDAO();
		Integer id =  rdao.getIdByName(rname);
		session.setAttribute("idR", id);
		
		DishInfoDAO ddao = new DishInfoDAO();
		ArrayList<DishInfo> listDish = ddao.getImgByRtsId(id);
		if(listDish != null)
		{
			req.setAttribute("listDish", listDish);
		}
		req.setAttribute("list", list);
		req.getRequestDispatcher("/site/add-dish-torst.jsp").forward(req, resp);
	}

	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		String rname = (String) session.getAttribute("rname");
		Integer idRts = null;
		if(rname!= null)
		{
			RestaurantDAO rdao = new RestaurantDAO();
			idRts =  rdao.getIdByName(rname);
		}
		else
		{
			idRts=Integer.parseInt(req.getParameter("inputRtsId"));
		}
		session.removeAttribute("hasDish");
		
		Integer idDish = Integer.parseInt(req.getParameter("idDish"));
		String describe = (String) req.getParameter("describe");
		Integer price = Integer.parseInt(req.getParameter("price")) ;
		DishInfoDAO dao = new DishInfoDAO();
		String prc = req.getParameter("prc"); // xet tinh trang them la them moi hay bo sung
		if(dao.hasDish(idRts, idDish))
		{
			session.setAttribute("hasDish", "Quán ăn đã có món ăn này!!!!!!!");
			switch (prc) {
			case "new":
			{
				resp.sendRedirect("addDishToRts.html");
				break;
			}
			case "old":
			{
				resp.sendRedirect("detailRts.html?id="+idRts);
				break;
			}

			default:
				break;
			}
			
				
			
			
			
			
		}
		else
		{
			 String fileName ="";
			try {
				ByteArrayOutputStream buffer = new ByteArrayOutputStream();
				Part filePart = req.getPart("pic"); 
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
				fileName= "noimagefound.jpg";
			}
			
				dao.insertNewInfo(idRts, idDish, fileName, describe, price);
				switch (prc) {
				case "new":
				{
					session.removeAttribute("hasDish");
					resp.sendRedirect("addDishToRts.html");
					break;
				}
				case "old":
				{
					session.setAttribute("oldscs", "Thêm món ăn thành công");
					resp.sendRedirect("detailRts.html?id="+idRts);
					break;
				}

				default:
					break;
				}
				
				
		}
		
		
		
	}

}
