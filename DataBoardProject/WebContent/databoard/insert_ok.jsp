<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="com.oreilly.servlet.*,com.oreilly.servlet.multipart.*" %>
<%@ page import="com.dao.*,java.io.*" %>
<!-- ó���� �� _ok �Է°��� ������ �������� �ΰ��� �ؾ��Ѵ� -->
<%
	String path="c:\\download";
	String enctype="EUC-KR";
	int size=1024*1024*500;
	MultipartRequest mr = new MultipartRequest(request,path,size,enctype,new DefaultFileRenamePolicy()); //�����̸��� ������ �ٲ�� �ϴ°� ���ϳ���������()
	String name=mr.getParameter("name");
	String subject=mr.getParameter("subject");
	String content=mr.getParameter("content");
	String pwd=mr.getParameter("pwd");
	String filename=mr.getOriginalFileName("upload");
	DataBoardDTO d= new DataBoardDTO();
	d.setName(name);
	d.setSubject(subject);
	d.setContent(content);
	d.setPwd(pwd);
	if(filename==null)
	{
			d.setFilename("");
			d.setFilesize(0);
	}
	else
	{
		d.setFilename(filename);
		File f=new File(path+"\\"+filename);
		d.setFilesize((int)f.length());
	}
	
	 DataBoardDAO dao=DataBoardDAO.newInstance();
	    dao.databoardInsert(d);
	    
	    response.sendRedirect("list.jsp");
%>