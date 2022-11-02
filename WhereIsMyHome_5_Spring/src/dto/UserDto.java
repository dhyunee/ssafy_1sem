package dto;

import java.time.LocalDateTime;

public class UserDto {
	private int userSeq;
	private String userName;
	private String userPassword;
	private String userEmail;
	private LocalDateTime userRegistDate;
	private String userClsf;

	public int getUserSeq() {
		return userSeq;
	}

	public void setUserSeq(int userSeq) {
		this.userSeq = userSeq;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserPassword() {
		return userPassword;
	}

	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public LocalDateTime getUserRegistDate() {
		return userRegistDate;
	}

	public void setUserRegistDate(LocalDateTime userRegistDate) {
		this.userRegistDate = userRegistDate;
	}

	public String getUserClsf() {
		return userClsf;
	}

	public void setUserClsf(String userClsf) {
		this.userClsf = userClsf;
	}

	@Override
	public String toString() {
		return "UserDto [userSeq=" + userSeq + ", userName=" + userName + ", userPassword=" + userPassword
				+ ", userEmail=" + userEmail + ", userRegistDate=" + userRegistDate + ", userClsf=" + userClsf + "]";
	}

	

	

}