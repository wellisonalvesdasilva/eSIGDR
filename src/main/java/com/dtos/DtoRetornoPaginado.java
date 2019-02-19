package com.dtos;

import java.util.List;

public class DtoRetornoPaginado<T> {
	public int qtdRegistroPagina;
	public int qtdTotalDeRegistros;
	public long numeroPaginas;
	public List<T> lista;

	public int getQtdRegistroPagina() {
		return qtdRegistroPagina;
	}

	public void setQtdRegistroPagina(int qtdRegistroPagina) {
		this.qtdRegistroPagina = qtdRegistroPagina;
	}

	public int getQtdTotalDeRegistros() {
		return qtdTotalDeRegistros;
	}

	public void setQtdTotalDeRegistros(int qtdTotalDeRegistros) {
		this.qtdTotalDeRegistros = qtdTotalDeRegistros;
	}

	public long getNumeroPaginas() {
		return numeroPaginas;
	}

	public void setNumeroPaginas(long numeroPaginas) {
		this.numeroPaginas = numeroPaginas;
	}

	public List<T> getLista() {
		return lista;
	}

	public void setLista(List<T> lista) {
		this.lista = lista;
	}

}