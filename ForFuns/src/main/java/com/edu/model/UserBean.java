/**
 * 
 */
package com.edu.model;

import java.beans.Transient;
import java.util.HashSet;
import java.util.Set;

import javax.management.relation.Role;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinColumns;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.codehaus.jackson.annotate.JsonIgnoreProperties;

@Table(name="u_user")
@Entity
public class UserBean {
	private Integer id;
	private String username;
	private String password;
	private Set<RoleBean> roleBeans = new HashSet<RoleBean>();
	
	@Transient
	@ManyToMany(cascade=CascadeType.PERSIST,fetch=FetchType.EAGER)
	@JoinTable(name = "ur_userrole",joinColumns ={@JoinColumn(name = "userid", referencedColumnName = "id") },   
    inverseJoinColumns = { @JoinColumn(name = "roleid", referencedColumnName = "id")})  
	public Set<RoleBean> getRoleBeans() {
		return roleBeans;
	}

	public void setRoleBeans(Set<RoleBean> roleBeans) {
		this.roleBeans = roleBeans;
	}


	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@Column(name = "username")
	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	@Column(name = "password")
	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}


	@Override
	public String toString() {
		return "User [ \nid : " + this.id + "\nusername : " + this.username
				+ "\npassword : " + this.password + "\n]";
	}

	public UserBean() {
		super();
	}

	public UserBean(String username, String password) {
		super();
		this.username = username;
		this.password = password;
	}

	public UserBean(Integer id, String username, String password) {
		super();
		this.id = id;
		this.username = username;
		this.password = password;
	}

	
	
}
