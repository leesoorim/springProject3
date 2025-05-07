<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>업로드 게시판 등록 화면</title>
	<link rel="stylesheet" href="../css/style.css" />
	<link rel="stylesheet" href="../css/jquery-ui.css">
  	<script src="../js/jquery-3.7.1.js"></script>
  	<script src="../js/jquery-ui.js"></script>
</head>

	<script>
	
	function fn_delete(seqid,delname){
		
		let dtoFile = "${dto.filename}";
		let filename = dtoFile.replace(delname+"／","");
		
		
		$.ajax({
			type : "post",
			url  : "/dataBoardFileDelete",
			data : "seqid="+seqid+"&delname="+delname+"&filename="+filename,
			dataType : "text",
			success  : function(data){
				if(data == "ok") {
					alert("삭제완료");
					window.location.reload(); // 새로고침 함수
				} else {
					alert("삭제실패");
				}
			},
			error    : function(){
				alert("오류발생!!");
			}
		});
	}
	
	$(function(){

		$("#btn_list").click(function(){
			location = "/dataList";
		});
		
		$("#btn_submit").click(function() {
			
			let title = $("#title").val();
			title = $.trim(title);
			$("#title").val(title);

			let pass  = $("#pass").val();
			pass = $.trim(pass);
			$("#pass").val(pass);
			
			if( title == "" ) {
				alert("제목을 입력해주세요.");
				$("#title").focus();
				return false;
			}
			if( pass == "" ) {
				alert("암호를 입력해주세요.");
				$("#pass").focus();
				return false;
			}
			
			//let form = $("#frm").serialize();
			// 파일 전송을 위한 폼설정 - 일반 데이터도 전송됨 위에 명령어는 일반 데이터만
			let form = new FormData(document.getElementById('frm'));
			$.ajax({
				type : "post",
				url  : "/dataBoardUpdate",
				data : form,
				
				processData: false,	// 전송데이터의 인식을 위한 세팅
				contentType: false, // 전송데이터의 인식을 위한 세팅

				dataType : "text",
				success  : function(data){
					if(data == "ok") {
						alert("수정완료");
						location = "/dataList";
					} else {
						alert("수정실패");
					}
				},
				error    : function(){
					alert("오류발생!!");
				}
			});

		});
	});
	</script>

<body>
 <div class="div_title">
    업로드 게시판 등록 화면
 </div>
 
<form id="frm" enctype="multipart/form-data">
	<input type="hidden" name = "seqid" value="${dto.seqid }">
	<input type="hidden" name = "filename" value="${dto.filename }">

<table class="table1">
	<colgroup>
		<col width="20%" />
		<col width="*" />
	</colgroup>
	<tr>
		<th><label for="title">제목</label></th>
		<td><input type="text" id="title" name="title" class="input1" value="${dto.title }" placeholder="제목입력" autofocus></td>
	</tr>
	<tr>
		<th><label for="pass">암호</label></th>
		<td><input type="password" id="pass" name="pass" class="input1" placeholder="암호입력"></td>
	</tr>
	<tr>
		<th><label for="writer">글쓴이</label></th>
		<td><input type="text" id="writer" name="writer" value="${dto.writer }" class="input1"></td>
	</tr>
	<tr>
		<th><label for="content">내용</label></th>
		<td><textarea id="content" name="content" class="textarea1">${dto.content }</textarea></td>
	</tr>
	<tr>
		<th><label for="file">파일</label></th>
		<td style="text-align:left">
		
		<!-- 1745981835480-1.txt／1745981835480-2.txt／ -->
		<c:set var="filesnames" value="${fn:trim(dto.filename) }"/>
		<c:set var="files" value="${fn:split(filesnames,'／') }"/>
		
		<c:forEach var="cnt" begin="0" end="2">
		&nbsp;
		<c:if test="${filesnames != '' }">
			<c:if test="${files[cnt] != null }">
			<a href="/data/${files[cnt] }">
				<img src="/images/icon/download.png" width="20" height="20">	
			</a>
				<a href="#" onClick="fn_delete('${dto.seqid}','${files[cnt]}')">삭제</a>
			</c:if>
			<c:if test="${files[cnt ]==null}">
				<img src="/images/icon/download.png" width="20" height="20">
				없음
			</c:if>
		</c:if>
		
		<input type="file" id="myfile${cnt }" name="myfile${cnt }"> <br>
		</c:forEach>
		</td>
		
	</tr>
	
</table>

 <div class="div_button_area">
    <button type="submit" id="btn_submit" onClick="return false;">저장</button>
    <button type="reset">취소</button>
    <button type="button" id="btn_list">목록</button>
 </div>
 
</form>

</body>
</html>