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
public class CheckLogin implements Filter {

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
		String loginURI = req.getContextPath() + "/signin.html";
		
		int role  = 0;
		if(session.getAttribute("Quyen") != null)
		{
			
			role = Integer.parseInt(session.getAttribute("Quyen").toString());
		}
		boolean loginRequest = req.getRequestURI().equals(loginURI);
		Boolean rs = session != null && ( role == 2 || role == 3);
		if (rs || loginRequest) {
			chain.doFilter(request, response);
		} else {
			resp.sendRedirect(loginURI);
		}
		// TODO Auto-generated method stub

	}

	@Override
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub

	}

}
