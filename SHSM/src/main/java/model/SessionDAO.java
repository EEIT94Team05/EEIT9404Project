package model;

public interface SessionDAO {
	SessionBean select(String session_id);
	SessionBean insert(SessionBean bean);
}
