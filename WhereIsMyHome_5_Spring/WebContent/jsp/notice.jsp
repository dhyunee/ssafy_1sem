<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="dto.*"%>
<%
	String contextPath = request.getContextPath();
	UserDto userDto = (UserDto) session.getAttribute("userDto");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
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
<title>Document</title>

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
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<div class="container-fluid">
			<a class="navbar-brand" href="#"><img
				src="<%=contextPath%>/img/ssafy_logo.png"
				style="width: 30px; height: 30px; border-radius: 50%" /></a>
				
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="navbar-brand text-primary fw-bold"
						aria-current="page" href="<%=contextPath%>/index.jsp">WhereIsMyHome</a></li>
				</ul>
			</div>
			
		</div>
	</nav>


	<div class="container">
		<h4 class="text-center mt-3">공지사항</h4>

		<div class="input-group mb-5 mt-5">
			<input type="text" class="form-control" id="inputSearchWord" placeholder="Search Here"/>
			<button class="btn btn-outline-primary" type="button" id="btnSearchWord">Search</button>
		</div>

		<table class="table table-hover">
			<thead>
				<tr>
					<th scope="col">#</th>
					<th scope="col">작성자</th>
					<th scope="col">제목</th>
					<th scope="col">작성일자</th>
					<th scope="col">조회 수</th>
				</tr>
			</thead>
			<tbody id = "boardTbody">
			
			</tbody>
		</table>

		<div id = "paginationWrapper"></div>

		<button type="button" id="btnInsertPage" class="btn btn-primary">글쓰기</button>
	</div>


	<!-- Modal -->
	<div class="modal fade" id="insertModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">공지사항 작성하기</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>

				<div class="modal-body">
					<div class="form-floating mb-3">
						<input type="text" class="form-control" id="title"
							placeholder="name@example.com"> <label for="title">제목</label>
					</div>
					<div class="form-floating">
						<textarea class="form-control" placeholder="Leave a comment here"
							id="content" style="height: 500px"></textarea>
						<label for="content">내용</label>
					</div>
				</div>

				<div class="modal-footer">
					<button type="button" class="btn btn-primary" id="insertPost">등록</button>
				</div>
			</div>
		</div>
	</div>


<!-- Modal -->
	<div class="modal fade" id="detailModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">글 상세</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<table class="table table-hover">
						<tbody id = "boardTbody">
							<tr><td>글 번호</td><td id="boardIdDetail">#</td></tr>
							<tr><td>제목</td><td id="boardTitleDetail">#</td></tr>
							<tr><td>내용</td><td id="boardContentDetail">#</td></tr>
							<tr><td>작성자</td><td id="userNameDetail">#</td></tr>
							<tr><td>작성일시</td><td id="regDtDetail">#</td></tr>
							<tr><td>조회수</td><td id="readCountDetail">#</td></tr>	
						</tbody>
					</table>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" id="btnBoardUpdatePage">수정</button>
					<button type="button" class="btn btn-danger" id="btnBoardDeleteConfirm">삭제</button>
				</div>
			</div>
		</div>
	</div>
	
	
	<!-- update Modal -->
	<div class="modal fade" id="updateModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">글 수정하기</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>

				<div class="modal-body">
					<div class="form-floating mb-3">
						<input type="text" class="form-control" id="titleUpdate"
							placeholder=""> <label for="title">제목</label>
					</div>
					<div class="form-floating">
						<textarea class="form-control" placeholder="Leave a comment here"
							id="contentUpdate" style="height: 500px"></textarea>
						<label for="content">내용</label>
					</div>
				</div>

				<div class="modal-footer">
					<button type="button" class="btn btn-primary" id="updatePost">수정</button>
				</div>
			</div>
		</div>
	</div>
	
	
	<script src = "<%=contextPath %>/js/util.js"></script>
	
	<script>
		var LIST_ROW_COUNT = 10;
		var OFFSET = 0;
		var SEARCH_WORD = "";
		
		// pagination
		var PAGE_LINK_COUNT = 10;
		var CURRENT_PAGE_INDEX = 1;
		var TOTAL_LIST_ITEM_COUNT = 0;
		
     	window.onload = function(){
    	 
     		//boardList();
		    document.querySelector('#btnInsertPage').onclick = function(){
				document.querySelector("#title").value = "";
				document.querySelector("#content").value = "";
		    	
		    	let modal = new bootstrap.Modal(document.querySelector("#insertModal"));
				
				modal.show();
				
				document.querySelector("#insertPost").onclick = function(){
			          if(validateInsert()){
			        		boardInsert();
			          }
			          else {
			          		alertify.error("입력을 확인해주세요");
			          }
				}
		    }
	    	  
          
		    document.querySelector('#btnSearchWord').onclick = function(){
		    	SEARCH_WORD = document.querySelector('#inputSearchWord').value;
		    	
		    	OFFSET = 0;
		    	CURRENT_PAGE_INDEX = 1;
		    	
		    	boardList();
		    }
		    
		    document.querySelector('#btnBoardUpdatePage').onclick = function(){
		    	// detail => update 글 상세내용 복사 boardId 포험
		    	// detail modal 닫고 update modal 띄우기
		    	
		    	let boardId = document.querySelector("#detailModal").getAttribute("data-boardId");
		    	document.querySelector("#updateModal").setAttribute("data-boardId", boardId);

		    	document.querySelector("#titleUpdate").value = document.querySelector("#boardTitleDetail").innerHTML;
		    	document.querySelector("#contentUpdate").value = document.querySelector("#boardContentDetail").innerHTML;
		    	
				let detailModal = new bootstrap.Modal(document.querySelector("#detailModal"));
				detailModal.hide();
				
				let updateModal = new bootstrap.Modal(document.querySelector("#updateModal"));
				updateModal.show();
				
				document.querySelector("#updatePost").onclick = function(){
			          if(validateUpdate()){
			        		boardUpdate();
			          }
			          else {
			          		alertify.error("입력을 확인해주세요");
			          }
				}
		    }
		    
		    document.querySelector('#btnBoardDeleteConfirm').onclick = function(){
				alertify.confirm("정보", "삭제 하시겠습니까?", function(){
			    	boardDelete();
				}, function(){ console.log("삭제취소"); }
				
		    	);
		    }
		    
		    // logout
		    document.querySelector("#btnLogout").onclick = function(){
		    	logout();
		    }
   		};
            
   		// GET 
   		async function boardList(){
   			let url = '<%=contextPath%>/board/boardList';
   			let urlParams = '?limit=' + LIST_ROW_COUNT + '&offset=' + OFFSET + '&searchWord=' + SEARCH_WORD;
   			//let urLParams = `limit=${LIST_ROW_COUNT}&offset=${OFFSET}`; // jsp EL 표기법과 javascript es6 literal template과 충돌
   			
   			let fetchOptions = {
   				method: 'GET',
   			}
   			
   			try{
   				let response = await fetch(url + urlParams, fetchOptions);
   				let data = await response.json();
   				console.log(data);
   				
   				makeListHtml(data);
   			}catch( error ){
   				
   				console.log(error);
   				alertify.error('글 조회 과정에서 문제가 생겼습니다.');
   			
   			}
   			
   		}
   		
   		// javascript array => table <tr> make 
   		function makeListHtml( list ){
   			let listHtml = ``;
   			
   			list.forEach( el => {
   				let boardId = el.boardId;
   				let userName = el.userName;
   				let title = el.boardTitle;
   				let regDt = el.regDate;
   				let regDtStr = makeDateStr(regDt.date.year, regDt.date.month, regDt.date.day, ".");
   				let readCount = el.readCount;
   				
   				listHtml += 
   					`<tr style="cursor:pointer" data-boardId=\${boardId}><td>\${boardId}</td><td>\${userName}</td><td>\${title}</td><td>\${regDtStr}</td><td>\${readCount}</td></tr>`;
   			});
   			
   			document.querySelector("#boardTbody").innerHTML = listHtml;
   			
   			makeListHtmlEventHandler();
   			boardListTotalCnt();
   		}
   		
   		
   		function makeListHtmlEventHandler(){
   			document.querySelectorAll("#boardTbody tr").forEach(el =>{
   				el.onclick = function(){
   					let boardId = this.getAttribute("data-boardId");
   					boardDetail(boardId);
   				}
   			});
   		}
   		
   		async function boardDetail(boardId){
   			let url = '<%=contextPath%>/board/boardDetail';
   			let urlParams = '?boardId=' + boardId;
   			
   			let fetchOptions = {
   				method: 'GET',
   			}
   			
   			try{
   				let response = await fetch(url + urlParams, fetchOptions);
   				let detail = await response.json();
   				console.log(detail);
   				
   				
   				makeDetailHtml(detail);
   			}catch( error ){
   				
   				console.log(error);
   				alertify.error('글 상세조회 과정에서 문제가 생겼습니다.');
   			
   			}
   		}
   		
   		function makeDetailHtml( detail ){
				let boardId = detail.boardId;
				let userName = detail.userName;
				let title = detail.boardTitle;
				let content = detail.boardContent;
				let regDt = detail.regDate;
				let regDtStr = makeDateStr(regDt.date.year, regDt.date.month, regDt.date.day, ".") + ' ' + makeTimeStr(regDt.time.hour, regDt.time.minute, regDt.time.second, '.');
				let readCount = detail.readCount;
				let sameUser = detail.sameUser;
				
				document.querySelector("#detailModal").setAttribute("data-boardId", boardId);
				
				document.querySelector("#boardIdDetail").innerHTML = boardId;
				document.querySelector("#boardTitleDetail").innerHTML = title;
				document.querySelector("#boardContentDetail").innerHTML = content;
				document.querySelector("#userNameDetail").innerHTML = userName;
				document.querySelector("#regDtDetail").innerHTML = regDtStr;
				document.querySelector("#readCountDetail").innerHTML = readCount;
				
				if(sameUser){
					document.querySelector("#btnBoardUpdatePage").style.display = "inline-block";
					document.querySelector("#btnBoardDeleteConfirm").style.display = "inline-block";
					
					
				}else{
					document.querySelector("#btnBoardUpdatePage").style.display = "none";
					document.querySelector("#btnBoardDeleteConfirm").style.display = "none";
				}
				
				

				let modal = new bootstrap.Modal(document.querySelector("#detailModal"));
				
				modal.show();
   		}
   		
   		
   		async function boardListTotalCnt(){
   			let url = '<%=contextPath%>/board/boardListTotalCnt';
   			let urlParams = '?searchWord=' + SEARCH_WORD;
   			
   			let fetchOptions = {
   				method: 'GET',
   			}
   			
   			try{
   				let response = await fetch(url + urlParams, fetchOptions);
   				let data = await response.json();
   				console.log(data);
   				
   				TOTAL_LIST_ITEM_COUNT = data.totalCnt;
   				makePaginationHtml(LIST_ROW_COUNT, PAGE_LINK_COUNT, CURRENT_PAGE_INDEX, TOTAL_LIST_ITEM_COUNT, "paginationWrapper");
   				
   			}catch( error ){
   				
   				console.log(error);
   				alertify.error('글 조회 과정에서 문제가 생겼습니다.');
   			
   			}
   			
   		}
   		
   		function movePage(pageIndex){
   			OFFSET = (pageIndex - 1) * LIST_ROW_COUNT;
   			CURRENT_PAGE_INDEX = pageIndex;
   			boardList();
   		}
   		
   		///////////////////////////////
   		
   		function validateInsert(){
   			let isTitleInsertValid = false;
   			let isContentInsertValid = false;
   			
   			let titleInsertValue = document.querySelector("#title").value;
   			if(titleInsertValue.length > 0) isTitleInsertValid = true;
   			
   			let contentInsertValue = document.querySelector("#content").value;
   			if(contentInsertValue.length > 0) isContentInsertValid = true;
   			
   			if(isTitleInsertValid && isContentInsertValid) return true;
   			return false;
   			
   		}
   		
   		async function boardInsert(){
		    let title = document.querySelector("#title").value;
		    let content = document.querySelector("#content").value;
		    
		    let urlParams = new URLSearchParams ({
		        title: title,
		        content: content
		    });
		
		    let fetchOptions = {
		    method: "POST",
		    body: urlParams
		    }
		
		    let response = await fetch("<%=contextPath%>/board/boardInsert", fetchOptions);
		    let data = await response.json();
		    if(data.result == "success"){ 
		    	alertify.alert("Welcome!", "글이 정상적으로 작성되었습니다.", function(){
		    		  alertify.message('글 작성 성공');
		    		  boardList();
		    	});
		    	
		    }else if(data.result == "fail"){
		        alertify.error("글 등록 과정에서 오류가 발생했습니다.");
		    }
		}
   		
		///////////////////////////////
   		
   		function validateUpdate(){
   			let isTitleInsertValid = false;
   			let isContentInsertValid = false;
   			
   			let titleInsertValue = document.querySelector("#titleUpdate").value;
   			if(titleInsertValue.length > 0) isTitleInsertValid = true;
   			
   			let contentInsertValue = document.querySelector("#contentUpdate").value;
   			if(contentInsertValue.length > 0) isContentInsertValid = true;
   			
   			if(isTitleInsertValid && isContentInsertValid) return true;
   			return false;
   		}
		
   		async function boardUpdate(){
   			let boardId = document.querySelector("#updateModal").getAttribute("data-boardId");
		    let title = document.querySelector("#titleUpdate").value;
		    let content = document.querySelector("#contentUpdate").value;
		    
		    let urlParams = new URLSearchParams ({
		    	boardId: boardId,
		        title: title,
		        content: content
		    });
		
		    let fetchOptions = {
		    method: "POST",
		    body: urlParams
		    }
		
		    let response = await fetch("<%=contextPath%>/board/boardUpdate", fetchOptions);
		    let data = await response.json();
		    if(data.result == "success"){ 
		    	alertify.alert("Welcome!", "글이 정상적으로 수정되었습니다.", function(){
		    		  alertify.message('글 수정 성공');
		    		  boardList();
		    	});
		    	
		    }else if(data.result == "fail"){
		        alertify.error("글 수정 과정에서 오류가 발생했습니다.");
		    }
		}

		///////////////////////////////
  
   		async function boardDelete(){
   			let boardId = document.querySelector("#detailModal").getAttribute("data-boardId");
		    
		    let urlParams = "?boardId=" + boardId;
		
		
		    let response = await fetch("<%=contextPath%>/board/boardDelete" + urlParams);
		    let data = await response.json();
		    if(data.result == "success"){ 
		    	alertify.alert("Welcome!", "글이 정상적으로 삭제되었습니다.", function(){
		    		  alertify.message('글 삭제 성공');
		    		  boardList();
		    	});
		    	
		    }else if(data.result == "fail"){
		        alertify.error("글 삭제 과정에서 오류가 발생했습니다.");
		    }
		}
		
		// logout
		
		async function logout(){
			// logout => 백엔드에서 sessin.invalidate();
			// result => success => login 페이지 이동
			
			
			let url = "<%=contextPath%>/logout";
			let response = await fetch(url);
			let data = await response.json();
		    if(data.result == "success"){ 
		    	window.location.href="<%=contextPath%>/jsp/login.jsp";
		    	
		    }else if(data.result == "fail"){
		        alertify.error("로그아웃 과정에서 오류가 발생했습니다.");
		    }
		}
   		

        </script>
</body>
</html>