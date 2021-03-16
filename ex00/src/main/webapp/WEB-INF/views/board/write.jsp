<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
</head>
<style>
	.mb-3{
		padding:15px;
	}
</style>
<body>
	<article >
		<div class="container" role="main">
			<h2>board Form</h2>
				<form name="form" id="form" role="form" method="post"
					action="/board/write">
					<div class="mb-3">
						<label for="title">제목</label> <input type="text"
							class="form-control" name="title" id="title"
							placeholder="제목을 입력해 주세요">
					</div>
					<div class="mb-3">
						<label for="reg_id">작성자</label> <input type="text"
							class="form-control" name="writer" id="reg_id"
							placeholder="이름을 입력해 주세요">
					</div>
					<div class="mb-3">
					<label for="content">내용</label>
						<textarea class="form-control" rows="5" name="content" id="content"
							placeholder="내용을 입력해 주세요"></textarea>
					</div>
						<button type="submit" class="btn btn-secondary mb-3">제출</button>
				</form>
			<div>
				<a href="/board/list">
					<button type="button" class="btn btn-sm btn-primary" id="btnList" 
					style="float:right;">
						목록으로가기
					</button>
				</a>
			</div>
		</div>
	</article>

</body>
</html>