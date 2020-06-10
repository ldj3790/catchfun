<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%



%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style>
.area {
	width: 300px;
	height: 100px;
	font-size: 50px;
	color: black;
	background-color: white;
	border: 1px solid black;
	position: absolute;
}

.question {
	font-size: 30px;
	color: blue;
}

.questiontext {
	width: 700px;
	height: 100px;
}

.questioninput {
	width: 700px;
	height: 35px;
}

.grey {
	font-size: 15px;
	color: grey;
}

.answer {
	font-size: 22px;
	color: green;
}

.outer {
	min-width: 800px;
}

.black {
	color: black;
	font-size: 15px;
}

.blacktool {
	/* vertical-align: middle; */
	width: 700px;
	height: 120px;
	background-color: white;
	border: 1px solid black;
	font-size: 15px;
	color: black;
}
</style>

</style>
</head>

<body>
	<div style="position: fixed">
		<%@ include file="../common/menubarIm.jsp"%>
	</div>
	<!-- <div  style="position: fixed";> -->

	<div class="outer">
	
	
	<div style=" height: 700px ; margin-left: 270px;">

			<br>
			<h1 class="h3 text-gray-900 mb-4">펀딩결제현황</h1>
			<div class="card shadow mb-4" style="width: 500px;">
                <div class="card-header py-3">
	                  <h6 class="m-0 font-weight-bold text-primary">나의 펀딩현황</h6>
                </div>
                <div class="card-body">
	                 	<h1 class="black">
						1) ${project.projectTargetAmount }원목표
						</h1>
						<h1 class="black">
						2) ${project.projectStartDate }~${project.projectFinishDate } 마감
						</h1>
                </div>
            </div>
			
	
	
		
            <br> <br>
		 <div class="row" style="width: 100%;">
			 <div class="col-xl-3 col-md-6 mb-4">
              <div class="card border-left-primary shadow h-100 py-2">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                      <div class="h5 font-weight-bold text-primary text-uppercase mb-1">총펀딩 결제 예약금액</div>
                      <div class="h5 mb-0 font-weight-bold text-gray-800">${fundSum.fundSum}원</div>
                      <div class="h6 mb-0 font-weight-grey text-gray-800">오늘 ${todayfundSum.fundSum}원</div>
                    </div>
                  
                  </div>
                </div>
              </div>
            </div>
			 <div class="col-xl-3 col-md-6 mb-4">
              <div class="card border-left-primary shadow h-100 py-2">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                      <div class="h5 font-weight-bold text-primary text-uppercase mb-1">총펀딩 달성률</div>
                      <div class="h5 mb-0 font-weight-bold text-gray-800">${fundSum.fundSum / project.projectTargetAmount *100}%</div>
                      <div class="h6 mb-0 font-weight-grey text-gray-800">오늘 ${todayfundSum.fundSum /project.projectTargetAmount *100}%</div>
                    </div>
                  
                  </div>
                </div>
              </div>
            </div>
			 <div class="col-xl-3 col-md-6 mb-4">
              <div class="card border-left-primary shadow h-100 py-2">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                      <div class="h5 font-weight-bold text-primary text-uppercase mb-1">총펀딩 건수</div>
                      <div class="h5 mb-0 font-weight-bold text-gray-800">${fundSum.fundCount}건</div>
                      <div class="h6 mb-0 font-weight-grey text-gray-800">오늘 ${todayfundSum.fundCount}건</div>
                    </div>
                  
                  </div>
                </div>
              </div>
            </div>
		</div>
		<br><br>
		  <div class="card shadow mb-4" style="width: 800px; height: 500px; ">
                <div class="card-header py-3">
                  <h6 class="m-0 font-weight-bold text-primary">수익현황(10일전까지)</h6>
                </div>
                <div class="card-body">
                  <div class="chart-area">
                    <canvas id="myAreaChart"></canvas>
                  </div>
                  <hr>
                
                </div>
              </div>
		 <br>
		 <h1 class="h3 text-gray-900 mb-4">펀딩내역</h1>
		 
		 <table class="table-bordered table-hover table-sm listArea" style="width:1000px;">
            <thead>
              <tr>
               
                <th width="150px">이름</th>
                <th width="400px">선택 리워드</th>
                <th width="200px">금액</th>
                <th width="100px">갯수</th>
                <th width="150px">펀딩일</th>
                <th width="150px">펀딩상태</th>
                <th width="150px">펀딩총액</th>
              </tr>
            </thead>
            <tbody>
            
		
			<!-- tr>
				<td colspan="6">존재하는 공지사항이 없습니다.</td>
			</tr> -->
			
			<c:forEach items="${ fundingList }" var="b">
		
				<c:if test="${ b.projectNo eq project.projectNo }">
	                    <tr>
	                        <td>${ b.fundingProduct }</td>
	                        <td>${ b.rewardTitle }</td>
	                        <td>${ b.fundingCost }</td>
	                        <td>${ b.fundingQuantity }</td>
	                        <td>${ b.fundingDate }</td>
	                      	<td>${ b.fundingStatus }</td>
	                      	<td>${ b.fundingQuantity * b.fundingCost }</td>
	                    </tr>
	                </c:if>
                 </c:forEach>
                    
            </tbody>
          </table>
             

   	<br><br>
   			<div id="pagingArea">
                <ul class="pagination">
                	
                	<c:choose>
                		<c:when test="${ pi.currentPage eq 1 }">
	                    	<li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>     
	                    </c:when>
	                    <c:otherwise>
	                   		<li class="page-item"><a class="page-link" href="fund.pa?currentPage=${ pi.currentPage-1 }">Previous</a></li>
                    	</c:otherwise>
                    </c:choose>
                    
                    <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
                    	<c:choose>
                    		<c:when test="${ p eq pi.currentPage }">
	                    		<li class="page-item disabled"><a class="page-link" href="#">${ p }</a></li>
	                    	</c:when>
	                    	<c:otherwise>
	                    		<li class="page-item"><a class="page-link" href="fund.pa?currentPage=${ p }">${ p }</a></li>
                    		</c:otherwise>
                    	</c:choose>
                    </c:forEach>
                    
                    <c:choose>
                    	<c:when test="${ pi.currentPage eq pi.maxPage }">
	                    	<li class="page-item disabled"><a class="page-link" href="#">Next</a></li>
	                    </c:when>
	                    <c:otherwise>
	                    	<li class="page-item"><a class="page-link" href="fund.pa?currentPage=${ pi.currentPage+1 }">Next</a></li>
                    	</c:otherwise>
                    </c:choose>
                </ul>
                
                
            </div>
			
			
			
			</div>

		
	</div>
 
 
	     


	<script>
		
		
		
		
		
		// Set new default font family and font color to mimic Bootstrap's default styling
		Chart.defaults.global.defaultFontFamily = 'Nunito', '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
		Chart.defaults.global.defaultFontColor = '#858796';

		function number_format(number, decimals, dec_point, thousands_sep) {
		  // *     example: number_format(1234.56, 2, ',', ' ');
		  // *     return: '1 234,56'
		  number = (number + '').replace(',', '').replace(' ', '');
		  var n = !isFinite(+number) ? 0 : +number,
		    prec = !isFinite(+decimals) ? 0 : Math.abs(decimals),
		    sep = (typeof thousands_sep === 'undefined') ? ',' : thousands_sep,
		    dec = (typeof dec_point === 'undefined') ? '.' : dec_point,
		    s = '',
		    toFixedFix = function(n, prec) {
		      var k = Math.pow(10, prec);
		      return '' + Math.round(n * k) / k;
		    };
		  // Fix for IE parseFloat(0.55).toFixed(0) = 0;
		  s = (prec ? toFixedFix(n, prec) : '' + Math.round(n)).split('.');
		  if (s[0].length > 3) {
		    s[0] = s[0].replace(/\B(?=(?:\d{3})+(?!\d))/g, sep);
		  }
		  if ((s[1] || '').length < prec) {
		    s[1] = s[1] || '';
		    s[1] += new Array(prec - s[1].length + 1).join('0');
		  }
		  return s.join(dec);
		}

		// Area Chart Example
		var ctx = document.getElementById("myAreaChart");
		var myLineChart = new Chart(ctx, {
		  type: 'line',
		  data: {
		    labels: [${fundDayDate}],
		    datasets: [{
		      label: "Earnings",
		      lineTension: 0.3,
		      backgroundColor: "rgba(78, 115, 223, 0.05)",
		      borderColor: "rgba(78, 115, 223, 1)",
		      pointRadius: 3,
		      pointBackgroundColor: "rgba(78, 115, 223, 1)",
		      pointBorderColor: "rgba(78, 115, 223, 1)",
		      pointHoverRadius: 3,
		      pointHoverBackgroundColor: "rgba(78, 115, 223, 1)",
		      pointHoverBorderColor: "rgba(78, 115, 223, 1)",
		      pointHitRadius: 10,
		      pointBorderWidth: 2,
		      data: [${fundDayMoney}],
		    }],
		  },
		  options: {
		    maintainAspectRatio: false,
		    layout: {
		      padding: {
		        left: 10,
		        right: 25,
		        top: 25,
		        bottom: 0
		      }
		    },
		    scales: {
		      xAxes: [{
		        time: {
		          unit: 'date'
		        },
		        gridLines: {
		          display: false,
		          drawBorder: false
		        },
		        ticks: {
		          maxTicksLimit: 7
		        }
		      }],
		      yAxes: [{
		        ticks: {
		          maxTicksLimit: 5,
		          padding: 10,
		          // Include a dollar sign in the ticks
		          callback: function(value, index, values) {
		            return  number_format(value)+'원';
		          }
		        },
		        gridLines: {
		          color: "rgb(234, 236, 244)",
		          zeroLineColor: "rgb(234, 236, 244)",
		          drawBorder: false,
		          borderDash: [2],
		          zeroLineBorderDash: [2]
		        }
		      }],
		    },
		    legend: {
		      display: false
		    },
		    tooltips: {
		      backgroundColor: "rgb(255,255,255)",
		      bodyFontColor: "#858796",
		      titleMarginBottom: 10,
		      titleFontColor: '#6e707e',
		      titleFontSize: 14,
		      borderColor: '#dddfeb',
		      borderWidth: 1,
		      xPadding: 15,
		      yPadding: 15,
		      displayColors: false,
		      intersect: false,
		      mode: 'index',
		      caretPadding: 10,
		      callbacks: {
		        label: function(tooltipItem, chart) {
		          var datasetLabel = chart.datasets[tooltipItem.datasetIndex].label || '';
		          return datasetLabel + ': 원' + number_format(tooltipItem.yLabel);
		        }
		      }
		    }
		  }
		});

	</script>
</body>
</html>