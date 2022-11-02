<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="dto.*"%>
<%
	String contextPath = request.getContextPath();
	UserDto userDto = (UserDto) session.getAttribute("userDto");
%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>WhereIsMyHome</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
	integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
	integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"
	crossorigin="anonymous"></script>

<!-- JavaScript -->
<script
	src="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/alertify.min.js"></script>

<!-- CSS -->
<link rel="stylesheet"
	href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/alertify.min.css" />
<!-- Default theme -->
<link rel="stylesheet"
	href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/default.min.css" />
<!-- Semantic UI theme -->
<link rel="stylesheet"
	href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/semantic.min.css" />
<!-- Bootstrap theme -->
<link rel="stylesheet"
	href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/bootstrap.min.css" />
  </head>
  <body>
  	<%@ include file = "/jsp/header.jsp" %>
  	
    <!-- 중앙 content start -->
    <div class="container">
      <div style="height: 70px"></div>
      <h2 class="text-center mt-5 mb-3">아파트 매매 정보</h2>
      <div class="row col-md-12 justify-content-center mb-2">
        <div class="form-group col-md-2">
				<select class="form-select bg-secondary text-light" id="sido">
				</select>
			</div>
			<div class="form-group col-md-2">
				<select class="form-select bg-secondary text-light" id="gugun">
					<option value="">구군선택</option>
				</select>
			</div>
			<div class="form-group col-md-2">
				<select class="form-select bg-secondary text-light" id="dong">
					<option value="">동선택</option>
				</select>
			</div>
			<div class="form-group col-md-2">
				<button type="button" id="list-btn" class="btn btn-outline-primary">
					검색</button>
			</div>
        </div>
      </div>
      <div id="aptTable" style="display: none;">
			<div class="container">
				<table id="apt" class="table table-hover text-center">
					<thead>
						<tr>
							<th>아파트이름</th>
							<th>층</th>
							<th>면적</th>
							<th>법정동</th>
							<th>거래금액</th>
						</tr>
					</thead>
					<tbody id="aptlist"></tbody>
				</table>
			</div>

		</div>
    </div>
   	
   	<%@ include file = "/jsp/scriptFile.jsp" %>
   	<script>
	   	////////////////onload 변경점///////////////////////////////////////////
	        document.querySelector("#list-btn").onclick = function(){
	        	getListFromXML();
	        }
   	</script>
   	<%@ include file = "/jsp/footer.jsp" %>
  </body>
</html>
