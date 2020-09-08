<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
$(function() {
	$('#addDept').on("click", function() {
		alert("부서 추가 버튼 클릭");
		$.ajax({
			type : "get",
			url : "DepartmentAddHandler",
			success:function(data){
				alert("data > " + data);
				window.location.href = "departmentAdd.jsp?nextNo="+data;
			}
		});
	});

});

</script>
</head>
<body>
	${list }
	<h2>부서 목록</h2>
	<table border="1">
		<thead>
			<td>부서번호 </td>
			<td>부서명 </td>
			<td>부서위치 </td>
		</thead>
		<tbody>
			<c:forEach var="department" items="${list }">
				<tr>
					<td>${department.deptNo } </td>
					<td><a href="DepartmentGetHandler?deptNo=${department.deptNo  }">${department.deptName } </td>
					<td>${department.deptFloor } </td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<button id="addDept">부서 추가</button>
</body>
</html>