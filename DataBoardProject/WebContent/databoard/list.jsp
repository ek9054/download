<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.*, com.dao.*"%>
 <%
 	String strPage = request.getParameter("page");
 	if(strPage==null)
 		strPage="1";
 	DataBoardDAO dao =DataBoardDAO.newInstance();
 	int curpage=Integer.parseInt(strPage);
 	ArrayList<DataBoardDTO> list =dao.databoardListData(curpage);
 	int totalpage = dao.databoardTotalPage();
 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="board.css"/>

</head>
<body>
	<center>
		<h3>자료실</h3>
		<table border=0 width=700>
			<tr>
				<td align=left>
					<a href="insert.jsp">등록</a>
				</td>
			</tr>
		</table>
		<table border=0 width=700>
			<tr bgcolor=#ccffcc>
				<th width=10%>번호</th>
				<th width=45%>제목</th>
				<th width=15%>이름</th>
				<th width=20%>작성일</th>
				<th width=10%>조회수</th>
			</tr>
			<%
				for(DataBoardDTO d:list)
				{
			%>
				<tr>
					<td widtd=10% align=center><%=d.getNo() %></td>
					<td widtd=45% align=left><a href="content.jsp?no=<%=d.getNo()%>&page=<%=curpage%>"><%=d.getSubject() %></a></a></td>
					
					<td widtd=15% align=center><%=d.getName() %></td>
					<td widtd=20% align=center><%=d.getRegdate().toString() %></td>
					<td widtd=10% align=center><%=d.getHit() %></td>
				</tr>
			<%
				}
			%>
		</table>
		<hr width=700>
		<table border=0 width=700>
			<tr>
				<td align=right>
					<a href="list.jsp?page=<%= curpage>1?curpage-1:curpage%>">이전</a>&nbsp;
					<a href="list.jsp?page=<%= curpage<totalpage?curpage+1:curpage%>">다음</a>&nbsp;&nbsp;
					<%=curpage %> page / <%=totalpage %> pages 
				</td>
			</tr>
		</table>
	</center>
</body>
</html>