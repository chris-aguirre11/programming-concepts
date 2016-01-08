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
		PaintFillFunction pFill = new PaintFillFunction(3, 3);
		pFill.fill2DArrayWithInitialColors();
		pFill.printContentsOf2DArray();
        
        Color newFillColor = new Color(255, 255, 0);    //yellow
        pFill.executepaintFill(2, 1, newFillColor);
        
        pFill.printContentsOf2DArray();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
