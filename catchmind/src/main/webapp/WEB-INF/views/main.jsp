<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<style>

.carousel-inner img { width: 100%; }
* { margin: 0px; padding: 0px; }
ul { list-style: none; }
a { text-decoration: none; }
img { border: none; vertical-align: top; }

.listCarousel {
	width: 1300px;
	margin: 0 auto;
	background-color: white;
	position: relative;
}

.listCarousel .view {
	width: 1200px;
	margin: 0 auto;
	background-color: white;
	overflow: hidden;
}

.listCarousel .view .list {
	width: 2400px;
	margin-left: -1200px;
}

.listCarousel .view .list:after {
	content: "";
	display: block;
	clear: both;
}

.listCarousel .view .list>li { float: left; }
.listCarousel .view .list>li ul:after { content: ""; display: block; clear: both; }
.listCarousel .view .list>li ul li { float: left; width: 370px; height: 450px; }
.listCarousel .view .list>li ul li.a1 { margin-left: 0; margin-right: 45px; }
.listCarousel .view .list>li ul li.a2 { margin-left: 0; margin-right: 45px; }
.listCarousel .view .list>li ul li.a3 { margin-left: 0; margin-right: 0px; }

.list { width: 370px; height: 310px; display: inline-block; box-sizing: border-box; }
.lists img { width: 370px; height: 200px; }
.lists h4 { margin: 0px; }
.dday { float: right; }
.dday>img { width: 17px; height: 17px; vertical-align: text-bottom; }
.maker { color: darkgray; font-weight: 800; font-size: 13px; }
.icon { float: right; margin-top: 10px; }
.title { font-size: 25px; font-weight: 900; height: 45px; vertical-align:middle;}

progress { width: 370px; height: 10px; background-color: #2ed5d5; }
progress::-webkit-progress-bar { background-color: lightgray; }
progress::-webkit-progress-value { background-color: #2ed5d5; }

.lists:hover {cursor:pointer; background-color:#F4FFFE; }
</style>
</head>
<body>
	<jsp:include page="common/menubar.jsp" />
	<br>
	<br>
	<div class="content">
		<div>
			<!-- ?????? ????????? ???????????? -->
			<div id="myCarousel" class="carousel slide" data-ride="carousel">

				<!-- Indicators -->
				<ul class="carousel-indicators">
					<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
					<li data-target="#myCarousel" data-slide-to="1"></li>
					<li data-target="#myCarousel" data-slide-to="2"></li>
				</ul>

				<!-- The slideshow -->
				<div class="carousel-inner">
					<div class="carousel-item active"  style="position: relative;"><a href="">
						<img src="resources/images/mainimage05.jpg" width="1200px"
							height="400px"></a>
						<div style="right:150px; width: 450px; bottom:100px; font-size: 2.0em; font-weight: bold; position: absolute; color:white;">
						 ???????????? ???????????? ???-???!<br>
						????????? ?????? ??????
						</div>
					</div>
					<div class="carousel-item">
						<img src="resources/images/mainimage02.jpg" width="1200px"
							height="400px">

					</div>
					<div class="carousel-item">
						<img src="resources/images/mainimage06.jpg" width="1200px"
							height="400px">
						<div style="left:420px; width: 450px; bottom:110px; font-size: 1.8em; font-weight: bold; position: absolute; color:white;">
						 ?????????????????? ????????? ??????<br>
						 ????????? ???????????????!
						</div>
					</div>
				</div>

				<!-- Left and right controls -->
				<a class="carousel-control-prev" href="#myCarousel"
					data-slide="prev"> <span class="carousel-control-prev-icon"></span>
				</a> <a class="carousel-control-next" href="#myCarousel"
					data-slide="next"> <span class="carousel-control-next-icon"></span>
				</a>
			</div>
			<br> <br>
			
			
			<!-- ??????????????? ???????????? -->
		
			<div class="listCarousel">
				<div class="view">
					<div class="title">
						??????????????? ????????????
						<span class="prev icon"><img src="${pageContext.servletContext.contextPath}/resources/images/arrow_right16.png"></span> 
						<span class="prev icon">??????</span> 
						<span class="next icon"><img src="${pageContext.servletContext.contextPath}/resources/images/arrow_left16.png"></span>
					</div>
					
					<ul class="list">
						<li>
							<ul>
								<c:forEach items="${ list }" var="p" varStatus="index" begin="0" end="2">
									<li class="a${index.count}">
										<div class="lists">
											<input type="hidden" value="${p.projectNo}">
											<div>
												<img src="${pageContext.servletContext.contextPath}/resources/uploadFiles/${p.projectImg }">
											</div>
											<div>
												<h4 style="height:60px;">
													<b>${p.projectName}</b>
												</h4>
											</div>
											<div class="maker">${p.projectCategory} | ${p.makerName}</div>
											<div>
												<progress value="${p.fundingTotalCost / p.projectTargetAmount * 100 }" max="100"></progress>
											</div>
											<div>
												<span><fmt:formatNumber value="${p.fundingTotalCost / p.projectTargetAmount * 100 }" pattern="0" />% &nbsp;&nbsp; <fmt:formatNumber value="${ p.fundingTotalCost}"/>???</span><span class="dday">
												<img src="${pageContext.servletContext.contextPath}/resources/images/time.png">&nbsp;${p.projectDday }??? ??????</span>
											</div>
										</div>
									</li>
								</c:forEach>
							</ul>
						</li>
						<li>
							<ul>
								<c:forEach items="${ list }" var="p" varStatus="index" begin="3" end="5">
									<li class="a${index.count}">
										<div class="lists">
											<input type="hidden" value="${p.projectNo}">
											<div>
												<img src="${pageContext.servletContext.contextPath}/resources/uploadFiles/${p.projectImg }">
											</div>
											<div>
												<h4 style="height:60px;">
													<b>${p.projectName}</b>
												</h4>
											</div>
											<div class="maker">${p.projectCategory} | ${p.makerName}</div>
											<div>
												<progress value="${p.fundingTotalCost / p.projectTargetAmount * 100 }" max="100"></progress>
											</div>
											<div>
												<span><fmt:formatNumber value="${p.fundingTotalCost / p.projectTargetAmount * 100 }" pattern="0" />% &nbsp;&nbsp; <fmt:formatNumber value="${ p.fundingTotalCost}"/>???</span><span class="dday">
												<img src="${pageContext.servletContext.contextPath}/resources/images/time.png">&nbsp;${p.projectDday }??? ??????</span>
													
											</div>
										</div>
									</li>
								</c:forEach>
							</ul>
						</li>
					</ul>
				</div>
			</div>
			
		</div>
	</div>
	
	
	<script>
	  $(document).ready(function(){
	    
	    $('.prev').click(function(){
	        $('.list').stop().animate({'margin-left':'-1200px'},function(){
	            $('.list>li').eq(0).appendTo('.list');
	            $('.list').css({'margin-left':'0px'});
	        });
	    });
	    
	    $('.next').click(function(){
	        $('.list').stop().animate({'margin-left':'0px'},function(){
	            $('.list>li').eq(1).prependTo('.list');
	            $('.list').css({'margin-left':'-1200px'});
	        });
	    });
	    
	    /* ?????????????????? ???????????? ????????? ?????? */
       	$(function(){
    		$(".lists").click(function(){
    			var pno = $(this).children().eq(0).val();
    			location.href = "detail.pro?pno=" + pno;
    		});
    	});
	    
	 });
</script>


	<jsp:include page="common/footer.jsp" />
	
	

</body>
</html>