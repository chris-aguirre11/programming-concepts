package servlets;

import java.awt.Color;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import recursion.PaintFillFunction;

/**
 * Servlet implementation class PaintFill
 */
@WebServlet("/PaintFill")
public class PaintFill extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	PaintFillFunction pFill = null;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PaintFill() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String nRows = request.getParameter("nRows"); 
		String nColumns = request.getParameter("nColumns"); 
//		PaintFillFunction pFill = null;
		
		if(nRows != null) {
			pFill = new PaintFillFunction(Integer.parseInt(nRows), Integer.parseInt(nColumns));
			pFill.fill2DArrayWithInitialColors();
			pFill.printContentsOf2DArray();
			
			request.setAttribute("colorArray", pFill.colorArray);
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}
		else {
			String newFillColor = request.getParameter("newFillColor"); 
			String paintFillnRow = request.getParameter("paintFillnRow"); 
			String paintFillnColumn = request.getParameter("paintFillnColumn"); 
			
			// Convert Hex Color value from UI to Hex Values for Color object creation
			Color newFillColorObject = new Color(
					 Integer.parseInt(newFillColor.substring(0, 2), 16), 
					 Integer.parseInt(newFillColor.substring(2, 4), 16),
					 Integer.parseInt(newFillColor.substring(4, 6), 16) );
					 
		     pFill.executepaintFill(Integer.parseInt(paintFillnRow), Integer.parseInt(paintFillnColumn), newFillColorObject);  
		     pFill.printContentsOf2DArray();
		     
		     request.setAttribute("colorArray", pFill.colorArray);
			 request.getRequestDispatcher("index.jsp").forward(request, response);
		}
	}
}
