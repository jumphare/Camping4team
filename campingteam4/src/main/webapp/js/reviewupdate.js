 function check(){
	 if($.trim($("#subject").val())==""){
		 alert("제목을 입력하세요!");
		 $("#subject").val("").focus();
		 return false;
	 }
	 if($.trim($("#score").val())==""){
		 alert("별점을 등록하세요!");
		 $("#score").val("").focus();
		 return false;
	 }
	 if($.trim($("#content").val())==""){
		 alert("내용을 등록하세요!");
		 $("#content").val("").focus();
		 return false;
	 }
	 if($.trim($("#re_file").val())==""){
		 alert("사진을 등록하세요!");
		 $("#re_file").val("").focus();
		 return false;
	 }
}