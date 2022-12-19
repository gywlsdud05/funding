<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>새로운 학생 등록하기</title>
</head>
<body>
	<form action="insert_logic.jsp" method="post">
		이름: <input type="text" name="student_name" id="student_name"> <br />
		국어: <input type="text" name="korean" id = "korean"> <br />
		영어: <input type="text" name="english" id = "english"> <br />
		수학: <input type="text" name="math" id = "math"> <br />
		<button type="submit">등록하기</button>
	</form>
</body>
</html>