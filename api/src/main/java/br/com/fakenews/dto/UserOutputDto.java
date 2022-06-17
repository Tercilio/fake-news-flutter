package br.com.fakenews.dto;

import java.util.Date;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Builder
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class UserOutputDto {
	
	@NotNull
	private Long id;

	@NotBlank
	private String email;
	
	@NotBlank
	private String fullname;
	
	@NotNull
	private Date birthdate;
	
	private String photo;
	
	private String address;
}
