    const signupForm = document.querySelector("#signupForm");
    const reg = /-/g;

    // 주소검색창 열기 함수
    const uzonecode = document.querySelector("#zonecode");
    const uaddress = document.querySelector("#uaddress");
    const uaddressdetail = document.querySelector("#uaddressdetail");



    function requestAjax(users) {
        console.log("ajax 실행");
  
        $.ajax({
            url: '/viewport_mini_web/signup',
            type: 'POST',
            contentType: 'application/json',
            data: JSON.stringify(users),
            success: function (data) {
                console.log('회원가입이 성공적으로 처리되었습니다.');
                window.location.href = 'http://localhost:8080/viewport_mini_web/loginForm';
            }
        });
    }

    // 유효성 검사 함수
    function validatePattern(pattern, value, errorElement, errorMessage) {
        const isValid = pattern.test(value);
        if (value.trim() === "") {
          errorElement.innerHTML = "값을 입력해주세요.";
          errorElement.classList.add("text-danger");
          return false;
      }
        if (!isValid) {
            errorElement.innerHTML = errorMessage;
            errorElement.classList.add("text-danger");
        } else {
            errorElement.innerHTML = "";
        }
        return isValid;
    }

    // 이메일 중복 확인 함수
    function checkEmail() {
        let uemail = document.getElementById("uemail").value;
        console.log(uemail);

        if (uemail === "") {
            $(".uemail_null").show();
            return;
        } else {
            $(".uemail_null").hide();
        }

        $.ajax({
            type: "GET",
            url: "http://localhost:8080/viewport_mini_web/checkDuplicateEmail",
            data: {
                uemail: uemail
            },
            success: function (response) {
                if (response === "Unique") {
                    $(".uemail_ok").show();
                    $(".uemail_already").hide();
                } else {
                    $(".uemail_ok").hide();
                    $(".uemail_already").show();
                    resultCheck = false;
                }
            },
            error: function () {
                alert("이메일 중복 확인 요청 실패");
            }
        });
    }
    
    // 회원가입 버튼 클릭 시
    signupForm.addEventListener('submit', function (e) {
        e.preventDefault(); // 폼 전송을 중지하여 페이지가 새로고침되는 것을 방지

        let resultCheck = true;

        // 이메일 유효성 검사
        const uemail = document.querySelector("#uemail").value;
        const emailPattern = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
        const emailError = document.querySelector("#emailError");

        resultCheck &= validatePattern(emailPattern, uemail, emailError, "올바른 이메일을 입력해 주세요!");

        // 패스워드 유효성 검사
        const pwPattern = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,15}$/;
        const upassword = document.querySelector("#upassword").value;
        const pw1Error = document.querySelector("#pw1Error");

        resultCheck = validatePattern(pwPattern, upassword, pw1Error, "영어 대,소문자 숫자 혼용하여 8~15자를 입력해 주세요!");

        const upasswordCheck = document.querySelector("#upasswordCheck").value;
        const pw2Error = document.querySelector("#pw2Error");

        if (upassword !== upasswordCheck) {
            pw2Error.innerHTML = "비밀번호가 일치하지 않습니다.";
            pw2Error.classList.add("text-danger");
            resultCheck = false;
        } else {
            pw2Error.innerHTML = "";
        }

        // 주민등록번호 유효성 검사
        const ussn1 = document.querySelector("#ussn1").value;
        const ussn2 = document.querySelector("#ussn2").value;
        const ussn = ussn1 + ussn2;
        const residentNumberPattern = /^[0-9]+$/;
        const ussnError = document.querySelector("#ussnError");

        resultCheck = validatePattern(residentNumberPattern, ussn, ussnError, "올바른 주민등록번호 형식이 아닙니다.");

        const birthYear = parseInt(ussn1.substring(0, 2));
        const birthMonth = parseInt(ussn1.substring(2, 4));
        const birthDay = parseInt(ussn1.substring(4, 6));
        const genderCode = parseInt(ussn2.charAt(0));

        if (birthMonth < 1 || birthMonth > 12 || birthDay < 1 || birthDay > 31 || genderCode < 1 || genderCode > 4) {
            ussnError.innerHTML = "올바른 생년월일 또는 성별 정보가 아닙니다.";
            ussnError.classList.add("text-danger");
            resultCheck = false;
        }

        // 이름 유효성 검사
        const uname = document.querySelector("#uname").value.trim();
        const namePattern = /^[a-zA-Zㄱ-ㅎ가-힣]*$/;
        const nameError = document.querySelector("#nameError");

        resultCheck = validatePattern(namePattern, uname, nameError, "올바른 이름을 입력해 주세요!");

        // 휴대폰 번호 유효성 검사
        const uphonenumber = document.querySelector("#uphonenumber").value.trim();
        const phoneNumError = document.querySelector("#phoneNumError");

        const phonePattern = /^(01[016789]{1})-?[0-9]{3,4}-?[0-9]{4}$/;
                                                                                     
        if (!validatePattern(phonePattern, uphonenumber, phoneNumError, "올바른 휴대폰 번호를 입력해 주세요")) {
            resultCheck = false;
        }

        // 회원가입 폼 데이터를 새로운 FormData 객체로 생성
        var users = {
            uemail: document.getElementById('uemail').value,
            upassword: document.getElementById('upassword').value,
            passwordConfirm: document.getElementById('upasswordCheck').value,
            uname: document.getElementById('uname').value.trim(),
            uphonenumber: document.getElementById('uphonenumber').value.replace(reg, ''),
            uaddress: document.getElementById('uaddress').value,
            uaddressdetail: document.getElementById('uaddressdetail').value,
            upostcode: document.getElementById('zonecode').value,
            ussn: document.getElementById('ussn1').value + document.getElementById('ussn2').value,
            ugender: document.querySelector('input[name="ugender"]:checked').value
        };
        console.log()
        if (resultCheck) {
            // 서버로 데이터 전송 로직
            requestAjax(users);
        }
    });

    // 휴대폰번호 자동으로 하이픈 추가
    document.querySelector("#uphonenumber").addEventListener("input", function () {
        let val = this.value.replace(/\D/g, "");
        let result = '';

        if (val.length < 4) {
            result = val;
        } else if (val.length <= 7) {
            result += val.substring(0, 3) + "-";
            result += val.substring(3);
        } else {
            result += val.substring(0, 3) + "-";
            result += val.substring(3, 7) + "-";
            result += val.substring(7);
        }
        this.value = result;
    });

const onClickSearch = () => {
  new daum.Postcode({
      oncomplete: function (data) {
          console.log(data);
          uzonecode.value = data.zonecode;
          uaddress.value = data.address;
      },
  }).open();
};