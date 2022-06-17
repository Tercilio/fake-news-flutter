package br.com.fakenews.service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Optional;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import br.com.fakenews.dto.NewsInputDto;
import br.com.fakenews.dto.PredictNewsInputDto;
import br.com.fakenews.dto.PredictNewsOutputDto;
import br.com.fakenews.exception.NewsNotFoundException;
import br.com.fakenews.exception.UserNotFoundException;
import br.com.fakenews.model.IBMInputData;
import br.com.fakenews.model.IBMNewsModel;
import br.com.fakenews.model.IBMToken;
import br.com.fakenews.model.entity.NewsEntity;
import br.com.fakenews.model.entity.Prediction;
import br.com.fakenews.repository.NewsRepository;

@Service
public class NewsService {

	private final NewsRepository newsRepository;	
	
	public NewsService(NewsRepository newsRepository) {
		this.newsRepository = newsRepository;
	}
	
	public List<NewsEntity> findAllNews() {
		return  newsRepository.findAll();
	}

	public NewsEntity findNewsById(final Long idNews) {
		Optional<NewsEntity> optionalNews = newsRepository.findById(idNews);
		
		if(optionalNews.isEmpty()) {
			throw new NewsNotFoundException("Notícia [" + idNews + "] não encontrada."); 
		}
		
		return optionalNews.get();
	}

	public NewsEntity saveNews(final NewsInputDto newsInputDto) {
		NewsEntity newsEntity = newsInputDto.toNewsEntity();
		
		return predictNewsById(newsEntity);
	}

	public void deleteNews(final Long idNews) {
		Optional<NewsEntity> optionalNews = newsRepository.findById(idNews);
		
		if(optionalNews.isEmpty()) {
			throw new NewsNotFoundException("Notícia [" + idNews + "] não encontrado."); 
		}
		
		newsRepository.deleteById(idNews);
	}

	public NewsEntity updateNews(final Long idNews, final NewsInputDto newsInputDto){
		Optional<NewsEntity> optionalNews = newsRepository.findById(idNews);
		
		if(optionalNews.isEmpty()) {
			throw new UserNotFoundException("Notícia [" + idNews + "] não encontrado."); 
		}
		
		NewsEntity newsEntity = optionalNews.get();
		newsEntity.setAuthor(newsInputDto.getAuthor());
		newsEntity.setBody(newsInputDto.getBody());
		newsEntity.setCategory(newsInputDto.getCategory());
		newsEntity.setPublicationDate(newsInputDto.getPublicationDate());
		
		return newsRepository.save(newsEntity);
	}
	
	public IBMToken getTokenIBM() {
		String url = "https://iam.cloud.ibm.com/identity/token";
		
		RestTemplate restTemplate = new RestTemplate();
		
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);

		MultiValueMap<String, String> map= new LinkedMultiValueMap<String, String>();
		map.add("apikey", "siOgNM7ZbjKhBLoVUyryQ7Kc6NOuvAFWqvpaKQc7O1Xn");
		map.add("grant_type", "urn:ibm:params:oauth:grant-type:apikey");

		HttpEntity<MultiValueMap<String, String>> request = new HttpEntity<MultiValueMap<String, String>>(map, headers);

		IBMToken ibmToken = restTemplate.postForObject( url, request , IBMToken.class );
		
		return ibmToken;
	}
	
	public NewsEntity predictNewsById(NewsEntity newsEntity) {
		List<String> valuesNews = new ArrayList<>();
		valuesNews.add(newsEntity.getBody());
		
		IBMInputData inputData = new IBMInputData();
		inputData.setFields(Arrays.asList("noticia"));
		inputData.setValues(Arrays.asList(valuesNews));
		
		IBMNewsModel newsModel = new IBMNewsModel();
		newsModel.setInput_data(Arrays.asList(inputData));
		
		Prediction prediction = predictNews(newsModel);
		
		newsEntity.setPredictions(prediction);
		
		return newsRepository.save(newsEntity);
	}
	
	public PredictNewsOutputDto predictNewsByBody(PredictNewsInputDto newsInputDto) {
		List<String> valuesNews = new ArrayList<>();
		valuesNews.add(newsInputDto.getBody());
		
		IBMInputData inputData = new IBMInputData();
		inputData.setFields(Arrays.asList("noticia"));
		inputData.setValues(Arrays.asList(valuesNews));
		
		IBMNewsModel newsModel = new IBMNewsModel();
		newsModel.setInput_data(Arrays.asList(inputData));
		
		Prediction prediction = predictNews(newsModel);
		
		PredictNewsOutputDto newsOutputDto = PredictNewsOutputDto.builder()
				.body(newsInputDto.getBody())
				.predictions(prediction).build();
		
		return newsOutputDto;
	}
	
	private Prediction predictNews(IBMNewsModel newsModel) {
		IBMToken ibmToken = getTokenIBM();
		
		String url = "https://us-south.ml.cloud.ibm.com/ml/v4/deployments/08c0df4c-cd3d-4a29-a4b3-5a3fe9559062/predictions?version=2022-06-02";
		
		RestTemplate restTemplate = new RestTemplate();
		
		HttpHeaders headers = new HttpHeaders();
		headers.setBearerAuth(ibmToken.getAccess_token());
		
		HttpEntity<IBMNewsModel> request = new HttpEntity<>(newsModel, headers);
		
		String newsOutputModel = restTemplate.postForObject(url, request, String.class);
		
		return getResponse(newsOutputModel);
	}
	
	private Prediction getResponse(String newsOutputModel) {
		String jsonString = "[" + newsOutputModel + "]";
		
		JSONArray array = new JSONArray(jsonString);
		
		for(int i=0; i < array.length(); i++) {
			JSONObject object = array.getJSONObject(i);
			JSONArray arrayPredictions = new JSONArray(object.get("predictions").toString());
			
			JSONObject objectPredictions  = arrayPredictions.getJSONObject(0);
			String values = objectPredictions.get("values").toString();
			
			if(!values.isEmpty()) {
				return getVeluesPredict(values);				
			}
		}
		
		return null;
	}
	
	private Prediction getVeluesPredict(String values) {
		JSONArray array = new JSONArray(values);
		JSONArray array1 = new JSONArray(array.get(0).toString());
		JSONArray array2 = new JSONArray(array1.get(1).toString());
		
		int prediction = (int) array1.get(0); 			
		double probability = (double) array2.get(0);
		
		Prediction predict = Prediction.builder()
				.veracity(prediction)
				.probability(probability).build();
		
		return predict;
	}
}
