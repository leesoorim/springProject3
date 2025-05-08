<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>게시판 등록화면1212</title>
</head>

<script>
 function fn_board_submit() {
	 let f = document.frm;
	 if( f.title.value == "" ) {
		alert("제목을 입력해주세요.");
		f.title.focus();
		return false;
	 }
	 f.submit();
 }
</script>

<body>
 <div class="div_title">
    게시판 등록화면
 </div>
 
<form name="frm" method="post" action="insert">

 <div class="div_top_button">
    <button type="submit" onClick="fn_board_submit(); return false;">저장</button>
    <button type="reset">취소</button>
    <button type="button" onClick="location='boardList.jsp'">목록</button>
 </div>

<table border="1" width="600">
	<colgroup>
		<col width="20%" />
		<col width="*" />
	</colgroup>
	<tr>
		<th><label for="title">제목12  </label></th>
		<td><input type="text" id="title" name="title" class="input1" placeholder="제목입력" autofocus></td>
	</tr>
	<tr>
		<th><label for="pass">암호12</label></th>
		<td><input type="password" id="pass" name="pass" class="input1" placeholder="암호입력"></td>
	</tr>

	<tr>
		<th><label for="writer">글쓴이12</label></th>
		<td><input type="text" id="writer" name="writer" class="input1"></td>
	</tr>
	<tr>
		<th><label for="content">내용12</label></th>
		<td><textarea id="content" name="content" class="textarea1"></textarea></td>
	</tr>
</table>
</form>

</body>
</html>