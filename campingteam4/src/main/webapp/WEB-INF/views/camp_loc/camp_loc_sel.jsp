<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form method="post" action="<%=request.getContextPath()%>/loc_check.do?startDate=${startDate}&endDate=${endDate}&memcount=${memcount}">
 	<input type ="submit" name ="loc" value="서울"><br>
 	<input type ="submit" name ="loc" value="천안"><br>
 	<input type ="submit" name ="loc" value="대전"><br>
</form>

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
                zoom: 8,
                center: { lat: 37.2410864, lng: 127.1775537 },  //용인
            });

				var num = 0;
            for (var i = 0; i < locations.length; i++) {


             if(i==0){

             	var  marker1 = new google.maps.Marker({
                    map: map,
                    label: locations[i].place,
                    position: new google.maps.LatLng(locations[i].lat, locations[i].lng),
                    title:'Click to zoom' 
                });
             	
            	  google.maps.event.addListener(marker1,'click',function() {
                      map.setZoom(17);
                      map.setCenter(marker1.getPosition());
                     });
             }else if(i==1){
            	 
             	var  marker2 = new google.maps.Marker({
                    map: map,
                    label: locations[i].place,
                    position: new google.maps.LatLng(locations[i].lat, locations[i].lng),
                    title:'Click to zoom' 
                });
            	 
            	     google.maps.event.addListener(marker2,'click',function() {
                      map.setZoom(17);
                      map.setCenter(marker2.getPosition());

                     });
            	  
             }else if(i==2){
            	 
             	var  marker3 = new google.maps.Marker({
                    map: map,
                    label: locations[i].place,
                    position: new google.maps.LatLng(locations[i].lat, locations[i].lng),
                    title:'Click to zoom' 
                });
            	 
            	  google.maps.event.addListener(marker3,'click',function() {
                      map.setZoom(17);
                    
                      map.setCenter(marker3.getPosition());
                     });
             }
          
                num++;
                
            } // for end
            
        } // initMap() end
        const locations = [
            { place:"서울", lat: 37.570134, lng:126.8725638 },
            { place:"천안", lat: 36.8013881, lng:127.2262169 },
            { place:"대전", lat: 36.4561675, lng:127.4747085 },
        ];

    </script>
    
</head>

<body>
    <h3>구글 맵</h3>
    <!--The div element for the map -->
    <div id="map"></div>

    <!-- Async script executes immediately and must be after any DOM elements used in callback. -->
    <script
        src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDEM3FEmY5ecJzAkXH9TDRAs1MaXpSWtME&callback=initMap&libraries=&v=weekly"
        async></script>
</body>

</body>
</html>