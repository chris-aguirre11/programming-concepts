<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

	<style>
      body {
        margin: 0px;
        padding: 0px;
      }
    </style>
    
</head>
<body>
	<form action="PaintFill" method="POST">
	
	Enter nRows	(between 1 and 3):
  	<input type="number" name="nRows" min="1" max="3"> <br><br>
  	
  	Enter nColumns (between 1 and 3):
  	<input type="number" name="nColumns" min="1" max="3"> <br><br>
  	
    <input type="submit" value="Submit" /> 
    <br><br>
    
    <table>
    	<c:forEach var="color" items="${colorArray}" >
    		<tr>
    			<td>${color}</td>
    		</tr>
    	</c:forEach>
    </table>
    
	<!-- <canvas id="myCanvas" width="578" height="200"></canvas>
    <script>
      var canvas = document.getElementById('myCanvas');
      var context = canvas.getContext('2d');
      context.beginPath();
      context.rect(0, 0, 100, 100);
      context.fillStyle = 'yellow';
      context.fill();
      context.lineWidth = 2;
      context.strokeStyle = 'black';
      context.stroke();
      
      var rectangle2 = canvas.getContext('2d');
      rectangle2.beginPath();
      rectangle2.rect(100, 100, 100, 100);
      rectangle2.fillStyle = 'blue';
      rectangle2.fill();
      rectangle2.lineWidth = 2;
      rectangle2.strokeStyle = 'black';
      rectangle2.stroke();
    </script> -->
    
    
</form>
    
</body>
</html>

