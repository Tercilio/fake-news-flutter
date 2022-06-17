package br.com.fakenews.model;

public class MapModel {
    private String nome;
    private int quatidade;

    public void setNome(String nome) {
        this.nome = nome;
    }

    public void setQuatidade(int quatidade) {
        this.quatidade = quatidade;
    }

    public String getNome() {
        return nome;
    }

    public int getQuatidade() {
        return quatidade;
    }

    @Override
    public String toString() {
        return "MapModel{" +
                "nome='" + nome + '\'' +
                ", quatidade=" + quatidade +
                '}';
    }
}
