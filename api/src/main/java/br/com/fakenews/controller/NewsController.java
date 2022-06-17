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
import org.springframework.web.bind.annotation.RestController;

import br.com.fakenews.dto.NewsInputDto;
import br.com.fakenews.dto.PredictNewsInputDto;
import br.com.fakenews.dto.PredictNewsOutputDto;
import br.com.fakenews.model.IBMToken;
import br.com.fakenews.model.entity.NewsEntity;
import br.com.fakenews.service.NewsService;

@RestController
@RequestMapping(value = "/api/news")
public class NewsController {
	
	private final NewsService newsService;
	
	public NewsController(NewsService newsService) {
		this.newsService = newsService;
	}
	
	@GetMapping
	public ResponseEntity<List<NewsEntity>> getAllNews(){
		return new ResponseEntity<>(newsService.findAllNews(), HttpStatus.OK);
	}
	
	@GetMapping(value = "/{idNews}")
	public ResponseEntity<NewsEntity> findNewsById(@PathVariable Long idNews){
		NewsEntity newsEntity = newsService.findNewsById(idNews);
		
		return new ResponseEntity<>(newsEntity, HttpStatus.OK);
	}
	
	@PostMapping
	public ResponseEntity<NewsEntity> saveNews(@Valid @RequestBody NewsInputDto newsInputDto) {
		NewsEntity newsEntity = newsService.saveNews(newsInputDto);
		
		return new ResponseEntity<>(newsEntity, HttpStatus.OK);
	}
	
	@PutMapping(value = "/{idNews}")
	public ResponseEntity<NewsEntity> updateNews(@PathVariable Long idNews, @Valid @RequestBody NewsInputDto newsInputDto) {
		NewsEntity newsEntity = newsService.updateNews(idNews, newsInputDto);
		
		return new ResponseEntity<>(newsEntity, HttpStatus.OK);
	}
	
	@DeleteMapping(value = "/{idNews}")
	public ResponseEntity<Void> deleteNews(@PathVariable Long idNews) {
		newsService.deleteNews(idNews);
		
		return ResponseEntity.noContent().build();
	}
	
	@GetMapping(value = "/ibm-token")
	public ResponseEntity<IBMToken> getTokenIBM() {
		IBMToken ibmToken = newsService.getTokenIBM();
		
		return new ResponseEntity<>(ibmToken, HttpStatus.OK);
	}
	
	@GetMapping(value = "/predict/{idNews}")
	public ResponseEntity<NewsEntity> predictNews(@PathVariable Long idNews) {
		NewsEntity newsEntity = newsService.findNewsById(idNews);
		
		newsEntity = newsService.predictNewsById(newsEntity);
		
		return new ResponseEntity<>(newsEntity, HttpStatus.OK);
	}
	
	@PostMapping(value = "/predict")
	public ResponseEntity<PredictNewsOutputDto> predictNews(@RequestBody PredictNewsInputDto newsInputDto) {
		PredictNewsOutputDto outputDto = newsService.predictNewsByBody(newsInputDto);
		
		return new ResponseEntity<>(outputDto, HttpStatus.OK);
	}
}
