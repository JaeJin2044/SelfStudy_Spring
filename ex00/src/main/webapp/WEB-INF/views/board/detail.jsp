<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
</head>
<body>
	<div class="container" role="main">
		<h2>board Form</h2>
			<div class="mb-3">
				<label for="title">제목</label> <input type="text"
					class="form-control" name="title" id="title"
						value="${board.title}" readonly>
			</div>
			<div class="mb-3">
				<label for="writer">작성자</label> 
				<input type="text" class="form-control" name="writer" id="writer"
					value="${board.writer}"readonly>
			</div>
			<div class="mb-3">
				<label for="content">내용</label>
					<textarea class="form-control" rows="5" name="content" id="content" readonly>${board.content}
					</textarea>
			</div>
			<div class="mb-3">
				<label for="regDate">등록일자</label>
					<input type="text" class="form-control" name="regDate" id="regDate"
					value="<fmt:formatDate value="${board.regDate}" pattern="yyyy.MM.dd"/>" readonly>
			</div>
			<div>
				<a href="/board/delete?bno=${board.bno}&pageNum=${param.pageNum}">
					<button type="button"class="btn btn-secondary mb-3">삭제</button>
				</a>
				
				<a href="/board/edit?bno=${board.bno}&pageNum=${param.pageNum}">
					<button type="button"class="btn btn-secondary mb-3">수정</button>
				</a>
			</div>
			<a href="/board/list?pageNum=${param.pageNum}">
				<button type="button" class="btn btn-sm btn-primary" id="btnList" 
				style="float:right;">
					목록으로가기
				</button>
			</a>
	</div>
</body>
</html>