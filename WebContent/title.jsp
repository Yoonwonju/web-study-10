<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>직책 정보</title>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
$(function(){							
var status = false;   
	   
    $('#modify').on("click", function(){
       alert("수정");
       if(!status){
          $('input#titleName').attr("readonly", false);
          status = true;            
       }else{
          var title = {
                titleNo:$('#titleNo').val(),
                titleName:$('#titleName').val()};
          $.ajax({
             type:"post",
             url : "TitleModifyHandler",
             data : JSON.stringify(title),
             success:function(data){
                alert(data);
                if(data == 1)
                  window.location.href="TitleListHandler";
               }
          })
       }
    });
	$('#delete').on("click", function(){
		alert("삭제");
		var delTitle = {titleNo:$('#titleNo').val()}		// : json 형식 val : 값 , titleNo를 전달
		$.ajax({
			type:"get",
			url:"TitleDeleteHandler",						// 에게 17:titleNo를  전달 
			data:delTitle,
			success:function(data){
				alert(data);	// 1이면 삭제 0이면 실패
				if(data == 1){
					alert("삭제되었습니다.");
					window.location.href="TitleListHandler";
				}
			}
		});
	});
	$('#list').on("click", function(){
		location.href="TitleListHandler";
	});
});
</script>
</head>
<body>
	<fieldset>
		<legend>직책 정보</legend>
		<ul>
			<li>
				<label for="titleNo">직책 번호</label>
				<input id="titleNo" type="number" name="titleNo" value="${title.titleNo }" readonly="readonly">
			</li>
			<li>
				<label for="titleName">직책명</label>
				<input id="titleName" type="text" name="titleName" value="${title.titleName }" readonly="readonly">
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