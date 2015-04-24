package Action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface SignAction {
	public SignActionForward execute(
			HttpServletRequest request,
			HttpServletResponse response) throws Exception;
}
