<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
    <title>Document</title>
</head>
<style>
    #outer{
        margin: auto;
        width: 700px;
        text-align: center;
    }
    #rewardArea{
        width: 700px;
        height: auto;
        border: 1px solid rgb(202, 202, 202);
        text-align: left;
        padding-left: 50px;
        padding-right: 50px;
        padding-top: 30px;
        padding-bottom: 30px;
        font-size: 15px;
    }
    #rewardArea td{
        padding-bottom: 10px;
    }
    .resultContent{
        text-align: right;
    }
    #payArea span{
        float : right;
        font-size: 17px;
    }
    #payArea div{
        padding-top: 10px;
        padding-bottom: 10px;
    }
    #payArea{
        width: 700px;
        height: auto;
        background-color: rgb(235, 235, 235);
        padding-left: 50px;
        padding-right: 50px;
        padding-top: 20px;
        padding-bottom: 20px;
        text-align: left;
        vertical-align: top;
        box-sizing: border-box;
        /* margin-left: 3px; */
    }
    #payArea td{
        border-bottom: 1px dotted gray;
        border-collapse: collapse;
        padding-bottom: 10px;
        padding-top: 10px;
        font-size: 15px;
    }
    #payArea th{
        padding-bottom: 10px;
        padding-top: 10px;
        font-size: 15px;
    }
    .payContent{
        /* float: right; */
        text-align: right;
    }
    #payAddress{
        width: 700px;
        height: auto;
        border: 1px solid rgb(202, 202, 202);
        padding-left: 50px;
        padding-right: 50px;
        padding-top: 30px;
        padding-bottom: 30px;
        font-size: 15px;
        text-align: left;
        margin-left: 3px;
    }
    #payAddress td{
        vertical-align: top;
        padding-bottom: 10px;
        padding-top: 10px;
        /* border-bottom: 1px dotted gray; */
    }
    #payAddress input{
        width: 400px;
        height: 20px;
        border-radius: 2px;
        border: 1px solid gray;
    }
    #next_btn{
        width: 150px;
        height: 50px;
        font-size: 15px;
        background-color:  rgb(31, 205, 211);
        border-radius: 5px;
        color: white;
        border: 1px solid rgb(31, 205, 211);
    }
    #cancel_btn{
        width: 150px;
        height: 50px;
        font-size: 15px;
        background-color:  rgb(190, 190, 190);
        border-radius: 5px;
        color: white;
        border: 1px solid rgb(202, 202, 202);
    }
    .btn{
        height: 30px;
        background-color:  rgb(190, 190, 190);
        border-radius: 2px;
        border: 1px solid rgb(202, 202, 202);
        color: white;
    }
    .btn2{
        height: 30px;
        background-color:   rgb(31, 205, 211);
        border-radius: 2px;
        border: 1px solid  rgb(31, 205, 211);
        color: white;
    }
</style>
<body>
    
    <jsp:include page="../common/menubar.jsp"/>
    
    <div id="outer">
        
        <table id="rewardArea">
            
            <!-- <h1>?????? ??????</h1> -->
			<br><br>
            <thead id="resultArea">
                <tr>
                    <td colspan="2" style="font-size: 12px;">?????????/????????????</td>
                </tr>
                <tr style="border: 1px solid black;">
                    <td>
                        <div>
                            <b style="font-size: 18px;">${ p.projectName }</b>
                            <p></p>
                        </div>        
                    </td>
                    <td class="resultContent">by ${ m.makerName }</td>
                </tr>
            </thead>   
            
            <tbody>
                <tr>
                    <td>????????????</td>
                    <td class="resultContent">
                    	${ fundingNo }
                    	<%-- <c:forEach items="${ cfl }" var ="fl">
	                    	<c:choose>
	                    		<c:when test="">
	                    			${ fl.fundingNo }&nbsp;&nbsp;
	                    		</c:when>
	                    		<c:otherwise></c:otherwise>
	                    	</c:choose>
                    	</c:forEach> --%>
                    </td>
                </tr>
                <tr>
                    <td>?????? ??????</td>
                    <td class="resultContent"><fmt:formatDate value="${ f0.fundingDate }" pattern="yyyy-MM-dd hh:mm:ss" /></td>
                </tr>
                <tr>
                    <td>?????? ?????????</td>
                    <td class="resultContent">${ p.projectFinishDate }</td>
                </tr>
                <tr>
                    <td>?????? ??????</td>
                    <td class="resultContent" style="font-size: 20px; color:rgb(31, 205, 211)">
                    	<b>
						<c:choose>
							<c:when test="${ f0.fundingStatus eq 'N' }">
								?????? ??????
							</c:when>
							<c:when test="${ f0.fundingStatus eq 'E' }">
								?????? ?????? ??????
							</c:when>
							<c:when test="${ f0.fundingStatus eq 'C' }">
								?????? ?????? ??????
							</c:when>
							<c:when test="${ f0.fundingStatus eq 'S' }">
								????????????
							</c:when>
							<c:otherwise>
								????????????
							</c:otherwise>
						</c:choose>
						</b>
					</td>
                </tr>
                <tr>
                	<form id="resultForm" action="requestCancel.pro?" method="post">
                		<input type="hidden" value="${ cfl }" id="originCfl">
                		<input type="hidden" name="fundingNo" value="${fundingNo }" >
                		<input type="hidden" name="pno" value="${ p.projectNumber }" >
                    	<td colspan="2">
                    		<c:choose>
                    			<c:when test="${ f0.fundingStatus eq 'N' }">
                    				<button type="button" class="btn2" style="width: 100%; height: 40px;" onclick="requestCancel();">?????? ?????? ??????</button>
                    			</c:when>
                    			<c:otherwise>
                    				<button type="button" disabled class="btn" style="width: 100%; height: 40px;" onclick="requestCancel();">?????? ?????? ??????</button>
                    			</c:otherwise>
                    		</c:choose>
                    	</td>
                	</form>
                	
                </tr>
            </tbody>
			
        </table>
        <br>
        
        
        <script>
        
        //?????? ??????
        function requestCancel(){
        	
        	alert("????????? ????????? ?????????????????????????");
        	
        	var originCfl = $("#originCfl").val(); 
        	//console.log(originCfl);
        	//var newCfl = encodeURI(originCfl);
        	
        	//$("#newCfl").val(newCfl);
			$("#resultForm").submit();

        }
        </script>
        

        <table id="payArea">
            <tr>
                <td colspan="2">
                
           	        <c:forEach items="${ cfl }" var ="fl">
                   		<div><b>${ fl.fundingTitle2 } (${ fl.fundingProduct })</b><span><fmt:formatNumber value="${ fl.fundingCost }" pattern="#,###" />??? (?????? ${ fl.fundingQuantity }???)</span></div>
                   	</c:forEach>
                
                </td>
            </tr>
            <tr>
                <td>????????????</td>
                <td class="payContent" id="fSum"><fmt:formatNumber value="${ sum }" pattern="#,###"/>???</td>
            </tr>
            <tr>
                <td>?????????</td>
                <td class="payContent"><fmt:formatNumber value="${ f0.fundingSponsership }" pattern="#,###" />???</td>
            </tr>
            <tr>
                <td>?????????</td>
                <td class="payContent">3,000???</td>
            </tr>
            <tr>
                <td>????????? ??????</td>
                <td class="payContent">-<fmt:formatNumber value="${ f0.usePoint }" pattern="#,###" />???</td>
            </tr>
            <tr>
                <th>??????????????????</th>
                <th class="payContent" style="font-size: 20px; color:rgb(31, 205, 211)"><fmt:formatNumber value="${ sum + f0.fundingSponsership + 3000 - f0.usePoint }" pattern="#,###" />???</th>
            </tr>
        </table>
        
        <br><br>


        <div style="text-align: left; margin-bottom: 10px;">
            <b style="font-size: 20px; ">?????? ??????</b>&nbsp;&nbsp;<!-- <button class="btn">?????? ?????? ??????</button> -->
        </div>
        

        <table id="payAddress">
           	<tr>
                <td width="200px">????????????</td>
                <td>${ f0.paymentMethod }</td>
            </tr>
            <tr>
                <td width="200px">????????????</td>
                <td>??????(??????)??????</td>
            </tr>
	   <!-- <tr>
                <td width="200px">????????????</td>
                <td>************1111</td>
            </tr> -->
        </table>
        <br><br>


        <div style="text-align: left; margin-bottom: 10px;">
            <b style="font-size: 20px; ">????????? ?????????</b>&nbsp;&nbsp;<button class="btn" onclick="location.href='mypageModify.me'">????????? ??????</button>
        </div>

        <table id="payAddress">
            <tr>
                <td width="200px">??????</td>
                <td>${ loginUser.userName }</td>
            </tr>
            <tr>
                <td width="200px">????????? ??????</td>
                <td>${ loginUser.phone }</td>
            </tr>
            <tr>
                <td width="200px">??????</td>
                <td>${ loginUser.address }</td>
            </tr>
            <tr>
                <td width="200px">????????? ???????????? (??????)</td>
                <td>${ f0.shipMemo }</td>
            </tr>
            <!-- <tr>
                <td colspan="2"><button class="btn" style="width: 100%;">????????? ????????? ??????</button></td>
            </tr> -->
        </table>


        <br><br><br>
        <button type="button" id="next_btn" onclick="location.href='bookingList.me?chc=li'" >?????? ?????? ????????????</button>
        <button type="button" id="cancel_btn" onclick="location.href='${ pageContext.servletContext.contextPath }';">?????????</button>
    </div>
    <br><br><br>

<%-- <jsp:include page="../common/footer.jsp"/> --%>

</body>
</html>