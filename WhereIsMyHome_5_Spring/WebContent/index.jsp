<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="dto.*"%>
<%
	String contextPath = request.getContextPath();
	UserDto userDto = (UserDto) session.getAttribute("userDto");
	int userClsf = 0;
	if (userDto != null) {
		userClsf = Integer.parseInt(userDto.getUserClsf());
	}
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

<style>
th {
	position: sticky;
	top: 0px;
	background-color: white !important;
}
</style>
<body>

	<%@ include file = "/jsp/header.jsp" %>

	<!-- 중앙 content start -->
	<div class="container">
		<div style="height: 70px"></div>
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
			<div class="form-group col-md-2">
                <button type="button" id="list-btn" class="btn btn-outline-primary dijkstra">
                   	가장 가까운 아파트
                </button>
            </div>
		</div>
		<div id="aptTable" style="display: none;">
			<div style="overflow: auto; height: 600px; width: 600px; display: inline-block;">
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

			<div id="map" style="width: 600px; height: 600px; display: inline-block;"></div>
		</div>
	</div>


	<div class="container">

		<div id="MainImage" class="carousel slide" data-bs-ride="carousel">
			<div class="carousel-inner">
				<div class="carousel-item active">
					<img src="img/carousel1.jpg" class="d-block w-100" alt="...">
				</div>
				<div class="carousel-item">
					<img src="img/carousel2.jpg" class="d-block w-100" alt="...">
				</div>
				<div class="carousel-item">
					<img src="img/carousel3.jpg" class="d-block w-100" alt="...">
				</div>
				<div class="carousel-item">
					<img src="img/carousel4.jpg" class="d-block w-100" alt="...">
				</div>
				<div class="carousel-item">
					<img src="img/carousel5.jpg" class="d-block w-100" alt="...">
				</div>
				<div class="carousel-item">
					<img src="img/carousel6.jpg" class="d-block w-100" alt="...">
				</div>
			</div>
			<button class="carousel-control-prev" type="button"
				data-bs-target="#carouselExampleControls" data-bs-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Previous</span>
			</button>
			<button class="carousel-control-next" type="button"
				data-bs-target="#carouselExampleControls" data-bs-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Next</span>
			</button>
		</div>


		<%@ include file = "/jsp/scriptFile.jsp" %>
		<%@ include file = "/jsp/scriptKakao.jsp" %>
		<script src="./js/location.js"></script>
        <script src="./js/dijkstra.js"></script>
		<script>
			////////////////onload 변경점///////////////////////////////////////////
	        document.querySelector("#list-btn").onclick = function(){
	        	getList();
	        }
		</script>
		<%@ include file = "/jsp/footer.jsp" %>
</body>
</html>
