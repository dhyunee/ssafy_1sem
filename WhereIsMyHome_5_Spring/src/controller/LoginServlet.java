package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import dto.UserDto;
import service.LoginService;
import service.LoginServiceImple;

@WebServlet({ "/login", "/logout" })
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		session.invalidate();

		Gson gson = new Gson();
		JsonObject jsonObject = new JsonObject();
		jsonObject.addProperty("result", "success");

		String jsonStr = gson.toJson(jsonObject);
		response.getWriter().write(jsonStr);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");

		String userEmail = request.getParameter("userEmail");
		String userPassword = request.getParameter("userPassword");

		System.out.println(userEmail);
		System.out.println(userPassword);

		LoginService service = LoginServiceImple.getInstance();
		UserDto userDto = service.login(userEmail, userPassword);

		Gson gson = new Gson();
		JsonObject jsonObject = new JsonObject();

		if (userDto != null) {
			HttpSession session = request.getSession();
			session.setAttribute("userDto", userDto);
			System.out.println(userDto.getUserRegistDate());

			jsonObject.addProperty("result", "success");
			System.out.println("LoginServlet - login success");
		} else {
			jsonObject.addProperty("result", "fail");
			System.out.println("LoginServlet - login fail");
		}

		String jsonStr = gson.toJson(jsonObject);
		response.getWriter().write(jsonStr);
	}

}
