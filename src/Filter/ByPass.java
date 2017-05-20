package Filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebFilter("/admin/*")
public class ByPass implements Filter {

	@Override
	public void destroy() {
		// TODO Auto-generated method stub

	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse resp = (HttpServletResponse) response;
		HttpSession session = req.getSession();
		String uri = req.getRequestURI();
		System.out.println(uri);
		String errUrl = req.getContextPath() + "/err.html";
		
		//bắt ev vào trang list-editor hoặc gửi request lên trang list-editor
		if(uri.endsWith("/list-editor.html") || uri.endsWith("/list-mem.html"))
		{
			System.out.println("By pass filter");
			int role  = 0;
			if(session.getAttribute("Quyen") != null)
			{
				
				role = Integer.parseInt(session.getAttribute("Quyen").toString());
			}
			if(role == 2)  // quyền admin - được phép gửi rq cũng như truy cập vào trang
			{
				chain.doFilter(request, response);
			}
			else
				resp.sendRedirect(errUrl);
		}
		else
		{
			chain.doFilter(request, response);
		}

		

	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub

	}

}
