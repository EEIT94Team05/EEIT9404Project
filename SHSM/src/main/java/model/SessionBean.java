package model;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="session")
public class SessionBean {
	@Id
	private String session_id;
	private java.util.Date session_date;
	private byte[] session_img;
	private String session_context;
	
	@OneToMany
	private List<customer> setCus_id;
	
	@OneToMany
	private List<company> setom_id;
		
}
