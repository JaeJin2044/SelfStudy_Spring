
console.log('replyModul.....');

var replyService = (function(){
	
	function add(reply,callback, error){
		console.log('add실행');
		
		$.ajax({
			type:'post',
			url : '/reply/new',
			data : JSON.stringify(reply),
			contentType : "application/json; charset=utf-8",
			success : function(result,status,xhr){
				if(callback){
					callback(result);
				}
			},
			error: function(xhr,status,er){
				if(error){
					error(er);
				}
			}
		})
	}
	
	function getList(param,callback,error){
		var bno = param.bno;
		var page = param.page || 1 ;
		
		$.getJSON("/reply/pages/"+bno+"/"+page+".json",
			function(data){
			if (callback){
				callback(data);
			}
		}).fail(function(xhr,status,err){
			error();
		});
	}
		return {
			add: add,
			getList : getList
		};
})();