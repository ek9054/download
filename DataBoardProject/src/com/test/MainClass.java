package com.test;

import java.io.File;

import javax.xml.parsers.SAXParser;
import javax.xml.parsers.SAXParserFactory;

public class MainClass {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
         try
         {
        	 SAXParserFactory spf=
        			 SAXParserFactory.newInstance();
        	 SAXParser sp=spf.newSAXParser();
        	 MyXMLParse mxp=new MyXMLParse();
        	 String path="C:\\webDev\\webStudy\\DataBoardProject\\src\\com\\test\\server.xml";
        	 sp.parse(new File(path), mxp);
        	 DataSource ds=(DataSource)mxp.obj;
        	 System.out.println(ds.getDriverClassName());
        	 System.out.println(ds.getUrl());
        	 System.out.println(ds.getUsername());
        	 System.out.println(ds.getPassword());
         }catch(Exception ex){};
	}

}





