package com.mycom.myhouse.user.dto;

import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class UserDto {
	private int userSeq;
	private String userName;
	private String userPassword;
	private String userEmail;
	private LocalDateTime userRegistDate;
	private int userClsf;
}
