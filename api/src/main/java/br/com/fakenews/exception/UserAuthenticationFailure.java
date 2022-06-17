package br.com.fakenews.exception;

public class UserAuthenticationFailure extends RuntimeException{

	private static final long serialVersionUID = 1L;

	public UserAuthenticationFailure() {
		super();
	}
	
	public UserAuthenticationFailure(final String menssage) {
		super(menssage);
	}
	
	public UserAuthenticationFailure(final String menssage, final Throwable e) {
		super(menssage, e);
	}
}
