<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<center>
		<h3>글쓰기</h3>
		<form method=post action="insert_ok.jsp"
			enctype="multipart/form-data"
		>
		<!-- 파일업로드 enctype!!! -->
		<table border=1 width=500 bordercolor="black" cellpadding="0" ceelspacing="0">
			<tr>
				<td>
					<table border=0 width=450>
					<tr>
						<td width=10% align=right>이름</td>
						<td width=90% align=left>
						<input type=text name=name size=15>
						</td>
					</tr>
					<tr>
						<td width=10% align=right>제목</td>
						<td width=90% align=left>
						<input type=text name=subject size=45>
						</td>
					</tr>
					<tr>
						<td width=10% align=right>내용</td>
						<td width=90% align=left>
						<textarea rows="8" cols="50" name=content></textarea>
						</td>
					</tr>
					<tr>
						<td width=10% align=right>파일</td>
						<td width=90% align=left>
						<input type=file name=upload size=25>
						</td>
					</tr>
					<tr>
						<td width=10% align=right>비번</td>
						<td width=90% align=left>
						<input type=password name=pwd size=10>
						</td>
					</tr>
					<tr>
						
						<td colspan=2 align=center>
						<input type=submit value=글쓰기>
						<input type=button value=취소 onclick="javascript:history.back()">
						</td>
					</tr>
					</table>
				</td>
			</tr>
		</table>
		</form>
	</center>
</body>
</html>