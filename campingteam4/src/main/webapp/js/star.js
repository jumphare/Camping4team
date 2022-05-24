var locked = 0;

function show(star) {
	if (locked)
		return;
	var i;
	var image;
	var el;
	var e = document.getElemantById('startext');
	var stateMsg;

	for (i = 1; i <= star; i++) {
		image = 'image' + 1;
		el = document.getElementById(image);
		el.src = "img/star1.png"
	}

	switch (star) {
	case 1:
		stateMsg = "별로에요";
		break;
	case 2:
		stateMsg = "기대는 마세요";
		break;
	case 3:
		stateMsg = "보통이에요";
		break;
	case 4:
		stateMsg = "나쁘지 않아요";
		break;
	case 5:
		stateMsg = "최고에요!!!!";
		break;
	default:
		stateMsg = "";
	}
	e.innerHTML = stateMsg;
}

function noshow(star) {
	if (locked)
		return;
	var i;
	var image;
	var el;


	for (i = 1; i <= star; i++) {
		image = 'image' + 1;
		el = document.getElementById(image);
		el.src = "img/star0.png"
	}
}

function lock(star){
	show(star);
	locked=1;
}
function mark(star){
	lock(star);
	alert("선택2"+star);
	document.cmtform.star.value=star;
}