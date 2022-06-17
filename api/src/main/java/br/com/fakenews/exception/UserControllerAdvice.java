package br.com.fakenews.exception;

import java.io.PrintWriter;
import java.io.StringWriter;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;
import org.springframework.web.servlet.mvc.method.annotation.ResponseEntityExceptionHandler;

import br.com.fakenews.model.ErrorResponse;

@RestControllerAdvice
public class UserControllerAdvice extends ResponseEntityExceptionHandler{

	@ExceptionHandler(Exception.class) // exception handled
	public ResponseEntity<ErrorResponse> handleExceptions(Exception e) {

		HttpStatus status = HttpStatus.INTERNAL_SERVER_ERROR;

		StringWriter stringWriter = new StringWriter();
		PrintWriter printWriter = new PrintWriter(stringWriter);

		e.printStackTrace(printWriter);

		return new ResponseEntity<>(new ErrorResponse(status, e.getMessage()), status);
	}

	@ExceptionHandler(UserNotFoundException.class)
	public ResponseEntity<ErrorResponse> handleUserNotFound(UserNotFoundException notFoundException) {

		HttpStatus status = HttpStatus.NOT_FOUND;

		StringWriter stringWriter = new StringWriter();
		PrintWriter printWriter = new PrintWriter(stringWriter);

		notFoundException.printStackTrace(printWriter);

		return new ResponseEntity<>(new ErrorResponse(status, notFoundException.getMessage()), status);
	}
	
	@ExceptionHandler(NewsNotFoundException.class)
	public ResponseEntity<ErrorResponse> handleNewsNotFound(NewsNotFoundException notFoundException) {

		HttpStatus status = HttpStatus.NOT_FOUND;

		StringWriter stringWriter = new StringWriter();
		PrintWriter printWriter = new PrintWriter(stringWriter);

		notFoundException.printStackTrace(printWriter);

		return new ResponseEntity<>(new ErrorResponse(status, notFoundException.getMessage()), status);
	}
	
//	@ExceptionHandler(UserAuthenticationFailure.class)
//	public ResponseEntity<ErrorResponse> handleUserAuthenticationFailure(UserAuthenticationFailure e) {
//
//		HttpStatus status = HttpStatus.FORBIDDEN;
//
//		StringWriter stringWriter = new StringWriter();
//		PrintWriter printWriter = new PrintWriter(stringWriter);
//
//		e.printStackTrace(printWriter);
//
//		String stackTrace = stringWriter.toString();
//
//		return new ResponseEntity<>(new ErrorResponse(status, e.getMessage(), stackTrace), status);
//	}
//
//	@ExceptionHandler(UserAccessDenied.class)
//	public ResponseEntity<ErrorResponse> handleUserAccessDenied(UserAccessDenied e) {
//
//		HttpStatus status = HttpStatus.FORBIDDEN;
//
//		StringWriter stringWriter = new StringWriter();
//		PrintWriter printWriter = new PrintWriter(stringWriter);
//
//		e.printStackTrace(printWriter);
//
//		String stackTrace = stringWriter.toString();
//
//		return new ResponseEntity<>(new ErrorResponse(status, e.getMessage(), stackTrace), status);
//	}

}
