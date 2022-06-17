package br.com.fakenews.exception;

public class NewsNotFoundException extends RuntimeException {

	private static final long serialVersionUID = 1L;

	public NewsNotFoundException(final String message) {
        super(message);
    }
}
