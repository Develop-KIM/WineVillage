<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!doctype html>
<html lang="ko">
<head>
<body>
<%@ include file="../admin_common/admin_header.jsp"%>
	
<div id="wrapper">

		<div id="snb">
			<div class="snb_header ico_config">
				<h2><i class="fa fa-comments-o"></i>고객지원</h2>
			</div>
			<dl>
				<dt class="h10 menu_toggle">고객지원</dt>
				<dd class="h10">
					<a href="admin_customer_qna.do">1:1 상담문의
						<em>0</em>
					</a>
				</dd>
				<dd class="h10">
					<a href="admin_customer_chat.do">1:1 채팅문의</a>
				</dd>
				<dd class="h10">
					<a href="admin_customer_withdrawal.do">회원 탈퇴내역</a>
				</dd>
				<dt class="h20 menu_toggle">FAQ 작성</dt>
				<dd class="h20">
					<a href="admin_customer_faq_lists.do">FAQ 관리</a>
				</dd>
				<dd class="h20">
					<a href="admin_customer_faq_category.do">FAQ 분류</a>
				</dd>
				<dd class="h20 active">
					<a href="admin_customer_faq_write.do">FAQ 작성</a>
				</dd>
				<dt class="h20 menu_toggle">공지사항</dt>
				<dd class="h20">
					<a href="admin_customer_notice_lists.do">공지사항 관리</a>
				</dd>
				<dd class="h20">
					<a href="admin_customer_notice_write.do">공지사항 작성</a>
				</dd>
			</dl>
		</div>
		<div id="content">
<div class="breadcrumb">
	<span>HOME</span> <i class="ionicons ion-ios-arrow-right"></i> 고객지원 <i class="ionicons ion-ios-arrow-right"></i> FAQ 작성		</div>

	<div class="s_wrap">
		<h1>FAQ 작성</h1>
		<!-- <form name="faqform" method="post" onsubmit="return faqform_submit(this);"> -->
		<form name="faqform" method="post" action="admin_customer_faq_write.do">
			<input type="hidden" name="w" value="">
			<input type="hidden" name="sca" value="">
			<input type="hidden" name="sfl" value="">
			<input type="hidden" name="stx" value="">
			<input type="hidden" name="page" value="">
			<input type="hidden" name="index_no" value="">
			<div class="tbl_frm02">
				<table>
				<colgroup>
				<col class="w140">
				<col>
				</colgroup>
				<tbody>
				<tr>
					<th scope="row">분류</th>
					<td>
						<select id="faq_classified_select" name="faq_classified">
							<c:forEach var="category" items="${category}">
								<option value="${category}">${category}</option>
							</c:forEach>
							<option value="">그 외</option>
						</select>
						<input type="text" id="faq_classified_other" name="faq_classified" value="" class="frm_input required" size="20" style="background-position: right top; background-repeat: no-repeat; display: none;">
						<!-- <select name="faq_classified">
							<option value="배송문의">배송문의</option>
							<option value="취소/교환/반품">취소/교환/반품</option>
							<option value="환불관련">환불관련</option>
							<option value="주문/결제">주문/결제</option>
							<option value="쿠폰/포인트">쿠폰/포인트</option>
							<option value="회원관련">회원관련</option>
							<option value="기타">기타</option>
						</select> -->
						<%-- <select id="faq_classified" name="faq_classified">
							<c:forEach items="${ category }" var="item" varStatus="loop">
								<option value="${ item }">${ item }</option>
							</c:forEach>
							<option value="">그 외</option>
						</select>
						<input type="text" id="faq_classified_other" name="faq_classified" value="" class="frm_input required" size="20" style="background-position: right top; background-repeat: no-repeat; display:none;"> --%>
					</td>
				</tr>
				<tr>
					<th scope="row">제목</th>
					<td>
						<input type="text" name="faq_title" value="" required="" itemname="제목" class="frm_input required"
						size="60" style="background-position: right top; background-repeat: no-repeat;">
					</td>
				</tr>
				<tr>
					<th scope="row">내용</th>
					<td>
						<span class="sound_only">웹에디터 시작</span>
						<script src="http://demofran.com/plugin/editor/smarteditor2/js/HuskyEZCreator.js"></script>
						<script>var tw_editor_url = "http://demofran.com/plugin/editor/smarteditor2", oEditors = [];</script>
						<script src="http://demofran.com/plugin/editor/smarteditor2/config.js"></script>
						<textarea id="memo" name="faq_content" class="smarteditor2" maxlength="65536" style="width:100%"></textarea>
						<span class="sound_only">웹 에디터 끝</span>		
					</td>
					<!-- <td>
						<textarea name="faq_content" class="frm_textbox wfull" rows="5"></textarea>
					</td> -->
				</tr>
				</tbody>
				</table>
			</div>
			<div class="btn_confirm">
				<input type="submit" value="저장" class="btn_large" accesskey="s">
				<a href="admin_customer_notice_lists.do" class="btn_large bx-white">목록</a>
			</div>
		</form>
		<script>
		$(document).ready(function() {
		    if ($("#faq_classified_select option").length <= 1) {
		        $('#faq_classified_other').show();
		    }
			$('#faq_classified_select').change(function(){
				if($(this).val() == '') {
					$('#faq_classified_other').show();
				} else {
					$('#faq_classified_other').hide();
				}
			});
			$("form").submit(function() {
				if($("#faq_classified_select").val() == ''){
		            $("#faq_classified_select").attr("disabled", "disabled");
		        } else {
		            $("#faq_classified_other").attr("disabled", "disabled");
		        }
		    });
		});
		</script>
		<!-- <script>
		$(document).ready(function() {
		    $('#faq_classified').change(function() {
		        if ($(this).val() === '') {
		            $('#faq_classified').attr('name', 'faq_classified_other');
		            $('#faq_classified_other').attr('name', 'faq_classified').show();
		        } else {
		            $('#faq_classified').attr('name', 'faq_classified');
		            $('#faq_classified_other').attr('name', 'faq_classified_other').hide();
		        }
		    });
		    if ($('#faq_classified').val() === '') {
		        $('#faq_classified').attr('name', 'faq_classified_other');
		        $('#faq_classified_other').attr('name', 'faq_classified').show();
		    } else {
		        $('#faq_classified').attr('name', 'faq_classified');
		        $('#faq_classified_other').attr('name', 'faq_classified_other').hide();
		    }
		});
		</script> -->
		<!-- <script>
			function faqform_submit(f) {
				var memo_editor_data = oEditors.getById['memo'].getIR();
			oEditors.getById['memo'].exec('UPDATE_CONTENTS_FIELD', []);
			if(jQuery.inArray(document.getElementById('memo').value.toLowerCase().replace(/^\s*|\s*$/g, ''), ['&nbsp;','<p>&nbsp;</p>','<p><br></p>','<div><br></div>','<p></p>','<br>','']) != -1){document.getElementById('memo').value='';}
				f.action = "./help/help_faq_form_update.php";
					return true;
			}
		</script> -->
	</div>

</div>
</div>
<%@ include file="../admin_common/admin_footer.jsp"%>
</body>
</html>

