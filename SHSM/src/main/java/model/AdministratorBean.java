package model;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="administrator")
public class AdministratorBean {
	@Id
	private String admin_id;
	private String admin_password;
	private String dmin_name;
	
	
	public String getAdmin_id() {
		return admin_id;
	}
	public void setAdmin_id(String admin_id) {
		this.admin_id = admin_id;
	}
	public String getAdmin_password() {
		return admin_password;
	}
	public void setAdmin_password(String admin_password) {
		this.admin_password = admin_password;
	}
	public String getDmin_name() {
		return dmin_name;
	}
	public void setDmin_name(String dmin_name) {
		this.dmin_name = dmin_name;
	}

	
	
}
