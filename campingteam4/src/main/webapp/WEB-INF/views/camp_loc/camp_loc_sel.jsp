<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<style>
html {
	font-size: 10px;
}
.myButton {
	box-shadow:inset 0px 1px 0px 0px #fce2c1;
	background:linear-gradient(to bottom, #ffc477 5%, #fb9e25 100%);
	background-color:#ffc477;
	border-radius:6px;
	border:1px solid #eeb44f;
	display:inline-block;
	cursor:pointer;
	color:#ffffff;
	font-family:Arial;
	font-size:20px;
	font-weight:bold;
	padding:6px 25px;
	text-decoration:none;
	text-shadow:0px 1px 0px #cc9f52;
}
.myButton:hover {
	background:linear-gradient(to bottom, #fb9e25 5%, #ffc477 100%);
	background-color:#fb9e25;
}
.myButton:active {
	position:relative;
	top:1px;
}
@font-face {
	font-family: 'GmarketSansBold';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansBold.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

.title {
	margin-top: 3rem;
	font-family: 'GmarketSansBold';
	font-size: 3.2rem;
	color: #E35E0A;
	margin-bottom: 1rem;
}

table {
	font-size: 1.6rem;
}

th, td {
	text-align: center;
	vertical-align: middle;
}

a {
	color: #000;
}

a:hover {
	text-decoration: none;
}
</style>
<style type="text/css">
/* Set the size of the div element that contains the map */
#map {
	height: 400px;
	/* The height is 400 pixels */
	width: 30%;
	/* The width is the width of the web page */
}
</style>
<script>
	function initMap() {
		const map = new google.maps.Map(document.getElementById("map"), {
			zoom : 8,
			center : {
				lat : 37.2410864,
				lng : 127.1775537
			}, //용인
		});

		var num = 0;
		for (var i = 0; i < locations.length; i++) {

			if (i == 0) {

				var marker1 = new google.maps.Marker({
					map : map,
					label : locations[i].place,
					position : new google.maps.LatLng(locations[i].lat,
							locations[i].lng),
					title : 'Click to zoom'
				});

				google.maps.event.addListener(marker1, 'click', function() {
					map.setZoom(17);
					map.setCenter(marker1.getPosition());
				});
			} else if (i == 1) {

				var marker2 = new google.maps.Marker({
					map : map,
					label : locations[i].place,
					position : new google.maps.LatLng(locations[i].lat,
							locations[i].lng),
					title : 'Click to zoom'
				});

				google.maps.event.addListener(marker2, 'click', function() {
					map.setZoom(17);
					map.setCenter(marker2.getPosition());

				});

			} else if (i == 2) {

				var marker3 = new google.maps.Marker({
					map : map,
					label : locations[i].place,
					position : new google.maps.LatLng(locations[i].lat,
							locations[i].lng),
					title : 'Click to zoom'
				});

				google.maps.event.addListener(marker3, 'click', function() {
					map.setZoom(17);

					map.setCenter(marker3.getPosition());
				});
			}

			num++;

		} // for end

	} // initMap() end
	const locations = [ {
		place : "서울",
		lat : 37.570134,
		lng : 126.8725638
	}, {
		place : "천안",
		lat : 36.8013881,
		lng : 127.2262169
	}, {
		place : "대전",
		lat : 36.4561675,
		lng : 127.4747085
	}, ];
</script>

</head>
<body>
	<div class="container" align="center">
	<div class="title">위치를 선택해주세요</div>
		
		<form method="post"
			action="<%=request.getContextPath()%>/loc_check.do?startDate=${startDate}&endDate=${endDate}&memcount=${memcount}">
			<input type="submit" class="myButton" name="loc" value="서울"> 
			<input type="submit" class="myButton" name="loc" value="천안">
			<input type="submit" class="myButton" name="loc" value="대전">
		</form><br>
		<!--The div element for the map -->
		<div id="map"></div>

		<!-- Async script executes immediately and must be after any DOM elements used in callback. -->
		<script
			src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDEM3FEmY5ecJzAkXH9TDRAs1MaXpSWtME&callback=initMap&libraries=&v=weekly"
			async></script>
		
		
	</div>


</body>
</html>