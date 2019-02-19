package com.dtos;

public abstract class DtoPaginacao {
	private int itensPorPagina;
	private int quantidade;
	private int itensTotalConsulta;
	private String ordenar;
	private boolean asc;

	public boolean isAsc() {
		return asc;
	}

	public void setAsc(boolean asc) {
		this.asc = asc;
	}

	public String getOrdenar() {
		return ordenar;
	}

	public void setOrdenar(String ordenar) {
		this.ordenar = ordenar;
	}

	public int getItensTotalConsulta() {
		return itensTotalConsulta;
	}

	public void setItensTotalConsulta(int itensTotalConsulta) {
		this.itensTotalConsulta = itensTotalConsulta;
	}

	public int getItensPorPagina() {
		return itensPorPagina;
	}

	public void setItensPorPagina(int itensPorPagina) {
		this.itensPorPagina = itensPorPagina;
	}

	public int getQuantidade() {
		return quantidade;
	}

	public void setQuantidade(int quantidade) {
		this.quantidade = quantidade;
	}

}