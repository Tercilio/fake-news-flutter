package br.com.fakenews.dto;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class UserLoginOutputDto {

	@NotNull
	private Long id;

	@NotBlank
	private String fullname;
	
	@NotNull
	private String birthdate;
	
	@Email
	@NotBlank
	private String email;
	
	private String password;
	
	private String photo;
	
	private String address;

	@NotBlank
	private String token;
}
