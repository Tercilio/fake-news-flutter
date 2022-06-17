package br.com.fakenews.model;

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
public class IBMToken {
	
	private String access_token; 
	
	private String refresh_token;
	
	private String token_type;
	
	private int expires_in;
	
	private long expiration;
	
	private String scope;
}
