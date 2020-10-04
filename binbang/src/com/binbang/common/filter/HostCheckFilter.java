package com.binbang.common.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.binbang.member.model.vo.Member;

/**
 * Servlet Filter implementation class HostCheckFilter
 */
@WebFilter("/host/hostDetail")
public class HostCheckFilter implements Filter {

    /**
     * Default constructor. 
     */
    public HostCheckFilter() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest rq = (HttpServletRequest) request;
		HttpSession session = rq.getSession(false);
		Member m = (Member) session.getAttribute("m");
		if (m == null || m.getHostConfirm()==null) {
			rq.setAttribute("msg", "호스트권한을 가진 회원만 접근가능합니다.");
			rq.setAttribute("loc", "/mainMove");
			rq.getRequestDispatcher("/views/common/printMsg.jsp").forward(request, response);
			return;
		}

		// pass the request along the filter chain
		chain.doFilter(request, response);
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
