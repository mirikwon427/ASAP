<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>

<!DOCTYPE html>
<html>
<head>
   <%@ include file="/WEB-INF/views/include/head.jsp"%>
<style>
.aCss {
   cursor: pointer;
}
/* 드롭다운 목록의 폭과 높이를 동시에 조절 */
#excpStrYear {
   width: 120px; /* 원하는 폭으로 설정 */
   height: 50px; /* 원하는 높이로 설정 */
   font-size: 14px; /* 원하는 글꼴 크기로 설정 */
}

#excpStrMonth {
   width: 120px; /* 원하는 폭으로 설정 */
   height: 50px; /* 원하는 높이로 설정 */
   font-size: 14px; /* 원하는 글꼴 크기로 설정 */
}

#btnDate {
   height: 50px;
}
.liCss {
   border: 1px solid #ffffff !important;
   width: 15%;
   line-height: 20px !important;
   margin: 0 auto;
   font-size: 15px !important;
   margin-bottom: 20px;
}
</style>

<script>
$(document).ready(function(){

	setSelectFormCalendar("excpStr");
	
	var selectedMonth = localStorage.getItem("selectedMonth");
	  if (selectedMonth) {
	    $("#excpStrMonth").val(selectedMonth);
	  }

	  // 월 선택 드롭다운 변경 시 로컬 저장소에 저장
	  $("#excpStrMonth").change(function() {
	    var selectedValue = $("#excpStrMonth").val();
	    localStorage.setItem("selectedMonth", selectedValue);
	  });

	  // 조회 버튼 클릭 시 선택한 월을 사용하여 검색
	  $("#btnDate").click(function() {
	    var selectedValue = $("#excpStrMonth").val();
	    document.voteForm.searchDate.value = selectedValue;
	    document.voteForm.curPage.value = "1";
	    document.voteForm.action = "/vote/voteResult";
	    document.voteForm.submit();
	  });

});

// 날짜 조회 (연도는 껍데기 )
function setSelectFormCalendar(id){

	var monthNames = ["", "1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월" ];
	var qntYears = 1;
	var selectYear = $("#"+id+"Year");
	var selectMonth = $("#"+id+"Month");
	var currentYear = new Date().getFullYear();
	// var currentYear = 2023;

	// "월을 선택하세요" 옵션 추가
	var monthPrompt = document.createElement("option");
	monthPrompt.value = "";
	monthPrompt.textContent = "전체";
	selectMonth.append(monthPrompt);
	
	
	//년도에대한 드롭다운 요소추가
	for (var y = 0; y < qntYears; y++){
		var date = new Date(currentYear);
		var yearElem = document.createElement("option");
		yearElem.value = currentYear; 
		yearElem.textContent = currentYear+"년";
		selectYear.append(yearElem);
		currentYear++;
	} 

	// 에대한 요소 추가
	for (var m = 0; m < 12; m++){
		var monthNum = new Date(currentYear, m).getMonth()+1;
		var month = monthNames[monthNum];
		var monthElem = document.createElement("option");
		if(monthNum<10){monthNum='0'+monthNum}
		monthElem.value = monthNum; 
		monthElem.textContent = month;
		selectMonth.append(monthElem);
	}
  

}
//작품 클릭시 상세페이지 이동
function fn_detail(vrSeq) 
{
	if($("#gubun").val() == 1)
	{
		document.voteForm.vrSeq.value = vrSeq;
		document.voteForm.gubun.value = 1;
		document.voteForm.action = "/vote/voteResultDetail";
		document.voteForm.submit();
	}
	else if($("#gubun").val() == 2)
	{
		document.voteForm.vrSeq.value = vrSeq;
		document.voteForm.gubun.value = 2;
		document.voteForm.action = "/vote/voteResultDetail";
		document.voteForm.submit();
	}
	else if($("#gubun").val() == 3)
	{
		document.voteForm.vrSeq.value = vrSeq;
		document.voteForm.gubun.value = 3;
		document.voteForm.action = "/vote/voteResultDetail";
		document.voteForm.submit();
	}
	else
	{
		document.voteForm.vrSeq.value = vrSeq;
		document.voteForm.action = "/vote/voteResultDetail";
		document.voteForm.submit();
	}
    
}
//페이지 버튼 클릭 이동
function fn_list(curPage)
{
	document.voteForm.vrSeq.value = "";
	document.voteForm.curPage.value = curPage;
	document.voteForm.action = "/vote/voteList";
	document.voteForm.submit();
}

function searchCategory(value) {
	document.voteForm.vrSeq.value = "";
    document.voteForm.searchType.value = value;
    document.voteForm.searchDate.value = "";
    document.voteForm.curPage.value = "1";
    document.voteForm.action = "/vote/voteResult";
    document.voteForm.submit();	    
}
//페이지 버튼 클릭 이동
function fn_list2(curPage)
{
	document.voteForm.vrSeq.value = "";
	document.voteForm.curPage.value = curPage;
	document.voteForm.action = "/vote/voteResult";
	document.voteForm.submit();
}

</script>

</head>
<body>
   <%@ include file="/WEB-INF/views/include/navigation.jsp"%>
   <!-- breadcrumb -->
    <div class="gen-breadcrumb" style="background-image: url('/resources/images/background/back.png');">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-12">
                    <nav aria-label="breadcrumb">
                        <div class="gen-breadcrumb-title">
                            <h1>
                                투표 결과
                            </h1>
                        </div>
                        <div class="gen-breadcrumb-container">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="index.html"><i
                                            class="fas fa-home mr-2"></i>홈</a></li>
                                <li class="breadcrumb-item active">투표 결과</li>
                            </ol>
                        </div>
                    </nav>
                </div>
            </div>
        </div>
    </div>
    <!-- breadcrumb -->
    
	<!-- 카테고리 시작-->
     <br>
	<div style="text-align: center !important;" id="_searchType">
		<a class="gen-button gen-button-flat aCss" onclick="location.href='/vote/voteResult'"> 
			<span class="text" onclick="location.href='/vote/voteResult'">전체</span>
		</a> 
		<a class="gen-button gen-button-flat aCss" onclick="searchCategory(1)"> 
			<span class="text" onclick="searchCategory(1)">미술</span>
		</a> 
		<a class="gen-button gen-button-flat aCss" onclick="searchCategory(3)"> 
			<span class="text" onclick="searchCategory(3)">도예</span>
		</a>
		<a class="gen-button gen-button-flat aCss" onclick="searchCategory(2)"> 
			<span class="text" onclick="searchCategory(2)">사진</span>
		</a> 
	</div>
   <!--카테고리 끝 -->
     
   <!-- Pricing Plan Start -->
	<section class="gen-section-padding-2" style="margin-top:-80px !important;">
        <div class="container container-2">
	       <div class="row" style="margin-left: 10px !important;">
	           <!-- 종료경매 날짜 조회 -->
	           <select id="excpStrYear"></select> 
	           <select id="excpStrMonth"></select>
	           <input type="button" id="btnDate" name="btnDate" value="조회" />
	        </div>
	        <div class="row">
             <c:if test="${!empty list}">
                    		<c:forEach var="voteUpload" items="${list}" varStatus="status">
                <div class="col-xl-4 col-lg-4 col-md-4" style="margin-top:3%;">
                    <div class="gen-price-block text-center">
                        <div class="gen-price-detail">
                            <span class="gen-price-title">${voteUpload.vrStartDate.substring(0, 4)}년 ${voteUpload.vrStartDate.substring(4, 6)}월</span>
                            <h2 class="price"><fmt:formatNumber type = "number" maxFractionDigits ="3" 
                                                            value="${voteUpload.vrTotalCnt}"/>표</h2>
                            <div class="gen-bg-effect">
                                <img src="/resources/upload/vote/${voteUpload.vrSeq}.png" alt="stream-lab-image">
                            </div>
                        </div>
                        <ul class="gen-list-info ">
                           <li class="liCss">
                              ${voteUpload.categoryName}
                           </li>
                           <li>
                              <h6>${voteUpload.vrTitle}</h6>
                           </li>
                           <li>${voteUpload.userName}</li>
                        </ul>
                        <div class="gen-btn-container button-1">
                            <a href="javascript:void(0)" class="gen-button" onclick="fn_detail(${voteUpload.vrSeq})">
                                <span class="text">자세히 보기</span>
                            </a>
                        </div>                          
                    </div>
                </div>
                 </c:forEach>
                        </c:if>
            </div>
        </div>
    </section>
    <!-- Pricing Plan End -->
    <!-- 페이징 처리 시작 -->
	<div class="col-lg-12 col-md-12" style="margin: 0 auto;">
 		<div class="gen-pagination" style="text-align: center;">
			<nav aria-label="Page navigation" style="display :inline-block;">
				<ul class="page-numbers">
					<c:if test="${!empty paging}">
						<c:if test="${paging.prevBlockPage gt 0}">		
         					<li><<a class="next page-numbers" href="javascript:void(0)" onclick="fn_list(${paging.prevBlockPage})">이전블럭</a></li>
						</c:if>
	
						<c:forEach var="i" begin="${paging.startPage}" end="${paging.endPage}" >
							<c:choose>
								<c:when test="${i ne curPage}" >		
									<li><a class="page-numbers" href="javascript:void(0)" onclick="fn_list2(${i})">${i}</a></li>
								</c:when>
								<c:otherwise>         
									<li><a class="page-numbers" href="javascript:void(0)" style="cursor:default;">${i}</a></li>
								</c:otherwise>   		
							</c:choose>
   						</c:forEach>
    					<c:if test="${paging.nextBlockPage gt 0}">
         					<li><a class="next page-numbers" href="javascript:void(0)" onclick="fn_list(${paging.nextBlockPage})">다음블럭</a></li>
						</c:if>
					</c:if>
                </ul>
            </nav>
        </div>
    </div>
    <br><br><br>
    <!-- 페이징 처리 끝 -->
    
    <form name="voteForm" id="voteForm" method="post">
		<input type="hidden" name="vrSeq" value="" /> 
		<input type="hidden" name="gubun" id="gubun" value="${gubun }" />
		<input type="hidden" name="searchType" id="searchType" value="${searchType}" />	
		<input type="hidden" name="searchDate" value="${searchDate}" />
		<input type="hidden" name="curPage" value="${curPage}" />
   </form>
   	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</body>
</html>