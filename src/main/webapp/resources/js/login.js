document.addEventListener('DOMContentLoaded', () => {
	    // 로그인 폼 유효성 검사
	    const loginform = document.querySelector("#loginform");
	    const uemail = document.querySelector("#uemail");
	    const upassword = document.querySelector("#upassword");
	    const idError = document.querySelector("#idError");
	    const pwError = document.querySelector("#pwError");
	
	    const loginValidate = (event) => {
	        event.preventDefault();
	        let resultCheck = true;
	
	        if (uemail.value === "") {
	            idError.innerHTML = "아이디를 입력해 주세요";
	            idError.classList.add("text-danger");
	            resultCheck = false;
	        } else {
	            idError.innerHTML = ""; // 오류 메시지 초기화
	        }
	
	        if (upassword.value === "") {
	            pwError.innerHTML = "비밀번호를 입력해 주세요";
	            pwError.classList.add("text-danger");
	            resultCheck = false;
	        } else {
	            pwError.innerHTML = ""; // 오류 메시지 초기화
	        }
	
	        if (resultCheck) { 
	            loginform.submit(); 
	        }
	    };
	
	    loginform.addEventListener('submit', loginValidate);
	
	    // "비밀번호를 잊으셨나요?" 링크를 클릭했을 때 모달에 포커스를 주는 JavaScript 코드
	    const forgotpw = document.getElementById('forgotPw');
	    const forgotPasswordModal = document.getElementById('forgotPasswordModal');
	
	    // 링크를 클릭했을 때 모달을 표시하는 이벤트 리스너
	    forgotpw.addEventListener('click', () => {
	        $('#forgotPasswordModal').modal('show');
	    });
	
	    // 임시 비밀번호 생성 및 발급
	    window.generateTemporaryPassword = function() {
	        const chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!@#$%&*";
	        let randomStr = "";
	        for (let i = 0; i < 10; i++) {
	            let randomIndex = Math.floor(Math.random() * chars.length);
	            randomStr += chars[randomIndex];
	        }
	
	        // 사용자 입력 정보 가져오기
	        let name = document.getElementById('findPwName').value;
	        let email = document.getElementById('findPwEmail').value;
	        let phoneNumber = document.getElementById('findPwPhonenumber').value;
	

	        // 사용자 정보를 객체로 생성 (필요한 필드들을 모두 포함)
	        let userData = {
	            uname: name,
	            uemail: email,
	            uphonenumber: phoneNumber,
	        };


            // AJAX를 이용하여 백엔드로 데이터 전송하여 일치 여부 확인, 임시 비밀번호 업데이트
            $.ajax({
                type: 'POST',
                url: '/viewport_mini_web/findPw',
                contentType: 'application/json',
                data: JSON.stringify(userData), //전송
                success: function(data) {
                	/*console.log(data);*/
                    if (data.success) {
                        // 일치하는 경우 임시 비밀번호 출력
                        document.getElementById('random').innerText = '임시 비밀번호: ' + data.temporaryPassword;
                        document.getElementById('random').classList.remove('text-danger');
                        document.getElementById('random').classList.add('text-success');
                    } else {
                        // 일치하지 않는 경우 메시지 표시
                       /* document.getElementById('random').innerText = '일치하는 정보가 없습니다.';*/
                        document.getElementById('random').innerText = data.message; //message는 서버에서 응답으로 클라이언트에게 전송되는 JSON 객체의 일부
                        document.getElementById('random').classList.remove('text-success');
                        document.getElementById('random').classList.add('text-danger');
                        
                        
                        // 로그인 링크 보이기
                        document.getElementById('goToLogin').style.display = 'block';
                    }
                },
                error: function(xhr, status, error) {
                    const response = xhr.responseJSON;
                    document.getElementById('random').innerText = response.message || '일치하는 정보가 없습니다.';
                    document.getElementById('random').classList.remove('text-success');
                    document.getElementById('random').classList.add('text-danger');
                }
            });

            // generatePwBtn 클릭 이벤트 추가
            document.getElementById('generatePwBtn').addEventListener('click', window.generateTemporaryPassword);
        };

    });