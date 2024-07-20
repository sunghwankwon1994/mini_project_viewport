<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>403 Forbidden</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
    body {
        background: url('/viewport_mini_web/resources/image/403error.png') no-repeat center center fixed;
        background-size: cover;
    }
    .container {
        text-align: center;
        margin-top: 20%;
        background-color: rgba(255, 255, 255, 0.8);
        padding: 20px;
        border-radius: 10px;
    }
    .btn {
        margin: 10px;
    }
</style>
</head>
<body>
    <div class="container">
        <h1 class="display-3">403</h1>
        <p class="lead">접근이 금지되었습니다.</p>
        <p>이 페이지에 접근할 권한이 없습니다. 필요한 권한을 확인하세요.</p>
        <a href="/viewport_mini_web" class="btn btn-dark mt-3">홈으로 돌아가기</a>
        <button onclick="goBack()" class="btn btn-secondary mt-3">이전으로 돌아가기</button>
    </div>
    <script>
        function goBack() {
            window.history.back();
        }
    </script>
</body>
</html>
