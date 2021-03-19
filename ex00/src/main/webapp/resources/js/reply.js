
console.log('replyModul.....');
var replyService = (function(){
	function add(reply,callback){
		console.log('안녕하세요');
	}
	return {add : add};
})();