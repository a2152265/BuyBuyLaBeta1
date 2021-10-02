<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<sql:setDataSource var="ds" dataSource="jdbc/EmployeeDB" />
<% String id= request.getParameter("id");
request.getSession(true).setAttribute("id", id);%>
<sql:update sql="delete from GrouponProduct where id ='${id}'"  dataSource="${ds}" /> 
<% request.getRequestDispatcher("/Manage.jsp").forward(request, response); %>