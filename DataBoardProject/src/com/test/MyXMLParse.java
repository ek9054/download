package com.test;

import org.xml.sax.Attributes;
import org.xml.sax.SAXException;
import org.xml.sax.helpers.DefaultHandler;
import java.lang.reflect.*;

public class MyXMLParse extends DefaultHandler{
    Class clsName;
    Object obj;
	@Override
	public void startElement(String uri, String localName, String qName, Attributes attributes) throws SAXException {
		
		
			try
			{
				if(qName.equals("Resource"))
				{
					String type=attributes.getValue("type");
					clsName=Class.forName(type);
					obj=clsName.newInstance();
					
					String driver=attributes.getValue("driverClassName");
					String url=attributes.getValue("url");
					String password=attributes.getValue("password");
					String username=attributes.getValue("username");
					
					Method[] methods=clsName.getDeclaredMethods();
					for(Method m:methods)
					{
						String mName=m.getName();
						if(mName.equalsIgnoreCase("setdriverClassName"))
						{
							m.invoke(obj, driver);
						}
						if(mName.equalsIgnoreCase("seturl"))
						{
							m.invoke(obj, url);
						}
						if(mName.equalsIgnoreCase("setusername"))
						{
							m.invoke(obj, username);
						}
						if(mName.equalsIgnoreCase("setpassword"))
						{
							m.invoke(obj, password);
						}
					}
				}
			}catch(Exception ex){}
		
	}
	
   
}






