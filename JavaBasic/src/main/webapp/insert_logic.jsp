<%@page import="controller.StudentController"%>
<%@page import="connector.MySqlConnector"%>
<%@page import="connector.DBConnector"%>
<%@ page import="model.StudentDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	request.setCharacterEncoding("UTF-8");

	StudentDTO s = new StudentDTO();

	String name = request.getParameter("student_name");
	int korean = Integer.parseInt(request.getParameter("korean"));
	int english = Integer.parseInt(request.getParameter("english"));
	int math = Integer.parseInt(request.getParameter("math"));

	s.setName(name);
	s.setKorean(korean);
	s.setEnglish(english);
	s.setMath(math);

	DBConnector connector = new MySqlConnector();
	StudentController controller = new StudentController(connector);

	controller.insert(s);

	response.sendRedirect("/index.jsp");
	%>

</body>
</html>








