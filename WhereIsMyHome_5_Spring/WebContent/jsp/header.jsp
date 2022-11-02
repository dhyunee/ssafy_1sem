<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- 상단 navbar start -->
	<nav class="navbar navbar-expand-lg navbar-light bg-light shadow">
		<div class="container">
			<a class="navbar-brand text-primary fw-bold" href="./index.jsp">
				<img src="./img/ssafy_logo.png" alt="" width="60" /> WhereIsMyHome
			</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-lg-0">
					<li class="nav-item"><a class="nav-link" aria-current="page"
						href="<%=contextPath %>/jsp/notice.jsp">공지사항</a></li>
					<li class="nav-item"><a class="nav-link" aria-current="page"
					href="<%=contextPath %>/aptList.jsp">공공데이터검색</a></li>
				</ul>

				<!-- 로그인 전 -->
				<ul class="navbar-nav mb-2 me-2 mb-lg-0">
					<li class="nav-item">
						<!-- 회원가입 버튼 -->
						<button id="REGISTER" type="button" class="btn"
							data-bs-toggle="modal" data-bs-target="#userRegisterModal">회원가입</button>
						<!-- 회원가입 Modal -->
						<div class="modal fade" id="userRegisterModal" tabindex="-1"
							aria-labelledby="registerModalLabel" aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="registerModalLabel">회원가입</h5>
										<button type="button" class="btn-close"
											data-bs-dismiss="modal" aria-label="Close"></button>
									</div>
									<div class="modal-body">
										<div class="mb-3">
											<label class="form-label">이름</label> <input type="text"
												class="form-control" id="userName" placeholder="이름을 입력하세요">
										</div>
										<div class="mb-3">
											<label class="form-label">비밀번호</label> <input type="password"
												class="form-control" id="userPassword"
												placeholder="비밀번호를 입력하세요">
										</div>
										<div class="mb-3">
											<label class="form-label">비밀번호 확인</label> <input
												type="password" class="form-control" id="userPassword2"
												placeholder="비밀번호를 다시 입력하세요">
										</div>
										<div class="mb-3">
											<label class="form-label">이메일</label> <input type="text"
												class="form-control" id="userEmail" placeholder="이메일을 입력하세요">
										</div>
										<div class="mb-3">
											<label class="form-label">회원 구분</label>
											<div id = "memberRadio">
												
											</div>
										</div>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-primary" id="btnRegister">회원가입</button>
									</div>
								</div>
							</div>
						</div>
					</li>
					<li class="nav-item">
						<!-- 로그인 버튼 -->
						<button id="LOGIN" type="button" class="btn"
							data-bs-toggle="modal" data-bs-target="#userLoginModal">로그인</button>
						<!-- 로그인 Modal -->
						<div class="modal fade" id="userLoginModal" tabindex="-1"
							aria-labelledby="loginModalLabel" aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="loginModalLabel">로그인</h5>
										<button type="button" class="btn-close"
											data-bs-dismiss="modal" aria-label="Close"></button>
									</div>
									<div class="modal-body">
										<div class="mb-3">
											<label for="formGroupExampleInput" class="form-label">이메일</label>
											<input type="text" class="form-control" id="userLoginEmail"
												placeholder="이메일을 입력하세요">
										</div>
										<div class="mb-3">
											<label for="formGroupExampleInput2" class="form-label">비밀번호</label>
											<input type="password" class="form-control"
												id="userLoginPassword" placeholder="비밀번호를 입력하세요">
										</div>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-primary" id="btnLogin">로그인</button>
									</div>
								</div>
							</div>
						</div>
					</li>
				</ul>


				<!-- 로그인 후 -->
				<ul class="navbar-nav mb-2 me-2 mb-lg-0">

					<!-- 로그아웃 버튼 -->
					<li class="nav-item">
						<button type="button" class="btn" id="LOGOUT">로그아웃</button>
					</li>

					<!-- 마이페이지 버튼 -->
					<li class="nav-item">
						<button id="MYPAGE" type="button" class="btn"
							data-bs-toggle="modal" data-bs-target="#userUpdateModal">마이페이지</button>
						<div class="modal fade" id="userUpdateModal" tabindex="-1"
							aria-labelledby="updateModalLabel" aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="updateModalLabel">마이페이지</h5>
										<button type="button" class="btn-close"
											data-bs-dismiss="modal" aria-label="Close"></button>
									</div>
									<div class="modal-body">
										<div class="mb-3">
											<label for="formGroupExampleInput" class="form-label">이름</label>
											<input type="text" class="form-control" id="userUpdateName"
												readonly />
										</div>

										<div class="mb-3">
											<label for="formGroupExampleInput2" class="form-label">이메일</label>
											<input type="text" class="form-control" id="userUpdateEmail"
												readonly />
										</div>

										<div class="mb-3">
											<label for="formGroupExampleInput3" class="form-label">비밀번호</label>
											<input type="password" class="form-control"
												id="userUpdatePassword" placeholder="비밀번호를 입력하세요">
										</div>

										<div class="mb-3">
											<label for="formGroupExampleInput4" class="form-label">비밀번호
												확인</label> <input type="password" class="form-control"
												id="userUpdatePassword2" placeholder="비밀번호를 다시 입력하세요">
										</div>

										<div class="mb-3">
											<label for="formGroupExampleInput5" class="form-label">가입
												날짜</label> <input type="text" class="form-control"
												id="userUpdateRegdt" readonly />
										</div>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-primary" id="btnUpdate">수정</button>
										<button type="button" class="btn btn-danger" id="btnDelete">삭제</button>
									</div>
								</div>
							</div>
						</div>
					</li>
					<li class="nav-item">
						<button type="button" class="btn" id="EVMANAGE">이벤트관리</button>
					</li>
					
				</ul>
			</div>
		</div>
	</nav>
	<!-- 상단 navbar end -->
	