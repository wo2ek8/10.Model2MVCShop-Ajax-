
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>재이의 카카오 프렌즈샵</title>
<link
	href="https://fonts.googleapis.com/css?family=Do+Hyeon|Nanum+Gothic|Roboto&display=swap"
	rel="stylesheet">

<link rel="stylesheet" href="../css/bootstrap.min.css">
<link rel="stylesheet" href="../css/bootstrap-theme.min.css">
<link rel="stylesheet"
	href="http://netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap-glyphicons.css">
<link rel="icon" href="../images/img/favicon.ico" type="image/x-icon" />
<link rel="shortcut icon" href="../images/img/favicon.ico"
	type="image/x-icon" />

<style>
* {
	box-sizing: border-box;
	margin: 0;
	padding: 0;
}

li {
	list-style: none;
}

a {
	text-decoration: none;
	color: inherit;
}

a:hover, a:focus {
	text-decoration: none;
	color: inherit;
}

body {
	font-family: 'Roboto', sans-serif;
	font-family: 'Nanum Gothic', sans-serif;
	font-size: 14px;
	line-height: 1.5;
	color: #1e1e1e;
}

.grid {
	max-width: 1200px;
	margin: 0 auto;
}

.grid:after {
	content: '';
	display: block;
	clear: both;
}

.grid-sizer, .grid-item {
	width: 25%;
}

.grid-item {
	width: calc(25% - 20px);
	float: left;
	background: #fff;
	margin: 10px;
	box-shadow: rgba(0, 0, 0, 0.2) 0px 5px 13px;
	overflow: hidden;
	border-radius: 6px;
}

.grid-item img {
	width: 100%;
}

.grid-item p:nth-child(1) {
	font-size: 18px;
	font-weight: bold;
	color: rgb(26, 26, 26);
	margin-bottom: 5.8px;
	margin-top: 0;
}

.grid-item div {
	padding: 20px;
}

.dropdown:hover .dropdown-menu {
	display: block;
}

.navbar-brand {
	position: absolute;
	left: 50%;
	transform: translateX(-50%);
	font-family: 'Do Hyeon', sans-serif;
	font-weight: bold;
	font-size: 22px;
}



.navbar-brand img {
	width: 235px;
	vertical-align: -3px;
}

.navbar {
	background-color: #fff;
	border-bottom: 1px solid rgb(227, 229, 232);
	padding: 10px;
}

.navbar-form button {
	border: none;
	background: none;
	box-shadow: none;
}

.main {
	margin: 80px 0;
}

.dropdown-menu li a:hover {
	background: #fff;
}
</style>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script
	src="https://unpkg.com/masonry-layout@4/dist/masonry.pkgd.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script>
        $(function() {
            $('.grid').masonry({
                columnWidth: '.grid-sizer',
                itemSelector: '.grid-item',
                percentPosition: true,
                transitionDuration: 0
            });
            
            var count = 2;
        	var didScroll = false;
        	
        	
        	
        	$(window).on('scroll', function() {
        		didScroll = true;
        	});
        	
        	setInterval(function() {
        		if(didScroll) {
        			didScroll = false;
        			if($(window).scrollTop() == $(document).height() - $(window).height()) {
        				
        				if(count <= ${resultPage.maxPage}) {
        				
        					console.log('페이지 끝');
        					
        					
        					console.log(count);
        					infiniteScroll();
        					
        					count++;
        				}
        			}
        		}
        	}, 1000);
        	
        	function infiniteScroll() {
        		$.ajax({
        			url: '/product/json/listProduct/'+ count,
        			method: 'GET',
        			success: function(data) {
        				
                
        		        for(var i = 0; i < data.list.length; i++) {
        		        	
        		        	
        		            
        		            
                            
                            
                        
                        var displayValue4 = "<div class='grid-item'>"
                        + "<a href='#'><img src='/images/uploadFiles/" + data.list[i].fileNameList[0] + "' alt=''>"
                        + "<div>"
                            + "<p>" + data.list[i].prodName + "</p>"
                            + "<p>" + data.list[i].prodDetail + "</p>"
                            + "<p>" + data.list[i].price + "원</p>"
                        + "</div>"
                    + "</a>"
                + "</div>";
        		            
                            
                $( '.grid' ).append(displayValue4);
                setInterval(function() { 
                	
                	$( '.grid' ).masonry( 'reloadItems' );
                    $( '.grid' ).masonry( 'layout' );
                    }, 1); 
                            
                
                	
                    
                	
                            	
                                
        		        	
        		        	
        		        }
        		        
        		        
                
                
        			}
        		});
        	}
        });
    </script>
</head>

<body>
	<div class="header">
		<nav class="navbar navbar-default navbar-fixed-top">
			<div class="container">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed"
						data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
						aria-expanded="false">
						<span class="sr-only">Toggle navigation</span> <span
							class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="#"><img
						alt="Brand" src="../images/img/j_kakao_friends.PNG"></a>
				</div>


				<div class="collapse navbar-collapse"
					id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav">


						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-haspopup="true"
							aria-expanded="false">카테고리 <span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a href="#">Action</a></li>
								<li><a href="#">Another action</a></li>
								<li><a href="#">Something else here</a></li>
								<li role="separator" class="divider"></li>
								<li><a href="#">Separated link</a></li>
								<li role="separator" class="divider"></li>
								<li><a href="#">One more separated link</a></li>
							</ul></li>
						<li><a href="#">매장안내</a></li>
						<li><a href="#">고객센터</a></li>
					</ul>

					<ul class="nav navbar-nav navbar-right">
						<li><a href="#"><span class="glyphicon glyphicon-user"></span></a></li>
						<li><a href="#"><span
								class="glyphicon glyphicon-shopping-cart"></span></a></li>
						<li><a href="#"><span class="glyphicon glyphicon-globe"></span></a></li>
					</ul>
					<form class="navbar-form navbar-right">
						<div class="form-group">
							<input type="text" class="form-control" placeholder="무엇을 찾으세요?">
						</div>
						<button type="submit" class="btn btn-default">
							<span class="glyphicon glyphicon-search"></span>
						</button>
					</form>
				</div>
			</div>
		</nav>


	</div>

	<div class="main">
		<div class="grid">

			<div class="grid-sizer"></div>
			<c:forEach var="product" items="${list }">
				<div class="grid-item">
					<a href="#"><img
						src="/images/uploadFiles/${product.fileNameList[0]}" alt="">
						<div>
							<p>${product.prodName }</p>
							<p>${product.prodDetail }</p>
							<p>${product.price }원</p>
						</div> </a>
				</div>
			</c:forEach>

		</div>
	</div>

</body>
</html>
