package com.entities;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name = "cardapio")
public class Cardapio {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "id")
	private Integer id;

	@Column(name = "titulo")
	private String titulo;

	@Column(name = "valor")
	private Double valor;

	@Column(name = "descricao")
	private String descricao;

	@Column(name = "data")
	@Temporal(TemporalType.TIMESTAMP)
	private Date data;

	@JsonIgnore
	@OneToMany(mappedBy = "cardapio", fetch = FetchType.LAZY, orphanRemoval = false)
	private List<Venda> vendas;

	@JsonIgnore
	@OneToMany(mappedBy = "cardapio", cascade = CascadeType.ALL, orphanRemoval = true)
	private List<CardapioAlimento> alimentosCardapio = new ArrayList<CardapioAlimento>();

	public List<Venda> getVendas() {
		return vendas;
	}

	public void setVendas(List<Venda> vendas) {
		this.vendas = vendas;
	}

	public void AdicionarFilhos(CardapioAlimento filho) {
		alimentosCardapio.add(filho);
		filho.setCardapio(this);
	}

	public Double getValor() {
		return valor;
	}

	public void setValor(Double valor) {
		this.valor = valor;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
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

	public List<CardapioAlimento> getAlimentosCardapio() {
		return alimentosCardapio;
	}

	public void setAlimentosCardapio(List<CardapioAlimento> alimentosCardapio) {
		this.alimentosCardapio = alimentosCardapio;
	}

}
