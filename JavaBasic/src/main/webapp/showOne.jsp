<%@page import="java.util.Formatter"%>
<%@page import="model.StudentDTO"%>
<%@page import="controller.StudentController"%>
<%@page import="connector.MySqlConnector"%>
<%@page import="connector.DBConnector"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>개별 학생 보기</title>
</head>
<body>
	<%
	Formatter formatter = new Formatter();
	int id = Integer.parseInt(request.getParameter("id"));
	DBConnector connector = new MySqlConnector();
	StudentController controller = new StudentController(connector);

	StudentDTO s = controller.selectOne(id);

	int sum = s.getKorean() + s.getEnglish() + s.getMath();
	double average = (double) sum / 3;
	%>
	<table>
		<tr>
			<th>번호:</th>
			<td><%=s.getId()%></td>
		</tr>

		<tr>
			<th>이름:</th>
			<td><%=s.getName()%></td>
		</tr>

		<tr>
			<th>국어:</th>
			<td><%=s.getKorean()%></td>
		</tr>

		<tr>
			<th>영어:</th>
			<td><%=s.getEnglish()%></td>
		</tr>

		<tr>
			<th>수학:</th>
			<td><%=s.getMath()%></td>
		</tr>

		<tr>
			<th>총점:</th>
			<td><%=sum%></td>
		</tr>

		<tr>
			<th>평균:</th>
			<td><%=formatter.format("%6.2f", average)%></td>
		</tr>

	</table>
	<a href="/delete.jsp?id=<%=s.getId()%>">학생 삭제</a>
	<a href="/update.jsp?id=<%=s.getId()%>">학생 수정</a>
</body>
</html>








