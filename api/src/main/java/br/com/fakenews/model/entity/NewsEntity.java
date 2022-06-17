package br.com.fakenews.model.entity;

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

import br.com.fakenews.dto.NewsInputDto;
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
@Table(name = "tb_news")
public class NewsEntity {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@NotBlank
	private String title;
	
	@NotBlank
	@Size(max = 100000)
	private String body;
	
	private String author;
	
	private String URL;
	
	private String category;
	
	private Date publicationDate;
	
	@OneToOne(cascade=CascadeType.ALL)
	private Prediction predictions;
	
	public NewsInputDto toNewsInputDto() {
		return NewsInputDto.builder()
				.title(this.title)
				.body(this.body)
				.author(this.author)
				.URL(this.URL)
				.category(this.category)
				.publicationDate(this.publicationDate)
				.build();
	}
}
