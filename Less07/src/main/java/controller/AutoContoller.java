package controller;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.DbExecutor;

public class AutoContoller extends HttpServlet {
	private static final long serialVersionUID = 1L;
	boolean showForm = true;

    public AutoContoller() {
        super();
    }

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		RequestDispatcher rd = req.getRequestDispatcher("WEB-INF/auth.jsp");
		req.setAttribute("showForm", showForm);
		rd.forward(req, resp);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		boolean isError = false;
	    String errorText = "<ul>";
	    String login = req.getParameter("login");
	    String password = req.getParameter("password");

	    if (login == null || login.isEmpty()) {
	        isError = true;
	        errorText = "Login is empty!";
	    }
	    errorText = "Registration succeeded.";
	    if (!isError) {
	        DbExecutor de = new DbExecutor();
	        de.addUser(login, login, password);
	    } else {
	    	req.setAttribute("errorText", errorText);
	    }
		doGet(req, resp);
	}

}
