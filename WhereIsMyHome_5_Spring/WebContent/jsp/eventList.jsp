<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,dto.*"%>
<% 
	String contextPath = request.getContextPath();
	UserDto userDto = (UserDto) session.getAttribute("userDto");
	int userClsf = 0;
	if (userDto != null) {
		userClsf = Integer.parseInt(userDto.getUserClsf());
	}
	List<EventDto> list = (List) request.getAttribute("list"); 
%>
<!DOCTYPE html>

<html>
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
	<div class="container">
		<table class="table">
			<thead>
				<tr>
					<th scope="col">#</th>
					<th scope="col">이벤트명</th>
					<th scope="col">시작일자</th>
					<th scope="col">종료일자</th>
					<th scope="col"></th>
				</tr>
			</thead>
			<tbody>
			<% for (int i = 0; i < list.size(); i++) { %>
				<tr>
					<th scope="row"><%=list.get(i).eventId%></th>
					<td><%=list.get(i).eventName %></td>
					<td><%=list.get(i).eventFrom %></td>
					<td><%=list.get(i).eventTo %></td>
					<td>
						<button class="btn btn-danger btn-sm" id="btnEventDelete">삭제하기</button>
					</td>
				</tr>
			<% } %>
			</tbody>
		</table>
		<button class="btn btn-primary btn-sm float-end" id="btnEventCreate" type="button" class="btn"
							data-bs-toggle="modal" data-bs-target="#btnEventCreateModal">이벤트 등록</button>
		<!-- 회원가입 Modal -->
		<div class="modal fade" id="btnEventCreateModal" tabindex="-1"
			aria-labelledby="btnEventCreateModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="registerModalLabel">이벤트 등록</h5>
						<button type="button" class="btn-close"
							data-bs-dismiss="modal" aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<div class="mb-3">
							<label class="form-label">이벤트 명</label> <input type="text"
								class="form-control" id="eventName" placeholder="이름을 입력하세요">
						</div>
						<div class="mb-3">
							<label class="form-label">시작일자</label> <input type="date"
								class="form-control" id="eventFrom">
						</div>
						<div class="mb-3">
							<label class="form-label">종료일자</label> <input
								type="date" class="form-control" id="eventTo">
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary" id="btnEventRegister">등록</button>
					</div>
				</div>
			</div>
		</div>
		
	</div>
	 
	
	<%@ include file = "/jsp/scriptFile.jsp" %>
	<%@ include file = "/jsp/footer.jsp" %>
	<script>
		
	const tr = document.querySelectorAll("tr");
	
	for(let i = 0 ; i < tr.length;i++){
		tr[i].addEventListener('click',(e)=>{
			let id = e.target.parentNode.parentNode.children[0].innerHTML;
			deleteEvent(id);
		})
	}
	// 이벤트 삭제 시작
	async function deleteEvent(id){
		// userEmail = document.querySelector("#userUpdateEmail").value;
		if (confirm("삭제된 이벤트는 되돌릴 수 없습니다. 정말 삭제하시겠습니까?")) {
			let urlParams = new URLSearchParams ({
				eventId: id,
			});
		
			let fetchOptions = {
				method: "POST",
				body: urlParams
			}
		
			let response = await fetch("<%=contextPath%>/main/eventDelete", fetchOptions);
			let data = await response.json(); // json => js object <= JSON.parse();
			if(data.result == "success"){ // login.jsp => /jsp/login.jsp 로 페이지 이동 ( 새로운 페이지 요청 )
				alertify.alert("Welcome!", "이벤트 삭제가 완료되었습니다.", function(){
					alertify.message('이벤트 삭제');
					window.location.reload();
				});
			     	
				} else if (data.result == "fail"){
				alert('삭제에 실패했습니다.');
			}
		}
	}
	// 이벤트 삭제 끝
	
	document.querySelector("#btnEventRegister").onclick = function(){
		eventRegist();
    }
	
	// 이벤트 등록 시작
	async function eventRegist(){
		eventName = document.querySelector("#eventName").value;
		eventFrom = document.querySelector("#eventFrom").value;
		eventTo = document.querySelector("#eventTo").value;
	
	    let urlParams = new URLSearchParams ({
	    	eventName: eventName,
	    	eventFrom: eventFrom,
	    	eventTo: eventTo
	    });
	
	    let fetchOptions = {
	    method: "POST",
	    body: urlParams
	    }
	
	    let response = await fetch("<%=contextPath%>/main/eventRegist", fetchOptions);
	    let data = await response.json();
	    if(data.result == "success"){
	    	alertify.alert("Welcome!", "이벤트 등록을 성공했습니다.", function(){
	    		 window.location.reload();
	    	});
	    } else if(data.result == "fail"){
	        alert('이벤트 등록 실패.');
	    }
	}
	// 이벤트 등록 끝
	</script>
</body>
</html>