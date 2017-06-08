package br.com.mundodocodigo.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import br.com.mundodocodigo.modelo.Produto;

@Repository

@Transactional
public class ProdutoDAO {

	@PersistenceContext
	private EntityManager entityManager;

	public void grava(Produto produto) {

		entityManager.persist(produto);

	}

	public List<Produto> listar() {
		return entityManager.createQuery("select p from Produto p", Produto.class).getResultList();

	}

	public Produto find(int id) {
		return entityManager
				.createQuery("select distinct(p) from Produto p join fetch p.precos precos where p.id = :id",
						Produto.class)
				.setParameter("id", id).getSingleResult();
	}

}
