package br.com.fakenews.security;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;

import com.auth0.jwt.JWT;
import com.auth0.jwt.algorithms.Algorithm;
import com.fasterxml.jackson.databind.ObjectMapper;

import br.com.fakenews.dto.UserLoginInputDto;
import br.com.fakenews.dto.UserLoginOutputDto;
import br.com.fakenews.exception.UserAuthenticationFailure;
import br.com.fakenews.security.data.DetailsLoginData;

public class JWTAuthenticationFilter extends UsernamePasswordAuthenticationFilter {
	
	public static final int TOKEN_EXPIRATION = 600_000;
	public static final String TOKEN_PASSWORD = "23c10c3b-4bcb-4910-92e3-7141805a4dd0";

	private final AuthenticationManager authenticationManager;
	
	public JWTAuthenticationFilter(AuthenticationManager authenticationManager) {
		this.authenticationManager = authenticationManager;
	}
	
	@Override
	public Authentication attemptAuthentication(HttpServletRequest request, 
			HttpServletResponse response) throws AuthenticationException {

		try {
			UserLoginInputDto userLoginInputDto = new ObjectMapper()
					.readValue(request.getInputStream(), UserLoginInputDto.class);
		
			return authenticationManager.authenticate(new UsernamePasswordAuthenticationToken(
					userLoginInputDto.getEmail(),
					userLoginInputDto.getPassword(),
					new ArrayList<>()
			));
		} catch (Exception e) {
			throw new UserAuthenticationFailure("Falha ao autenticar usuario.", e);
		}
	}
	
	@Override
	protected void successfulAuthentication(HttpServletRequest request, 
											HttpServletResponse response, 
											FilterChain chain,
											Authentication authResult) throws IOException, ServletException {

		DetailsLoginData loginData = (DetailsLoginData) authResult.getPrincipal();
		
		String token = JWT.create()
				.withSubject(loginData.getUsername())
				.withExpiresAt(new Date(System.currentTimeMillis() + TOKEN_EXPIRATION))
				.sign(Algorithm.HMAC512(TOKEN_PASSWORD));
		
		UserLoginOutputDto loginOutputDto = UserLoginOutputDto.builder()
				.id(loginData.getUser().getId())
				.fullname(loginData.getUser().getFullname())
				.birthdate(loginData.getUser().getBirthdate().toString())
				.email(loginData.getUsername())
				.photo(loginData.getUser().getPhoto())
				.address(loginData.getUser().getAddress())
				.token(token)
				.build();
		
		ObjectMapper mapper = new ObjectMapper();
		String json = mapper.writeValueAsString(loginOutputDto);
		
		response.getWriter().write(json);
		response.getWriter().flush();
	}
	
	@Override
	protected void unsuccessfulAuthentication(HttpServletRequest request, HttpServletResponse response,
	        AuthenticationException failed) throws IOException, ServletException {
		
		response.sendError(HttpServletResponse.SC_UNAUTHORIZED, "Authentication Failed");
	}
}
