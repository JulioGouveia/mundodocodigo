package br.com.mundodocodigo.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Repository;

import br.com.mundodocodigo.modelo.Usuario;

@Repository
public class UsuarioDAO implements UserDetailsService {

	@PersistenceContext
	private EntityManager manager;

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {

		String query = "select u from Usuario u where u.email = :email";

		List<Usuario> users = manager.createQuery(query, Usuario.class).setParameter("email", username).getResultList();

		if (users.isEmpty()) {
			throw new UsernameNotFoundException("Usuario" + username + "Não Existe");
		}

		System.out.println(users.get(0));

		return users.get(0);
	}
}