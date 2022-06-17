package br.com.fakenews.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import br.com.fakenews.dto.UserInputDto;
import br.com.fakenews.dto.UserOutputDto;
import br.com.fakenews.service.UserService;

@RestController
@RequestMapping(value = "/api/user")
public class UserController {
	
	private final UserService userService;
	
	public UserController(UserService userService) {
		this.userService = userService;
	}
	
	@GetMapping
	public ResponseEntity<List<UserOutputDto>> getAllUsers(){
		return new ResponseEntity<>(userService.findAllUser(), HttpStatus.OK);
	}
	
	@GetMapping(value = "/{idUser}")
	public ResponseEntity<UserOutputDto> findById(@PathVariable Long idUser){
		UserOutputDto userOutputDto = userService.findUserById(idUser);		
		return new ResponseEntity<>(userOutputDto, HttpStatus.OK);
	}
	
	@GetMapping(value = "/email")
	public ResponseEntity<UserOutputDto> findUserByEmail(@RequestParam String email){
		UserOutputDto userOutputDto = userService.findUserByEmail(email);		
		return new ResponseEntity<>(userOutputDto, HttpStatus.OK);
	}
	
	@PostMapping
	public ResponseEntity<UserOutputDto> saveUser(@Valid @RequestBody UserInputDto userInputDto) {
		UserOutputDto userOutputDto = userService.saveUser(userInputDto);
		return new ResponseEntity<>(userOutputDto, HttpStatus.OK);
	}
	
	@PutMapping(value = "/{idUser}")
	public ResponseEntity<UserOutputDto> updateUser(@PathVariable Long idUser, @Valid @RequestBody UserInputDto userInputDto) {
		UserOutputDto userOutputDto = userService.updateUser(idUser, userInputDto);
		return new ResponseEntity<>(userOutputDto, HttpStatus.OK);
	}
	
	@DeleteMapping(value = "/{idUser}")
	public ResponseEntity<Void> deleteUser(@PathVariable Long idUser) {
		userService.deleteUser(idUser);
		return ResponseEntity.noContent().build();
	}
}
