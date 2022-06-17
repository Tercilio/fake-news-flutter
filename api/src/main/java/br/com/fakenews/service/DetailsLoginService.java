package br.com.fakenews.service;

import java.util.Optional;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Component;

import br.com.fakenews.model.entity.UserEntity;
import br.com.fakenews.repository.UserRepository;
import br.com.fakenews.security.data.DetailsLoginData;

@Component
public class DetailsLoginService  implements UserDetailsService{
	
	private final UserRepository userRepository;
	
	public DetailsLoginService(UserRepository userRepository) {
		this.userRepository = userRepository;
	}

	@Override
	public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
		
		if(email.isBlank()){
			throw new UsernameNotFoundException("Email must be provided.");
		}
		
		
		Optional<UserEntity> optionalUser = userRepository.findByEmail(email);
		
		if(optionalUser.isEmpty()) {
			throw new UsernameNotFoundException(String.format("Email %s not found .", email));	
		}
		
		return new DetailsLoginData(optionalUser.get());
	}
}
