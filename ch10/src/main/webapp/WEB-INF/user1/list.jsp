<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>user1::list</title>
	<script>
		document.addEventListener("DOMContentLoaded", function () { 
			const deletebtns = document.querySelectorAll(".deletebtn"); // 삭제 버튼 선택

			deletebtns.forEach(function (link) { 
				link.onclick = function (event) { 
					event.preventDefault(); // 기본 이동 방지
					if (confirm("정말 삭제하시겠습니까?")) { 
						window.location.href = this.href; // 확인하면 삭제 요청
					}
				};
			});
		});
	</script>
</head>
<body>
	<h3>user1 목록</h3>
	<a href="/ch10">처음으로</a>
	<a href="/ch10/user1/register.do">등록하기</a>
	<table border="1">
		<tr>
			<th>아이디</th>
			<th>이름</th>
			<th>휴대폰</th>
			<th>나이</th>
			<th>관리</th>
		</tr>
		<c:forEach var="dto" items="${dtos}">
			<tr>
				<td>${dto.uid}</td>
				<td>${dto.name}</td>
				<td>${dto.hp}</td>
				<td>${dto.age}</td>
				<td>
					<a href="/ch10/user1/modify.do?uid=${dto.uid}">수정</a>
					<a href="/ch10/user1/remove.do?uid=${dto.uid}" class="deletebtn">삭제</a>
				</td>
			</tr>
		</c:forEach>
	</table>	
</body>
</html>
