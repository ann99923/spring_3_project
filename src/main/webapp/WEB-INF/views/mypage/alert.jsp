<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<script>
	var msg = "<c:out value='${msg}'/>";
	alert(msg);
	parent.close();
	opener.location.href = '/member/login';
</script>
