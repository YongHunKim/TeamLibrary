<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>좌석 예약</title>
<script type="text/javascript">
	function cntCheck(){
		var select = eval("document.selectform");
		
		var cntCheck = 0;
		for(var i=0; iselect.seat.length;i++){
			if(select.seat[i].checked == true){
				cntCheck++;
			}
			
			if(cntCheck < "${count}"){
				alert("선택하신 인원 수만큼 선택하세요.");
				for(var i=0;i<select.seat.length;i++){
					select.seat[i].checked = false;
				}
				return false;
			}else{
				setSeat();
			}
		}
	}
	
	function setSeat(){
		var select = eval("document.selectform");
		var checked = document.getElementsByName("seat");
		var chkList = "";
		
		for(var i=0;i<select.seat.length;i++){
			if(checked[i].checked == true){
				chkList += checked[i].value + " ";
			}	
		}
		alert(chkList);
		opener.document.reserveform.screen.value = "관";
		opener.document.reserveform.seatnum.value = chkList;
		self.close();
	}
</script>
</head>
<body>
	<c:forEach begin="1" end="10" step="1" var="i">
		<c:forEach begin="1" end="10" step="1" var="j">
			<input type="checkbox" name="seat" value="${i}${j}">
			${i}${j}
		</c:forEach>
		<br/>
	</c:forEach>
</body>
</html>