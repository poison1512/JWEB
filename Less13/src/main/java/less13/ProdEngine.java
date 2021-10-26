package less13;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Persistence;
import javax.persistence.TypedQuery;

public class ProdEngine { 
	public EntityManager em = Persistence.createEntityManagerFactory("products").createEntityManager();
	public void addProd(Products prod ) {
		em.getTransaction().begin();
		em.merge(prod);
		em.getTransaction().commit();
	}
	public Products getProdBiId(int id) {
		return em.find(Products.class, id);
	}
	public List<Products> getAll() {
		TypedQuery<Products> namedQuery = em.createNamedQuery("Products.getAll", Products.class);
		return namedQuery.getResultList();
		
	}
}
