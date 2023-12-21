package beans;

public class Account {
	private int idAccount;
	 private String username;
	   private String password;
	   private String email;
	   private String role;
	public int getIdAccount() {
		return idAccount;
	}
	public void setIdAccount(int idAccount) {
		this.idAccount = idAccount;
	}
	public String getUsername() {
		return username;
	}
	@Override
	public String toString() {
		return "Account [idAccount=" + idAccount + ", username=" + username + ", password=" + password + ", email="
				+ email + ", role=" + role + "]";
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}

}
