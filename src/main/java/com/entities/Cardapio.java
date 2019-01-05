package com.entities;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
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

	@Column(name = "descricao")
	private String descricao;

	@Column(name = "data")
	private Date data;

	@ManyToOne
	@JoinColumn(name = "categoria_id", insertable = false, updatable = false)
	private Categoria categoria;

	@Column(name = "categoria_id")
	private Integer categoria_id;

	@JsonIgnore
	@OneToMany(mappedBy = "cardapio", cascade = CascadeType.ALL, orphanRemoval = true)
	private List<CardapioAlimento> alimentosCardapio = new ArrayList<CardapioAlimento>();

	public void AdicionarFilhos(CardapioAlimento filho) {
		alimentosCardapio.add(filho);
		filho.setCardapio(this);
	}

	public Categoria getCategoria() {
		return categoria;
	}

	public void setCategoria(Categoria categoria) {
		this.categoria = categoria;
	}

	public Integer getCategoria_id() {
		return categoria_id;
	}

	public void setCategoria_id(Integer categoria_id) {
		this.categoria_id = categoria_id;
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
