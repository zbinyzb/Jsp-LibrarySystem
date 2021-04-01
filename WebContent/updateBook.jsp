<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.sql.*"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改结果</title>
</head>
<body>
<%
			request.setCharacterEncoding("UTF-8");
			String tno = request.getParameter("tno");
			String bname = request.getParameter("bname");
			String writer = request.getParameter("writer");
			String pubdept = request.getParameter("pubdept");
			String price = request.getParameter("price");
			String typnum= request.getParameter("typnum");
			String remark= request.getParameter("remark");
			
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
			// 添加图书信息的SQL语句
			System.out.println("数据库成功");
			String sql = "update BookI set tno=?,bname=?,writer=?,pubdept=?,price=?,typnum=?,remark=?  where tno='"+tno+"'";
			// 获取PreparedStatement
			PreparedStatement ps = conn.prepareStatement(sql);
			// 对SQL语句中的第1个参数赋值
			// 对SQL语句中的第2个参数赋值
			ps.setString(1, tno);
			ps.setString(2, bname);
			// 对SQL语句中的第3个参数赋值
			ps.setString(3,writer);
			// 对SQL语句中的第4个参数赋值
			ps.setString(4,pubdept);
			ps.setString(5, price);
			ps.setString(6,typnum);
			ps.setString(7,remark);
			// 执行更新操作，返回所影响的行数
			int row = ps.executeUpdate();
			// 判断是否更新成功
			if(row > 0){
				// 更新成输出信息
				out.print("修改成功！！");
			}
		   // 关闭PreparedStatement，释放资源
			ps.close();
			// 关闭Connection，释放资源
			conn.close();
		} catch (Exception e) {
			out.print("学生信息修改失败！");
			%><a href="contain.jsp">修改失败！</a>
			<% e.printStackTrace();
		}
	%>
	<br>
	<a href="contain.jsp">返回</a>
</body>
</html>