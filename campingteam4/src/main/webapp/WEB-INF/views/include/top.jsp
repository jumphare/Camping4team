<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
  <title>top</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <style>
    /* Remove the navbar's default margin-bottom and rounded borders */ 
    .navbar {
      margin-bottom: 0;
      border-radius: 0;
      background-color:#fff;
    }

  
    .navbar-nav li a{  
             background-color:#fff!important;
             color:#000!important;
             }
  
    .navbar-nav li a:hover {
    background: silver!important;
  }
      
    }
  </style>
</head>
<body>

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li class="active"><a href="./index.jsp" >Home</a></li>
        <li><a href="/abc/member_login.do" >로그인</a></li>
        <li><a href="/abc/mypage.do" >마이페이지</a></li>
        <li><a href="/abc/noticelist.do" >공지게시판</a></li>
        <li><a href="/abc/reviewlist.do" >리뷰목록</a></li>
        <li><a href="/abc/date_sel.do">예약하기</a></li>
        <li><a href="/abc/eq_table.do">장비</a></li>
        <li><a href="msgmain.jsp">메세지</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="#"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
      </ul>
    </div>
  </div>
</nav>