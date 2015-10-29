package com.test;
import java.sql.*;
public class DataSource {
    private Connection conn;
    private String driverClassName;
    private String url;
    private String username;
    private String password;
	public String getDriverClassName() {
		return driverClassName;
	}
	public void setDriverClassName(String driverClassName) {
		this.driverClassName = driverClassName;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
    public void init()
    {
    	try
    	{
    		Class.forName(driverClassName);
    	}catch(Exception ex){}
    }
    public Connection getconnection()
    {
    	try
    	{
    		conn=DriverManager.
    				getConnection(url,username,
    						password);
    	}catch(Exception ex){}
    	return conn;
    }
}
