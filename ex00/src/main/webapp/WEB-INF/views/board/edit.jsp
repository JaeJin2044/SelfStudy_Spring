<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
</head>
<body>
	<div class="container" role="main">
		<h2>글 수정 </h2>
		<form action="/board/edit" method="post">
			<div><input type="hidden" value="${param.pageNum}" name="pageNum"></div>
			<div><input type="hidden" value="${board.bno}" name="bno"></div>
			<div class="mb-3">
				<label for="title">제목</label> <input type="text"
					class="form-control" name="title" id="title"
						value="${board.title}" >
			</div>
			<div class="mb-3">
				<label for="writer">작성자</label> 
				<input type="text" class="form-control" name="writer" id="writer"
					value="${board.writer}">
			</div>
			<div class="mb-3">
				<label for="content">내용</label>
					<textarea class="form-control" rows="5" name="content" id="content" >${board.content}
					</textarea>
			</div>
			<div><input type="submit" value="글 수정" class="btn btn-sm btn-primary"></div>
		</form>
			<a href="/board/list">
				<button type="button" class="btn btn-sm btn-primary" id="btnList" 
				style="float:right;">
					목록으로가기
				</button>
			</a>
	</div>

	

</body>
</html>