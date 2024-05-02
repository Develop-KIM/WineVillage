<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WINE VILLAGE | WINE</title>
</head>
<body>
	<%@ include file="../common/common.jsp"%>
	<div class="wrap" style="padding-top: 80px">
		<c:set var="wineStyles"
			value="${{'레드':'#E0D8EA','화이트':'#F6EC9C','로제':'#EEC1CC','스파클링':'#E0EBF8','주정강화':'#E1D5CA','디저트':'#D7F9E2'}}" />
		<div class="content product product_view_page product_lists_page">
			<div class="line_map mb_hidden">
				<ul>
					<li onclick="location.href='/main.do'" style="cursor: pointer;">HOME</li>
					<li onclick="location.href='/list_product.do'"
						style="cursor: pointer;">ALL WINES</li>
					<li onclick="location.href='product_view.html'"
						style="cursor: pointer;">PRODUCT</li>
				</ul>
			</div>
			<div class="product_view_wrap">
				<div class="main_prd_detail">
					<div class="main_img_area"
						style="background: ${wineStyles[productDTO.wine]};">
						<div
							class="main_img js_main_img easyzoom easyzoom--overlay easyzoom--with-toggle">
							<img data-src="/uploads/product/550/${productDTO.productImg }"
								alt="" class="lozad"
								src="/uploads/product/550/${productDTO.productImg }"
								data-loaded="true">
							<!-- 일반 이미지 경로가 들어가야합니다. -->

							<!-- 아래에도 확대이미지 경로를 넣어주셔야합니다. -->
							<div class="easyzoom-flyout zoom_btn_active lozad"
								style="display: none">
								<img data-src="/uploads/product/550/${productDTO.productImg }"
									style="position: absolute; top: 0px; left: 0px;">
							</div>
						</div>
						<div class="label_wrap"></div>
					</div>

					<div class="thumbnail">
						<ul>
							<li class="on">
								<button type="button" class="thumnail_btn_js">
									<picture> <!--[if IE 9]><video style="display: none;"><![endif]-->
									<source srcset="/uploads/product/550/${productDTO.productImg }"
										media="(min-width:768px)">
									<!-- pc이미지 -->
									<source srcset="/uploads/product/550/${productDTO.productImg }"
										media="(max-width:767px)">
									<!-- mb이미지 --> <!--[if IE 9]></video><![endif]--> <img
										src="/uploads/product/550/${productDTO.productImg }" alt=""><!-- pc이미지 -->
									</picture>
								</button>
							</li>

						</ul>
					</div>

				</div>

				<div class="info_area">
					<div class="more_info">
						<div class="over_wrap tit_wrap">
							<p class="prd_name">${productDTO.productName }</p>
							<p class="prd_en_name">${productDTO.productName_En }</p>
							<p class="prd_info"></p>
							<div class="share_area">
								<button type="button" class="open">공유</button>
								<div class="share_layer">
									<button type="button" class="facebook"
										onclick="share_sns('F');">페이스북으로 공유하기</button>
									<button type="button" class="kakao" onclick="share_sns('K');">카카오로
										공유하기</button>
									<button type="button" class="url" onclick="share_sns('U');">URL로
										공유하기</button>
									<button type="button" class="close">공유하기 레이어 닫기</button>
								</div>
								<script>
									$('.share_area .open').on('click',
											function() {
												$(this).addClass('on');
											})
									$('.share_area .close').on(
											'click',
											function() {
												$('.share_area .open')
														.removeClass('on');
											})
								</script>
							</div>
						</div>

						<ul class="cate_label">
							<li class="label"
								style="background: ${wineStyles[productDTO.wine]};">${productDTO.wine }</li>

							<li class="label"
								style="background: ${wineStyles[productDTO.wine]};">${productDTO.country }</li>

							<li class="label"
								style="background: ${wineStyles[productDTO.wine]};">${productDTO.grapeVariety }</li>
						</ul>

						<div class="price_box">
							<p class="price info_box">
								<c:if test="${productDTO.discountRate > 0 }">
									<span>${productDTO.discountRate }%</span>
									<ins>
										<fmt:formatNumber
											value="${(productDTO.fullPrice - (productDTO.fullPrice * productDTO.discountRate / 100))}"
											type="number" />
										원
									</ins>
									<del>${productDTO.fullPrice }원</del>
								</c:if>
								<c:if test="${productDTO.discountRate == 0}">
									<ins class="out">매장문의</ins>
									<del class="out out_price"
										style="text-decoration: none; font-weight: 700">${productDTO.fullPrice }원</del>
								</c:if>
							</p>
						</div>

						<!-- 픽업제외매장 -->
						<!-- //픽업제외매장 -->

						<div class="buy_process">
							<div class="black_bg">&nbsp;</div>
							<div class="hide_process"></div>
							<div class="btn_area">
								<button type="button" class="btn_txt wish_btn">찜하기</button>
								<!--피씨-->

								<button type="button"
									onclick="RC_Method({page_type:'product_page', behavior: 'user_action', action: 'shopping_basket'}); chklayer();"
									class="btn_txt cart_btn buy_process_btn">장바구니</button>
								<button type="button"
									onclick="RC_Method({page_type:'product_page', behavior: 'user_action', action: 'buying'}); chklayer();"
									class="btn_txt buy_btn btn_black buy_process_btn">바로구매</button>
								<!--피씨-->


							</div>
						</div>
						<dl class="details">
					    <c:if test="${not empty productDTO.sweetNess}">
							<dt>당도</dt>
							<dd>
								<span class="label">드라이</span> 
								<span class="label">미디움드라이</span>
								<span class="label">미디엄</span> 
								<span class="label">미디움스윗</span>
								<span class="label">스윗</span>
							</dd>
						</c:if>
						<c:if test="${not empty productDTO.body }">
							<dt>바디</dt>
							<dd>
								<span class="label">가벼움</span> 
								<span class="label">약간가벼움</span>
								<span class="label">중간</span> 
								<span class="label">약간 무거움</span>
								<span class="label">무거움</span>
							</dd>
						</c:if>
						<c:if test="${not empty productDTO.acidity }">
							<dt>산도</dt>
							<dd>
								<span class="label">낮음</span> 
								<span class="label">약간낮음</span> 
								<span class="label">중간</span> 
								<span class="label">약간높음</span>
								<span class="label">높음</span>
							</dd>
						</c:if>
						<c:if test="${not empty productDTO.tannins }">
							<dt>타닌</dt>
							<dd>
								<span class="label">약함</span>
								<span class="label">약한약함</span>
								<span class="label">중간</span>
								<span class="label">약간강함</span>
								<span class="label">강함</span>
							</dd>
						</c:if>
						<c:if test="${not empty productDTO.alcohol }">
							<dt>알코올</dt>
							<dd>
								<span class="label">낮음(~11%)</span>
								<span class="label">중간(12~13%)</span>
								<span class="label">높음(14%+)</span>
							</dd>
						</c:if>
						</dl>
					</div>

					<!-- 문의 매장정보 레이어 -->
					<div class="layer store_layer" id="store_layer">
						<div class="display_table">
							<div class="table_cell">
								<div class="layer_area">
									<button type="button" class="layer_close"
										onclick="commonUI.layer.close()">닫기</button>
									<div class="layer_con">
										<p class="tit">문의 매장정보</p>
										<table class="tbl_list">
											<colgroup>
												<col class="col_w01">
												<col>
											</colgroup>
											<thead>
												<tr>
													<th>매장</th>
													<th>매장 연락처</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td>송도점</td>
													<td><a href="tel:0328330833">032-833-0833</a></td>
												</tr>
												<tr>
													<td>신용산점</td>
													<td><a href="tel:0263283835">02-6328-3835</a></td>
												</tr>
												<tr>
													<td>압구정점</td>
													<td><a href="tel:025414363">02-541-4363</a></td>
												</tr>
												<tr>
													<td>경희궁점</td>
													<td><a href="tel:027754663">02-775-4663</a></td>
												</tr>
												<tr>
													<td>코엑스점</td>
													<td><a href="tel:025589880">02-558-9880</a></td>
												</tr>
												<tr>
													<td>서래마을점</td>
													<td><a href="tel:025929035">02-592-9035</a></td>
												</tr>
												<tr>
													<td>일산점</td>
													<td><a href="tel:0319111556">031-911-1556</a></td>
												</tr>
												<tr>
													<td>홍대점</td>
													<td><a href="tel:023260116">02-326-0116</a></td>
												</tr>
												<tr>
													<td>시청점</td>
													<td><a href="tel:027773999">02-777-3999</a></td>
												</tr>
												<tr>
													<td>성수점</td>
													<td><a href="tel:0269493869">02-6949-3869</a></td>
												</tr>
												<tr>
													<td>MOWa</td>
													<td><a href="tel:027535008">027535008</a></td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- //문의 매장정보 레이어 -->

				</div>



				<div class="tab_area">
					<div class="tab_btn">
						<ul class="tab_btn_area">
							<li>
								<button type="button" class="on">
									<span>PRODUCT</span>
								</button>
							</li>

							<li>
								<button type="button"
									onclick="RC_Method({page_type:'product_page', behavior: 'user_action', action: 'winery_info'})">
									<span>RELATED PRODUCT</span>
								</button>
							</li>

							<li>
								<button type="button"
									onclick="RC_Method({page_type:'product_page', behavior: 'user_action', action: 'winery_info'})">
									<span>REVIEW (0)</span>
								</button>
							</li>
						</ul>
					</div>

					<div class="tab_con detail_con on">
						<!-- <p> </p> -->
						<%@ include file="product_txt.jsp"%>
					</div>

					<div class="tab_con prd_con">
						<ul class="n_prd_list" id="SimilarWine">

							<li class="nodata">등록된 정보가 없습니다.</li>
						</ul>

						<div class="btn_area" id="more_button_wine" style="display: none;">
							<button type="button" onclick="getList('add')" class="btn_txt">
								<span>더보기</span>
							</button>
						</div>
					</div>

					<!--<div class="tab_con detail_con">
                            <p> </p>                </div>-->

					<div class="tab_con food_con">
						<div class="js_tab">
							<ul class="js_tabBtn">
							</ul>
						</div>
					</div>

					<div class="tab_con review_con">
						<div class="ratings_tit">
							<p>
								0.0 <em>(0 ratings)</em>
							</p>
						</div>

						<ul class="tasting_review_lists">
							<li class="nodata">작성한 시음노트가 없습니다.</li>
						</ul>

						<div class="btn_area">
							<button type="button" class="btn_txt"
								onclick="getTastingReview('more')">
								<span>더보기</span>
							</button>
							<input type="hidden" id="tasting_page" value="1">
						</div>

					</div>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="../common/footer.jsp"%>
</body>
</html>