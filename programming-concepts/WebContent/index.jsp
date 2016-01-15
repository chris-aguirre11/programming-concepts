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
	
	Enter nRows	(between 1 and 5):
  	<input type="number" name="nRows" min="1" max="5"> <br><br>
  	
  	Enter nColumns (between 1 and 5):
  	<input type="number" name="nColumns" min="1" max="5"> <br><br>
  	
    <input type="submit" value="Submit" /> 
    <br><br>
   
    <!--TODO: Need to get the grid cells ppulating with correct color based on Color object in Java array-->
    
    <canvas id="myCanvas" width="500" height="500"></canvas>
    
    <c:set var="rowCount" value="0" scope="page" />
    <c:forEach var="rows" items="${colorArray}" >
	
    	<c:set var="columnCount" value="0" scope="page" />
    	<c:forEach var="columns" items="${rows}" >
    	
    		<c:set var="currentRedValue" value="columns.getRed()" scope="page" />
    		
    		  	<script>
	    		  var canvas = document.getElementById('myCanvas');
	    		  var square = canvas.getContext('2d');
	    		  square.beginPath();
	    		  square.rect("${columnCount}", "${rowCount}", 100, 100);
	    		  /* square.fillStyle = 'yellow'; */
	    	     /*  square.fillStyle = 'rgb(255,255,0)'; */
	    	       square.fillStyle = 'rgb(' + ${rowCount} + ',255,0)'; 
	    	   
	    		  
	    		  square.fill();
	    		  square.lineWidth = 2;
	    		  square.strokeStyle = 'black';
	    		  square.stroke();
    			</script>
    		<c:set var="columnCount" value="${columnCount + 100}" scope="page"/>		
    		
    	</c:forEach>
    	
    	<c:set var="rowCount" value="${rowCount + 100}" scope="page"/>
    </c:forEach>
   
</form>
    
</body>
</html>

