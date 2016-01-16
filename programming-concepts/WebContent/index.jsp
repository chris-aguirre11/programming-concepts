<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Insert title here</title>
	<script src="jscolor-2.0.4/jscolor.js"></script>
	
	<style>
      body {
        margin: 0px;
        padding: 0px;
      }
    </style>
    
</head>
<body>

	<form action="PaintFill" method="POST">
		Enter nRows	(between 3 and 5):
	  	<input type="number" name="nRows" min="3" max="5"> <br><br>
	  	
	  	Enter nColumns (between 3 and 5):
	  	<input type="number" name="nColumns" min="3" max="5"> <br><br>
	  	
	    <input type="submit" value="Populate Grid with Initial Colors" /> 
	    <br><br>
	</form>
	
	
	<!-- Using nice Javascript Color Picker from http://jscolor.com/examples/#example-sending-forms -->
	<form action="PaintFill" method="POST">
		<p style="text-indent: 5em;">
			Choose a new fill color:
		    <input name="newFillColor" type="hidden" id="color_value" value="99cc00">
		    <button class="jscolor {valueElement: 'color_value'}">Pick a color</button> <br><br>
		</p>
	
	    <p style="text-indent: 5em;">
			Enter paint fill nRows cell:
			<input type="number" name="paintFillnRow" min="0" max="4"> <br><br>
		</p>
		
		<p style="text-indent: 5em;">
			Enter paint fill nColumns cell:
			<input type="number" name="paintFillnColumn" min="0" max="4"> <br><br>
		</p>
		
		<p style="text-indent: 5em;">
			<input type="submit" value="Execute Paint Fill" />
		</p>
	</form>

<canvas id="myCanvas" width="500" height="500"></canvas>
    
    <c:set var="rowCount" value="0" scope="page" />
    <c:forEach var="rows" items="${colorArray}" >
	
    	<c:set var="columnCount" value="0" scope="page" />
    	<c:forEach var="columns" items="${rows}" >
    	
    		<c:set var="currentRedValue" value="${columns.getRed()}" scope="page" />
    		<c:set var="currentGreenValue" value="${columns.getGreen()}" scope="page" />
    		<c:set var="currentBlueValue" value="${columns.getBlue()}" scope="page" />
    		
    		<c:if test="${empty currentRedValue}">
			    <c:set var="currentRedValue" value="255" scope="page"/>
	    		<c:set var="currentGreenValue" value="255" scope="page"/>
	    		<c:set var="currentBlueValue" value="255" scope="page"/>
			</c:if>
    		
    		  	<script>
	    		  var canvas = document.getElementById('myCanvas');
	    		  var square = canvas.getContext('2d');
	    		  square.beginPath();
	    		  square.rect("${columnCount}", "${rowCount}", 100, 100);
	    		  /* square.fillStyle = 'yellow'; */
	    	     /*  square.fillStyle = 'rgb(255,255,0)'; */
	    	     
	    	    
	    	       square.fillStyle = 'rgb(' + ${currentRedValue} + ',' + ${currentGreenValue} + ',' + ${currentBlueValue} + ')';
	    	   
	    		  
	    		  square.fill();
	    		  square.lineWidth = 2;
	    		  square.strokeStyle = 'black';
	    		  square.stroke();
    			</script>
    		<c:set var="columnCount" value="${columnCount + 100}" scope="page"/>		
    		
    	</c:forEach>
    	
    	<c:set var="rowCount" value="${rowCount + 100}" scope="page"/>
    </c:forEach>
    
</body>
</html>

