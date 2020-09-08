<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>부서 추가</title>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
	$('#add').on("click", function(){
		var newDepartment = {
				deptNo:$('#deptNo').val(),
				deptName:$('#deptName').val(),
				deptFloor:$('#deptFloor').val()
		};
		$.ajax({
			type:"post",
			url:"DepartmentAddHandler",
			cache:false,
			data:JSON.stringify(newDepartment),
			complete:function(data){
				alert("추가되었습니다." + data);
				window.location.href="DepartmentListHandler";
			}
		});
	});
	
});

</script>
</head>
<body>
	<fieldset>
		<legend>부서 추가</legend>
		<ul>
			<li>
				<label for="deptNo">부서 번호</label>
				<input id="deptNo" type="number" name="deptNo" value="${param.nextNo }" readonly="readonly">
			</li>
			<li>
				<label for="deptName">부서명</label>
				<input id="deptName" type="text" name="deptName">
			</li>
			<li>
				<label for="deptFloor">부서위치</label>
				<input id="deptFloor" type="number" name="deptFloor">
			</li>
			<li>
				<button id="add">추가</button>
				<button id="cancel">취소</button>
			</li>
		</ul>
	</fieldset>
</body>
</html>