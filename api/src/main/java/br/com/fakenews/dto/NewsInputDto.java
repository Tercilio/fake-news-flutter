package br.com.fakenews.dto;

import java.util.Date;

import javax.validation.constraints.NotBlank;

import br.com.fakenews.model.entity.NewsEntity;
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
public class NewsInputDto {

	@NotBlank
	private String title;
	
	@NotBlank
	private String body;
	
	private String author;
	
	private String URL;
	
	private String category;
	
	private Date publicationDate;
	
	public NewsEntity toNewsEntity() {
		return NewsEntity.builder()
				.title(this.title)
				.body(this.body)
				.author(this.author)
				.URL(this.URL)
				.category(this.category)
				.publicationDate(this.publicationDate)
				.build();
	}
}
