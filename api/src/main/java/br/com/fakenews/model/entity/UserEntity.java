package br.com.fakenews.model.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

import br.com.fakenews.dto.UserInputDto;
import br.com.fakenews.dto.UserLoginInputDto;
import br.com.fakenews.dto.UserOutputDto;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "tb_user")
public class UserEntity {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@NotBlank
	private String fullname;
	
	@Email
	@NotBlank
	@Column(unique = true)
	private String email;
	
	@NotBlank
	private String password;
	
	@NotNull
	private Date birthdate;
	
	private String photo;
	
	private String address;
	
	public UserLoginInputDto toUserLoginInputDto() {
		return UserLoginInputDto.builder()
				.email(this.email)
				.password(this.password)
				.build();
	}
	
	public UserOutputDto toUserOutputDto() {
		return UserOutputDto.builder()
				.id(this.id)
				.fullname(this.fullname)
				.email(this.email)
				.birthdate(this.birthdate)
				.photo(this.photo)
				.address(this.address)
				.build();
	}
	
	public UserInputDto toUserInputDto(UserEntity userEntity) {
		return UserInputDto.builder()
				.fullname(this.fullname)
				.birthdate(this.birthdate)
				.photo(this.photo)
				.build();
	}
}
