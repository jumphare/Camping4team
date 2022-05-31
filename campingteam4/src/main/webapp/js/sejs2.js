//후기 작성폼 스마트에디터 적용
var oEditors = []; 
nhn.husky.EZCreator.createInIFrame({ 
	oAppRef : oEditors, elPlaceHolder : "content", //저는 textarea의 id와 똑같이 적어줬습니다. 
	sSkinURI : "se2/SmartEditor2Skin.html", //경로를 꼭 맞춰주세요! 
	fCreator : "createSEditor2", 
	htParams : { // 툴바 사용 여부 (true:사용/ false:사용하지 않음) 
		bUseToolbar : true, // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음) 
		bUseVerticalResizer : false, // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음) 
		bUseModeChanger : false,
		fOnBeforeUnload : function(){}
		} 
}); 

function submitContents(elClickedObj) {
    oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []); // 에디터의 내용이 textarea에 적용됩니다.
     
    // 에디터의 내용에 대한 값 검증은 이곳에서 document.getElementById("ir1").value를 이용해서 처리하면 됩니다.
     
    try {
            elClickedObj.form.submit();
    } catch(e) {}
}
var pasteHTML = function(filename){                     //업로드한 사진을 화면에 보여주게 만드는 스크립트입니다.
	
    var sHTML = '<img src="/resources/upload/'+filename+'">'; //사진이 저장된 경로입니다.

    oEditors.getById["txtContent"].exec("PASTE_HTML", [sHTML]);

};


//유효성 검사
$(function() { 
	$("#savebutton").click(function() { 
		oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []); //textarea의 id를 적어줍니다. 

		var subject = $("#subject").val(); 
		var content = document.getElementById("content").value;; 

		if (subject == null || subject == "") { 
			alert("제목을 입력해주세요."); 
			$("#subject").focus();
			return; 
			} 
		if(content == "" || content == null || content == '&nbsp;' || 
				content == '<br>' || content == '<br/>' || content == '<p>&nbsp;</p>'){ 
			alert("본문을 작성해주세요."); 
			oEditors.getById["content"].exec("FOCUS"); //포커싱 
			return; 
			} //이 부분은 스마트에디터 유효성 검사 부분이니 참고하시길 바랍니다. 
		if (score == null || score == "") { 
			alert("평점을 입력해주세요"); 
			return; 
			} 
		if (re_file == null || re_file == "") { 
			alert("파일을 등록시켜 주세요"); 
			return; 
			} 


		$("#update").submit(); 
		
		}); 
	})


	
