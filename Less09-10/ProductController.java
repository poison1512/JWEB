 package market;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ProductController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ProductController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cat = request.getParameter("category");
		String id = request.getParameter("id");
		RequestDispatcher rd;
		ProductDbService pds = new ProductDbService(DbConnector.getInstance());
		if (id != null && !id.isEmpty()) {
			rd = request.getRequestDispatcher("WEB-INF/views/product.jsp");
			ProductDto product = pds.getProductById(id);
			request.setAttribute("product", product);
		} else {
			rd = request.getRequestDispatcher("WEB-INF/views/products.jsp");
			List<ProductDto> products = pds.getProductsByCategory(cat);
			request.setAttribute("productList", products);
		}
		rd.forward(request, response);

//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//
//		doGet(request, response);
	}
}
