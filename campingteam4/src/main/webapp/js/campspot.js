function spot_check() {
	if ($.trim($("#sp_name").val()) == "") {
		alert("장소이름을 입력하세요 !");
		$("#sp_name").val("").focus();
		return false;
	}
	if ($.trim($("#camp_no").val()) == "0") {
		alert("지역을 입력하세요 !");
		$("#camp_no").val("0").focus();
		return false;
	}

	if ($.trim($("#type").val()) == "") {
		alert("캠핑 타입을 입력하세요 !");
		$("#type").val("").focus();
		return false;
	}
	if ($.trim($("#standard_num").val()) == "") {
		alert("기준 인원을 입력하세요!");
		$("#standard_num").val("").focus();
		return false;
	}
	if ($.trim($("#max_num").val()) == "") {
		alert("최대인원을 입력하세요!");
		$("#max_num").val("").focus();
		return false;
	}
	if ($.trim($("#price").val()) == "") {
		alert("가격을 입력하세요!");
		$("#price").val("").focus();
		return false;
	}
	if ($.trim($("#hightprice").val()) == "") {
		alert("성수기 가격을 입력하세요!");
		$("#hightprice").val("").focus();
		return false;
	}
	if ($.trim($("#image").val()) == "") {
		alert("대표 이미지를 입력하세요!");
		$("#image").val("").focus();
		return false;
	}
	if ($.trim($("#memo").val()) == "") {
		alert("성수기 날짜 및 주요사항을 입력하세요!");
		$("#memo").val("").focus();
		return false;
	}
	
}