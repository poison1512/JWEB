package market;

import java.util.List;

public interface ProductDao {

	    List<ProductDto> getProducts();
	    ProductDto getProductById(String id);
	    List<ProductDto> getProductsByCategory(String category);
	
}
