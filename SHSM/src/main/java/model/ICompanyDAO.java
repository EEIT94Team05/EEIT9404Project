package model;

import java.util.List;

public interface ICompanyDAO {
	CompanyBean select(String comid);
	List<CompanyBean> select();
}
