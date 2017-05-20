package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.CommentDAO;
import DAO.MessageDAO;
import model.Comment;
import model.Message;

/**
 * Servlet implementation class deleteCommentController
 */
@WebServlet("/admin/delete-cmt.html")
public class deleteCommentController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public deleteCommentController() {
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
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		boolean ajax = "XMLHttpRequest".equals(req.getHeader("X-Requested-With"));
		if(ajax)
		{
			Integer id = Integer.parseInt(req.getParameter("id"));
			CommentDAO cdao = new CommentDAO();
			Comment cm = cdao.findCommentById(id);
			Integer idViewer = cm.getIdNguoiDung();
			String textcmt = cm.getNoiDung();
			String json="";
			if(cdao.deleteComment(id))
			{
				
				json = "{\"result\": \"success\"}";
				MessageDAO mdao = new MessageDAO();
				String text ="Đã xóa bình luận: "+ textcmt + " . Vì lí do vi phạm tiêu chuẩn cộng đồng";
				String sender = "Quản trị viên";
				Message ms = new Message();
				ms.setIdViewer(idViewer);
				ms.setSender(sender);
				ms.setText(text);
				ms.setStatus(1);
				mdao.sendMessage(ms);
				
			}
			else
			{
				json = "{\"result\": \"fail\"}";
			}
			resp.getWriter().write(json);
		}
	}

}
