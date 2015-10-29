<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="com.dao.*,java.io.*" %>
<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="com.oreilly.servlet.multipart.*" %>
<%
	String path="c:\\download";
	String enctype="EUC-KR";
	int size=1024*1024*500;
	MultipartRequest mr=
		new MultipartRequest(request,path,size,
				enctype,new DefaultFileRenamePolicy());
	String name=mr.getParameter("name");
	String subject=mr.getParameter("subject");
	String content=mr.getParameter("content");
	String pwd=mr.getParameter("pwd");
	
	String strNo=mr.getParameter("no");
	String strPage=mr.getParameter("page");
	
	String ofilename=mr.getParameter("filename");
	
	DataBoardDAO dao=DataBoardDAO.newInstance();
	DataBoardDTO up=dao.databoardUpdateData(Integer.parseInt(strNo));
	
	String filename=mr.getOriginalFileName("upload");
	DataBoardDTO d=new DataBoardDTO();
	d.setName(name);
	d.setSubject(subject);
	d.setContent(content);
	d.setPwd(pwd);
	if(filename==null)// upload�� �ȵ� ���� 
	{
		if(ofilename==null) // ���� ������ ���� ��� 
		{
		  d.setFilename("");
		  d.setFilesize(0);
		}
		else  //���� ������ �״�� ����
		{
			d.setFilename(ofilename);
			File f=new File(path+"\\"+ofilename);
			d.setFilesize((int)f.length());
		}
	}
	else  // upload�� ���� 
	{
		if(ofilename!=null)
		{
			File f=new File(path+"\\"+ofilename);
			f.delete();
		}
		d.setFilename(filename);
		File f=new File(path+"\\"+filename);
		d.setFilesize((int)f.length());
	}
	d.setNo(Integer.parseInt(strNo));
	
	boolean bCheck=dao.databoardUpdate(d);
	if(bCheck==true)
	{
		response.sendRedirect("content.jsp?no="+strNo+"&page="+strPage);
	}
	else
	{
%>
        <script>
         alert("��й�ȣ�� Ʋ���ϴ�");
         history.back();
        </script>
<%
	}

%>
