package br.com.fakenews.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import br.com.fakenews.model.entity.NewsEntity;
import br.com.fakenews.model.enumerator.EstadosEnum;

@Service
public class MapService {
	
    private final NewsService newsService;

    public MapService(NewsService newsService) {
        this.newsService = newsService;
    }

    public Map<String,Integer> getMap(){
        
    	List<NewsEntity> list = newsService.findAllNews();
        Map<String,Integer> count = new HashMap<String,Integer>();
        
        int a = 0, b = 0, c = 0, d = 0, e = 0, f = 0, g = 0, h = 0, i = 0, j = 0, k = 0, l = 0, m = 0, n = 0, o = 0, p = 0, q= 0, r = 0, s = 0, t = 0, u = 0, v = 0 , w = 0, y = 0, z = 0, a1 = 0, b1 = 0 ;

        for(NewsEntity estados : list){
            if(estados.getBody().toUpperCase().contains(EstadosEnum.ACRE.getDescricao().toUpperCase())){
               a++;
                count.put("ACRE", a);
            }
            if(estados.getBody().toUpperCase().contains(EstadosEnum.ALAGOAS.getDescricao().toUpperCase())){
                b++;
                count.put("ALAGOAS", b);
            }
            if(estados.getBody().toUpperCase().contains(EstadosEnum.AMAPA.getDescricao().toUpperCase())){
                c++;
                count.put("AMAPA", c);
            }
            if(estados.getBody().toUpperCase().contains(EstadosEnum.AMAZONAS.getDescricao().toUpperCase())){
                d++;
                count.put("AMAZONAS", d);
            }
            if(estados.getBody().toUpperCase().contains(EstadosEnum.BAHIA.getDescricao().toUpperCase())){
                e++;
                count.put("BAHIA", e);
            }

            if(estados.getBody().toUpperCase().contains(EstadosEnum.CEARA.getDescricao().toUpperCase())){
                f++;
                count.put("CEARA", f);
            }

            if(estados.getBody().toUpperCase().contains(EstadosEnum.DISTRITO_FEDERAL.getDescricao().toUpperCase())){
                g++;
                count.put("DISTRITO_FEDERAL", g);
            }

            if(estados.getBody().toUpperCase().contains(EstadosEnum.ESPIRITO_SANTO.getDescricao().toUpperCase())){
                h++;
                count.put("ESPIRITO_SANRO", h);
            }

            if(estados.getBody().toUpperCase().contains(EstadosEnum.GOIAS.getDescricao().toUpperCase())){
                i++;
                count.put("GOIAS", i);
            }

            if(estados.getBody().toUpperCase().contains(EstadosEnum.MARANHAO.getDescricao().toUpperCase())){
                j++;
                count.put("MARANHAO", j);
            }

            if(estados.getBody().toUpperCase().contains(EstadosEnum.MATO_GROSSO.getDescricao().toUpperCase())){
                k++;
                count.put("MATO_GROSSO", k);
            }

            if(estados.getBody().toUpperCase().contains(EstadosEnum.MATO_GROSSO_DO_SUL.getDescricao().toUpperCase())){
                l++;
                count.put("MATO_GROSSO_DO_SUL", l);
            }

            if(estados.getBody().toUpperCase().contains(EstadosEnum.MINAS_GERAIS.getDescricao().toUpperCase())){
                m++;
                count.put("MINAS_GERAIS", m);
            }


            if(estados.getBody().toUpperCase().contains(EstadosEnum.PARA.getDescricao().toUpperCase())){
                n++;
                count.put("PARA", n);
            }

            if(estados.getBody().toUpperCase().contains(EstadosEnum.PARAIBA.getDescricao().toUpperCase())){
                o++;
                count.put("PARAIBA", o);
            }

            if(estados.getBody().toUpperCase().contains(EstadosEnum.PARANA.getDescricao().toUpperCase())){
                p++;
                count.put("PARANA", p);
            }

            if(estados.getBody().toUpperCase().contains(EstadosEnum.PERNAMBUCO.getDescricao().toUpperCase())){
                q++;
                count.put("PERNAMBUCO", q);
            }

            if(estados.getBody().toUpperCase().contains(EstadosEnum.PIAUI.getDescricao().toUpperCase())){
                r++;
                count.put("PIAUI", r);
            }

            if(estados.getBody().toUpperCase().contains(EstadosEnum.RIO_DE_JANEIRO.getDescricao().toUpperCase())){
                s++;
                count.put("RIO_DE_JANEIRO", s);
            }

            if(estados.getBody().toUpperCase().contains(EstadosEnum.RIO_GRANDE_DO_NORTE.getDescricao().toUpperCase())){
                t++;
                count.put("RIO_GRANDE_DO_NORTE", t);
            }

            if(estados.getBody().toUpperCase().contains(EstadosEnum.RIO_GRANDE_DO_SUL.getDescricao().toUpperCase())){
                u++;
                count.put("RIO_GRANDE_DO_SUL", u);
            }

            if(estados.getBody().toUpperCase().contains(EstadosEnum.RONDONIA.getDescricao().toUpperCase())){
                v++;
                count.put("RONDONIA", v);
            }

            if(estados.getBody().toUpperCase().contains(EstadosEnum.RORAIMA.getDescricao().toUpperCase())){
                w++;
                count.put("RORAIMA", w);
            }

            if(estados.getBody().toUpperCase().contains(EstadosEnum.SANTA_CATARINA.getDescricao().toUpperCase())){
                y++;
                count.put("SANTA_CATARINA", y);
            }

            if(estados.getBody().toUpperCase().contains(EstadosEnum.SAO_PAULO.getDescricao().toUpperCase())){
                z++;
                count.put("SAO_PAULO", z);
            }

            if(estados.getBody().toUpperCase().contains(EstadosEnum.SERGIPE.getDescricao().toUpperCase())){
                a1++;
                count.put("SERGIPE", a1);
            }

            if(estados.getBody().toUpperCase().contains(EstadosEnum.TOCANTINS.getDescricao().toUpperCase())){
                b1++;
                count.put("TOCANTINS", b1);
            }

        }
        
        return count;
    }
}
