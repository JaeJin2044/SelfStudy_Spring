<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Board</title>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="/resources/css/list.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script defer
  src="https://code.jquery.com/jquery-3.6.0.js"
  integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
  crossorigin="anonymous"></script>
<!-- <script defer src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script> -->
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
						<td><a href="/board/detail?bno=${list.bno}&pageNum=${page.cri.pageNum}&type=${page.cri.type}&keyword=${page.cri.keyword}"><c:out value="${list.title}"></c:out></a></td>
						<td><fmt:formatDate value="${list.regDate}" pattern="yyyy.MM.dd"/></td>
						<td><c:out value="${list.writer}"></c:out></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div class="row">
			<div class="col-lg-12">
				<form id="searchForm" action="/board/list" method="get">
					<select name="type">
						<option value='' <c:out value="${page.cri.type == null ? 'selected' : ''}"/>>---</option>
						<option value="T" <c:out value="${page.cri.type eq 'T' ? 'selected' : ''}"/>>제목</option>
						<option value="C" <c:out value="${page.cri.type eq 'C' ? 'selected' : ''}"/>>내용</option>
						<option value="W" <c:out value="${page.cri.type eq 'W' ? 'selected' : ''}"/>>작성자</option>
						<option value="TC" <c:out value="${page.cri.type eq 'TC' ? 'selected' : ''}"/>>제목+내용</option>
						<option value="TW" <c:out value="${page.cri.type eq 'TW' ? 'selected' : ''}"/>>제목+작성자</option>
						<option value="TWC" <c:out value="${page.cri.type eq 'TWC' ? 'selected' : ''}"/>>제목+작성자+내용</option>
					</select>
					<input type="text" name="keyword" value="${page.cri.keyword}" />
					<input type="hidden" name="pageNum" value="${page.cri.pageNum}" />
					<input type="hidden" name="amount" value="${page.cri.amount}" />
					<button class="btn btn-primary">검색</button>
				</form>
			</div>		
		</div>


		<div class="pageContainer">
			<ul class="pagination">
				<li>
					<a href="/board/list?pageNum=${page.realStart}&type=${page.cri.type}&keyword=${page.cri.keyword}" aria-label="Previous">
					 <span aria-hidden="true">&laquo;</span>
					</a>
				</li>
				<c:if test="${page.prev}">
					<li>
						<a href="/board/list?pageNum=${page.startPage-1}&type=${page.cri.type}&keyword=${page.cri.keyword}" aria-label="Previous">
						 <span aria-hidden="true">&laquo;</span>
						</a>
					</li>
				</c:if>
				<c:forEach var="num" begin="${page.startPage}" end="${page.endPage}">
					<li class="${page.cri.pageNum == num ? 'active' : ''}">
						<a href="/board/list?pageNum=${num}&type=${page.cri.type}&keyword=${page.cri.keyword}">
							${num}
						</a>
					</li>
				</c:forEach>
				<c:if test="${page.next}">
					<li>
						<a href="/board/list?pageNum=${page.endPage+1}&type=${page.cri.type}&keyword=${page.cri.keyword}" aria-label="Next">
						 <span aria-hidden="true">&raquo;</span>
						</a>
					</li>
				</c:if>
				<li>
					<a href="/board/list?pageNum=${page.realEnd}&type=${page.cri.type}&keyword=${page.cri.keyword}" aria-label="Next">
					 <span aria-hidden="true">&raquo;</span>
					</a>
				</li>
			</ul>
		</div>
		<div class="writeBtn">
			<a href="/board/write"><button type="button" class="btn btn-primary">글 작성</button></a>
			<a href="/board/list"><button id="golist" class="btn btn-primary">리스트</button></a>
		</div>
	</div>
</body>

</html>









