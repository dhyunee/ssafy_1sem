package controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Arrays;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import dao.EventDaoImpl;
import dto.AptInfoDto;
import dto.EventDto;
import dto.PlaceDto;
import service.MainListService;
import service.MainListServiceImpl;


@WebServlet("/main/*")
public class MainServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	MainListService listdao = MainListServiceImpl.getInstance();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf8");
		String contextPath = request.getContextPath();
		String path = request.getRequestURI().substring(contextPath.length());
		System.out.println(path);
		switch(path) {
		case "/main/sido": doSido(request,response);break;
		case "/main/gugun": doGugun(request,response);break;
		case "/main/dong": doDong(request,response);break;
		case "/main/list": doList(request,response);break;
		case "/main/eventList": getEventList(request, response); break;
		case "/main/eventDelete": deleteEvent(request, response); break;
		case "/main/eventRegist": registEvent(request, response); break;
		
		}
	}
	
	protected void doSido(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("call doSido");
		
		List<PlaceDto> ret = listdao.getSido();
		Gson gson = new Gson();
		String jsonStr = gson.toJson(ret);
       
        response.getWriter().write(jsonStr);
//		RequestDispatcher dis = request.getRequestDispatcher("/index.jsp");
//		dis.forward(request, response);
	}
	
	protected void doGugun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("call doGugun");
		String sido = request.getParameter("sido");
		List<PlaceDto> ret = listdao.getGugun(sido);
		System.out.println(ret);
		Gson gson = new Gson();
		String jsonStr = gson.toJson(ret);
       
        response.getWriter().write(jsonStr);
	}
	
	protected void doDong(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("call doDong");
		String sido = request.getParameter("sido");
		String gugun = request.getParameter("gugun");
		List<PlaceDto> ret = listdao.getDong(sido,gugun);
		System.out.println(ret);
		Gson gson = new Gson();
		String jsonStr = gson.toJson(ret);
       
        response.getWriter().write(jsonStr);
	}
	
	protected void doList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("call doList");
		String sido = request.getParameter("sido");
		String gugun = request.getParameter("gugun");
		String dong = request.getParameter("dong");
		List<AptInfoDto> ret = listdao.getList(sido,gugun,dong);
		System.out.println(ret);
		Gson gson = new Gson();
		String jsonStr = gson.toJson(ret);
       
        response.getWriter().write(jsonStr);
	}
	
	protected void getEventList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// DB 에서 이벤트 정보를 가져온다.
	    EventDaoImpl dao = EventDaoImpl.getInstance();
	    List<EventDto> list;
	    
	    String path = request.getContextPath();
	    list = dao.eventList();
	    System.out.println("123123123" + list);
	    
//	        Gson gson = new Gson();
//	        String jsonStr = gson.toJson(list);
//	        System.out.println(jsonStr);
	        request.setAttribute("list", list);
//	        response.getWriter().write(jsonStr);
	        RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/eventList.jsp");
	        dispatcher.forward(request, response);
	    }
	
	protected void deleteEvent(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// DB 에서 이벤트 정보를 가져온다.
		EventDaoImpl dao = EventDaoImpl.getInstance();
		
		int id = Integer.parseInt(request.getParameter("eventId"));
		int ret = dao.eventDelete(id);
		
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
	
	protected void registEvent(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// DB 에서 이벤트 정보를 가져온다.
		EventDaoImpl dao = EventDaoImpl.getInstance();
		
		String eventName = request.getParameter("eventName");
		String eventFrom = request.getParameter("eventFrom");
		String eventTo = request.getParameter("eventTo");
		 
		EventDto eventDto = new EventDto();
		eventDto.eventName = eventName;
		eventDto.eventFrom = eventFrom;
		eventDto.eventTo = eventTo;
		System.out.println("!!!" + eventDto);
		
		int ret = dao.eventRegister(eventDto);
		
		Gson gson = new Gson();
		JsonObject jsonObject = new JsonObject();
		
		if (ret == 1) {
			jsonObject.addProperty("result", "success");
			System.out.println("event - regist success");
		} else {
			jsonObject.addProperty("result", "fail");
			System.out.println("event - regist fail");
		}
		
		String jsonStr = gson.toJson(jsonObject);
		response.getWriter().write(jsonStr);
	}

}
