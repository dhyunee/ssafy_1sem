<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script src="<%=contextPath%>/js/util.js"></script>

<script>
			
      window.onload = function () {
        
        // 로그인 / 회원가입 / 로그아웃 / 마이페이지 버튼
		if("<%=userDto%>" != "null"){
			document.querySelector("#REGISTER").style.display = "none";
			document.querySelector("#LOGIN").style.display = "none";
			document.querySelector("#LOGOUT").style.display = "inline-block";
			document.querySelector("#MYPAGE").style.display = "inline-block";
			if("<%=userClsf%>" === "1"){
				document.querySelector("#EVMANAGE").style.display = "inline-block";
			} else {
				document.querySelector("#EVMANAGE").style.display = "none";
			}
		}else{
			document.querySelector("#REGISTER").style.display = "inline-block";
			document.querySelector("#LOGIN").style.display = "inline-block";
			document.querySelector("#LOGOUT").style.display = "none";
			document.querySelector("#MYPAGE").style.display = "none";
			document.querySelector("#EVMANAGE").style.display = "none";
		}
        //
        
        
        
        
        // 로그인 시작
        document.querySelector("#btnLogin").onclick = function(){
            let userEmailValue = document.querySelector("#userLoginEmail").value;
            let userPasswordValue = document.querySelector("#userLoginPassword").value;
            console.log(userEmailValue);
            console.log(userPasswordValue);


            // 유효성 검사 => POST 전송
            if(validate()){
                login();
            }else{
                // 유효성 검사 실패 코드
            }
        }
        // 로그인 끝
        
        // 로그아웃 confirm
        document.querySelector('#LOGOUT').onclick = function(){
			alertify.confirm("정보", "로그아웃 하시겠습니까?", function(){
				logout();
			}, function(){ console.log("로그아웃 취소"); });
	    }
	   	// 로그아웃 끝 
       
        
        // 회원가입 시작
        document.querySelector("#REGISTER").onclick = function(){
	   		registerForm();
	   	}
        
        document.querySelector("#userName").focus();

        document.querySelector("#userName").onblur = function(){
            if(validateUserName(this.value)){
                this.classList.remove('is-invalid');
                this.classList.add('is-valid');
                
            }else{
                this.classList.remove('is-valid');
                this.classList.add('is-invalid');
                
            }
        }

        document.querySelector("#userPassword").onblur = function(){
            if(validatePassword(this.value)){
                this.classList.remove('is-invalid');
                this.classList.add('is-valid');

            }else{
                this.classList.remove('is-valid');
                this.classList.add('is-invalid');
            }
        }

        document.querySelector("#userPassword2").onblur = function(){
            if(validatePassword2(this.value)){
                this.classList.remove('is-invalid');
                this.classList.add('is-valid');

            }else{
                this.classList.remove('is-valid');
                this.classList.add('is-invalid');
            }
        }

        document.querySelector("#userEmail").onblur = function(){
            if(validateEmail(this.value)){
                this.classList.remove('is-invalid');
                this.classList.add('is-valid');

            }else{
                this.classList.remove('is-valid');
                this.classList.add('is-invalid');
            }
        }


        
        document.querySelector("#btnRegister").onclick = function(){
        	if(document.querySelectorAll("form .is-invalid").length == 0){
        		regist();
        	}
        	else alert("입력을 다시 확인해주세요");
        }
        
        // 회원가입 끝
        

        document.querySelector("#MYPAGE").onclick = function(){
        	userDetail();
        }
        
        
        //시 도 정보 요청
        getSido();
        /////////////////onload 변경점 끝///////////////////////////////////////
        
        // 회원정보 수정 시작
        document.querySelector("#btnUpdate").onclick = function(){
        	updateUser();
        }
        // 회원정보 수정 끝
        
     	// 회원정보 삭제 시작
        document.querySelector("#btnDelete").onclick = function(){
        	deleteUser();
        }
        // 회원정보 삭제 끝
        
        
      };
      
      
      
      var SIDO = '';
      var GUGUN = '';
      var DONG = '';
      // 시도가 바뀌면 구군정보 얻기.
      document.querySelector("#sido").addEventListener("change",function() {
    	 SIDO = this.value;
    	 GUGUN = '';
    	 DONG = '';
	   	 getGugun(SIDO);
	   	 //console.log(digit);
      });
      
      // 구군이 바뀌면 동정보 얻기.
      document.querySelector("#gugun").addEventListener("change",function() {
	   	 GUGUN = this.value;
	   	 DONG = '';
	   	 getDong(SIDO,GUGUN);
	   	 //console.log(digit);
      });
      
   // 동정보 얻기.
      document.querySelector("#dong").addEventListener("change",function() {
	   	 DONG = this.value;
	   	 //console.log(digit);
      });
      
      async function getSido(){
    	  console.log("<%=contextPath%>/main/sido");
    	  let response = await fetch("<%=contextPath%>/main/sido" );

          let data = await response.json();
          
          //console.log(data);
          
          let sido = document.querySelector("#sido");
          sido.innerHTML = `<option value="">시도선택</option>`;
          innerHtml = ``;
          data.forEach(el => {
        	  innerHtml += `<option value="\${el.num}">\${el.name}</option>`;
          });
          sido.innerHTML += innerHtml;
      }
      
      async function getGugun(sido){
    	  console.log("<%=contextPath%>/main/gugun?sido="+sido);
    	  let response = await fetch("<%=contextPath%>/main/gugun?sido="+sido );

          let data = await response.json();
          
          console.log(data);
          
          let gugun = document.querySelector("#gugun");
          gugun.innerHTML = `<option value="">구군선택</option>`;
          innerHtml = ``;
          data.forEach(el => {
        	  innerHtml += `<option value="\${el.num}">\${el.name}</option>`;
          });
          gugun.innerHTML += innerHtml;
      }
      
      async function getDong(sido,gugun){
    	  console.log("<%=contextPath%>/main/dong?sido="+sido+"&gugun="+gugun);
    	  let response = await fetch("<%=contextPath%>/main/dong?sido="+sido+"&gugun="+gugun );

          let data = await response.json();
          
          console.log(data);
          
          let dong = document.querySelector("#dong");
          dong.innerHTML = `<option value="">동선택</option>`;
          innerHtml = ``;
          data.forEach(el => {
        	  innerHtml += `<option value="\${el.num}">\${el.name}</option>`;
          });
          dong.innerHTML += innerHtml;
      }
      

      
      async function getList(){
    	  console.log("<%=contextPath%>/main/list?sido="+SIDO+"&gugun="+GUGUN+"&dong="+DONG);
    	  let response = await fetch("<%=contextPath%>/main/list?sido="+SIDO+"&gugun="+GUGUN+"&dong="+DONG );

          let data = await response.json();
          
          console.log(data);
          
          let aptlist = document.querySelector("#aptlist");
          
          innerHtml = ``;
          
          var positions = [];
          data.forEach(el => {
        	  innerHtml += `<tr onclick="clickPlace(\${el.lat}, \${el.lng})"><td>\${el.aptName}</td><td>\${el.floor}</td><td>\${el.area}</td><td>\${el.dong}</td><td>\${el.dealAmount}</td><td id="lat" style="display:none">\${el.lat}</td><td id="lng" style="display:none">\${el.lng}</td></tr>`;
        	  
        	  var obj = {
        		        title: el.aptName,
        		        area: el.area,
        		        amount: el.dealAmount,
        		        latlng: new kakao.maps.LatLng(el.lat, el.lng)
        		    };
        	  
        	  positions.push(obj);
          });
          aptlist.innerHTML = innerHtml;
          

          document.querySelector("#aptTable").style.display = "";
          document.querySelector("#MainImage").style.display = "none";
          
          
          console.log(positions);
          
          // 지도 띄우기
			var options = { //지도를 생성할 때 필요한 기본 옵션
				center: positions[0].latlng, //지도의 중심좌표.
				level: 3 //지도의 레벨(확대, 축소 정도)
			};
			
			map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
		    
			for (var i = 0; i < positions.length; i ++) {
			    
			    // 마커 이미지의 이미지 크기 입니다
			    var imageSize = new kakao.maps.Size(24, 35); 
			    
			    // 마커 이미지를 생성합니다    
			    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
			    
			    // 마커를 생성합니다
			    var marker = new kakao.maps.Marker({
			        map: map, // 마커를 표시할 지도
			        position: positions[i].latlng, // 마커를 표시할 위치
			        title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
			        image : markerImage // 마커 이미지 
			    });
			    
			  	var infowindow = new kakao.maps.InfoWindow({
			  		content: '<div class="card" style="width: 100%;">' + 
                    '<h5 class="card-title">' + positions[i].title + '</h5>' +
                    '<p class="card-text">총 면적 : 약 ' + positions[i].area  + '</p>' +
                    '<p class="card-text">금액 : ' + positions[i].amount  + '</p>' +
                    '</div>'
			  	
			  	});
			  	

			    kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
			    kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
			}
      }
      
      async function getListFromXML(){
    	  console.log("<%=contextPath%>/main/list?sido="+SIDO+"&gugun="+GUGUN+"&dong="+DONG);
    	  let response = await fetch("<%=contextPath%>/aptdeal?sido="+SIDO+"&gugun="+GUGUN+"&dong="+DONG );

          let data = await response.json();
          
          console.log(data);
          
          let aptlist = document.querySelector("#aptlist");
          
          innerHtml = ``
          
          var positions = [];
          data.forEach(el => {
        	  innerHtml += `<tr onclick="clickPlace(\${el.lat}, \${el.lng})"><td>\${el.aptName}</td><td>\${el.floor}</td><td>\${el.area}</td><td>\${el.dong}</td><td>\${el.dealAmount}</td><td id="lat" style="display:none">\${el.lat}</td><td id="lng" style="display:none">\${el.lng}</td></tr>`;
        	  
        	  var obj = {
        		        title: el.aptName,
        		        area: el.area,
        		        amount: el.dealAmount,
        		    };
        	  
        	  positions.push(obj);
          });
          aptlist.innerHTML = innerHtml;
          

          document.querySelector("#aptTable").style.display = "";
          
          console.log(positions);
			  	
      }
      
      function clickPlace(lat, lng){
			map.setCenter(new kakao.maps.LatLng(lat, lng)); //지도 생성 및 객체 리턴
      }
      
   		// 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
      function makeOverListener(map, marker, infowindow) {
          return function() {
              infowindow.open(map, marker);
          };
      }

      // 인포윈도우를 닫는 클로저를 만드는 함수입니다 
      function makeOutListener(infowindow) {
          return function() {
              infowindow.close();
          };
      }
      
      // 로그인 시작
      function validate(){
                    //return true / false
                    let isUserEmailValid = false;
                    let isUserPasswordValid = false;
    
                    let userEmailValue = document.querySelector("#userLoginEmail").value;
                    if(userEmailValue.length > 0){
                        isUserEmailValid = true;
                    }
    
                    let userPasswordValue = document.querySelector("#userLoginPassword").value;
                    if(userPasswordValue.length > 0){
                        isUserPasswordValid = true;
                    }
    
    
                    if(isUserEmailValid && isUserPasswordValid){
                        return true;
                    }
    
                    return false;
                }
    
                async function login(){
                    // validate() 가 true면 return 
                    // 백엔드로 전송할 데이터 준비
                    // 비동기요청 + POST
                    // success => /board/boardMain
                    // fail => alert
    
                    
                    let userEmail = document.querySelector("#userLoginEmail").value;
                    let userPassword = document.querySelector("#userLoginPassword").value;
    
                    // parameter
                    let urlParams = new URLSearchParams({
                        userEmail: userEmail,
                        userPassword: userPassword
                    });
    
                    // fetch options
                    let fetchOptions = {
                        method: "POST",
                        body: urlParams
                    }
    
                    
                    let response = await fetch("<%=contextPath%>/login", fetchOptions);
                    let data = await response.json(); // json => js object <= JSON.parse();
                    if(data.result == "success"){ 
                    	window.location.reload();
                    }else if(data.result == "fail"){
                    	alertify.error('아이디 또는 패스워드를 확인하세요.');
                    }
                
                    // fetch(url, option)
                }
      		// 로그인 종료
      
      		// 회원가입 관련 시작
      
      		// 회원가입 페이지 생성
      	 	async function registerForm(){
   				let url = "<%=contextPath%>/user/registerForm";
   				
   				let fetchOptions = {
   					method: "POST"
   				}
   				
   				console.log("registerForm");
   				let response = await fetch(url, fetchOptions);
   				let data = await response.json();
   				
   				var mR = document.querySelector("#memberRadio");
   				var innerHTML = ``;
   				data.forEach(el =>{
   					console.log(el);
   					innerHTML += `
	   				<div class="form-check" style="display: inline-block;margin-right:1rem">
	   				  <input class="form-check-input" type="radio" name="memberCode" id="memberCode" value= \${el.code}>
	   				  <label class="form-check-label" for="flexRadioDefault1">
	   				    ` + el.codeName + `
	   				  </label>
	   				</div>`;
   				});
   				
   				mR.innerHTML = innerHTML;
      		}
      		
      		// 실제 회원가입
      		async function regist(){
            	userName = document.querySelector("#userName").value;
                userPassword = document.querySelector("#userPassword").value;
                userEmail = document.querySelector("#userEmail").value;
                userCode = document.querySelector("input[name='memberCode']:checked").value;
                console.log(userCode);

                let urlParams = new URLSearchParams ({
                    userName: userName,
                    userPassword: userPassword,
                    userEmail: userEmail,
                    userClsf: userCode
                });

                let fetchOptions = {
                method: "POST",
                body: urlParams
                }

                let response = await fetch("<%=contextPath%>/user/register", fetchOptions);
                let data = await response.json(); // json => js object <= JSON.parse();
                if(data.result == "success"){ // login.jsp => /jsp/login.jsp 로 페이지 이동 ( 새로운 페이지 요청 )
                	alertify.alert("Welcome!", "회원가입을 축하드립니다.", function(){
                		  alertify.message('회원가입 성공');
                		 window.location.reload();
                	});
                	
                }else if(data.result == "fail"){
                    alert('아이디 또는 패스워드를 확인하세요.');
                }
            }

            function validateUserName(userName){
                if(userName.length >= 3) return true;
                return false;
            }

            function validatePassword(userPassword){
                var patternEngAtListOne = new RegExp(/[a-zA-Z]+/);// + for at least one
                var patternSpeAtListOne = new RegExp(/[~!@#$%^&*()_+|<>?:{}]+/);// + for at least one
                var patternNumAtListOne = new RegExp(/[0-9]+/);// + for at least one

                if( patternEngAtListOne.test( userPassword ) 
                        && patternSpeAtListOne.test( userPassword )  
                        && patternNumAtListOne.test( userPassword )
                        && userPassword.length >= 8
                ){
                    return true;
                }
                else return false;
            }

            function validatePassword2(userPassword2) {
                if (userPassword2 == document.querySelector("#userPassword").value ) return true;
                else return false;
            }

            function validateEmail(userEmail){
                var emailPattern = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;

                if(userEmail.match(emailPattern) != null) return true;
                return false;
            }
            
            // 회원가입 종료
            
            // 로그아웃 시작
            
            async function logout(){
				// logout => 백엔드에서 sessin.invalidate();
				// result => success => login 페이지 이동
				
				
				let url = "<%=contextPath%>/logout";
				let response = await fetch(url);
				let data = await response.json();
			    if(data.result == "success"){ 
			    	window.location.reload();
			    }else if(data.result == "fail"){
			        alertify.error("로그아웃 과정에서 오류가 발생했습니다.");
			    }
			}
            
            // 로그아웃 종료
            
            // 회원정보 변경 시작
            async function updateUser(){
            	userEmail = document.querySelector("#userUpdateEmail").value;
                userPassword = document.querySelector("#userUpdatePassword").value;
                userPassword2 = document.querySelector("#userUpdatePassword2").value;
				
                
                if (validatePassword(userPassword) && userPassword == userPassword2) {
	                let urlParams = new URLSearchParams ({
	                    userEmail: userEmail,
	                    userPassword: userPassword,
	                });
	
	                let fetchOptions = {
	                method: "POST",
	                body: urlParams
	                }
	
	                let response = await fetch("<%=contextPath%>/user/update", fetchOptions);
	                let data = await response.json(); // json => js object <= JSON.parse();
	                if(data.result == "success"){ // login.jsp => /jsp/login.jsp 로 페이지 이동 ( 새로운 페이지 요청 )
	                	alertify.alert("Welcome!", "회원정보가 변경되었습니다.", function(){
	                		  alertify.message('회원정보 변경');
	                		 window.location.reload();
	                	});
	                	
	                }else if(data.result == "fail"){
	                    alert('아이디 또는 패스워드를 확인하세요.');
	                }
                } else {
                	alert('비밀번호를 확인해주세요.');
                }
                
            }
            // 회원정보 변경 끝
            
            // 회원정보 삭제 시작
            async function deleteUser(){
            	userEmail = document.querySelector("#userUpdateEmail").value;
            	
                if (confirm("삭제된 아이디는 되돌릴 수 없습니다. 정말 탈퇴하시겠습니까?")) {
	                let urlParams = new URLSearchParams ({
	                    userEmail: userEmail,
	                });
	
	                let fetchOptions = {
	                method: "POST",
	                body: urlParams
	                }
	
	                let response = await fetch("<%=contextPath%>/user/delete", fetchOptions);
	                let data = await response.json(); // json => js object <= JSON.parse();
	                if(data.result == "success"){ // login.jsp => /jsp/login.jsp 로 페이지 이동 ( 새로운 페이지 요청 )
	                	alertify.alert("Welcome!", "회원탈퇴가 완료되었습니다.", function(){
	                		 alertify.message('회원정보 삭제');
	                		 logout();
	                	});
	                	
	                }else if(data.result == "fail"){
	                    alert('아이디 또는 패스워드를 확인하세요.');
	                }
                }
            }
            // 회원정보 삭제 끝
            
            document.querySelector('#EVMANAGE').onclick = function(){
		   	location.href="<%=contextPath%>/main/eventList";
	   		}
           	

            function validateUserName(userName){
                if(userName.length >= 3) return true;
                return false;
            }
            
            
            // 유저 정보 받기
            async function userDetail(){

       			let url = '<%=contextPath%>/user/detail';
       			
       			let fetchOptions = {
       				method: 'POST'
       			}
       			
       			try{
       				let response = await fetch(url, fetchOptions);
       				let detail = await response.json();
       				
       				console.log(detail);
       				let userName = detail.userName;
       				let userEmail = detail.userEmail;
       				let regDt = detail.userRegistDate;
    				let regDtStr = makeDateStr(regDt.date.year, regDt.date.month, regDt.date.day, ".");
    				
    				console.log(userName);
    				
    				document.querySelector('#userUpdateName').value = userName;
    				document.querySelector('#userUpdateEmail').value = userEmail;
    				document.querySelector('#userUpdateRegdt').value = regDtStr;
    				
       			}catch( error ){
       				
       				console.log(error);
       				alertify.error('글 상세조회 과정에서 문제가 생겼습니다.');
       			
       			}
            }
            
    </script>