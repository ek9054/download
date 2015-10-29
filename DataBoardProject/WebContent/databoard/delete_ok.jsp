<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.io.*,com.dao.*"%>
<%
     String strNo=request.getParameter("no");
     String strPage=request.getParameter("page");
     String pwd=request.getParameter("pwd");
     // DB연동 => 1.pwd
     DataBoardDAO dao=DataBoardDAO.newInstance();
     DataBoardDTO d=dao.databoardData(Integer.parseInt(strNo));
     boolean bCheck=dao.databoardDelete(Integer.parseInt(strNo), pwd);
     if(bCheck==true)
     {
    	
        if(d.getFilesize()>0)
        {
        	File file=new File("c:\\download\\"+d.getFilename());
        	file.delete();
        }
    	response.sendRedirect("list.jsp?page="+strPage);
     }
     else
     {
%>
        <script>
         alert("비밀번호가 틀립니다");
         history.back();
         // location.href="delete.jsp?no &page"
        </script>
<%
     }
%>







