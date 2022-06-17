package br.com.fakenews.model.enumerator;

public enum EstadosEnum {
    ACRE("Acre"),
    AC("AC"),
    ALAGOAS("Alagoas"),
    AL("AL"),
    AMAPA("Amapá"),
    AP("AP"),
    AMAZONAS("Amazonas"),
    AM("AM"),
    BAHIA("Bahia"),
    BA("BA"),
    CEARA("Ceará"),
    CE("CE"),
    DISTRITO_FEDERAL("Distrito Federal"),
    DF("DF"),
    ESPIRITO_SANTO("Espírito Santo"),
    ES("ES"),
    GOIAS("Goiás"),
    GO("GO"),
    MARANHAO("Maranhão"),
    MA("MA"),
    MATO_GROSSO("Mato Grosso"),
    MT("MT"),
    MATO_GROSSO_DO_SUL("Mato Grosso do Sul"),
    MS("MS"),
    MINAS_GERAIS("Minas Gerais"),
    MG("MG"),
    PARA("Pará"),
    PA("PA"),
    PARAIBA("Paraíba"),
    PB("PB"),
    PARANA("Paraná"),
    PR("PR"),
    PERNAMBUCO("Pernambuco"),
    PE("PE"),
    PIAUI("Piauí"),
    PI("PI"),
    RIO_DE_JANEIRO("Rio de Janeiro"),
    RJ("RJ"),
    RIO_GRANDE_DO_NORTE("Rio Grande do Norte"),
    RN("RN"),
    RIO_GRANDE_DO_SUL("Rio Grande do Sul"),
    RS("RS"),
    RONDONIA("Rondônia"),
    RO("RO"),
    RORAIMA("Roraima"),
    RR("RR"),
    SANTA_CATARINA("Santa Catarina"),
    SC("SC"),
    SAO_PAULO("São Paulo"),
    SP("SP"),
    SERGIPE("Sergipe"),
    SE("SE"),
    TOCANTINS("Tocantins"),
    TO("TO");

    private String descricao;

    EstadosEnum(String descricao) {
        this.descricao = descricao;
    }

    public String getDescricao() {
        return descricao;
    }
}
