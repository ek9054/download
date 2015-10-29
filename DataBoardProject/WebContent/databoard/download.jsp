<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.net.*,java.io.*"%>

<%
	String fn=request.getParameter("fn");
	response.setHeader("Content-Disposition","attachment;filename="+URLEncoder.encode(fn,"UTF-8"));
	File file=new File("c:\\download\\"+fn);
	response.setContentLength((int)file.length());
	
	BufferedInputStream bis=
			new BufferedInputStream(new FileInputStream(file));
	BufferedOutputStream bos= new BufferedOutputStream(response.getOutputStream());
	byte[] buffer = new byte[1024];
	int i=0;
	while((i=bis.read(buffer, 0, 1024))!=-1)
	{
		bos.write(buffer,0,i);
	}
	out.clear();
	out=pageContext.pushBody();
	bis.close();
	bos.close();
	
%>