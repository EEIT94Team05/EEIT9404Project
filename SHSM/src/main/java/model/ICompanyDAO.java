package model;

import java.util.List;

public interface ICompanyDAO {
	CompanyBean select(String custid);
	
	List<CompanyBean> select();
}
