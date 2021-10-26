package model;

public class Autorizator {
	public String isAuthorized(String login, String password) {
		DbExecutor de = new DbExecutor();
        return de.checkLogin(login, password);
    }
}