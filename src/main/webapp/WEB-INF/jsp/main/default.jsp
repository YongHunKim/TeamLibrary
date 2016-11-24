<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--     
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

</head>
<body>
		<div id="banner">
				<div id="slider-wrapper" style="height:960px;">
					<div id="slider" class="nivoSlider">
						 <img src="/images/library1.jpg">
						<img src="/images/library2.jpg"> 
						<img src="/images/library3.jpg">
						<img src="/images/library4.jpg"> 
						
					</div>
				</div>
			</div>
</body>
</html> --%>
<!DOCTYPE html>
<html>
<title>W3.CSS</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<style>
.mySlides {display:none;}
</style>
<body>


<div class="w3-content w3-section" style="max-width:960px; max-height:650px;">
  <img class="mySlides" src="/images/library1.jpg" style="width:960px; height:640px;">
  <img class="mySlides" src="/images/library2.jpg" style="width:960px; height:640px;">
  <img class="mySlides" src="/images/library3.jpg" style="width:960px; height:640px;">
  <img class="mySlides" src="/images/library4.jpg" style="width:960px; height:640px;">
  <img class="mySlides" src="/images/library5.jpg" style="width:960px; height:640px;">
</div>

<script>
var myIndex = 0;
carousel();

function carousel() {
    var i;
    var x = document.getElementsByClassName("mySlides");
    for (i = 0; i < x.length; i++) {
       x[i].style.display = "none";
    }
    myIndex++;
    if (myIndex > x.length) {myIndex = 1}
    x[myIndex-1].style.display = "block";
    setTimeout(carousel, 3000); // Change image every 2 seconds
}
</script>

</body>
</html>


