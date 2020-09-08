<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>부서 정보</title>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
	var status = false;
	
	$('#modify').on("click", function(){
		alert("수정");
		if(!status){
			$('input#deptName').attr("readonly", false);
			$('input#deptFloor').attr("readonly", false);
			status = true;
		}else{
			var department = {
					deptNo:$('#deptNo').val(),
					deptName:$('#deptName').val(),
					deptFloor:$('#deptFloor').val()};
			$.ajax({
				type:"post",
				url:"DepartmentModifyHandler",
				data:JSON.stringify(department),
				success:function(data){
					alert(data);
					if(data == 1)
						window.location.href="DepartmentListHandler";
				}
			});
		}
	})
	
	
	
	$('#delete').on("click", function(){
		alert("삭제");
		var delDepartment = {deptNo:$('#deptNo').val()}
		$.ajax({
			type:"get",
			url:"DepartmentDeleteHandler",
			data:delDepartment,
			success:function(data){
				alert(data);
				if(data == 1){
					alert("삭제 되었습니다.");
					window.location.href="DepartmentListHandler";
				}
			}
		});
	})
	$('#list').on("click", function(){
		alert("목록");
		location.href="DepartmentListHandler";
	})
});

</script>
</head>
<body>
	<fieldset>
		<legend>부서 정보</legend>
		<ul>
			<li>
				<label for="deptNo">부서 번호</label>
				<input id="deptNo" type="number" name="deptNo" value="${department.deptNo }" readonly="readonly">
			</li>
			<li>
				<label for="deptName">부서명</label>
				<input id="deptName" type="text" name="deptName" value="${department.deptName }" readonly="readonly">
			</li>
			<li>
				<label for="deptFloor">부서위치</label>
				<input id="deptFloor" type="number" name="deptFloor" value="${department.deptFloor }" readonly="readonly">
			</li>
			<li>
				<button id="modify">수정</button>
				<button id="delete">삭제</button>
				<button id="list">목록</button>
			</li>
		</ul>
	</fieldset>
</body>
</html>