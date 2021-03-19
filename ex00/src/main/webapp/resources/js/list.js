var searchFormEl = $("#searchForm");


$("#searchForm button").on('click',function(e){
	
	if(!searchFormEl.find("option:selected").val()){
		alert('검색 종류를 선택하세요');
		return false
	}
	if(!searchFormEl.find("input[name='keyword']").val()){
		alert('키워드를 입력하세요');
		return false
	}
	
	searchFormEl.find("input[name ='pageNum']").val("1");
	e.preventDefault();
	searchFormEl.submit();
})


