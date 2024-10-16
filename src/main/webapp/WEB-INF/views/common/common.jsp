<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0">
<link rel="stylesheet" type="text/css" href="/css/jquery-ui.min.css" />
<link rel="stylesheet" type="text/css" href="/css/layouta0da.css" />
<link rel="stylesheet" type="text/css" href="/css/layout_pcdc60.css"
	media="screen and (min-width:1024px)">
<link rel="stylesheet" type="text/css" href="/css/layout_jj7f50.css" />
<link rel="stylesheet" type="text/css" href="/css/layout_pc_jj7d5a.css"
	media="screen and (min-width:1024px)">
<link rel="stylesheet" type="text/css" href="/css/layout_elly302b.css" />
<link rel="stylesheet" type="text/css"
	href="./css/layout_pc_elly1d8d.css"
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
<link rel="stylesheet" type="text/css"
	href="/css/shop/main99d9.css?v=231010140029" />
<link rel="stylesheet" type="text/css"
	href="/css/shop/main_pc2092.css?v=230810114342"
	media="screen and (min-width:1024px)">
<link rel="stylesheet" type="text/css" href="/css/shop/slick.css">
<link rel="stylesheet" type="text/css" href="/css/shop/jqcloud.min.css" />
<style>
#mylogin {padding: 0; background-image: none;}
.gnb>ul {margin-left: 110px;}
</style>
<script type="text/javascript" src="/js/slick.min.js"></script>
<script type="text/javascript" src="/js/jquery.min.js"></script>
<script type="text/javascript" src="/js/jquery-ui.min.js"></script>
<script type="text/javascript" src="/js/picturefill.min.js"></script>
<script type="text/javascript" src="/js/commond820.js?v=221216102931"></script>
<script type="text/javascript" src="/js/front_ui9442.js?v=221226120920"></script>
<script src="/js/wn.productf100.js?v=230405140747"></script>
<script type="text/javascript" src="/js/jqcloud.min.js"></script>
<script type="text/javascript" src="/js/slick.min.js"></script>
<script type="text/javascript" src="/js/filter.js"></script>
<script type="text/javascript" src="/js/order.js"></script>
<script>
function checkLoginStatus() {
    var loginMemberId = document.getElementById("loginMemberId").value.trim();
    var loginPassword = document.getElementById("loginPassword").value.trim();
    console.log(loginMemberId);
    console.log(loginPassword);
    $.ajax({
        type: "post",
        data: { loginMemberId: loginMemberId, loginPassword: loginPassword },
        url: "/checkLoginStatus", // 백엔드에서 로그인 상태를 확인하는 엔드포인트 URL
        success: function(response) {
            console.log('콜백', response);
            if (response) {
                // 로그인된 경우
                $('.on_login').show(); // 로그인 후 보여줄 영역 표시
                $('.no_login').hide(); // 로그인 전 보여줄 영역 숨김
                $('.login_layer').hide();
                window.location.href = 'main.do';
            } else {
                // 로그인되지 않은 경우
                $('.on_login').hide(); // 로그인 후 보여줄 영역 숨김
                $('.no_login').show(); // 로그인 전 보여줄 영역 표시
                // 아이디나 비밀번호가 맞지 않는다는 alert을 표시합니다.
                alert("아이디나 비밀번호가 맞지 않습니다.");
            }
        },
        error: function(xhr, status, error) {
            alert("에러 발생: " + error); // 예상치 못한 에러 처리
        }
    });
}
</script>
<script>
$(document).ready(function(){
    $("#logoutButton").click(function(){
        $.ajax({
            type: "POST",
            url: "/logout", // 로그아웃을 처리할 서버의 URL. Spring Security의 logoutUrl과 일치해야 합니다.
            success: function(response){
            	console.log(response);
                // 로그아웃 성공 후 처리할 로직
                // 예를 들어, 로그아웃 성공 URL로 리다이렉트 할 수 있습니다.
                window.location.href = window.location.href; // 로그아웃 성공 후 이동할 URL
            },
            error: function(e){
                // 로그아웃 실패 처리
                console.log(e);
            }
        });
    });
});
</script>
<title>WINEVILLAGE ㅣ 와인의 모든 것이 있는 곳 와인빌리지입니다!</title>
</head>
<body>
	<header id="header" class="header">
		<!-- 로딩바 -->
		<div class="loading">
			<div class="loading_bar">
				<div class="loading_img">
					<img src="./images/default/ico_loading.svg" alt="">
				</div>
			</div>
			<script type="text/javascript">
				var loding = setInterval(function() {
				}, 2100);
				window.onload = function() {
					clearInterval(loding);
					$(".loading").fadeOut(function() {
						$(".loading").remove();
					});
				}
			</script>
		</div>
		<input type="hidden" id="session_id" value="">
		<!-- 최상단 배너 -->
		<div class="top">
			<div class="wrap">
				<h1 class="logo">
					<a href="/main.do"> <picture> <!--[if IE 9]><video style="display: none;"><![endif]-->
						<source srcset="/images/default/wine_village.svg"
							media="(min-width:768px)">
						<!-- pc이미지 -->
						<source srcset="/images/default/wine_village.svg"
							media="(max-width:767px)">
						<!-- mb이미지 --> <!--[if IE 9]></video><![endif]--> <img
							src="/images/default/wine_village.svg" alt="WINEVILLAGE"
							draggable="false"><!-- pc이미지 --> </picture>
					</a>
				</h1>
				<div class="gnb">
					<ul>
						<li class=""><a
							href="/list_product.do?category=wine&state=value&sort=recent">WINE</a>
							<div class="pc_category_gnb">
								<div class="flex_box">
									<div class="box wine">
										<ul>
											<li class="ico_red"><a
												href="/list_product.do?category=red&state=value&sort=recent">레드</a></li>
											<li class="ico_white"><a
												href="/list_product.do?category=white&state=value&sort=recent">화이트</a></li>
											<li class="ico_rose"><a
												href="/list_product.do?category=rose&state=value&sort=recent">로제</a></li>
											<li class="ico_sparkling"><a
												href="/list_product.do?category=sparkling&state=value&sort=recent">스파클링</a></li>
											<li class="ico_spirits"><a
												href="/list_product.do?category=fortified&state=value&sort=recent">주정강화</a></li>
										</ul>
										<ul>
											<li class="ico_france"><a
												href="/list_product.do?category=fra&state=value&sort=recent">프랑스</a></li>
											<li class="ico_italia"><a
												href="/list_product.do?category=ita&state=value&sort=recent">이탈리아</a></li>
											<li class="ico_spain"><a
												href="/list_product.do?category=esp&state=value&sort=recent">스페인</a></li>
											<li class="ico_germ"><a
												href="/list_product.do?category=deu&state=value&sort=recent">독일</a></li>
											<li class="ico_usa"><a
												href="/list_product.do?category=usa&state=value&sort=recent">미국</a></li>
											<li class="ico_chile"><a
												href="'/list_product.do?category=chl&state=value&sort=recent">칠레</a></li>
											<li class="ico_argentina"><a
												href="/list_product.do?category=arg&state=value&sort=recent">아르헨티나</a></li>
											<li class="ico_aus"><a
												href="/list_product.do?category=aus&state=value&sort=recent">호주</a></li>
										</ul>
									</div>
								</div>
							</div></li>
						<li class=""><a
							href="/list_product.do?category=other&sort=recent">OTHER</a>
							<div class="pc_category_gnb">
								<div class="flex_box">
									<div class="box other">
										<ul>
											<li class="ico_acc"><a
												href="/list_product.do?category=acc&sort=recent">액세서리</a></li>
										</ul>
									</div>
								</div>
							</div></li>
						<li><a href="/list_store.do">SHOP</a></li>
					</ul>
				</div>
				<ul class="right_menu">
					<!-- 					<li class="cart"><a href="#" onclick="$('.layer.login_layer').show();"><span>Cart
								List</span> </a></li> -->
					<li class="cart"><a href="/cart_list.do"><span>Cart
								List</span> </a></li>
					<c:choose>
						<c:when test="${user_id != null && user_id != ''}">
							<li class="mb_hidden wish"><a href="#"
								onclick="location.href='/member/wish_list.do'"><img
									src="/images/default/pc_icon_wish.png" alt="Wish List"> </a></li>
						</c:when>
						<c:otherwise>
							<li class="mb_hidden wish"><a href="#"
							onclick="$('.layer.login_layer').show();"><img
								src="/images/default/pc_icon_wish.png" alt="Wish List"> </a></li>
						</c:otherwise>
					</c:choose>
					<li class="mypage mb_hidden">
						<button type="button" onclick="commonUI.header.Mypage.clickFn()" class="mypage">
							<img src="/images/default/pc_icon_mypage.png" alt="My Page">
						</button>
						<div class="mypage_layer">
							<c:choose>
								<c:when test="${user_id != null && user_id != ''}">
									<!-- 로그인 후 보여줄 내용 -->
									<div class="on_login">
										<ul>
											<li>
												<h3>${name }님</h3>

											</li>
											<li>
												<h3>포인트</h3>
												<p class="info">${point }P</p>
											</li>
											<li class="top_line">
												<h3>
													<a href="/member/order_list.do">마이페이지</a>
												</h3>
											</li>
										</ul>
										<button type="button" class="btn_txt btn_black logout_btn on" id="logoutButton">로그아웃</button>
									</div>
								</c:when>
								<c:otherwise>
									<!-- 로그인 전 보여줄 내용 -->
									<div class="no_login" style="width:70px;">
										<button style="display:block; font-size: 12px; color: #555; margin-left: 3px; margin:0 auto;" type="button" onclick="$('.layer.login_layer').show();" id="mylogin">로그인</button>
										<a style="margin:0 auto;" href="join_form.do">회원가입</a>
									</div>
								</c:otherwise>
							</c:choose>
						</div>
					</li>
					<li class="mb_hidden"><a href="/notice_list.do"><img
							src="/images/default/pc_icon_center.png" alt="Info Center"></a></li>
				</ul>

			</div>
		</div>

		<div class="bottom">
			<h1 class="fixed_logo" style="display: none;">
				<a href="main6f31.html"> <img
					src="/images/default/pc_fixed_logo.png" alt="WINENARA 1987"
					draggable="false">
				</a>
			</h1>
			<div class="wrap">
				<div class="pc_category_gnb">
					<div class="flex_box">
						<div class="box wine">
							<p class="tit">
								<strong>WINE</strong>
							</p>
							<ul>
								<li class="ico_red"><a
									href="product/product_lists9767.html?sh_category1_cd=10000&amp;sh_category2_cd=10100&amp;sh_category3_cd=10101">레드</a>
								</li>
								<li class="ico_white"><a
									href="product/product_lists1c99.html?sh_category1_cd=10000&amp;sh_category2_cd=10100&amp;sh_category3_cd=10102">화이트</a>
								</li>
								<li class="ico_rose"><a
									href="product/product_lists5123.html?sh_category1_cd=10000&amp;sh_category2_cd=10100&amp;sh_category3_cd=10108">로제</a>
								</li>
								<li class="ico_sparkling"><a
									href="product/product_listse091.html?sh_category1_cd=10000&amp;sh_category2_cd=10100&amp;sh_category3_cd=10103">스파클링</a>
								</li>
							</ul>
							<ul>
								<li class="ico_france"><a
									href="product/product_listsf3cc.html?sh_category1_cd=10000&amp;sh_category2_cd=10200&amp;sh_category3_cd=10201">프랑스</a>
								</li>
								<li class="ico_italia"><a
									href="product/product_listsf523.html?sh_category1_cd=10000&amp;sh_category2_cd=10200&amp;sh_category3_cd=10202">이탈리아</a>
								</li>
								<li class="ico_spain"><a
									href="product/product_lists0266.html?sh_category1_cd=10000&amp;sh_category2_cd=10200&amp;sh_category3_cd=10203">스페인</a>
								</li>
								<li class="ico_germ"><a
									href="product/product_lists50d2.html?sh_category1_cd=10000&amp;sh_category2_cd=10200&amp;sh_category3_cd=10204">독일</a>
								</li>
							</ul>
						</div>
						<div class="box other">
							<p class="tit">
								<strong>BEER & LIQUOR</strong>
							</p>
							<ul>
								<li class="ico_whiskey"><a
									href="product/product_listsf1c9.html?sh_category1_cd=20000&amp;sh_category2_cd=20100&amp;sh_category3_cd=20101">위스키</a>
								</li>
								<li class="ico_cognac"><a
									href="product/product_listse72d.html?sh_category1_cd=20000&amp;sh_category2_cd=20100&amp;sh_category3_cd=20102">꼬냑</a>
								</li>
								<li class="ico_tequila"><a
									href="product/product_listsb363.html?sh_category1_cd=20000&amp;sh_category2_cd=20100&amp;sh_category3_cd=20105">데킬라</a>
								</li>
								<li class="ico_jin"><a
									href="product/product_lists1cbb.html?sh_category1_cd=20000&amp;sh_category2_cd=20100&amp;sh_category3_cd=20103">진</a>
								</li>
								<li class="ico_rum"><a
									href="product/product_lists3273.html?sh_category1_cd=20000&amp;sh_category2_cd=20100&amp;sh_category3_cd=20106">럼</a>
								</li>
								<li class="ico_beer"><a
									href="product/product_lists9a59.html?sh_category1_cd=20000&amp;sh_category2_cd=20200&amp;sh_category3_cd=20201">맥주</a>
								</li>
							</ul>
							<p class="tit">
								<strong>TICKET</strong>
							</p>
							<ul>
								<li class="ico_ticket"><a
									href="product/product_lists9a3e.html?sh_category1_cd=50000">티켓</a></li>
							</ul>
							<p class="tit">
								<strong>OTHER</strong>
							</p>
							<ul>
								<li class="ico_acc"><a
									href="product/product_listse5ca.html?sh_category1_cd=40000&amp;sh_category2_cd=40100&amp;sh_category3_cd=40101">액세서리</a>
								</li>
							</ul>
						</div>
						<div class="box">
							<p class="tit">
								<a href="product/best_product_lists2532.html?group_cd=20240206"><strong>En
										Primeur</strong></a>
							</p>
							<p class="tit">
								<strong>PROMOTION</strong>
							</p>
							<ul>
								<li><a href="event/event_lists.html">이달의 프로모션</a></li>
								<li><a href="event/event_end.html">완료된 프로모션</a></li>
								<li><a href="cs/special.html">특판문의</a></li>
							</ul>
							<p class="tit">
								<a href="company/store.html"><strong>SHOP</strong></a>
							</p>
							<p class="tit">
								<strong>BLOG</strong>
							</p>
							<ul>
								<li><a href="community/brandstory_lists.html">OUR
										BRANDS</a></li>
								<li><a href="community/magazine_con_lists.html">OUR
										STORIES</a></li>
							</ul>
						</div>
						<div class="box">
							<p class="tit">
								<strong>VIDEO</strong>
							</p>
							<ul>
								<li><a href="community/video_lists.html">BRANDS FILM</a></li>
								<li><a href="community/film_lists.html">WINENARA FILM</a></li>
							</ul>
							<p class="tit">
								<strong>ABOUT US</strong>
							</p>
							<ul>
								<li><a href="company/about_us.html">WINENARA</a></li>
								<li><a href="company/brand.html">BRANDS</a></li>
								<li><a href="company/store.html">SHOP</a></li>
								<li><a href="company/fnb.html">F&B</a></li>
								<li><a href="community/press_lists.html">PRESS</a></li>
								<li><a href="company/member_benefit.html">MEMBERSHIP</a></li>
							</ul>
						</div>
						<div class="box">
							<p class="tit">
								<strong>고객센터</strong>
							</p>
							<ul>
								<li><a href="cs/notice_lists.html">공지사항</a></li>
								<li><a href="cs/faq_lists.html">자주하는 질문</a></li>
								<li><a href="cs/qna_write.html">1:1문의</a></li>
								<li><a href="cs/nomem_cert.html">비회원 주문조회</a></li>
							</ul>
							<div class="info">
								<a href="tel:0807320101">080-732-0101</a>
								<p>
									<em>[운영시간]</em> 10:00~17:00<br> (점심시간 12:00~13:00)<br>
									<em>[휴무]</em> 주말 및 공휴일
								</p>
							</div>
						</div>
					</div>
				</div>
			</div>
			<button type="button" onclick="commonUI.header.Search.clickFn()"
				class="fixed_search_btn">PC Search</button>
			<a href="mypageping/mypage.html" class="fixed_mypage"><img
				src="/images/default/pc_icon_mypage.png" alt="My Page"></a> <a
				href="cart/cart_lists.html" class="fixed_cart"> </a>
		</div>
		<div class="mb_lnb pc_hidden">
			<ul>
				<li class="btn_order"><button type="button"
						onclick="commonUI.layer.open('login_layer.html')">
						<span>ORDER LIST</span>
					</button></li>

				<li class="btn_search"><button type="button"
						onclick="commonUI.layer.open('category_layer.html')">
						<span>SEARCH</span>
					</button></li>
				<li class="btn_home"><button type="button"
						onclick="location.href='main.html'">
						<span>mobile Home</span>
					</button></li>
				<li class="btn_wish"><button type="button"
						onClick="commonUI.layer.open('login_layer.html');">
						<span>WISH LIST</span>
					</button></li>
				<li class="btn_mypage"><button type="button"
						onClick="commonUI.layer.open('login_layer.html');">
						<span>MY PAGE</span>
					</button></li>
			</ul>
		</div>

		<form action="https://www.winenara.com/order/barcode_view"
			id="BarcodeForm" name="BarcodeForm" method="post"
			accept-charset="utf-8">
			<input type="hidden" name="witplus_csrf_token"
				value="6d4b67b6bb470edeee07d5a9e38ef1d6" /> <input type="hidden"
				name="barcode" value="">
		</form>

		<form action="https://www.winenara.com/product/search_product_lists"
			id="searchForm" name="searchForm" method="get" accept-charset="utf-8">
			<div class="search_layer">
				<div class="search_box">
					<button type="button" class="btn_close"
						onclick="commonUI.header.Search.clickFn()">Search</button>
					<input type="text" name="keyword" id="keyword"
						placeholder='오늘 마시고 싶은 와인을 검색해 보세요.' autocomplete="off"
						class="srch_close_event" value="">
					<button type="submit" id="s_btn">검색</button>
				</div>

				<div class="search_result srch_close_event" id="search_block">
					<div class="result_inner">
						<div class="allDelete off">
							<h2 class="tit">최근검색어</h2>
							<button type="button" class="btn del_btn"
								onclick="all_del_item();">
								전체삭제</span>
						</div>
						<ul id="result_list" class="result_list">
							<li id="nodata">최근검색어 내역이 없습니다.</li>
						</ul>
					</div>
				</div>

			</div>
		</form>
	</header>
	<form id="LoginPostFrm" method="post"
		accept-charset="utf-8">
		<div class="layer login_layer" id="login_layer">
			<div class="display_table">
				<div class="table_cell">
					<div class="layer_area">
						<h2 class="layer_tit">회원서비스</h2>
						<button type="button" class="layer_close"
							onclick="commonUI.layer.close()">닫기</button>
						<div class="layer_con">
							<div class="login_tab">
								<p class="check">
									<span>기존회원</span>
								</p>
								<p>
									<span><a href="join_form.do">신규회원가입</a></span>
								</p>
							</div>
							<div class="form_area">
								<ul>
									<li>
										<div class="form_box">
											<input type="text" id="loginMemberId" name="loginMemberId"
												placeholder="아이디를 입력하세요">
										</div>
									</li>
									<li>
										<div class="form_box">
											<input type="password" id="loginPassword"
												name="loginPassword" placeholder="비밀번호를 입력하세요">
										</div>
									</li>
								</ul>
							</div>
							<input type="hidden" id="login_return_url_param"
								name="login_return_url_param">
							<div class="btn_area">
								<button type="button" class="btn_txt btn_black" id="loginBtn" onClick="checkLoginStatus();">
									<span>로그인</span>
								</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>

</body>
</html>