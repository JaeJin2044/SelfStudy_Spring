<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">


<!-- <script defer src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script> -->

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
			<a href="/board/list?pageNum=${param.pageNum}&type=${param.type}&keyword=${param.keyword}">
				<button type="button" class="btn btn-sm btn-primary" id="btnList" 
				style="float:right;">
					목록으로가기
				</button>
			</a>
	</div>
</body>

<script  
  src="https://code.jquery.com/jquery-3.6.0.js"
  integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
  crossorigin="anonymous"></script>
<script  src="/resources/js/reply.js"></script>
<script>

	console.log("=====")
	console.log("js Test");
	
	var bnoValue = '<c:out value="${board.bno}"/>';

	/* replyService.add(
		{reply:"JS test", replyer:"tester", bno:bnoValue},
		function(result){
			alert("RESTUL : "+result);
		}
	); */
	replyService.getList({bno:bnoValue, page:1},function(list){
		for(var i = 0, len = list.length || 0 ; i < len; i++){
			console.log(list[i]);
		}
	})
	
</script>
</html>




