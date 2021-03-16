<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Board</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="/resources/css/list.css">
<script defer src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script defer src="/resources/js/list.js"></script>
</head>
<style>
	.pageContainer{
		text-align: center;
	}
	.container{
		margin-top : 50px;
	}
	
	
</style>

<body>
	<div class="container">
		<table class="table table-hover">
			<thead>
				<tr>
					<th>글번호</th>
					<th>제목</th>
					<th>작성날짜</th>
					<th>작성자</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${list}" var="list">
					<tr>
						<td><c:out value="${list.bno}"></c:out></td>
						<td><a href="/board/detail?bno=${list.bno}&pageNum=${page.cri.pageNum}"><c:out value="${list.title}"></c:out></a></td>
						<td><fmt:formatDate value="${list.regDate}" pattern="yyyy.MM.dd"/></td>
						<td><c:out value="${list.writer}"></c:out></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

		<div class="pageContainer">
			<ul class="pagination">
				<li>
					<a href="/board/list?pageNum=${page.realStart}" aria-label="Previous">
					 <span aria-hidden="true">&laquo;</span>
					</a>
				</li>
				<c:if test="${page.prev}">
					<li>
						<a href="/board/list?pageNum=${page.startPage-1}" aria-label="Previous">
						 <span aria-hidden="true">&laquo;</span>
						</a>
					</li>
				</c:if>
				<c:forEach var="num" begin="${page.startPage}" end="${page.endPage}">
					<li class="${page.cri.pageNum == num ? 'active' : ''}">
						<a href="/board/list?pageNum=${num}">
							${num}
						</a>
					</li>
				</c:forEach>
				<c:if test="${page.next}">
					<li>
						<a href="/board/list?pageNum=${page.endPage+1}" aria-label="Next">
						 <span aria-hidden="true">&raquo;</span>
						</a>
					</li>
				</c:if>
				<li>
					<a href="/board/list?pageNum=${page.realEnd}" aria-label="Next">
					 <span aria-hidden="true">&raquo;</span>
					</a>
				</li>
			</ul>
		</div>
		<div class="writeBtn">
			<a href="/board/write"><button type="button" class="btn btn-primary">글 작성</button></a>
			<button id="testBtn" class="btn btn-primary">테스트</button>
		</div>
		
	</div>
</body>
</html>