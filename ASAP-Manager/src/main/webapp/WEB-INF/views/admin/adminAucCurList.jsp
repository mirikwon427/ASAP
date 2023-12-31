<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<head>
<%@ include file="/WEB-INF/views/include/head.jsp"%>

<style>
th, td {
	text-align: center !important; /* 텍스트를 왼쪽 정렬합니다. */
}

.total {
	font-size: 80%; /* 작게 표시하기 위해 폰트 크기를 조절합니다. */
	color: #007bff;
	cursor: pointer;
}
</style>
<script>

$(document).ready(function(){
	setDateBox();
	
   $("#btnSearch").on("click",function(){
		var searchDate = mk_date();
		
		document.bbsForm.vrSeq.value = "";	
		document.bbsForm.curPage.value = 1;
		document.bbsForm.yearValue.value = $("#year").val();
		document.bbsForm.monthValue.value = $("#month").val();
	    document.bbsForm.searchType.value = $("#searchType").val();
		document.bbsForm.searchValue.value = $("#searchValue").val();
		document.bbsForm.searchDate.value = searchDate;
		document.bbsForm.action="/admin/adminAucCurList";
		document.bbsForm.submit();
	});
});

function fn_list(curPage){
	var searchDate = mk_date();
	
	document.bbsForm.vrSeq.value="";	
	document.bbsForm.curPage.value = curPage;
	document.bbsForm.searchDate.value = searchDate;
	document.bbsForm.action="/admin/adminAucCurList";
	document.bbsForm.submit();
}

function mk_date(){
	var year = $("#year").val();
	var month = $("#month").val();
	var searchDate;	
	
	if(month.length > 0){
		searchDate = year + month;
	}
	else
	{
		year ="";
		searchDate = year + month;
	}
	
	return searchDate;
}


function setDateBox(){
	
	window.onkeydown = function() {
		var kcode = event.keyCode;
		if(kcode == 116) 
		{
			history.replaceState({}, null, location.pathname);
		}
	}
	
	var dt = new Date();
	var year = dt.getFullYear();
	var month = dt.getMonth()+1;
	var selectedValue;
	
	if(!icia.common.isEmpty($("#yearValue").val()) && $("#yearValue").val() != "")
	{	
		for(var y = (year); y >=(year-5); y--)
		{
			if(y == $("#yearValue").val())
			{
				$("#year").append("<option selected value='"+ $("#yearValue").val() +"'>"+ $("#yearValue").val() + "년" +"</option>");
				continue;
			}
			else
			{
				$("#year").append("<option value='"+ y +"'>"+ y + "년" +"</option>");
			}
		}
	}
	else
	{
		for(var y = (year); y >=(year-5); y--)
		{
			if(year == y) 
			{
				$("#year").append("<option selected value='"+ y +"'>"+ y + "년" +"</option>");
			}
			else
			{
				$("#year").append("<option value='"+ y +"'>"+ y + "년" +"</option>");
			}
		}	
	}
	
	 if(!icia.common.isEmpty($("#monthValue").val()) && $("#monthValue").val() != "")
	{	
		$("#month").append("<option value>"+"전체" +"</option>");
		
		for(var i = 1; i <= 12; i++)
		{
			if(i.toString().length == 1)
			{
				i = "0" + i;
				
				if(i == $("#monthValue").val())
				{
					$("#month").append("<option selected value='"+ $("#monthValue").val() +"'>"+ $("#monthValue").val() + "월" +"</option>");
					continue;
				}
				
				$("#month").append("<option value='"+ i +"'>"+ i + "월" +"</option>");
			}
			else
			{
				if(i == $("#monthValue").val())
				{
					$("#month").append("<option selected value='"+ $("#monthValue").val() +"'>"+ $("#monthValue").val() + "월" +"</option>");
					continue;
				}
				$("#month").append("<option value='"+ i +"'>"+ i + "월" +"</option>");
			}		
		}
	}
	else
	{
		$("#month").append("<option selected value>"+"전체" +"</option>");
		for(var i = 1; i <= 12; i++)
		{
			if(i.toString().length == 1)
			{
				i = "0" + i;
				$("#month").append("<option value='"+ i +"'>"+ i + "월" +"</option>");
			}
			else
			{
				$("#month").append("<option value='"+ i +"'>"+ i + "월" +"</option>");
			}		
		}
	} 
}
</script>
</head>

<body>
	<div class="container-scroller">
		<!-- partial:/partials/_navbar.html -->
		<%@ include file="/WEB-INF/views/include/navigation.jsp"%>
		<!-- partial -->
		<div class="container-fluid page-body-wrapper">
			<!-- partial:/partials/_sidebar.html -->
			<nav class="sidebar sidebar-offcanvas" id="sidebar">
				<ul class="nav">
					<li class="nav-item nav-category" style="margin-bottom: 10px;"></li>
					<li class="nav-item"><a class="nav-link"
						href="/admin/userList"> <span class="icon-bg"><i
								class="mdi mdi-settings menu-icon"></i></span> <span class="menu-title">회원</span>
					</a></li>
					<li class="nav-item"><a class="nav-link"
						href="/admin/voteUpload"> <span class="icon-bg"><i
								class="mdi mdi-settings menu-icon"></i></span> <span class="menu-title">투표</span>
					</a></li>
					<li class="nav-item"><a class="nav-link"
						data-toggle="collapse" href="#ui-basic1" aria-expanded="false"
						aria-controls="ui-basic"> <span class="icon-bg"><i
								class="mdi mdi-settings menu-icon"></i></span> <span class="menu-title">경매</span>
							<i class="menu-arrow"></i>
					</a>
						<div class="collapse" id="ui-basic1">
							<ul class="nav flex-column sub-menu">
								<li class="nav-item"><a class="nav-link"
									href="/admin/adminAuction">경매 업로드</a></li>
								<li class="nav-item"><a class="nav-link"
									href="/admin/adminAucCurList">경매 입찰내역</a></li>
								<li class="nav-item"><a class="nav-link"
									href="/admin/adminAucBuyPriceList">경매 낙찰내역</a></li>
							</ul>
						</div></li>
					<li class="nav-item"><a class="nav-link"
						data-toggle="collapse" href="#ui-basic2" aria-expanded="false"
						aria-controls="ui-basic"> <span class="icon-bg"><i
								class="mdi mdi-settings menu-icon"></i></span> <span class="menu-title">이벤트
								경매</span> <i class="menu-arrow"></i>
					</a>
						<div class="collapse" id="ui-basic2">
							<ul class="nav flex-column sub-menu">
								<li class="nav-item"><a class="nav-link"
									href="/admin/aucEvent">이벤트경매 관리</a></li>
								<li class="nav-item"><a class="nav-link"
									href="/admin/aeCur">이벤트경매 입찰내역</a></li>
							</ul>
						</div></li>

					<li class="nav-item"><a class="nav-link"
						data-toggle="collapse" href="#ui-basic3" aria-expanded="false"
						aria-controls="ui-basic"> <span class="icon-bg"><i
								class="mdi mdi-settings menu-icon"></i></span> <span class="menu-title">상품
								및 결제 관리</span> <i class="menu-arrow"></i>
					</a>
						<div class="collapse" id="ui-basic3">
							<ul class="nav flex-column sub-menu">
								<li class="nav-item"><a class="nav-link"
									href="/admin/product">상품 관리</a></li>
								<li class="nav-item"><a class="nav-link"
									href="/admin/payList">결제 내역</a></li>
							</ul>
						</div></li>
					<li class="nav-item"><a class="nav-link"
						data-toggle="collapse" href="#ui-basic4" aria-expanded="false"
						aria-controls="ui-basic"> <span class="icon-bg"><i
								class="mdi mdi-settings menu-icon"></i></span> <span class="menu-title">게시판</span>
							<i class="menu-arrow"></i>
					</a>
						<div class="collapse" id="ui-basic4">
							<ul class="nav flex-column sub-menu">
								<li class="nav-item"><a class="nav-link"
									href="/admin/adminNoticeBoard">공지사항 게시판</a></li>
								<li class="nav-item"><a class="nav-link"
									href="/admin/adminQnaBoard">문의사항 게시판</a></li>
							</ul>
						</div></li>
					<li class="nav-item sidebar-user-actions" style="margin-top: 30px;">
						<div class="user-details">
							<div class="d-flex justify-content-between align-items-center">
								<div>
									<div class="d-flex align-items-center">
										<div class="sidebar-profile-img" style="margin-top: -10px;">
											<i class="mdi mdi-account-star" style="font-size: 20px;"></i>
										</div>
										<div class="sidebar-profile-text">
											<p class="mb-1" style="color: white;">${gnbAdmId }</p>
										</div>
									</div>
								</div>
							</div>
						</div>
					</li>
					<li class="nav-item sidebar-user-actions">
						<div class="sidebar-user-menu">
							<a href="/user/logOut" class="nav-link"><i
								class="mdi mdi-logout menu-icon"></i> <span class="menu-title">로그아웃</span></a>
						</div>
					</li>
				</ul>
			</nav>

			<!-- 네비게이션 바  -->

			<!-- partial -->
			<div class="main-panel">
				<div class="content-wrapper">
					<div class="page-header"></div>
					<div class="row">

						<div class="col-lg-12 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<h4 class="card-title">경매 입찰내역</h4>
									<div class="total" style="margin-bottom: 5px">
										<span>경매일 조회</span>
									</div>
									<div class="form-group"
										style="display: flex; margin-bottom: 10px;">

										<select id="year" name="year"
											class="form-control form-control-lg"
											style="width: 100px; height: 40px; margin-right: 10px;">
										</select> <select id="month" name="month"
											class="form-control form-control-lg month"
											style="width: 100px; height: 40px;">

										</select>
									</div>


									<div class="form-group"
										style="display: flex; margin-bottom: 10px;">
										<select id="searchType" name="searchType"
											class="form-control bg-transparent border-1"
											style="width: 100px; height: 46px; margin-top: 1px; margin-right: 5px;">
											<option value="">조회 항목</option>
											<option value="1"
												<c:if test = '${searchType eq "1"}'>selected</c:if>>작품명</option>
											<option value="2"
												<c:if test = '${searchType eq "2"}'>selected</c:if>>아이디</option>
										</select>
										<div class="search-field d-none d-xl-block"
											style="margin-bottom: 10px;">
											<div class="input-group-prepend bg-transparent"
												style="width: 500px !important;">

												<input type="text"
													class="form-control bg-transparent border-1"
													style="font-size: 0.8rem; width: 15rem; height: 3rem; margin-right: 5px;"
													id="searchValue" name="searchValue" value="${searchValue }">
												<div id="btnSearch"
													class="input-group-prepend bg-transparent"
													onclick="fn_btnSearch()">
													<i
														class="input-group-text bg-transparent border-1 mdi mdi-magnify"></i>
												</div>
											</div>
										</div>
									</div>

									<table class="table table-striped">
										<thead>
											<tr>
												<th>경매번호</th>
												<th>카테고리명</th>
												<th>작품명</th>
												<th>아이디</th>
												<th>입찰가</th>
												<th>입찰일시</th>
												<th>입찰상태</th>
											</tr>
										</thead>
										<tbody>
											<c:if test="${!empty list}">
												<c:forEach var="aucCur" items="${list}" varStatus="status">
													<tr>
														<td>${aucCur.aucSeq}</td>
														<td>
															<div>
																<c:choose>
																	<c:when test="${aucCur.categoryNo == 01}">
																		<span>미술</span>
																	</c:when>
																	<c:when test="${aucCur.categoryNo == 02}">
																		<span>사진</span>
																	</c:when>
																	<c:when test="${aucCur.categoryNo == 03}">
																		<span>도예</span>
																	</c:when>
																</c:choose>
															</div>
														</td>
														<td>${aucCur.vrTitle}</td>
														<td>${aucCur.userId}</td>
														<td><fmt:formatNumber type="number"
																maxFractionDigits="3" value="${aucCur.aucCurPrice}" /></td>
														<td>${aucCur.aucCurBuyTime}</td>
														<td><c:choose>
																<c:when test="${aucCur.status == 'N'}">입찰
																</c:when>
																<c:when test="${aucCur.status == 'Y'}">낙찰성공
																</c:when>
																<c:when test="${aucCur.status == 'C'}">입찰(환불)
																</c:when>
															</c:choose></td>

													</tr>


												</c:forEach>
											</c:if>
										</tbody>
									</table>
									<!-- 페이징처리 시작 -->
									<div class="mt-3"
										style="display: flex; justify-content: center;">
										<!-- 페이징 샘플 시작 -->
										<c:if test="${!empty paging}">
											<!--  이전 블럭 시작 -->
											<c:if test="${paging.prevBlockPage gt 0}">
												<a href="javascript:void(0)" class="btn btn-primary"
													onclick="fn_list(${paging.prevBlockPage})" title="이전 블럭">&laquo;</a>
											</c:if>
											<div style="width: 4px;"></div>
											<!--  이전 블럭 종료 -->
											<span> <!-- 페이지 시작 --> <c:forEach var="i"
													begin="${paging.startPage}" end="${paging.endPage}">
													<c:choose>
														<c:when test="${i ne curPage}">
															<a href="javascript:void(0)" class="btn btn-primary"
																onclick="fn_list(${i})" style="font-size: 14px;">${i}</a>
														</c:when>
														<c:otherwise>
															<h class="btn btn-primary"
																style="font-size:14px; font-weight:bold;">${i}</h>
														</c:otherwise>
													</c:choose>
												</c:forEach> <!-- 페이지 종료 -->
											</span>
											<div style="width: 4px;"></div>
											<!--  다음 블럭 시작 -->
											<c:if test="${paging.nextBlockPage gt 0}">
												<a href="javascript:void(0)" class="btn btn-primary"
													onclick="fn_list(${paging.nextBlockPage})" title="다음 블럭">&raquo;</a>
											</c:if>
											<!-- 다음 블럭 종료 -->
										</c:if>
										<!-- 페이징 샘플 종료  -->
									</div>

								</div>
							</div>
						</div>
					</div>

					<!-- content-wrapper ends -->


					<form name="bbsForm" id="bbsForm" method="post">
						<input type="hidden" name="vrSeq" id="vrSeq" value="" /> <input
							type="hidden" id="curPage" name="curPage" value="${curPage}" />
						<input type="hidden" id="searchDate" name="searchDate" value="" />
						<input type="hidden" id="yearValue" name="yearValue"
							value="${yearValue}" />
						<!-- modelMapd의 변수 -->
						<input type="hidden" id="monthValue" name="monthValue"
							value="${monthValue}" /> <input type="hidden" id="searchType"
							name="searchType" value="${searchType}" />
						<!-- modelMapd의 변수 -->
						<input type="hidden" id="searchValue" name="searchValue"
							value="${searchValue}" />
					</form>
				</div>
				<!-- main-panel ends -->
			</div>
			<!-- page-body-wrapper ends -->
		</div>
		<!-- container-scroller -->
	</div>
	<!-- plugins:js -->
	<script src="/resources/vendors/js/vendor.bundle.base.js"></script>
	<!-- endinject -->
	<!-- Plugin js for this page -->
	<!-- End plugin js for this page -->
	<!-- inject:js -->
	<script src="/resources/js/off-canvas.js"></script>
	<script src="/resources/js/hoverable-collapse.js"></script>
	<script src="/resources/js/misc.js"></script>
	<!-- endinject -->
	<!-- Custom js for this page -->
	<!-- End custom js for this page -->
</body>
</html>