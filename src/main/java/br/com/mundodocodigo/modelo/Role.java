package br.com.mundodocodigo.modelo;

import javax.persistence.Entity;
import javax.persistence.Id;

import org.springframework.security.core.GrantedAuthority;

@Entity
public class Role implements GrantedAuthority {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
	private String role;

	public String getRole() {
		return role;
	}

	@Override
	public String getAuthority() {
		return role;
	}

	@Override
	public String toString() {
		return "Role [role=" + role + "]";
	}

}
