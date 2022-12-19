<%@page import="model.StudentDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="controller.StudentController"%>
<%@page import="connector.MySqlConnector"%>
<%@page import="connector.DBConnector"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학생 목록 보기</title>
</head>
<body>
	<table>
		<tr>
			<th>번호</th>
			<th>이름</th>
		</tr>
		<%
		DBConnector connector = new MySqlConnector();
		StudentController controller = new StudentController(connector);
		ArrayList<StudentDTO> list = controller.selectAll();
		for (StudentDTO s : list) {
		%>
		<tr>
			<td><%=s.getId()%></td>
			<td><a href="/showOne.jsp?id=<%=s.getId()%>"><%=s.getName()%></a></td>
		</tr>
		<%
		}
		%>
	</table>
	<a href="insert.jsp">새로운 학생 등록하기</a>
</body>
</html>










