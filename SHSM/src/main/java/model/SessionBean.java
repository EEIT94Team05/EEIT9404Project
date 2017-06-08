package model;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="session")
public class SessionBean implements Serializable{
	@Id
	private String session_id;
	private java.util.Date session_date;
	private byte[] session_img;
	private String session_context;
	
	@OneToMany
	private List<CustomerBean> setCus_id;
	
	@OneToMany
	private List<CompanyBean> setom_id;

	public String getSession_id() {
		return session_id;
	}

	public void setSession_id(String session_id) {
		this.session_id = session_id;
	}

	public java.util.Date getSession_date() {
		return session_date;
	}

	public void setSession_date(java.util.Date session_date) {
		this.session_date = session_date;
	}

	public byte[] getSession_img() {
		return session_img;
	}

	public void setSession_img(byte[] session_img) {
		this.session_img = session_img;
	}

	public String getSession_context() {
		return session_context;
	}

	public void setSession_context(String session_context) {
		this.session_context = session_context;
	}
	
	
}
