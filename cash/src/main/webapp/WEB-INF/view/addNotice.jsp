<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>addNotice</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/cash.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	$(document).ready(function() {
		$('#addBtn').click(function() {
			let html = '<div><input type="file" name="noticeFileList" class="noticeFileList form-control my-2" style="padding-bottom: 2.25rem"></div>';
			$('#fileinput').append(html);
		});
		
		$('#delBtn').click(function() {
			$('#fileinput').children().last().remove();
		});

		$('#submitBtn').click(function() {
			let ck = true;
			$('.noticeFileList').each(function(index, item) {
				if ($(item).val() == '') {
					ck = false;
					return;
				}
			});
			if (ck == false) {
				alert('선택되지 않은 파일이 있습니다');
			} else {
				oEditors.getById["noticeContent"].exec("UPDATE_CONTENTS_FIELD", []);	// 에디터의 내용이 textarea에 적용됩니다.
				
				$('#createForm').submit();
			}
		});
	});
</script>
</head>
<body>
	<jsp:include page="/WEB-INF/view/inc/menu.jsp"></jsp:include>
	<div class="container-xl">
		<h2 class="text-center mb-5">ADD NOTICE</h2>
		
		<form id="createForm" method="post" action="${pageContext.request.contextPath}/admin/addNotice" enctype="multipart/form-data">
			<table class="table table-sm table-borderless px-5 text-center">
				<tr class="border-top border-bottom">
					<td class="font-weight-bold">TITLE</td>
					<td class="w-75">
						<input type="text" name="noticeTitle" class="form-control">
					</td>
				</tr>
				<tr class="border-bottom">
					<td class="font-weight-bold">CONTENT</td>
					<td>
						<textarea id="noticeContent" name="noticeContent" style="width: 100%"></textarea>
					</td>
				</tr>
				<tr class="border-bottom">
					<td class="font-weight-bold">FILES</td>
					<td>
						<div class="row">
							<div class="col">
								<button type="button" id="addBtn" class="btn btn-primary btn-block">APPEND FILE TO TAIL</button>
							</div>
							<div class="col">
								<button type="button" id="delBtn" class="btn btn-danger btn-block">DELETE LAST FILE</button>
							</div>
						</div>
						<div id="fileinput"></div>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<button id="submitBtn" type="button" class="btn btn-success btn-block">ADD NOTICE</button>
					</td>
				</tr>
			</table>
		</form>
	</div>
	
	<script type="text/javascript" src="${pageContext.request.contextPath}/se2/js/service/HuskyEZCreator.js" charset="utf-8"></script>
	<script type="text/javascript">
		var oEditors = [];
		var sLang = "ko_KR";	// 언어 (ko_KR/ en_US/ ja_JP/ zh_CN/ zh_TW), default = ko_KR
		
		// 추가 글꼴 목록
		//var aAdditionalFontSet = [["MS UI Gothic", "MS UI Gothic"], ["Comic Sans MS", "Comic Sans MS"],["TEST","TEST"]];
		
		nhn.husky.EZCreator.createInIFrame({
			oAppRef: oEditors,
			elPlaceHolder: "noticeContent",
			sSkinURI: "${pageContext.request.contextPath}/se2/SmartEditor2Skin.html",	
			htParams : {
				bUseToolbar : true,				// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
				bUseVerticalResizer : true,		// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
				bUseModeChanger : true,			// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
				//bSkipXssFilter : true,		// client-side xss filter 무시 여부 (true:사용하지 않음 / 그외:사용)
				//aAdditionalFontList : aAdditionalFontSet,		// 추가 글꼴 목록
				fOnBeforeUnload : function(){
					//alert("완료!");
				},
				I18N_LOCALE : sLang
			}, //boolean
			fOnAppLoad : function(){
				//예제 코드
				//oEditors.getById["ir1"].exec("PASTE_HTML", ["로딩이 완료된 후에 본문에 삽입되는 text입니다."]);
			},
			fCreator: "createSEditor2"
		});
		
		function pasteHTML() {
			var sHTML = "<span style='color:#FF0000;'>이미지도 같은 방식으로 삽입합니다.<\/span>";
			oEditors.getById["noticeContent"].exec("PASTE_HTML", [sHTML]);
		}
		
		function showHTML() {
			var sHTML = oEditors.getById["noticeContent"].getIR();
			alert(sHTML);
		}
		
		function setDefaultFont() {
			var sDefaultFont = '돋움';
			var nFontSize = 9;
			oEditors.getById["noticeContent"].setDefaultFont(sDefaultFont, nFontSize);
		}
	</script>
</body>
</html>