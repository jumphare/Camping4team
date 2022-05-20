<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet"/>

<meta charset="UTF-8">
<title>메인 레이아웃</title>
<style>
.item {
    position:relative;
    padding-top:20px;
    display:inline-block;
}
.notify-badge{
    position: absolute;
    right:-8px;  
    top:13px;    
    background:red;    
    text-align: center;
    border-radius: 30px 30px 30px 30px;
    color:white;
    padding:3px 5px;
    font-size:10px;
}
</style>
</head>
<body>   
 
<div class="col-sm-4">
    <div class="item">
        <a href="#">
            <span class="notify-badge">10</span>
            <img src="${pageContext.request.contextPath }/images/mail0.png"  alt="" width=30px height=30px />
        </a>
    </div>
</div>
</body>
</html>