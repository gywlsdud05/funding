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
	%>
	<form action="update_logic.jsp?id=<%=id %>" method="post">
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
				<td><input type="text" name="korean" id="korean"
					value="<%=s.getKorean()%>"></td>
			</tr>

			<tr>
				<th>영어:</th>
				<td><input type="text" name="english" id="english"
					value="<%=s.getEnglish()%>"></td>
			</tr>

			<tr>
				<th>수학:</th>
				<td><input type="text" name="math" id="math"
					value="<%=s.getMath()%>"></td>
			</tr>
			<tr>
				<td colspan=2>
					<button type="submit">수정하기</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>








