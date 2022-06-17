package br.com.fakenews.service;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import br.com.fakenews.dto.UserInputDto;
import br.com.fakenews.dto.UserOutputDto;
import br.com.fakenews.exception.UserNotFoundException;
import br.com.fakenews.model.entity.UserEntity;
import br.com.fakenews.repository.UserRepository;

@Service
public class UserService {

	private final UserRepository userRepository;	
	private final PasswordEncoder passwordEncoder;
	
	public UserService(UserRepository userRepository, PasswordEncoder passwordEncoder) {
		this.userRepository =  userRepository;
		this.passwordEncoder = passwordEncoder;
	}
	
	public List<UserOutputDto> findAllUser() {
		return  userRepository.findAll().stream()
				.map(UserEntity::toUserOutputDto)
				.collect(Collectors.toList());
	}
	
	public UserOutputDto findUserByEmail(final String email) {
		Optional<UserEntity> optionalUser = userRepository.findByEmail(email);
		
		if(optionalUser.isEmpty()) {
			throw new UserNotFoundException("Usuário [" + email + "] não encontrado."); 
		}
		
		return optionalUser.get().toUserOutputDto();
	}

	public UserOutputDto findUserById(final Long idUser) {
		Optional<UserEntity> optionalUser = userRepository.findById(idUser);
		
		if(optionalUser.isEmpty()) {
			throw new UserNotFoundException("Usuário [" + idUser + "] não encontrado."); 
		}
		
		return optionalUser.get().toUserOutputDto();
	}

	public UserOutputDto saveUser(final UserInputDto userInputDto) {
		UserEntity userEntity = UserInputDto.toUserEntity(userInputDto);
		userEntity.setPassword(passwordEncoder.encode(userEntity.getPassword()));
		
		return userRepository.save(userEntity).toUserOutputDto();
	}

	public void deleteUser(final Long idUser) {
		Optional<UserEntity> optionalUser = userRepository.findById(idUser);
		
		if(optionalUser.isEmpty()) {
			throw new UserNotFoundException("Usuário [" + idUser + "] não encontrado."); 
		}
		
		userRepository.deleteById(idUser);
	}


	public UserOutputDto updateUser(final Long idUser, final UserInputDto userInputDto){
		Optional<UserEntity> optionalUser = userRepository.findById(idUser);
		
		if(optionalUser.isEmpty()) {
			throw new UserNotFoundException("Usuário [" + idUser + "] não encontrado."); 
		}
		
		UserEntity userEntity = optionalUser.get();
		userEntity.setFullname(userInputDto.getFullname());
		userEntity.setBirthdate(userInputDto.getBirthdate());
		userEntity.setPhoto(userInputDto.getPhoto());
		userEntity.setAddress(userInputDto.getAddress());
		
		return userRepository.save(userEntity).toUserOutputDto();
	}
}
