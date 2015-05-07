package filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;

public class EncodingFilter implements Filter {

	// 전역 변수
	private String Encoding;

	public void init(FilterConfig fConfig) throws ServletException {
		this.Encoding = fConfig.getInitParameter("encoding");
		System.out.println("EncodingFilter 초기화(init) : " + this.Encoding);
	}

	public EncodingFilter() {
		// 생성자(초기화)
	}

	public void destroy() {
		this.Encoding = null;
		System.out.println("destroy : " + this.Encoding);
	}

	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		// request(요청처리 Filter)
		if (request.getCharacterEncoding() == null) {
			//System.out.println("Before : " + request.getCharacterEncoding());
			request.setCharacterEncoding(this.Encoding);
			//System.out.println("After : " + request.getCharacterEncoding());
		}
		chain.doFilter(request, response);

	}
}
