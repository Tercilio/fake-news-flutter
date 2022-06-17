package br.com.fakenews;

import java.util.Date;

import org.springframework.boot.ApplicationArguments;
import org.springframework.boot.ApplicationRunner;
import org.springframework.stereotype.Service;

import br.com.fakenews.dto.NewsInputDto;
import br.com.fakenews.dto.UserInputDto;
import br.com.fakenews.service.NewsService;
import br.com.fakenews.service.UserService;

@Service
public class DadosDeTeste implements ApplicationRunner {
	
	private NewsService newsService;
	private UserService userService;
	
	public DadosDeTeste(NewsService newsService, UserService userService) {
		this.userService = userService;	
		this.newsService = newsService;	
	}

	@Override
	public void run(ApplicationArguments args) throws Exception {
		UserInputDto userInputDto1 = new UserInputDto("admin@admin.com", "123", "Admin", new Date(), "", "");
		UserInputDto userInputDto2 = new UserInputDto("le@gmail.com", "123", "Leticia Alves", new Date(), "", "");
		UserInputDto userInputDto3 = new UserInputDto("lu@gmail.com", "123", "Lucas Pinto", new Date(), "", "");
		UserInputDto userInputDto4 = new UserInputDto("te@gmail.com", "123", "Tercilio Fonseca", new Date(), "", "");
		UserInputDto userInputDto5 = new UserInputDto("we@gmail.com", "123", "Welisson Lima", new Date(), "", "");
		
		NewsInputDto newsInputDto1 = new NewsInputDto("Title 1", "Title 1 Welisson Lima", "welisson lima", "www.google.com", "TESTE", new Date());
		NewsInputDto newsInputDto2 = new NewsInputDto("Title 2", "Title 2 Welisson Lima", "welisson lima", "www.google.com", "TESTE", new Date());
		NewsInputDto newsInputDto3 = new NewsInputDto("Title 3", "Title 3 Welisson Lima", "welisson lima", "www.google.com", "TESTE", new Date());
		NewsInputDto newsInputDto4 = new NewsInputDto("Title 4", "Title 4 Welisson Lima", "welisson lima", "www.google.com", "TESTE", new Date());
		NewsInputDto newsInputDto5 = new NewsInputDto("Title 5", "Title 5 Welisson Lima", "welisson lima", "www.google.com", "TESTE", new Date());
		NewsInputDto newsInputDto6 = new NewsInputDto("Title 6", "Title 6 Welisson Lima", "welisson lima", "www.google.com", "TESTE", new Date());
		NewsInputDto newsInputDto7 = new NewsInputDto("Title 7", "Title 7 Welisson Lima", "welisson lima", "www.google.com", "TESTE", new Date());
		NewsInputDto newsInputDto8 = new NewsInputDto("Title 8", "Title 8 Welisson Lima", "welisson lima", "www.google.com", "TESTE", new Date());
		NewsInputDto newsInputDto9 = new NewsInputDto("Title 9", "No Distrito Federal o roubo aumenta 90%", "welisson lima", "www.google.com", "TESTE", new Date());
		NewsInputDto newsInputDto10 = new NewsInputDto("Title 10", "No Distrito Federal foi propagado um novo virus chamado FakeNews", "welisson lima", "www.google.com", "TESTE", new Date());
		NewsInputDto newsInputDto11 = new NewsInputDto("Title 11", "O governador de Santa Catarina foi preso", "welisson lima", "www.google.com", "TESTE", new Date());
		NewsInputDto newsInputDto12 = new NewsInputDto("Title 12", "No RECREIO Rio de Janeiro foi encontrado uma mina de ouro", "welisson lima", "www.google.com", "TESTE", new Date());
		NewsInputDto newsInputDto13 = new NewsInputDto("Title 13", "No São Paulo, Welisson Lima ganha o concurso de homem mais boco", "welisson lima", "www.google.com", "TESTE", new Date());
		NewsInputDto newsInputDto14 = new NewsInputDto("Title 14", "Em Roraima o roubo aumenta 90%", "welisson lima", "www.google.com", "TESTE", new Date());
		NewsInputDto newsInputDto15 = new NewsInputDto("Title 15", "No Sergipe foi propagado um novo virus chamado FakeNews", "welisson lima", "www.google.com", "TESTE", new Date());
		NewsInputDto newsInputDto16 = new NewsInputDto("Title 16", "O governador de Bahia foi preso", "welisson lima", "www.google.com", "TESTE", new Date());
		NewsInputDto newsInputDto17 = new NewsInputDto("Title 17", "No RECREIO Rio grande do sul foi encontrado uma mina de ouro", "welisson lima", "www.google.com", "TESTE", new Date());
		NewsInputDto newsInputDto18 = new NewsInputDto("Title 18", "No Tocantins, Welisson Lima ganha o concurso de homem mais boco", "welisson lima", "www.google.com", "TESTE", new Date());

		NewsInputDto newsInputDto19 = new NewsInputDto("Title 19", "Ministra do STJ nega pedido de deputado preso para voltar a trabalhar na Câmara. Maria Thereza de Assis Moura disse que questão merece uma análise mais aprofundada. Preso desde junho no regime semiaberto, parlamentar perdeu o direito ao trabalho externo na semana passada..  A ministra Maria Thereza de Assis Moura, do Superior Tribunal de Justiça (STJ), negou um pedido do deputado federal Celso Jacob (PMDB-RJ) para trabalhar durante o dia na Câmara dos Deputados. Preso desde junho em Brasília por condenação criminal, ele havia obtido autorização da Justiça para voltar a trabalhar na casa legislativa durante o dia, mas teve o direito cassado na semana passada após um pedido do Ministério Público, que alegou falta de supervisão de suas atividades parlamentares. Ao negar o pedido de Celso Jacob, Maria Thereza disse que a questão merece uma análise mais aprofundada e, por isso, não poderia conceder a decisão liminar (provisória). A magistrada deverá submeter o pedido à Sexta Turma do STJ, composta por outros quatro ministros. A defesa recorreu ao STJ alegando não haver incompatibilidade entre exercício do cargo eletivo e a condenação, sob o argumento de que fatos pelos quais foi acusado ocorreram há mais de 14 anos e não têm qualquer relação com o mandato parlamentar. ''Se o Supremo Tribunal Federal, responsável pela condenação, absteve-se de impor a perda do mandato eletivo, afastando, aliás, qualquer suposição de incompatibilidade entre o cumprimento da pena e o desempenho de suas funções, não se pode admitir que o TJDFT – que, por delegação, apenas fiscaliza a execução da pena imposta – busque, de forma oblíqua, alterar a decisão do eg. STF, a qual, aliás, foi atingida pelo trânsito em julgado, fazendo, pois, coisa julgada'', argumentou a defesa. No dia 19, Celso Jacob foi flagrado com dois pacotes de biscoito e um de queijo provolone escondidos dentro da cueca ao retornar para o Centro de Detenção Provisória da Papuda, no Distrito Federal, após saída de final de semana autorizada pela Justiça. Celso Jacob foi pego com durante a revista e, por isso, foi levado para o setor de isolamento, onde ficaria por sete dias. A Subsecretaria do Sistema Penitenciário informou que é proibida a entrada de internos com qualquer objeto ou alimento no presídio sem autorização. A entrada de alimentos autorizados só é possível por meio da família, durante o período de visita. A assessoria de Celso Jacob disse que ele levou os alimentos para atender recomendações médicas de se alimentar a cada três horas. A decisão do TJ-DF de revogar a autorização para Celso Jacob trabalhar durante o dia na Câmara e retornar para o presídio à noite não tem relação com a apreensão do queijo e dos biscoitos na cueca do parlamentar fluminense. Celso Jacob foi preso no início de junho, no aeroporto de Brasília, em regime semiaberto, após a Primeira Turma do Supremo Tribunal Federal condená-lo por falsificação de documento público e dispensa de licitação quando o peemedebista era prefeito de Três Rios, no Sul do RJ. Ele governou a cidade em dois mandatos: de 2001 a 2004: e de 2005 a 2008. No fim de junho, o juiz substituto Valter André Bueno Araújo, da Vara de Execuções Penais do Distrito Federal, autorizou o deputado a deixar o presídio durante o dia para trabalhar como parlamentar na Câmara dos Deputados. Ele tinha que retornar diariamente para a unidade prisional à noite.", "welisson lima", "www.google.com", "TESTE", new Date());
		NewsInputDto newsInputDto20 = new NewsInputDto("Title 20", "Incerteza sobre Lula estimula partidos a lançarem candidatosA definição da data do julgamento do ex-presidente Luiz Inácio Lula da Silva em segunda instância (PT) reforçou a movimentação de partidos para lançar seus próprios candidatos ao Palácio do Planalto e pode estimular a multiplicação de nomes inscritos na corrida de 2018.Para dirigentes de siglas como DEM, PMDB, PSD e PSB, a velocidade dada ao processo contra o petista amplia as chances de que o ex-presidente fique fora das urnas, o que abriria espaço para candidaturas alternativas tanto na esquerda quanto no centro e na direita.A cúpula do DEM, por exemplo, voltou a trabalhar com a hipótese de convencer Luciano Huck a se candidatar à Presidência da República no ano que vem.Integrantes do comando da legenda mantiveram contato com o apresentador da TV Globo mesmo depois que ele publicou na Folha artigo em que afirma que não disputará o Planalto em 2018.Eles acreditam que podem convencer Huck a voltar a considerar esse projeto caso haja indícios fortes, nos próximos meses, de que Lula não conseguirá manter sua candidatura amparado por uma decisão judicial. Nesse caso, ele precisaria se filiar a um partido até o início de abril.Dirigentes do DEM avaliam que o apresentador conseguiria atrair boa parte do eleitorado do petista e planejam oferecer o partido como plataforma para esse projeto, rompendo conversas iniciais da sigla com o PSDB do pré-candidato Geraldo Alckmin.Além do plano Huck, os democratas ainda trabalham com os nomes do presidente da Câmara, Rodrigo Maia (RJ), e do prefeito de Salvador, ACM Neto.* NOMES ALTERNATIVOS *O TRF-4 (Tribunal Regional Federal da 4a Região) marcou para 24 de janeiro o julgamento do recurso apresentado pela defesa de Lula contra sua condenação a nove anos e seis meses de prisão por corrupção e lavagem de dinheiro.Se a condenação de Lula for confirmada em segunda instância, a Lei da Ficha Limpa torna o ex-presidente inelegível, mas ele pode se manter na disputa por meio de recursos eleitorais.Ainda que essa decisão não sele definitivamente o destino do petista, alguns partidos acreditam que o veredicto do tribunal tende a revelar um ambiente desfavorável ao sucesso de sua candidatura presidencial.As legendas querem explorar os primeiros sinais contrários à candidatura de Lula para refazer seus planos eleitorais já nos primeiros meses do ano que vem.Nos cálculos de dirigentes, a possível ausência do petista tornaria aberta uma disputa até então polarizada entre o ex-presidente e o deputado Jair Bolsonaro (PSC-RJ). Um quadro mais incerto e pulverizado, portanto, favoreceria um voo solo, capaz de chegar ao segundo turno com pouco mais de 15% dos votos.Um revés judicial nessa etapa do julgamento poderia ainda aumentar as chances de uma candidatura de Henrique Meirelles (Fazenda), do PSD. O ministro esperava usar como palanques a recuperação da economia e o otimismo do mercado financeiro com a reforma da Previdência, mas as dificuldades de aprovação da proposta criaram um novo empecilho a seu projeto presidencial.Também ganham fôlego candidaturas alternativas na esquerda. Além do ex-ministro Ciro Gomes (PDT), avançariam algumas casas no tabuleiro os nomes de Manuela D'Ávila (PC do B) e Guilherme Boulos, sem partido.O PSB também acredita que o ambiente seria mais favorável para a construção de uma chapa encabeçada pelo ex-presidente do STF Joaquim Barbosa. Ele deve decidir até março se aceita o convite da legenda para se lançar ao Palácio do Planalto.O PT pretendia explorar a força de Lula para tentar atrair essas siglas, mas uma derrota no TRF-4 tende a empurrar os partidos para outros projetos.", "welisson lima", "www.google.com", "TESTE", new Date());


		userService.saveUser(userInputDto1);
		userService.saveUser(userInputDto2);
		userService.saveUser(userInputDto3);
		userService.saveUser(userInputDto4);
		userService.saveUser(userInputDto5);
		
		newsService.saveNews(newsInputDto1);
		newsService.saveNews(newsInputDto2);
		newsService.saveNews(newsInputDto3);
		newsService.saveNews(newsInputDto4);
		newsService.saveNews(newsInputDto5);
		newsService.saveNews(newsInputDto6);
		newsService.saveNews(newsInputDto7);
		newsService.saveNews(newsInputDto8);
		newsService.saveNews(newsInputDto9);
		newsService.saveNews(newsInputDto10);
		newsService.saveNews(newsInputDto11);
		newsService.saveNews(newsInputDto12);
		newsService.saveNews(newsInputDto13);
		newsService.saveNews(newsInputDto14);
		newsService.saveNews(newsInputDto15);
		newsService.saveNews(newsInputDto16);
		newsService.saveNews(newsInputDto17);
		newsService.saveNews(newsInputDto18);
		newsService.saveNews(newsInputDto19);
		newsService.saveNews(newsInputDto20);
	}
}
