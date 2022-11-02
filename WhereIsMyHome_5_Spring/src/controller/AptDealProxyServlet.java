package controller;

import java.io.BufferedReader;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.parsers.SAXParser;
import javax.xml.parsers.SAXParserFactory;

import com.google.gson.Gson;

import dto.HouseDeal;

@WebServlet("/aptdeal")
public class AptDealProxyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private final String SERVICE_URL = "http://openapi.molit.go.kr/OpenAPI_ToolInstallPackage/service/rest/RTMSOBJSvc/getRTMSDataSvcAptTradeDev";
	private final String SERVICE_KEY = "x1HXcKPkVW0tDDnjP5WwJdMSwYE1fyNVy0q9cOMQYNS9XOEPYK5tsmbT0K%2B81Ih2AIQMqHA5MzDZ%2BzJOgQ8l%2Fg%3D%3D";

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// request paramter process
		// api 요청 + 파라미터
		// 결과 xml 수신
		// xml 요청 => xml
		// json 요청 => xml -> json 후 전송 ( xml parsing 작업 <= SAX parser )
		
		String pageNo = request.getParameter("pageNo");
		if(pageNo == null) pageNo = "1";

		String numOfRows = request.getParameter("numOfRows");
		if(numOfRows == null) numOfRows = "1000";

		String LAWD_CD = request.getParameter("LAWD_CD");
		if(LAWD_CD == null) LAWD_CD = "11110";

		String DEAL_YMD = request.getParameter("DEAL_YMD");
		if(DEAL_YMD == null) DEAL_YMD = "202112";
		
		// clsf xml, json 구분 client 에게 가공할 것인지 여부
		String clsf = request.getParameter("clsf");
		if(clsf == null) clsf = "json";
		
		StringBuilder sb = new StringBuilder();
		sb.append(SERVICE_URL)
		.append("?serviceKey=").append(SERVICE_KEY)
		.append("&pageNo=").append(pageNo)
		.append("&numOfRows=").append(numOfRows)
		.append("&LAWD_CD=").append(LAWD_CD)
		.append("&DEAL_YMD=").append(DEAL_YMD);
		
		System.out.println(sb.toString());
		
		URL url = new URL(sb.toString());
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("GET");
		
		System.out.println(conn.getResponseCode());
		
		BufferedReader br = null;
		if(conn.getResponseCode() == 200) {
			br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		}else {
			br = new BufferedReader(new InputStreamReader(conn.getErrorStream()));	
		}
		
		// api response => StringBuilder result에 넣기
		StringBuilder result = new StringBuilder();
		String line;
		while( ( line = br.readLine() )!= null) {
			result.append(line);
		}
		br.close();
		conn.disconnect();
		System.out.println(result.toString());
		
		if("raw".equals(clsf)) {
			sendRaw(result.toString(), response);
		}else if("json".equals(clsf)) {
			sendJson(result.toString(), request, response);
		}
		
	}

	private void sendRaw(String result, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/xml; charset=utf-8");
		response.getWriter().append(result);
	}
	
	private void sendJson(String result, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json; charset=utf-8");
		String dong = request.getParameter("dong");
		
		// xml => java List객체로 필요한 항목 추출
		try {
			//SAX parser
			SAXParser parser = SAXParserFactory.newInstance().newSAXParser();
			HouseSAXHandler handler = new HouseSAXHandler();
			
			// 한글처리 
			InputStream is = new ByteArrayInputStream(result.getBytes(StandardCharsets.UTF_8));
			parser.parse(is, handler);
			
			List<HouseDeal> houseDealList = handler.getHouseDealList();
			List<HouseDeal> alkfalisk = new ArrayList<>();
			for (HouseDeal houseDeal : houseDealList) {
				if(dong.equals(houseDeal.getBjdsgg()+houseDeal.getBjdumd())) {
					alkfalisk.add(houseDeal);
				}
			}
			
			// List to Json
			Gson gson = new Gson();
			String jsonStr = gson.toJson(alkfalisk);
			response.getWriter().append(jsonStr);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	
}
