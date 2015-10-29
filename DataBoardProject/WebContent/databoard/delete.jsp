<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String strNo = request.getParameter("no");
	String strPage = request.getParameter("page");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<center>
	<%--
		넘어가는 값
		form : input,select,textarea 
	 --%>
		<h3>삭제하기</h3>
		<form method=post action="delete_ok.jsp">
		<table border=1 width=200>
			<tr>
				<td align=left>
					비밀번호:<input type=password name=pwd size=10>
					<input type=hidden name=no value="<%=strNo %>">
					<input type=hidden name=page value="<%=strPage %>">
				</td>
			</tr>
			<tr>
				<td align=center>
					<input type=submit value=삭제>
					<input type=button value=취소 onclick="javascript:history.back()">
				</td>
			</tr>
		</table>
		</form>
	</center>
</body>
</html>