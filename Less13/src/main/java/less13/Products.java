package less13;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

@Entity
@Table(name="products")
@NamedQuery(name="Products.getAll", query="SELECT p FROM Products p")
public class Products {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	private String name;
	private String description;
	private int price;

	
	
	public Products() {
	}

	public Products(String name, String description, int price) {
		super();
		this.id = id;
		this.name = name;
		this.description = description;
		this.price = price;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	@Override
	public String toString() {
		return "Prod [id=" + id + ", name=" + name + ", description=" + description + ", price=" + price + "]";
	}
	
	
}
