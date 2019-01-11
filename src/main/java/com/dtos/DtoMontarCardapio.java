package com.dtos;

import java.util.Date;
import java.util.List;

public class DtoMontarCardapio {

	private Integer id;
	private Integer idCategoria;
	private String titulo;
	private String descricao;
	private Date data;
	private Double valor;
	private List<Integer> listAlimentos;
	private List<Integer> listCarnes;
	private List<Integer> listSaladas;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getIdCategoria() {
		return idCategoria;
	}

	public void setIdCategoria(Integer idCategoria) {
		this.idCategoria = idCategoria;
	}

	public String getTitulo() {
		return titulo;
	}

	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}

	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public Date getData() {
		return data;
	}

	public void setData(Date data) {
		this.data = data;
	}

	public Double getValor() {
		return valor;
	}

	public void setValor(Double valor) {
		this.valor = valor;
	}

	public List<Integer> getListAlimentos() {
		return listAlimentos;
	}

	public void setListAlimentos(List<Integer> listAlimentos) {
		this.listAlimentos = listAlimentos;
	}

	public List<Integer> getListCarnes() {
		return listCarnes;
	}

	public void setListCarnes(List<Integer> listCarnes) {
		this.listCarnes = listCarnes;
	}

	public List<Integer> getListSaladas() {
		return listSaladas;
	}

	public void setListSaladas(List<Integer> listSaladas) {
		this.listSaladas = listSaladas;
	}
}