<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0">
<link rel="shortcut icon" href="./images/default/favicon.ico"
	type="image/x-icon" />
<link rel="icon" href="./images/default/favicon.ico" type="image/x-icon" />
<link rel="stylesheet" type="text/css" href="/css/jquery-ui.min.css" />
<link rel="stylesheet" type="text/css" href="/css/layouta0da.css" />
<link rel="stylesheet" type="text/css" href="/css/layout_pcdc60.css"
	media="screen and (min-width:1024px)">
<link rel="stylesheet" type="text/css" href="/css/layout_jj7f50.css" />
<link rel="stylesheet" type="text/css" href="/css/layout_pc_jj7d5a.css"
	media="screen and (min-width:1024px)">
<link rel="stylesheet" type="text/css" href="/css/layout_elly302b.css" />
<link rel="stylesheet" type="text/css"
	href="/css/layout_pc_elly1d8d.css"
	media="screen and (min-width:1024px)">
<link rel="stylesheet" type="text/css" href="/css/layout_ch1bc4.css" />
<link rel="stylesheet" type="text/css" href="/css/layout_pc_chae31.css"
	media="screen and (min-width:1024px)">
<link rel="stylesheet" type="text/css" href="/css/layout_sy6617.css" />
<link rel="stylesheet" type="text/css" href="/css/layout_pc_sy231a.css"
	media="screen and (min-width:1024px)">
<link rel="stylesheet" type="text/css" href="/css/main99d9.css" />
<link rel="stylesheet" type="text/css" href="/css/main_pc2092.css"
	media="screen and (min-width:1024px)">
<title>Insert title here</title>
</head>
<body>
	<footer id="footer" class="footer">
		<div class="hidden_info">
			<div class="info_box">
				<div class="logo">
					<img src="/css/default/wine_village_rev2_wh.svg" alt="WINEVILLAGE">
				</div>
				<div class="info">
					<ul class="company_info">
						<li>대표번호 : 000-0000-0101 (업무시간 : 10:00-17:00 월~금/ 점심시간 :
							12:00-13:00) 주말, 공휴일 휴무</li>
						<li><span><em>대표자</em> : 김동환</span><span><em>주소</em> :
								서울특별시 중구 삼일대로 51길 17</span></li>
						<li><span><em>법인명</em> : (주)와인빌리지 아카데미</span><span><em>사업자
									등록정보</em> : 0000-00-000000</span></li>
						<li><span><em>통신판매업</em> : 제 2024-서울중구-7777호</span><span><em>개인정보보호책임자</em>
								: 와인빌리지</span></li>
						<li><span>호스팅 : (주)와인빌리지</span><span>E-MAIL :
								https://github.com/Develop-KIM/WineVillage</span></li>
						<li>주류는 매장을 방문하여 수령하여야 하며, 주류를 매장 외부로 반출하여 소비자에게 배달/판매하지 않음</li>
						<li>Copyright (c) WINEVillage All Rights Reserved. 무단 전재와 무단 복제를
							금함.</li>
					</ul>
				</div>
			</div>
		</div>
		<div class="mb_hidden quick_menu">
			<ul class="list">
				<li>
					<!-- <a href="http://pf.kakao.com/_vlkxfxb/chat"> -->
					<a href="chatUI.do" target="_blank" onclick="chatWinOpen(); return false;" data-id=${ user_id } data-username="${ name }">
						<div class="icon">
							<img src="/images/default/ico_quick_kakao_comment.png"
								alt="온라인 1:1 상담" draggable="false">
						</div>
						<div class="txt">온라인 1:1 상담</div>
					</a>
				</li>
				<li>
					<a href="/faq_list.do">
						<div class="icon">
							<img src="/images/default/ico_quick_faq.png" alt="자주하는 질문"
								draggable="false">
						</div>
						<div class="txt">FAQ</div>
					</a>
				</li>
			</ul>
			<div class="open_box">
				<button type="button" class="menu_open">quick menu open</button>
			</div>
			<a href="#none" class="go_top" onclick="commonUI.footer.topMove()"></a>
		</div>
	</footer>
	<script language=javascript>
		$(".quick_menu .menu_open").on("click", function() {
			$(".quick_menu").toggleClass("on")
		});
		function chatWinOpen() {
			var id = event.currentTarget.dataset.id;
			var username = event.currentTarget.dataset.username;
	        if (username == "") {
	            alert("대화명을 입력 후 채팅창을 열어주세요.");
	            /* username.focus(); */
	            return;
	        }
	        window.open("chatUI.do?chatId=" + id + "&chatName=" + username, "", 
	        		"width=321,height=482,scrollbars=no");
	        /* username = ""; */
	    }
	</script>
</body>
</html>