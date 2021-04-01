<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.sql.*"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加结果</title>
</head>
<body>

	<%
	String uname=request.getParameter("username");
	String pwd=request.getParameter("password");
	String bno=request.getParameter("bno");
	System.out.println(bno);
		try {
			// 加载数据库驱动，注册到驱动管理器
			Class.forName("com.mysql.jdbc.Driver");
			// 数据库连接字符串
			String url = "jdbc:mysql://127.0.0.1:3306/booksys";
			// 数据库用户名
			String username = "root";
			// 数据库密码
			String password = "q280654054";
			// 创建Connection连接
			Connection conn = DriverManager.getConnection(url,username,password);
			
			System.out.println("数据库成功");
			String sql = "insert BUser(username,password,bno) values(?,?,?)";
			// 获取PreparedStatement
			PreparedStatement ps = conn.prepareStatement(sql);
			// 对SQL语句中的第1个参数赋值
			ps.setString(1, uname);
	
			ps.setString(2,pwd);
			ps.setString(3,bno);
		
			
			// 执行更新操作，返回所影响的行数
			int row = ps.executeUpdate();
			// 判断是否更新成功
			if(row > 0){
				// 更新成输出信息
				out.print("注册成功！");
			}
		   // 关闭PreparedStatement，释放资源
			ps.close(); 
			// 关闭Connection，释放资源
			conn.close();
		} catch (Exception e) {
			out.print("注册失败！");
			e.printStackTrace();
		}
	%>
	<br>
	<a href="login.jsp">返回登录</a>
</body>
</html>