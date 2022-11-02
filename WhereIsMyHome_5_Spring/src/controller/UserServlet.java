package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import dao.CodeDaoImpl;
import dto.CodeDto;
import dto.UserDto;
import service.UserService;
import service.UserServiceImple;

@WebServlet("/user/*")
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");

		String contextPath = request.getContextPath();
		String path = request.getRequestURI().substring(contextPath.length());
		
		switch(path){
			case "/user/registerForm":userRegisterForm(request, response); break;
			case "/user/register" : userRegist(request, response); break;
			case "/user/detail" : userDetail(request, response); break;
			case "/user/delete" : userDelete(request, response); break;
			case "/user/update" : userUpdate(request, response); break;
		}

	}
	
	protected void userDetail(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		UserDto dto = (UserDto) session.getAttribute("userDto");

		Gson gson = new Gson();
		String jsonStr = gson.toJson(dto, UserDto.class);
		response.getWriter().write(jsonStr);
	}

	protected void userRegisterForm(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		CodeDaoImpl codeDao = CodeDaoImpl.getInstance();
		List<CodeDto> codeList = codeDao.getCodeList("001");  // 회원구분 : 001
		request.setAttribute("codeList", codeList);
		

		Gson gson = new Gson();
		String jsonStr = gson.toJson(codeList);
		response.getWriter().write(jsonStr);
	
	}
	
	
	protected void userRegist(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String userName = request.getParameter("userName");
		String userEmail = request.getParameter("userEmail");
		String userPassword = request.getParameter("userPassword");
		String userClsf = request.getParameter("userClsf");

		UserDto userDto = new UserDto();
		userDto.setUserEmail(userEmail);
		userDto.setUserName(userName);
		userDto.setUserPassword(userPassword);
		userDto.setUserClsf(userClsf);

		UserService service = UserServiceImple.getInstance();
		int ret = service.register(userDto);

		Gson gson = new Gson();
		JsonObject jsonObject = new JsonObject();

		if (ret == 1) {
			jsonObject.addProperty("result", "success");
			System.out.println("UserServlet - regist success");
		} else {
			jsonObject.addProperty("result", "fail");
			System.out.println("UserServlet - regist fail");
		}

		String jsonStr = gson.toJson(jsonObject);
		response.getWriter().write(jsonStr);		
	}
	
	protected void userDelete(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String userEmail = request.getParameter("userEmail");

		UserDto userDto = new UserDto();
		userDto.setUserEmail(userEmail);

		UserService service = UserServiceImple.getInstance();
		int ret = service.delete(userDto);

		Gson gson = new Gson();
		JsonObject jsonObject = new JsonObject();

		if (ret == 1) {
			jsonObject.addProperty("result", "success");
			System.out.println("UserServlet - delete success");
		} else {
			jsonObject.addProperty("result", "fail");
			System.out.println("UserServlet - delete fail");
		}
		String jsonStr = gson.toJson(jsonObject);
		response.getWriter().write(jsonStr);
	}
	
	protected void userUpdate(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String userEmail = request.getParameter("userEmail");
		String userPassword = request.getParameter("userPassword");

		UserDto userDto = new UserDto();
		userDto.setUserEmail(userEmail);
		userDto.setUserPassword(userPassword);

		UserService service = UserServiceImple.getInstance();
		int ret = service.update(userDto);

		Gson gson = new Gson();
		JsonObject jsonObject = new JsonObject();

		if (ret == 1) {
			jsonObject.addProperty("result", "success");
			System.out.println("UserServlet - update success");
		} else {
			jsonObject.addProperty("result", "fail");
			System.out.println("UserServlet - update fail");
		}

		String jsonStr = gson.toJson(jsonObject);
		response.getWriter().write(jsonStr);
	}
}
